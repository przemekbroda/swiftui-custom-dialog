//
//  CustomDialog.swift
//  CustomAlert
//
//  Created by Przemek on 26/01/2023.
//

import SwiftUI

struct CustomAlert<Presenting>: View where Presenting: View {
    
    @Binding var isPresented: Bool
    private let animDuration = 0.20
    
    var title: String
    var message: String
    let presenting: () -> Presenting
    
    var body: some View {
        ZStack {
            self.presenting()
                .zIndex(1)
            
            if isPresented {
                
                Color.gray.opacity(isPresented ? 0.4 : 0.0)
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut, value: isPresented)
                    .transition(.opacity.animation(.easeInOut(duration: animDuration)))
                    .zIndex(2)
                
                ZStack(alignment: .top) {
                    VStack {
                        Text(title)
                            .font(.headline)
                            .padding(.bottom, 1)
                            .padding(.top, 20)
                        
                        Text(message)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.center)
                            
                        
                        HStack {
                            Spacer()
                            Button {
                                withAnimation {
                                    isPresented.toggle()
                                }
                            } label: {
                                Text("Close")
                            }
                        }
                        .padding(.top)

                    }
                    .padding()
                    .background(Color.white)
                    .frame(width: 270)
                    .cornerRadius(15)
                    
                    Circle()
                        .frame(width: 60)
                        .foregroundColor(.orange)
                        .overlay {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                        }
                        .offset(x: 0, y: -30)
                    
                }
                .offset(x: 0, y: -40)
                .transition(.asymmetric(
                    insertion: .scale(scale: 1.1)
                        .combined(with: .opacity),
                    removal: .opacity
                ).animation(.easeInOut(duration: animDuration)))
                .zIndex(3)
            }
        }
    }
}

struct CustomDialog_Previews: PreviewProvider {
    @State private var isPresented = true
    
    static var previews: some View {
        CustomAlert(isPresented: .constant(true), title: "Title", message: "Message", presenting: { Text("") })
    }
}

extension View {
    func showCustomAlert(isPresented: Binding<Bool>, title: String, message: String) -> some View {
        return CustomAlert(isPresented: isPresented,title: title, message: message, presenting: { self })
    }
}
