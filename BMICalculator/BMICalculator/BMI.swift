//
//  BMI.swift
//  BMICalculator
//


import SwiftUI

struct BMI: View {
    
    @State var height: String = ""
    @State var weight: String = ""

    @Binding var bmiCal: String
    @Binding var bmiStatus: String
    
    var body: some View {
        
        VStack {
            Text("مرحباً بك بحاسبة الBMI")
                .font(.custom("AndikaNewBasic-Bold", size: 35))
            
            TextField("الطول بالمتر", text: $height)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("الوزن بالكيلوجرام", text: $weight)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                
                let h = Double(height) ?? 0.0
                let w = Double(weight) ?? 0.0
                
                bmiCal = String(format: "%.1f", w / (h * h))
                
                if Double(bmiCal) ?? 0.0 <= 20.0 {
                    bmiStatus = "ضعيف"
                } else if Double(bmiCal) ?? 0.0 <= 25.0 {
                    bmiStatus = "جيد"
                } else {
                    bmiStatus = "سمين"
                }
            }
            , label: {
                Text("إحسب")
                    .foregroundColor(.white)
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 40.0)
                    .background(Color.blue)
                    .clipShape(Capsule())
            })
            .padding()
            
            Text("BMI")
                .font(.custom("AndikaNewBasic-Bold", size: 25))
            
            Text( bmiCal)
                .font(.custom("AndikaNewBasic-Bold", size: 25))
            
            Text("Status")
                .font(.custom("AndikaNewBasic-Bold", size: 25))
            
            Text(bmiStatus)
                .font(.custom("AndikaNewBasic-Bold", size: 25))
            
        }
        .padding()
    }
}

struct BMI_Previews: PreviewProvider {
    static var previews: some View {
        BMI(bmiCal: .constant("6"), bmiStatus: .constant("6"))
    }
}
