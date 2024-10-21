import SwiftUI
import CoreML

struct AIPredictorView: View {
    @State private var showMenu = false
    @State private var glucose: String = ""
    @State private var bloodPressure: String = ""
    @State private var skinThickness: String = ""
    @State private var insulin: String = ""
    @State private var bmi: String = ""
    @State private var age: String = ""
    @State private var diabetesPedigreeFunction: String = ""
    @State private var pregnancies: String = ""
    
    @State private var result: String = ""
    
    let model = DiabetesAI()
    
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
                        
                        Spacer()
                        
                        Text("AI Predictor")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                        
                        VStack(spacing: 10) {
                            TextField("Glucose", text: $glucose)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Blood Pressure", text: $bloodPressure)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Skin Thickness (optional)", text: $skinThickness)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Insulin (optional)", text: $insulin)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("BMI", text: $bmi)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Age", text: $age)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Diabetes Pedigree Function (optional)", text: $diabetesPedigreeFunction)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                            TextField("Pregnancies", text: $pregnancies)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 20)
                        }
                        .padding()
                        
                        Button(action: predict) {
                            Text("Predict")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        Text("Result: \(result)")
                            .font(.headline)
                            .padding()
                        
                        Spacer()
                        Text("0 - Not in risk of diabetes ")
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 8)
                        Text("1 - In risk of diabetes ")
                            .font(.system(size: 18, design: .rounded))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 8)
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
    
    func predict() {
        let input = DiabetesAIInput(
            Glucose: Double(glucose) ?? 0.0,
            BloodPressure: Double(bloodPressure) ?? 0.0,
            SkinThickness: Double(skinThickness) ?? 0.0,
            Insulin: Double(insulin) ?? 0.0,
            BMI: Double(bmi) ?? 0.0,
            Age: Double(age) ?? 0.0,
            DiabetesPedigreeFunction: Double(diabetesPedigreeFunction) ?? 0.0,
            Pregnancies: Double(pregnancies) ?? 0.0
        )
        
        do {
            let prediction = try model.prediction(input: input)
            result = "\(prediction.classLabel)"
        } catch {
            result = "Error in prediction: \(error.localizedDescription)"
        }
    }
}

#Preview {
    AIPredictorView()
}

