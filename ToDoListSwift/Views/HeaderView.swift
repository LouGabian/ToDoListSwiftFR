//
//  HeaderView.swift
//  ToDoListSwift
//
//  Created by Jonathan Gusse on 03/10/2024.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(.degrees(angle))
            
            VStack /* VStack text */ {
                
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                
            }//END Vstack text
            .padding(.top, 80)
            
        }//END ZStack here
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
        
    }// END body
    
}//END struct View

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: Color.pink)
}
