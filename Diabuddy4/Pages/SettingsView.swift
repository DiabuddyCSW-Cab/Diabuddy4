import SwiftUI

struct SettingsView: View {
    @State private var showMenu = false
    @State private var targetBMI: Double = 20
    @State private var dailyCaloricIntake: Int = 500
    @State private var bloodPressure: Double = 50
    @State private var notificationsEnabled: Bool = true
    @State private var darkModeEnabled: Bool = true

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hexColor: "#A7DFFF"),
                            Color(hexColor: "#0B75B4")
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)

                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)

                        Text("Goals")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.bottom, 20)

                        Spacer()

                        sectionView(title: "Target BMI", titleFont: .title2) {
                            VStack(alignment: .leading) {
                                Slider(value: $targetBMI, in: 0...50, step: 1) {
                                    Text("Target BMI")
                                }
                                Text("Current: \(Int(targetBMI))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.bottom, 20)

                        sectionView(title: "Daily Caloric Intake", titleFont: .title2) {
                            Stepper(value: $dailyCaloricIntake, in: 500...10000, step: 100) {
                                Text("Daily Calories: \(dailyCaloricIntake)")
                            }
                        }
                        .padding(.bottom, 20)

                        sectionView(title: "Blood Pressure", titleFont: .title2) {
                            VStack(alignment: .leading) {
                                Slider(value: $bloodPressure, in: 20...150, step: 1) {
                                    Text("Blood Pressure (mm/Hg)")
                                }
                                Text("Current: \(Int(bloodPressure)) mm/Hg")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.bottom, 20)

                        sectionView(title: "Notifications", titleFont: .title2) {
                            Toggle(isOn: $notificationsEnabled) {
                                Text("Enable Notifications")
                                    .font(.body)
                            }
                        }
                        .padding(.bottom, 20)

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
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func sectionView<Content: View>(title: String, titleFont: Font = .headline, @ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: 10) {
            Text(title)
                .font(titleFont)
                .padding(.bottom, 5)

            content()
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
        .frame(width: 375) 
        .padding(.horizontal)
    }

}

#Preview {
    SettingsView()
}

