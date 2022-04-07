//
//  ChatController.swift
//  chatApp
//
//  Created by Mahmoud Ghoneim on 4/6/22.
//


import Combine
import SwiftUI

class ChatController : ObservableObject {
   
    var didChange = PassthroughSubject<Void, Never>()
    
   
    @Published var messages = [ChatMessage]()
    
    func sendMessage(_ chatMessage: ChatMessage) {
        messages.append(chatMessage)
        didChange.send(())
    }
    
}

struct ChatController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
