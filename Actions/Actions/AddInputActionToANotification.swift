//
//  AddInputActionToANotification.swift
//  Actions
//
//  Created by Renato on 09/02/23.
//

import SwiftUI
import UserNotifications

struct AddInputActionToANotification: View {
    @State private var inputMessage: String = ""
    @State private var isButtonDisabled: Bool = false

    var body: some View {
        VStack(spacing: 12) {
            HStack{
                Text("Message")
                TextField("Insert Message", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
            } //end HStack
            HStack{
                Spacer()
                Button("Post Notificarion") {
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty {
                        Task(priority: .background){
                            let center = UNUserNotificationCenter.current()
                            let authorization = await center.notificationSettings()
                            if authorization.authorizationStatus == .authorized{
                                await sendNotification()
                            } //end if authorization
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDisabled)
            } //end HStack
            Spacer()
        } //end VStack
        .padding()
        .task (priority: .background) {
            do {
                let center = UNUserNotificationCenter.current()
                let authorized = try await center.requestAuthorization(options: [.alert, .sound])
                await MainActor.run{
                    isButtonDisabled = !authorized
                } //end await
            } catch {
                print("Error: \(error)")
            } //end do catch
        } //end .task
    } //end var body

    func sendNotification() async {
        let center = UNUserNotificationCenter.current()
        let groupID = "ListActions"
        let actionDelete = UNNotificationAction(identifier: "deletebutton", title: "Delete", options: .destructive)
        let actionInput = UNTextInputNotificationAction(identifier: "inputField", title: "Message", options: [])

        let category = UNNotificationCategory(identifier: groupID, actions: [actionDelete, actionInput], intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])

        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = inputMessage
        content.categoryIdentifier = groupID

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let id = "reminder-\(UUID())"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        do {
            try await center.add(request)
            await MainActor.run {
                inputMessage = ""
            }
        } catch {
            print("Error: \(error)")
        }
    } //end func sendNotification
} //end struct

struct AddInputActionToANotification_Previews: PreviewProvider {
    static var previews: some View {
        AddInputActionToANotification()
    }
}
