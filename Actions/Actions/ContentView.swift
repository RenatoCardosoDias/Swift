//
//  ContentView.swift
//  Actions
//
//  Created by Renato on 09/02/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var inputMessage: String = ""
    @State private var isButtonDisabeld: Bool = false

    var body: some View {
        VStack (spacing: 12){
            HStack{
                Text("Message")
                TextField("Insert Message: ", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
            } //end HStack
            HStack {
                Spacer()
                Button("Post Notifiation"){
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty{
                        Task(priority: .background){
                            let center = UNUserNotificationCenter.current()
                            let autorization = await center.notificationSettings()
                            if autorization.authorizationStatus == .authorized{
                                await sendNotification()
                            } //end if autorization.authorizationStatus
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDisabeld)
            } //end HStack
            Spacer()
        } //end VStack
        .padding()
        .task(priority: .background) {
            do {
                let center = UNUserNotificationCenter.current()
                let autorized = try await center.requestAuthorization(options: [.alert, .sound])
                await MainActor.run {
                    isButtonDisabeld = !autorized
                }
            } catch {
                print("Error: \(error)")
            } //end do catch
        } //end .task

    } //end var body

    func sendNotification() async {
        let center = UNUserNotificationCenter.current()
        let groupID = "ListActions"
        let actionDelete = UNNotificationAction(identifier: "deleteButton", title: "Delete", options: .destructive)
        let category = UNNotificationCategory(identifier: groupID, actions: [actionDelete], intentIdentifiers: [], options: [])
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
        } //end do catch
    } //end func sendNotification
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
