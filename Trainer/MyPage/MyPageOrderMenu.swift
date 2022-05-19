//
//  MyPageOrder.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI

struct MyPageOrderMenu: View {
    var body: some View {
        VStack(){
            HStack(spacing: 100){
                VStack(){
                    Text("受注実績")
                    Text("0" + "件")
                }
                
                VStack(){
                    Text("評価")
                    Text("-")
                }
            }
        }
    }
}

struct MyPageOrderMenu_Previews: PreviewProvider {
    static var previews: some View {
        MyPageOrderMenu()
    }
}
