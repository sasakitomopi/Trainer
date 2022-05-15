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
                    let user = doc.document.get("name") as! String
                    let msg = doc.document.get("message") as! String
                    let createdAt = doc.document.get("createAt",serverTimestampBehavior: .estimate) as! Timestamp
                    let createdDate = createdAt.dateValue()
                    
                    DispatchQueue.main.async {
                        self.msgs.append(MsgModel(id: id,user: user, msg:msg,timeStamp: createdDate))
                    }
                }
            }
            
        }
    }
    
    func writeMsg(){
        let msg = ["user": user,"message":text,"timeStamp": FieldValue.serverTimestamp()] as [String : Any]
        let _ = ref.collection("Msgs").addDocument(data: msg) { err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            self.text = ""
        }
    }
}
