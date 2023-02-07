//
//  ContentView.swift
//  NotificationDelegate
//
//  Created by Renato on 07/02/23.

///UNUserNotificationCenterDelegate - Permite fazer duas coias, Nos podemos decidir quando mostrar as notificações quando o app estiver executando e também à ação realizada pelo usuário
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var inputMessage : String = ""
    @State private var isButtonDisabled: Bool = false


    var body: some View {
        VStack(spacing: 12){
            HStack{
                Text("Message")
                TextField("Insert Message", text: $inputMessage)
                    .textFieldStyle(.roundedBorder)
            } //end HStack
            HStack{
                Spacer()
                Button("Post Notification"){
                    let message = inputMessage.trimmingCharacters(in: .whitespaces)
                    if !message.isEmpty {
                        Task(priority: .background) {
                            let center = UNUserNotificationCenter.current()
                            let autorization = await center.notificationSettings()
                            if autorization.authorizationStatus == .authorized  {
//                                await sendNotification()
                            } //end if autorization.authorizationStatus
                        } //end Task
                    } //end if !message.isEmpty
                } //end Button
                .disabled(isButtonDisabled)
            } //end HStack
            Spacer()
        }//end VStack
        .padding()
    } //end var body
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
