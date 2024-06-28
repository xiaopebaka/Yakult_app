//
//  ContentView.swift
//  Yakult_app
//
//  Created by m.kaku on 2024/06/26.
//

import SwiftUI

struct ContentView: View {
    @State var selection = 0
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection,
                    content:  {
                HomeView().tag(TabbarItem.home.rawValue)
                PaymentView().tag(TabbarItem.payment.rawValue)
                MyPageView().tag(TabbarItem.mypage.rawValue)
            })
            
            ZStack {
                HStack {
                    ForEach(TabbarItem.allCases, id: \.self) { item in
                        Button {
                            selection = item.rawValue
                        } label: {
                            tabItemView(
                                tabbarItem: item,
                                isActive: selection == item.rawValue
                            )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}


extension ContentView {
    func tabItemView(tabbarItem: TabbarItem, isActive: Bool) -> some View {
        VStack {
            Image(tabbarItem.iconName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 24, height: 24)
            
        }
        .frame(width: 80, height: 60)
    }
}

enum TabbarItem: Int, CaseIterable {
    case home
    case payment
    case mypage
    
    var title: String? {
        switch self {
        case .home:
            return "home"
        case .payment:
            return "payment"
        case .mypage:
            return "mypage"
        }
    }
    var iconName: String {
        switch self {
        case .home:
            return "home"
        case .payment:
            return "qrcode"
        case.mypage:
            return "profile"
        }
    }
}

#Preview {
    ContentView()
}
