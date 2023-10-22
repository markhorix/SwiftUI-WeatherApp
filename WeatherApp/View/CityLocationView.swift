//
//  CityLocationView.swift
//  WeatherApp
//
//  Created by Mideveloper on 23/10/2023.
//

import SwiftUI

struct CityLocationView: View {
    
    // MARK: - PROPERTIES
    @State private var cityName: String = ""
    var cityNameClosure: (_ cityName: String) -> Void
    @Binding var isPresented: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // : Background View
            LinearGradient(
                colors: [
                    .customWindyPuple,
                    .customWindyCyan
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // : CONTENT
            VStack(alignment: .center) {
                Text("Check out the weather of any city around the Globe.")
                    .font(.footnote)
                    .padding(.vertical, 16)
                HStack {
                    Text("")
                        .padding(.horizontal, 8)
                    TextField("Enter city Name", text: $cityName)
                        .textFieldStyle(.plain)
                }
                .frame(height: 50)
                .background(Color.white)
                .clipShape(.capsule)
                
                Button {
                    if !cityName.isEmpty {
                        cityNameClosure(cityName)
                        isPresented = false
                    }
                } label: {
                    Text("Get Weather")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 20)
                }
                .buttonStyle(.bordered)
                .tint(.black)
                .clipShape(.capsule)
                .padding(.vertical, 20)
                
                Spacer()
            }//: VStack
            .padding([.horizontal, .vertical], 24)
        }//: ZStack
    }
}

#Preview {
    CityLocationView(cityNameClosure: {_ in }, isPresented: .constant(true))
}
