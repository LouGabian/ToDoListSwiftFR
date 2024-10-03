//
//  HeaderView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(.degrees(15))
            
            VStack /* VStack text */ {
                
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Get things done")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                
            }//END Vstack text
            .padding(.top, 30)
            
        }//END ZStack here
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
        
    }// END body
    
}//END struct View

#Preview {
    HeaderView()
}
