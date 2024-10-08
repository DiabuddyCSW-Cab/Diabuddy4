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
                            .padding(.top, 40) // Add some top padding if needed

                        Spacer() // This will push the content down

                        // Centered content
                        Text("Home page")
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
