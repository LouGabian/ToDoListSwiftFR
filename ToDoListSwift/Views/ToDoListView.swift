//
//  ToDoListItemsView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//


import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
   
    
    
    //To Get User and his items
    init(userId: String) {
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }//END init
    
    
    var body: some View {
        
        
        NavigationView {
            
            
            VStack {
                
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Image(systemName: "trash")
                                    .fontWeight(.semibold)
                                    
                                }
                            .tint(.darkRed)
                            }

                }//END List(items)
                .listStyle(PlainListStyle())
                
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
    ToDoListView(userId: "778J4aSsadTZN3f7wfD2UsHqGms2")
}
