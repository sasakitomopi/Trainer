//
//  MyPageTranserAmount.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI

struct MyPageTranserAmount: View {
    var body: some View {
        VStack(){
            HStack(spacing: 100){
                VStack(){
                    Text("未出金")
                    Text("0" + "円")
                }
                
                VStack(){
                    Text("次回の振込金額")
                    Text("0" + "円")
                }
            }
        }
    }
}

struct MyPageTranserAmount_Previews: PreviewProvider {
    static var previews: some View {
        MyPageTranserAmount()
    }
}
