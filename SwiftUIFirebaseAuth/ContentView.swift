//
//  ContentView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Lucas Spusta on 7/9/20.
//

//
//  ContentView.swift
//  SwiftUIFirebaseAuth
//
//  Created by Lucas Spusta on 7/9/20.
//

import SwiftUI
import Firebase
struct ContentView : View {

  @EnvironmentObject var session: SessionStore

  func getUser () {
      session.listen()
  }

  var body: some View {
    Group {
      if (session.session != nil) {
        Text("Hello user!")
      } else {
        SignInView()
      }
    }.onAppear(perform: getUser)
  }
}

struct SignInView : View {

    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }

    var body: some View {
     
//        VStack() {
//            Text("Login")
//                .font(.largeTitle).foregroundColor(Color.white)
//                .padding([.top, .bottom], 40)
//                .shadow(radius: 10.0, x: 20, y: 10)
//
//            Image("iosapptemplate")
//                .resizable()
//                .frame(width: 250, height: 250)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                .shadow(radius: 10.0, x: 20, y: 10)
//                .padding(.bottom, 50)
//
//            VStack(alignment: .leading, spacing: 15) {
//                TextField("Email", text: self.$email)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(20.0)
//                    .foregroundColor(.black)
//
//                    .shadow(radius: 10.0, x: 20, y: 10)
//
//                SecureField("Password", text: self.$password)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(20.0)
//                    .shadow(radius: 10.0, x: 20, y: 10)
//            }.padding([.leading, .trailing], 27.5)
//            if error {
//                print("Ahhhhh Crap")
//            }
//            Button(action: signIn) {
//                Text("Sign In")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(width: 300, height: 50)
//                    .background(Color.green)
//                    .cornerRadius(15.0)
//                    .shadow(radius: 10.0, x: 20, y: 10)
//            }.padding(.top, 50)
//
//            Spacer()
//            HStack(spacing: 0) {
//                Text("Don't have an account? ")
//                Button(action: {}) {
//                    Text("Sign Up")
//                        .foregroundColor(.black)
//                }
//            }
//        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [.blue, .blue]), startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all))

        
        
        VStack {
            TextField("email address", text: $email).autocapitalization(.none)
            TextField("password", text: $password).autocapitalization(.none)
            if (error) {
                Text("ahhh crap")
            }
            Button(action: signIn) {

                Text("Sign in")
            }
        }
    }
}
