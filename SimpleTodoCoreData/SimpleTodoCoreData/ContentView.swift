//
//  ContentView.swift
//  SimpleTodoCoreData
//
//  Created by Renato on 10/02/23.
//

import SwiftUI
import CoreData

enum Priority: String, Identifiable, CaseIterable{
    var id: UUID {
        return UUID()
    }
    case low = "Low"
    case medium = "Medium"
    case hight = "Hight"
}

extension Priority {

    var title : String{
        switch self {
            case .low:
                return "Low"
            case .medium:
                return "Medium"
            case .hight:
                return "Hight"
        } //end switch self
    } //end var title
} //end extesion Priority

struct ContentView: View {
    @State private var inputTitle: String = ""
    @State private var selectdPriority: Priority = .medium
    @Environment(\.managedObjectContext) private var viewContext

    private func saveTask() {
        do {
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectdPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter Title", text: $inputTitle)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $selectdPriority){
                    ForEach(Priority.allCases){ prioity in
                        Text(prioity.title).tag(prioity)
                    } //end ForEach
                } //end Picker
                .pickerStyle(.segmented)
                Button("Save"){
                    saveTask()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                Spacer()
            } //end VStack
            .padding()
            .navigationTitle("All Tasks")
        } //end NavigationView
    } //end var body
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
