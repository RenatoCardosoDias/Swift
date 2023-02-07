//
//  ContentView.swift
//  NotificationsProvisional1
//
//  Created by Renato on 07/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputMessage: String = ""
    @State private var isButtonDisabled: Bool = false

    var body: some View {
        VStack(spacing: 12){
            HStack {
                Text("Message:")
                TextField("Insert Message", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
            } //end HStack
            HStack{
                Spacer()
                Button("Post Notification"){
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty {
                        Task(priority: .background){
                            let center = UNUserNotificationCenter.current()
                            let autorization = await center.notificationSettings()
                            let status = autorization.authorizationStatus
                            if status == .authorized || status == .provisional {
                                await sendNotification()
                            } //end if status
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDisabled)
            } //end HStack
            Spacer()
        } //end VStack
        .padding()
        .task (priority: .background){
            do {
                let center = UNUserNotificationCenter.current()
                let authorized = try await center.requestAuthorization(options: [.alert, .sound, .provisional])
                await MainActor.run{
                    isButtonDisabled = !authorized
                }
            } catch {
                print("Error: \(error)")
            } //end do catch
        } //end .task
    } //end var body

    func sendNotification() async {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = inputMessage

        let idImage = "attach-\(UUID())"
        if let urlImage = await getThumbnail(id: idImage) {
            if let attachment = try? UNNotificationAttachment(identifier: idImage, url: urlImage, options: nil){
                content.attachments = [attachment]
            }
        } //end if let urlImage

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

        let id = "reminder-\(UUID())"
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        do {
            let center = UNUserNotificationCenter.current()
            try await center.add(request)
            await MainActor.run{
                inputMessage = ""
            } //end await MainActor.run
        } catch {
            print("Error: \(error)")
        } //end do catch
    } //end sendNotification

    func getThumbnail(id: String) async -> URL?  {
        let manager = FileManager.default
        if let docURL = manager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = docURL.appendingPathComponent("\(id).png")

            if let image = UIImage(named: "sofia") {
                if let thumbnail = await image.byPreparingThumbnail(ofSize: CGSize(width: 100, height: 100)) {
                    if let imageData = thumbnail.pngData() {
                        if let _ = try? imageData.write(to: fileURL){
                            return fileURL
                        } //end if let _
                    } //end if let imageData
                } //end if let thumbnail
            } //end if let image
        } //end if let docURL
        return nil
    } //end func getThumbnail
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
