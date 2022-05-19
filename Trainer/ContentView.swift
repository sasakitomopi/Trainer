//
//  ContentView.swift
//  PlayMusic
//
//  Created by user on 2021/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .previewDevice("iPhone 12 Pro")
        }
    }
}
 
struct MainView: View{

    @State private var selection: Tab = .search
    
    enum Tab{
        case search
        case interestedIn
        case scout
        case message
        case myPage
    }
    
    var body : some View{
        TabView(selection: $selection){
            SearchView()
                .tabItem{
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.blue)
                        Text("探す")
                    }
                }.tag(Tab.search)
            
            BookMarkView()
                .tabItem{
                    VStack{
                        Image(systemName: "bookmark")
                            .foregroundColor(Color.blue)
                        Text("気になる")
                    }
                }.tag(Tab.interestedIn)
            
            ScoutView()
                .tabItem{
                    VStack{
                        Image(systemName: "hand.point.up.left")
                            .foregroundColor(Color.blue)
                        Text("スカウト")
                    }
                }.tag(Tab.scout)
            
            LoginView()
                .tabItem{
                    VStack{
                        Image(systemName: "message")
                            .foregroundColor(Color.blue)
                        Text("メッセージ")
                    }
                }.tag(Tab.message)

            MyPageView()
                .tabItem{
                    VStack{
                        Image(systemName: "person")
                            .foregroundColor(Color.blue)
                        Text("マイページ")
                    }
                }.tag(Tab.myPage)
        }
    }
}
