//
//  MessageView.swift
//  Trainer
//
//  Created by user on 2022/05/15.
//

import SwiftUI

struct MessageView: View {
    @ObservedObject var messageModel = HomeModel()
    @AppStorage("current_user") var user = ""
    @State var typeMessage = ""
    @State var scrolled = false
    var body: some View {
        VStack{
            HStack{
                Text("Chat")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding()
            .padding(.top)
            
            //MARK: configure of ScrollView
            ScrollViewReader { reader in
                ScrollView{
                    VStack{
                        ForEach(messageModel.msgs){ msg in
                            ChatRow(chatData: msg)
                                .padding(.bottom,15)
                                .padding(.top , 10)
                                .onAppear {
                                    //if msg.id does not equals self.messageModel.msgs.last.id and scrolled
                                    //Commentary URL : https://capibara1969.com/3562/
                                    if msg.id == self.messageModel.msgs.last!.id && !scrolled{
                                        reader.scrollTo(messageModel.msgs.last!.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        //of : wants to detect property
                        //perform : motion
                        .onChange(of: messageModel.msgs, perform: { value in
                            reader.scrollTo(messageModel.msgs.last!.id, anchor: .bottom)
                        })
                    }
                    .padding(.vertical)
                }
            }
            HStack{
                TextField("Enter Message",text: $messageModel.text)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.blue.opacity(0.06))
                    .clipShape(Capsule())
                if messageModel.text != "" {
                    Button {
                        messageModel.writeMsg(msg: messageModel.text, user: messageModel.user)
                        messageModel.text = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size:22))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                }
            }
            .ignoresSafeArea(.all,edges: .all)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

struct ChatRow : View {
    @AppStorage("current_user") var user = ""
    var chatData : MsgModel
    
    var body: some View {
        HStack{
            if chatData.user != user {
                Name(name: chatData.user)
                    .offset(x: 0, y: -39)
            }
            
            if chatData.user == user {Spacer()}
            
            VStack(alignment: chatData.user == user ? .trailing : .leading, spacing: 5) {
                Text(chatData.msg)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(chatData.user == user ? Color.blue : Color.gray)
                    .clipShape(ChatBubble(myMsg: chatData.user == user))
                Text(chatData.timeStamp,style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(chatData.user != user ? .leading : .trailing , 10)
            }
            
            if chatData.user != user {Spacer()}
        }
        .padding(.horizontal)
        .id(chatData.id)
    }
}

struct Name : View {
    @AppStorage("current_user") var user = ""
    var name : String
    
    var body: some View{
        Text(String(name.first!))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(width: 25, height: 25)
            .background(name == user ? Color.green : Color.blue)
            .clipShape(Circle())
    }
}


struct ChatBubble : Shape {
    var myMsg : Bool
    
    func path (in rect : CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight,myMsg ? .topLeft : .topRight],cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
}
