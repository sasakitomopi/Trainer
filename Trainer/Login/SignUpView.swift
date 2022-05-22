//
//  SignUpView.swift
//  Trainer
//
//  Created by user on 2022/05/22.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State var mail = ""
    @State var password = ""
    @State var errorMessage = ""
    
    var body: some View {
        VStack(spacing:30){
            Text("新規登録画面")
                .font(.headline)
            //Character thickness
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
            TextField("メールアドレスを入力してください",text: $mail)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("パスワードを入力してください",text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                if(self.mail == ""){
                    self.errorMessage = "メールアドレスが入力されていません"
                    print("error")
                }else if(self.password == ""){
                    self.errorMessage = "パスワードが入力されていません"
                    print("パスワードが入力されていません")
                }else{
                    Auth.auth().createUser(withEmail: self.mail, password: self.password){ authResult,error in
                        print("success!!!")
                    }
                }
            } label: {
                Text("アカウント作成")
            }
        }
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
