//
//  MenuView.swift
//  diabuddy
//
//  Created by Roberto on 8/11/24.
//

//CHANGE THIS LATER TO WHAT WE HAVE IN FIGMA

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Home")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("AI Predictor")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "book.fill")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("History")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
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
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           }
}

#Preview {
    MenuView()
}

