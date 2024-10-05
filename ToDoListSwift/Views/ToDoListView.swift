//
//  ToDoListItemsView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    var body: some View {
        
        
        NavigationView {
            
            
            VStack {
                
            }//END Vstack
            .navigationTitle("Liste des tâches")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }//END toolbarItem ...
                
            }// END toolbar ....
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }//END NavigationView
    }// END body ...
}//END struc View ...

#Preview {
    ToDoListView(userId: "")
}
