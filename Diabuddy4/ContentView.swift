import CoreML
import SwiftUI

// Hex Color Extension
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

// Gradient Background View Modifier
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

// View Extension to Use Gradient Background
extension View {
    func gradientBackground() -> some View {
        self.modifier(GradientBackground())
    }
}

// HomeView with Navigation Links for Login and Register
struct InitialView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("db")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 191)
                    .padding()
                                
                // Navigation Link to LoginView
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.bottom, 20)
                
                // Navigation Link to RegisterView
                NavigationLink(destination: RegisterView()) {
                    Text("Register")
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

// Example: RegisterView Implementation
struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            VStack {
                Image("db") // Same asset as used in HomeView
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
                
                // Show errors if any
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
                
                // Register Button
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
                
                // Navigate to LoggedInView after successful registration
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                }
            }
            .padding()
            .gradientBackground()
        }
        .navigationBarBackButtonHidden(true)
    }

    // Dummy Authentication Logic
    func authenticateUser() {
        if username == "Test" && password == "password" {
            isLoggedIn = true
        } else {
            wrongUsername = username.isEmpty ? "Username cannot be empty" : "Incorrect username"
            wrongPassword = password.isEmpty ? "Password cannot be empty" : "Incorrect password"
        }
    }
}

// LoginView Implementation
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = ""
    @State private var wrongPassword = ""
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
            VStack {
                Image("db") // Image must be in Assets folder
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
                
                // Display errors
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
                
                // Login Button
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
                
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                }
            }
            .padding()
            .gradientBackground()
        }
        .navigationBarBackButtonHidden(true)
    }

    func authenticateUser() {
        if username == "Test" && password == "password" {
            isLoggedIn = true
        } else {
            wrongUsername = username.isEmpty ? "Username cannot be empty" : "Incorrect username"
            wrongPassword = password.isEmpty ? "Password cannot be empty" : "Incorrect password"
        }
    }
}




// MenuView (Ensure this is only declared once)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

