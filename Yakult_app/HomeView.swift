//
//  HomeView.swift
//  Yakult_app
//
//  Created by m.kaku on 2024/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            WebView(loardUrl: URL(string: "https://www.apple.com")!)
        }
}

#Preview {
    HomeView()
}
