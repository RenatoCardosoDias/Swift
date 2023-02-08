//
//  ContentView.swift
//  Groups
//
//  Created by Renato on 08/02/23.
// Agrupando as notificações em grupos por applicativo

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var inputMessage: String = ""
    @State private var isButtonDiabled: Bool = false

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Message:")
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
                            let authotization = await center.notificationSettings()
                            if authotization.authorizationStatus == .authorized {
                                await sendNotification()
                            } //end if authorization.authorizationStatus
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDiabled)
            } //end HStack
            Spacer()
        } //end VStack
        .padding()
        .task (priority: .background){
            do {
                let center = UNUserNotificationCenter.current()
                let autorized = try await center.requestAuthorization(options: [.alert, .sound])
                await MainActor.run {
                    isButtonDiabled = !autorized
                }
            } catch {
                print("Error: \(error)")
            } //end do catch
        } //end .task
    } //end var body

    func sendNotification() async {
        let listGroups = ["Group One", "Group Thwo"]

        for group in listGroups {
            for index in 1...3 {
                let content = UNMutableNotificationContent() //editar o conteudo das notificações, como titulo, conteudo
                content.title = "Reminder \(group)"
                content.body = "\(index) - \(inputMessage)"
                content.threadIdentifier = group //O identificador que agrupa as notificações relacionadas.

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false) //objeto quando você deseja agendar a entrega de uma notificação local após o número de segundos especificados decorrer

                let id = "reminder-\(UUID())"
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger) //Uma solicitação para agendar uma notificação local, que inclui o conteúdo da notificação e as condições de acionamento para entrega.
                do {
                    let center = UNUserNotificationCenter.current() //objeto para gerenciar todos os comportamentos relacionados à notificação em seu aplicativo ou extensão de aplicativo.

                    //.current - Retorna o centro de notificação do seu aplicativo. Sempre use esse método para recuperar o objeto do centro de notificação compartilhado para seu aplicativo.
                    try await center.add(request) // .add  - Agenda a entrega de uma notificação local.
                } catch {
                    print("Error: \(error)")
                } //end do catch
            } //end for index in 1..3
        } //end for group is listGroups
        await MainActor.run {
            inputMessage = ""
        }
    } //end func sendNotification
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
