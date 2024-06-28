//
//  MyPageView.swift
//  Yakult_app
//
//  Created by m.kaku on 2024/06/26.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("マイページだよ")
                    .padding()
            }
            .navigationTitle("マイページ")
        }
    }
}

#Preview {
    MyPageView()
}
