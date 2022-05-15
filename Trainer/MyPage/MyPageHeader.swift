//
//  MyPageHeader.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI

struct MyPageHeader: View {
    var body: some View {
        VStack{
            Text("マイページ")
                .foregroundColor(Color.white)
            //動的にする必要あり
            Image("person")
                .resizable()
                .frame(width: 100, height: 100)
            Text("tomohiro_sasaki")
                .font(.headline)
                .foregroundColor(Color.white)
            Text("ID:" + "aaaaaaaaaa")
                .foregroundColor(.white)
        }
    }
}

struct MyPageHeader_Previews: PreviewProvider {
    static var previews: some View {
        MyPageHeader()
    }
}
