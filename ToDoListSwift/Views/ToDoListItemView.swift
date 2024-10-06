//
//  ToDoListItemView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }//END Vstack
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.square" : "square")
                    .foregroundColor(item.isDone ? .green : .black)
                    .bold()
            }
            
        }//END HStack
        
        
        
        
    }//END body: some ...
    
}//END struct View ...

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Acheter du lait", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
