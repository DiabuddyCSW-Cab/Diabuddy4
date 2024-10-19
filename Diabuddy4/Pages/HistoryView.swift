//
//  HistoryView.swift
//  Diabuddy4
//
//  Created by Roberto on 10/5/24.
//

import SwiftUI

struct HistoryView: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)
                        
                        Spacer()

                        Text("History Page")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        
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
    HistoryView()
}
