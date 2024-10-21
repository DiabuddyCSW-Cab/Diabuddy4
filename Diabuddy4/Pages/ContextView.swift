import SwiftUI

struct ContextView: View {
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
                                   startPoint: .top,
                                   endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)
                        
                        Text("What is Diabetes?")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.bottom, 8)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("""
Diabetes is a chronic condition that affects the way the body processes blood sugar (glucose). Normally, insulin helps glucose from food enter cells to be used as energy. In diabetes, the body either doesn’t make enough insulin (Type 1) or becomes resistant to insulin (Type 2), leading to high blood sugar levels. This can result in long-term complications like heart disease, kidney failure, and nerve damage

Diabetes is a significant health concern in Delaware, where the prevalence of diagnosed diabetes has been rising steadily. As of 2022, 13.9% of Delaware adults had been diagnosed with diabetes, with 12.6% also reporting pre-diabetes. Type 2 diabetes is far more common, with 90.9% of Delaware’s cases being Type 2. The prevalence of diabetes tends to increase with age and is higher among Black adults compared to White adults. The financial and health burden of diabetes in the state is substantial, with associated healthcare costs estimated at nearly $1 billion annually.
""")
                            .font(.system(size: 15.7, design: .rounded))
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
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContextView()
}

