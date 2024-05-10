//
//  ToDoView.swift
//  WebTechWorkshop
//
//  Created by Rafael Pena on 09/05/24.
//

import SwiftUI
import Combine
import MapKit

struct ToDoView: View {
    @StateObject var toDoViewModel = ToDoViewModel()
    @State var newTodo = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Adicione novo To Do", text: $newTodo)
                    .padding()
                    .onSubmit {
                        toDoViewModel.addToDo(description: newTodo)
                        newTodo = ""
                    }
                
                List {
                    ForEach(toDoViewModel.toDos) { todo in
                        VStack(alignment: .leading) {
                            Text(todo.createAt.formatted())
                            Text(todo.description)
                            
                            Map(interactionModes: []) {
                                Marker("Marker", coordinate: CLLocationCoordinate2D(latitude: -19.9335, longitude: -43.9342))
                            }
                            .mapStyle(.hybrid(elevation: .realistic))
                            .frame(height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.vertical)
                    }
                    .onDelete(perform: toDoViewModel.removeToDo)
                }
                
                .scrollContentBackground(.hidden)
                .background(Color.yellow.opacity(0.5))
            }
            .padding(.top)
            .navigationTitle("WebTech Days")
        }
    }
}

#Preview {
    ToDoView()
}
