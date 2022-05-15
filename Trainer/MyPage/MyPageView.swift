//
//  MyPageView.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI

struct MyPageView: View {
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List{
                //Header
                MyPageHeader()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                //Order Menu(受注者メニュー)
                Text("受注者メニュー")
                    .frame(maxWidth: .infinity,alignment: .leading)
                MyPageOrderMenu()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                //Tranasfer Amount
                MyPageTranserAmount()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                HStack{
                    Image(systemName: "person.crop.square")
                    NavigationLink("フォロー中のクライアント",destination: FollowClientView())
                }
                HStack{
                    Image(systemName: "magnifyingglass")
                    NavigationLink("保存した検索結果",destination: FollowClientView())
                }
            }
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            //showing like modal
            .sheet(isPresented: $showingProfile){
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
