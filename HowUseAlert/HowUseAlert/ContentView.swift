//
//  ContentView.swift
//  HowUseAlert
//
//  Created by Renato on 02/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert: Bool = false
    @State private var showAlert1: Bool = false
    @State private var showAlertDelete: Bool = false
    @State private var showAlertHobby: Bool = false
    @State private var hobby: Hobby? = nil{
        didSet{
            if hobby != nil {
                showAlertHobby = true
            } //end if hobby
        } //end didSet
    } //end @State private var hobby

    var body: some View {
        VStack(spacing: 20){
            HStack(spacing: 20){
                Button("Hello"){
                    showAlert = true
                } //end Button
                .alert("Hello", isPresented: $showAlert, actions: {} )
                .padding()
                Button("Olá") {
                    showAlert1 = true
                } //end Button
                .alert("Ola", isPresented: $showAlert1, actions: {
                    Button("Cancel") {}
                }, message: {Text("This is message")})
                Button("Delete"){
                    showAlertDelete = true
                } //end Button
                .alert("Delete data", isPresented: $showAlertDelete, actions: {
                    Button("Delete data", role: .destructive) {}
//                    Button("Cancel") {}
                }, message: {Text("Deletar usuario")} )
            } //end HStack
            .padding(.bottom, 10)
            HStack(spacing: 30){
                Button("🎾") { hobby = Hobby(name: "Playing tennis")}
                Button("🎥") { hobby = Hobby(name: "Watching Youtube videos")}
                Button("📖") { hobby = Hobby(name: "Reading Books")}
            } //end HStack
            .padding()
            .alert("My Favorite hobbie is...", isPresented: $showAlertHobby, presenting: hobby, actions: { _ in},
                   message: { hobby in
                Text(hobby.name)

            }) //end alert
        } //end VStack
        .padding()
    } //end var body
} //end struct ContentView

struct Hobby: Identifiable {
    let id: UUID = UUID()
    let name: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
