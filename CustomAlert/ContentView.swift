//
//  ContentView.swift
//  CustomAlert
//
//  Created by Przemek on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Button {
                    showAlert1 = true
                } label: {
                    Text("Show alert 1")
                }
                .buttonStyle(.borderedProminent)
                .alert("Alert 1", isPresented: $showAlert1) {
                    
                } message: {
                    Text("message")
                }

                
                Button {
                    showAlert2 = true
                } label: {
                    Text("Show alert 2")
                }
                .buttonStyle(.bordered)
                
            }
            .padding()
            .navigationTitle("Custom Alert")
            .showCustomAlert(isPresented: $showAlert2, title: "Title", message: "message")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")

//        ContentView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
//            .previewDisplayName("iPhone 14 Pro Max")

    }
}
