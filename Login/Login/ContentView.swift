//
//  ContentView.swift
//  Login
//
//
//

import SwiftUI

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var showErrorAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack() {
                VStack {
                    Image("MyLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 74.0, height: 74.0)
                        .padding(Edge.Set.bottom, 10)
                    
                    Text("Login")
                        .bold()
                        .font(.title)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10.0)
                        .padding(.bottom, 15)
                    
                    SecureField("Password", text: $password) {
                        // submit the password
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10.0)
                    .padding(.bottom, 10)
                    
                    HStack() {
                        Spacer()
                        Text("Forgot Password?")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 40)
                    
                    Button(action: { self.loginButtonAction() }) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.green)
                    .cornerRadius(4.0)
                }
                .padding()
            }
        }
        .alert(isPresented: $showErrorAlert) { () -> Alert in
            Alert(title: Text(""),
                  message: Text("Invalid email or password"),
                  dismissButton: .default(Text("Ok")))
        }
    }
    
    /// Check for valid inputs
    private func loginButtonAction() {
        if email.isValidEmail && password.isValidPassword {
            // Login to view
        } else {
            self.showErrorAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
