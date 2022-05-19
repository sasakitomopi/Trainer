//
//  MessageView.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI

struct MessageRow: View {
    let msg : String
    let isMyMessage : Bool
    let user : String
    let date : Date
    var body: some View {
        let df = dateToString(date:date)
        HStack{
            if isMyMessage{
                Spacer()
                
                VStack{
                    Text(msg)
                        .padding(8)
                        .background(Color.red)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    Text(df.string(from: date))
                        .font(.callout)
                }
            }else{
                VStack(alignment: .leading){
                    Text(msg)
                        .padding(8)
                        .background(Color.green)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                    
                    HStack{
                        Text(user)
                        
                        Text(df.string(from: date))
                            .font(.callout)
                    }
                }
                Spacer()
            }
        }
    }
}

//Date to String Method
func dateToString(date:Date) -> DateFormatter{
    let df = DateFormatter()
    df.dateFormat = "yyyy/MM/dd HH:mm"
    df.locale = Locale(identifier: "ja_JP")
    return df
}

struct MessageRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRow(msg: "test", isMyMessage: true, user: "test", date: Date())
        MessageRow(msg: "test", isMyMessage: false, user: "test", date: Date())
    }
}
