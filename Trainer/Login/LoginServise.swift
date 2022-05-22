//
//  LoginServise.swift
//  Trainer
//
//  Created by user on 2022/05/19.
//

import SwiftUI
import FirebaseAuth

struct LoginServise: View {
    @State var mail = ""
    @State var password = ""
    @State var errorMessage = ""
    @State var signUpFlg = false
    @State var loginFlg = false
    
    var body: some View {
        NavigationView{
            VStack(spacing:30){
                Text("ログイン画面")
                    .font(.headline)
                    .fontWeight(.heavy)
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
                        Auth.auth().signIn(withEmail: self.mail,password: self.password){ authResult,error in
                            if authResult?.user != nil {
                                print("success!!!")
                                loginFlg = true
                            }else{
                                if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue : error.code){
                                    switch errorCode {
                                    case .invalidEmail:
                                        self.errorMessage = "メールアドレスの形式が正しくありません"
                                        print("メールアドレスの形式が正しくありません")
                                        break
                                    case .wrongPassword, .userNotFound:
                                        self.errorMessage = "メールアドレス、またはパスワードが間違っています"
                                        print("メールアドレス、またはパスワードが間違っています")
                                        break
                                    case .userDisabled:
                                        self.errorMessage = "このユーザーアカウントは無効化されています"
                                        print("このユーザーアカウントは無効化されています")
                                        break
                                    default:
                                        self.errorMessage = error.domain
                                        print(errorMessage)
                                        break
                                    }
                                }
                            }
                            
                        }
                    }
                } label: {
                    Text("ログイン")
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(Color.white)
                        .padding()
                }
                .sheet(isPresented: $loginFlg){
                    ContentView()
                }
                Divider()
                
                HStack{
                    Text("アカウントをお持ちでない場合")
                        .foregroundColor(Color.gray)
                    Button {
                        self.signUpFlg = true
                    } label: {
                        Text("アカウント作成")
                    }
                    .sheet(isPresented: $signUpFlg){
                        SignUpView()
                    }
                }
            }
        }
    }
}

struct LoginServise_Previews: PreviewProvider {
    static var previews: some View {
        LoginServise()
    }
}
