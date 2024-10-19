import SwiftUI

struct HomeView: View {
    @State private var showMenu = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Main content for the logged-in view
                    VStack {
                        // Logo at the top
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40) // Add some top padding if needed


                        // Centered content
                        Text("Stay Ahead of Diabetes")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        
                        NavigationLink(destination: AIPredictorView()) {
                            Text("Go Now")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .padding()
                        
                        Text("About Us")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        
                        Text("At DiaBuddy, we’re dedicated to helping you take control of your health by predicting your risk of diabetes. Our app provides personalized insights, making it easy to stay informed and take preventive action. Join us in building a healthier future.")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()

                        Spacer()
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: showMenu ? geometry.size.width / 2 : 0)
                    .disabled(showMenu) 

                    // Menu view that slides in when showMenu is true
                    if showMenu {
                        MenuView()
                            .frame(width: geometry.size.width / 2)
                            .transition(.move(edge: .leading))
                            .zIndex(1)
                    }
                }
            }
            
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3") // Hamburger icon
                    .foregroundColor(.blue)
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle()) // Avoid issues in some cases
    }
}

#Preview {
    HomeView()
}
