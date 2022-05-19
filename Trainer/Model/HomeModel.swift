//
//  HomeModel.swift
//  Trainer
//
//  Created by user on 2022/05/12.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject {
    @Published var text = ""
    @Published var msgs : [MsgModel] = []
    @AppStorage("current_user") var user = ""

    let ref = Firestore.firestore()
    init(){
        readAllMsgs()
    }
    
    func readAllMsgs(){
        //reference data record
        //descending:降順
        ref.collection("Msgs").order(by: "timeStamp",descending: false).addSnapshotListener { snap,err in
            
            //if valiable err is not nil then
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            //select data record
            guard let data = snap else {
                return
            }
            
            data.documentChanges.forEach { doc in
                if doc.type == .added {
                    let id = doc.document.documentID
                    let user = doc.document.get("user") as! String
                    let message = doc.document.get("message") as! String
                    let createdAt = doc.document.get("timeStamp",serverTimestampBehavior: .estimate) as! Timestamp
                    let createdDate = createdAt.dateValue()
                    DispatchQueue.main.async {
                        self.msgs.append(MsgModel(id:id ,user: user, msg: message, timeStamp: createdDate))
                    }
                }
            }
            
        }
    }
    
    func writeMsg(msg: String , user: String) {
        let data = [
            "message": msg,
            "user": user,
            "timeStamp":FieldValue.serverTimestamp(),
        ] as [String : Any]

        let ref = Firestore.firestore()

        ref.collection("Msgs").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            print("success")
        }
    }
}
