//
//  MsgModel.swift
//  Trainer
//
//  Created by user on 2022/05/11.
//

import SwiftUI
import FirebaseFirestoreSwift

struct MsgModel: Codable , Identifiable , Hashable {
    //UUID生成
    @DocumentID var id : String?
    var user : String
    var msg : String
    var timeStamp : Date

    enum CodingKeys: String,CodingKey {
        case id
        case user
        case msg
        case timeStamp
    }
}
