//
//  ContentView.swift
//  chatApp
//
//  Created by Mahmoud Ghoneim on 4/6/22.
//

import SwiftUI

struct ChatMessage : Hashable {
    var message: String
    var avatar: String
}


struct ContentView : View {
    
    @State var composedMessage: String = ""
    @EnvironmentObject var chatController: ChatController
    
    var body: some View {
        
        
        VStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)

                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)

                }
                Text("also joined group")
            }).padding(.top, 50)
            List {
                
                ForEach(chatController.messages, id: \.self) { msg in
                    HStack {
                        Group {
                            Image(systemName: msg.avatar)
                            Text(msg.message)
                                .bold()
                                .padding(10)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth:1) )
                        }
                    }
                }
                
                HStack {
                    
                    TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                    }.foregroundColor(.orange)
                    .frame(width: 25, height: 25)
                }.frame(maxHeight: CGFloat(40)).padding()
                .overlay( RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth:1))
                
            }
        }
    }
    func sendMessage(){
        chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "person.crop.circle.fill"))
        composedMessage = ""
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChatController())
    }
}



