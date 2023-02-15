//
//  ConfiguringSummaryNotifications.swift
//  Summary
//
//  Created by Renato on 08/02/23.
//

import SwiftUI
import UserNotifications


struct ConfiguringSummaryNotifications: View {
    @State private var inputMessage: String = ""
    @State private var isButtonDisabled: Bool = false

    var body: some View {
        VStack(spacing: 12){
            HStack{
                Text("Message")
                TextField("Insert Message", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
            } //end HStack
            HStack {
                Spacer()
                Button("Post Notification") {
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty {
                        Task(priority: .background) {
                            let center = UNUserNotificationCenter.current()
                            let authorization = await center.notificationSettings()
                            if authorization.authorizationStatus == .authorized {
                                await sendNotification()
                            } //end if authorization.authorizationStatus
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDisabled)
            } //end HStack
            Spacer()
        } //end VStack
        .padding()
        .task(priority: .background){
            do {
                let center = UNUserNotificationCenter.current()
                let authorized = try await center.requestAuthorization(options: [.alert, .sound])
                await MainActor.run {
                    isButtonDisabled = !authorized
                } //end await
            } catch {
                print("Error: \(error)")
            } //end do catch
        } //end .task
    } //end var body

    func sendNotification() async {
        let center = UNUserNotificationCenter.current()
        let groupID = "Group One"
        let totalMessage = 3

        let summaryFormat = "\(totalMessage) messages"
        let category = UNNotificationCategory(identifier: groupID, actions: [], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: nil, categorySummaryFormat: summaryFormat, options: [])
        center.setNotificationCategories([category])

        for index in 1...totalMessage {
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = "\(index) - \(inputMessage)"
            content.threadIdentifier = groupID

            let tigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

            let id = "reminder-\(UUID())"
            let request = UNNotificationRequest(identifier: id, content: content, trigger: tigger)
            do {
                try await center.add(request)
            } catch {
                print("Error: \(error)")
            } //end do catch
        }//end for index in 1...totalMessage
        await MainActor.run {
            inputMessage = ""
        }
    } //end func sendNotification
} //end struct

struct ConfiguringSummaryNotifications_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguringSummaryNotifications()
    }
}
