//
//  ContentView.swift
//  BMICalculatorCW
//
//  Created by Mohammed on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var height: String = ""
    @State var weight: String = ""
    @State var bmi: String = ""
    @State var bmiFunny: String = ""
    @State var funnyPhoto: String = "white"
    @State var red:Color = Color.white
    @State var red1:Color = Color.white
    
    var body: some View {
        VStack {
            Image("bg")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            VStack {
                Image("weight-scale")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("حاسبة الاحباط")
                    .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 70))
                    .padding(.vertical, -20.0)
                
                TextField("Height", text: $height)
                    .background(self.red)
                    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.custom("AndikaNewBasic-Regular", size: 20))
                
                TextField("Weight", text: $weight)
                    .background(self.red1)
                    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.custom("AndikaNewBasic-Regular", size: 20))
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.vertical, -20.0)
            
            VStack {
                Button("اصدمني") {
                    
                    let h = Double(height) ?? 0.0
                    let w = Double(weight) ?? 0.0
                    
                    bmi = String(format: "%.1f", w / (h * h))
                    
                    if h < 0.0 {
                        self.red = Color.red
                    } else {
                        self.red = Color.white
                    }
                    
                    if w < 0.0 {
                        self.red1 = Color.red
                    } else {
                        self.red1 = Color.white
                    }
                    
                    if Double(bmi) ?? 0.0 <= 20.0 {
                        
                        funnyPhoto = "coco"
                        bmiFunny = "عود يدق العود"
                        
                    } else if Double(bmi) ?? 0.0 <= 25.0 {
                        
                        funnyPhoto = "warrior"
                        bmiFunny = "كيتو ماستر"
                        
                    } else {
                        
                        funnyPhoto = "elephant"
                        bmiFunny = "بو تمبة كسر اللمبة"
                        
                    }
                    
                }
                .disabled(self.height.isEmpty)
                .disabled(self.weight.isEmpty)
                .padding(.vertical, -60.0)
                
                Image("\(funnyPhoto)")
                    .resizable()
                    .scaledToFit()
                
                Text(bmiFunny)
                    .font(.custom("(A) Arslan Wessam A (A) Arslan Wessam A", size: 50))
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
