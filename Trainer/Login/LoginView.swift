//
//  LoginView.swift
//  Trainer
//
//  Created by user on 2022/05/15.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("current_user") var user = ""
    @State var textFieldUser: String = ""
    @State var showHomeView : Bool = false
    
    var body: some View {
        ZStack{
            if showHomeView {
                MessageView()
            }
            else {
                VStack{
                    HStack{
                        Text("Welcome!")
                            .font(.title)
                        //Character thickness
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding()
                    .offset(x:0,y:-240)
                    
                    VStack{
                        HStack{
                            Image(systemName: "person")
                                .font(.title)
                                .foregroundColor(.black)
                            TextField("Enter UserName",text: $textFieldUser)
                                .textFieldStyle(PlainTextFieldStyle())
                                .keyboardType(.default)
                                .padding()
                            
                            Button {
                                user = textFieldUser
                                self.showHomeView.toggle()
                            } label: {
                                Image(systemName: "play.fill")
                                    .font(.title2)
                            }
                            .disabled(textFieldUser == "")
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 70)
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(15)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
