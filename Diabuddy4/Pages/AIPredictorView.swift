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
                    VStack {
                        // Logo at the top
                        Image("db")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 191)
                            .padding(.top, -40)
                        
                        Spacer()
                        
                        // Centered content
                        Text("AI Predictor Page")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        
                        // Input fields for each input
                        VStack(spacing: 10) {
                            TextField("Glucose", text: $glucose)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Blood Pressure", text: $bloodPressure)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Skin Thickness (optional)", text: $skinThickness)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Insulin (optional)", text: $insulin)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("BMI", text: $bmi)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Age", text: $age)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Diabetes Pedigree Function (optional)", text: $diabetesPedigreeFunction)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Pregnancies", text: $pregnancies)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding()
                        
                        // Prediction button
                        Button(action: predict) {
                            Text("Predict")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        // Display prediction result
                        Text("Result: \(result)")
                            .font(.headline)
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
                Image(systemName: "line.horizontal.3") // Hamburger icon
                    .foregroundColor(.blue)
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // Prediction function
    func predict() {
        // Create an instance of the input struct
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
        
        // Make prediction using the model
        do {
            let prediction = try model.prediction(input: input)
            
            // Access the correct output property
            result = "\(prediction.classLabel)" // Adjust based on the actual property name
        } catch {
            result = "Error in prediction: \(error.localizedDescription)"
        }
    }
    
}

#Preview {
    AIPredictorView()
}

