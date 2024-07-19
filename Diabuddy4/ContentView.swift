
//
//  ContentView.swift
//  diabuddy
//
//  Created by Roberto on 7/18/24.
//
import UIKit
import SwiftUI

extension Color {
    init(hexColor: String) {
        let hex = hexColor.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var isLoggedIn = false

    let gradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hexColor: "#A7DFFF"),
            Color(hexColor: "#0B75B4")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    private func authenticateUser() {
        // Dummy authentication logic
        if username == "Vishnu" && password == "123" {
            isLoggedIn = true
        } else {
            if username != "Vishnu" {
                wrongUsername = "Invalid username"
            }
            if password != "123" {
                wrongPassword = "Invalid password"
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                gradient.ignoresSafeArea()
                
                if isLoggedIn {
                    // Show the logged-in view
                    LoggedInView()
                } else {
                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding()
                                            
                        Text("Create an account")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Text("Enter your email to sign up")
                        
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.emailAddress)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        if !wrongUsername.isEmpty {
                            Text(wrongUsername)
                                .foregroundColor(.red)
                                .padding()
                        }
                        
                        if !wrongPassword.isEmpty {
                            Text(wrongPassword)
                                .foregroundColor(.red)
                                .padding()
                        }
                        
                        Button(action: {
                            authenticateUser()
                        }) {
                            Text("Sign up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoggedInView: View {
    var body: some View {
        VStack {
            Spacer() // Pushes the content to the center
            
            Text("You are logged in!")
                .font(.largeTitle)
                .bold()
                .padding()
                .multilineTextAlignment(.center) // Centers text horizontally
            
            Spacer() // Pushes the content to the center
        }
        .edgesIgnoringSafeArea(.all) // Makes the content extend beyond the safe areas
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
