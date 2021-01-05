//
//  ContentView.swift
//  BMICalculator


import SwiftUI

struct ContentView: View {
    
    @State var bmiCal = ""
    @State var bmiStatus = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("My name: Your Name")
                    .font(.custom("AndikaNewBasic-Bold", size: 15))
                
                Text("BMI: \(bmiCal)")
                    .font(.custom("AndikaNewBasic-Bold", size: 24))
                    
                
                Text("Status: \(bmiStatus)")
                    .font(.custom("AndikaNewBasic-Bold", size: 25))
                
                NavigationLink(
                    destination: BMI(bmiCal: $bmiCal, bmiStatus: $bmiStatus),
                    label: {
                        Text("اضغط")
                            .foregroundColor(.white)
                            .padding(.vertical, 10.0)
                            .padding(.horizontal, 40.0)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
