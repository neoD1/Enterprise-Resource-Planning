//
//  LoginUserInterface.swift
//  ERP Codebase
//
//  Created by Frank Castle on 04/04/20.
//  Copyright © 2020 Code Bew. All rights reserved.
//

import SwiftUI


enum LoginTypes {
    
    case emailPhone
    case facebook
    case google
    case apple
    
    func properties() -> (String , String) {
        switch self {
        case .emailPhone:
            return ("ic_user" , "Login with Phone or Email")
        case .facebook :
            return ("ic_facebook" , "Login with Facebook")
        case .google:
            return ("ic_google" , "Login with Google")
        default:
            return ("ic_apple" , "Login with Apple")

        }
    }
    
}



struct LoginUserInterface: View {
    var body: some View {
    
        VStack(spacing : 20){
            Spacer()
            LoginTop()
            LoginButtonView()
            LoginButtonView(loginType: .facebook)
            LoginButtonView(loginType: .google)
            LoginButtonView(loginType: .apple)
            Spacer()
            LoginBottom()
        }
        .edgesIgnoringSafeArea(.all)

    
    }
    
}





struct LoginButtonView : View {
    
    var loginType : LoginTypes = .emailPhone
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .border(borderGray, width: 1)
                .frame(width: UIScreen.main.bounds.width - 40, height: 56)
            HStack(spacing : 32) {
                HStack(spacing : 16) {
                    Image(loginType.properties().0)
                    Rectangle()
                        .fill(borderGray)
                        .frame(width: 1, height: 48)
                }
                Text(loginType.properties().1)
                    .foregroundColor(textGray).fontWeight(.semibold).font(Font.system(size: 14))
                                Spacer()

            }
            .frame(width: UIScreen.main.bounds.width - 80, height: 56)
            .gesture(TapGesture().onEnded({ (_) in
                print(self.loginType.properties().1)
            }))
        }
    }
}

struct LoginUserInterface_Previews: PreviewProvider {
    static var previews: some View {
        LoginUserInterface()
    }
}


let blueish = Color(red: 4/255, green: 145/255, blue: 255/255)
let textGray = Color(red: 72/255, green: 72/255, blue: 72/255)
let borderGray = Color.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.1)

struct LoginBottom : View {
    
    
    var body: some View {
        
        
        VStack(spacing : 36) {
            VStack{
                Text("By continue, you agree to our")
                    .foregroundColor(textGray).fontWeight(.medium).font(Font.system(size: 14))
                HStack {
                    Text("Terms of service")
                        .foregroundColor(blueish).fontWeight(.medium).font(Font.system(size: 14))
                        .gesture(TapGesture().onEnded({ (_) in
                            print("TOS")
                        }))
                    Text("and")
                        .foregroundColor(textGray).fontWeight(.medium).font(Font.system(size: 14))
                    Text("Privacy Policy")
                    .foregroundColor(blueish).fontWeight(.medium).font(Font.system(size: 14))
                    .gesture(TapGesture().onEnded({ (_) in
                        print("PP")
                    }))
                }
            }
            ZStack{
                Rectangle()
                    .fill(Color(red: 237/255, green: 237/255, blue: 237/255))
                    .frame(width: UIScreen.main.bounds.width , height: 66)
                HStack (spacing : 8) {
                    Text("Don't have an account?")
                        .foregroundColor(textGray).fontWeight(.medium).font(Font.system(size: 14))
                    Text("Sign Up")
                    .foregroundColor(blueish).fontWeight(.bold).font(Font.system(size: 14))
                }
            }
        }
        
        
        
    }
}

struct LoginBottom_Previews: PreviewProvider {
    static var previews: some View {
        LoginBottom()
    }
}




struct LoginTop : View {
    
    
    var body: some View {
        
        
        Text("Login to Code Brew Labs")
            .foregroundColor(textGray).fontWeight(.bold).font(Font.system(size: 18))

        
        
        
    }
}

struct LoginTop_Previews: PreviewProvider {
    static var previews: some View {
        LoginTop()
    }
}
