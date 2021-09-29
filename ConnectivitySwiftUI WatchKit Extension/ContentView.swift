//
//  ContentView.swift
//  ConnectivitySwiftUI WatchKit Extension
//
//  Created by Евгений Басистый on 12.07.2020.
//  Copyright © 2020 Евгений Басистый. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
    @State var messageText = ""
    var body: some View {
        VStack{
            Text(self.model.messageText)
            TextField("Input your message", text: $messageText)
            Button(action: {
                self.model.session.sendMessage(["message" : self.messageText], replyHandler: nil) { (error) in
                    print(error.localizedDescription)
                }
            }
                   , label: {
                    Text("sendMessage")})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
