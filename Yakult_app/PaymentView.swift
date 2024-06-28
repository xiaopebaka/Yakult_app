//
//  PaymentView.swift
//  Yakult_app
//
//  Created by m.kaku on 2024/06/26.
//

import SwiftUI
import LocalAuthentication

struct PaymentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                if isUnlocked {
                    Text("認証成功！")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                } else {
                    Text("Face ID/Touch IDでロック解除")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            authenticate()
                        }
                }
                
                Spacer()
                
                if isUnlocked {
                    Button(action: authenticate) {
                        Text("もう一度認証する")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding()
                }
            }
            .navigationTitle("お支払ページ")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // 生体認証（Face IDやTouch ID）が利用可能であるかどうかを確認
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let description = "認証が必要です。"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                    }
                }
            }
        }
    }
}

#Preview {
    PaymentView()
}
