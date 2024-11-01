import SwiftUI

struct HomeView: View {
    @State private var showMenu = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hexColor: "#A7DFFF"),
                            Color(hexColor: "#0B75B4")
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)

                        Text("Stay Ahead of Diabetes")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)

                        NavigationLink(destination: AIPredictorView()) {
                            Text("Go Now")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(12)
                                .shadow(radius: 5)
                        }
                        .padding(.bottom, 20)

                        Text("About Us")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.bottom, 8)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("""
At DiaBuddy, we’re dedicated to helping you take control of your health by predicting your risk of diabetes. Our app provides a risk prediction tool, as well as a goal setter, making it easier for patients to stay informed and take preventive action. Join us in building a healthier future. **Model was tested at 80% accuracy, should not be used definitively for assessing diabetes. Our goal is to use this predictor to encourage patients to seek efficient professional care from their doctor.
""")
                                .font(.system(size: 18, design: .rounded))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(5)

                        }
                        .padding(20)
                        .frame(width: geometry.size.width * 0.85)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)

                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: showMenu ? geometry.size.width / 2 : 0)
                    .disabled(showMenu)

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
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.blue)
                    .imageScale(.large)
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}

#Preview {
    HomeView()
}

