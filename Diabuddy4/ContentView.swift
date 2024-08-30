// NEED TO IMPORT SQL TO ADD CREDENTIALS INTO DB

//5:21 in hamburger menu vid

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

struct GradientBackground: ViewModifier {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hexColor: "#A7DFFF"),
            Color(hexColor: "#0B75B4")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    func body(content: Content) -> some View {
        ZStack {
            gradient
                .ignoresSafeArea()
            content
        }
    }
}


extension View {
    func gradientBackground() -> some View {
        self.modifier(GradientBackground())
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("db")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 191)
                    .padding()
                                
                NavigationLink(destination: LoginView()) {
                    Text("Login20000")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: RegisterView()) {
                    Text("Registerrrr")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                
                Spacer(minLength: 50)
            }
            .padding()
            .gradientBackground() // Apply the gradient background
            .navigationBarHidden(true)
        }
    }
}

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            VStack {
                Image("db")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 191)
                
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HStack {
                    Text("Have an account?")
                    NavigationLink(destination: LoginView()) {
                    Text("Login here.")
                            .foregroundColor(.purple)
                            .bold()
                    }
                }
                
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
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                NavigationLink(destination: LoggedInView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .padding()
            .gradientBackground() // Apply the gradient background here
            
            if isLoggedIn {
                // Show the logged-in view
                LoggedInView()
            }
        }
    }

    
//NOT FINISHED -->
    func authenticateUser() {
        // Basic authentication example
        // Replace this with your actual authentication logic
        if username == "Test" && password == "password" {
            isLoggedIn = true
        } else {
            wrongUsername = username.isEmpty ? "Vishnu" : "Incorrect username"
            wrongPassword = password.isEmpty ? "123" : "Incorrect password"
        }
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            VStack {
                Image("db")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 191)
                
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: RegisterView()) {
                    Text("Register here.")
                            .foregroundColor(.purple)
                            .bold()
                    }
                }
                
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
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                NavigationLink(destination: LoggedInView(), isActive: $isLoggedIn) {
                                EmptyView()
                            }
            }
            .padding()
            .gradientBackground() // Apply the gradient background here
            
            if isLoggedIn {
                // Show the logged-in view
                LoggedInView()
            }
        }
    }

    func authenticateUser() {
        // Basic authentication example
        // Replace this with your actual authentication logic
        if username == "Test" && password == "password" {
            isLoggedIn = true
        } else {
            wrongUsername = username.isEmpty ? "Vishnu" : "Incorrect username"
            wrongPassword = password.isEmpty ? "123" : "Incorrect password"
        }
    }
}

struct LoggedInView: View {
    
    @State var showMenu = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                if self.showMenu {
                    MenuView()
                        .frame(width: geometry.size.width/2)
                }
            }
        }
        .edgesIgnoringSafeArea(.all) // Makes the content extend beyond the safe areas
    }
}

struct MainView: View {
    var body: some View {
        Button(action: {
            print("open menu")
        }) {
            Text("Open menu")
        }
    }
}

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

