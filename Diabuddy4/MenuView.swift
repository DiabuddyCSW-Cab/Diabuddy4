import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: HomeView()) {
                HStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Home")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 100)
            
            NavigationLink(destination: AIPredictorView()) {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("AI Predictor")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 30)
            
            NavigationLink(destination: HistoryView()) {
                HStack {
                    Image(systemName: "book.fill")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("History")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 30)
            
            NavigationLink(destination: SettingsView()) {
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            .padding(.top, 30)
            
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Log Out")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 320)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    MenuView()
}

