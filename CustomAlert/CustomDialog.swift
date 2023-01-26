//
//  CustomDialog.swift
//  CustomAlert
//
//  Created by Przemek on 26/01/2023.
//

import SwiftUI

struct CustomDialog<Presenting>: View where Presenting: View {
    
    @Binding var isPresented: Bool
    var title: String
    var message: String
    let presenting: () -> Presenting
    
    var body: some View {
        ZStack {
            self.presenting()
                        
            Color.gray.opacity(isPresented ? 0.4 : 0.0)
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut(duration: 0.15), value: isPresented)

            
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
                            isPresented.toggle()
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
                    .padding(.top, -30)
                
            }
            .padding(.top, -70)
            .scaleEffect(isPresented ? 1.0 : 1.1 )
            .opacity(isPresented ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 0.15), value: isPresented)
        }
    }
}

struct CustomDialog_Previews: PreviewProvider {
    @State private var isPresented = true
    
    static var previews: some View {
        CustomDialog(isPresented: .constant(true), title: "Title", message: "Message", presenting: { Text("") })
    }
}

extension View {
    func showCustomDialog(isPresented: Binding<Bool>, title: String, message: String) -> some View {
        return CustomDialog(isPresented: isPresented,title: title, message: message, presenting: { self })
    }
}
