//
//  SettingsView.swift
//  Diabuddy4
//
//  Created by Roberto on 10/5/24.
//

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
                    VStack {
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)

                        Text("Goals")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()

                        Form {
                                        // Target Blood Sugar Section
                                        Section(header: Text("Target BMI")) {
                                            VStack(alignment: .leading) {
                                                Text("Target BMI")
                                                Slider(value: $targetBMI, in: 0...50, step: 1) {
                                                    Text("Blood Sugar")
                                                }
                                                Text("Current: \(Int(targetBMI)) ")
                                            }
                                        }
                                        
                                        // Daily Carb Intake Section
                                        Section(header: Text("Daily Caloric Intake")) {
                                            VStack(alignment: .leading) {
                                                Stepper(value: $dailyCaloricIntake, in: 500...10000, step: 100) {
                                                    Text("Daily Calories: \(dailyCaloricIntake) ")
                                                }
                                            }
                                        }
                                        
                                        // Insulin Sensitivity Section
                                        Section(header: Text("Blood Pressure")) {
                                            VStack(alignment: .leading) {
                                                Text("Blood Pressure (mm/Hg)")
                                                Slider(value: $bloodPressure, in: 20...150, step: 1) {
                                                    Text("Insulin Sensitivity")
                                                }
                                                Text("Current: \(Int(bloodPressure)) mm/Hg")
                                            }
                                        }
                                        
                                        // Notifications Section
                                        Section(header: Text("Notifications")) {
                                            Toggle(isOn: $notificationsEnabled) {
                                                Text("Enable Notifications")
                                            }
                                        }
                            
                                    }

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
    SettingsView()
}
