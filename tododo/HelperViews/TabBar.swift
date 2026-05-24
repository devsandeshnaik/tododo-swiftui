//
//  TabBar.swift
//  tododo
//
//  Created by Sandesh Naik on 24/05/26.
//

import SwiftUI

struct TabItem: Identifiable {
    let index: Int
    let title: String
    let imageName: String
    
    var id: Int { return index }
}


struct TabBar: View {
    
    static let tabs = [
        TabItem(index: 0, title: "Home", imageName: "home"),
        TabItem(index: 1, title: "Groups", imageName: "groups"),
        TabItem(index: 2, title: "Add", imageName: "add"),
        TabItem(index: 3, title: "Account", imageName: "account"),
    ]
    
    @Binding var selectedIndex: Int
    @State private var backgroundPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    @Namespace private var TabBars
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: 1)
                .overlay(Color.secondary)
            GeometryReader { proxy in
                HStack {
                    Spacer()
                    ForEach(TabBar.tabs) { item  in
                        tabItemView(item: item)
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    selectedIndex = item.index
                                    let xPosition = proxy.frame(in: .local).midX
                                    let yPosition = proxy.frame(in: .local).midY
                                    backgroundPosition = CGPoint(x: xPosition, y: yPosition)
                                }
                            }
                            .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(
                                            withAnimation(.snappy) {
                                                selectedIndex == item.index ? Theme.Colors.primary : .clear
                                            }
                                        )
                            )
                        Spacer()
                    }
                }
            }
        }
        .frame(width: .infinity, height: 48)
        
    }
    
    private func iconColor(at index: Int) -> Color {
        if index == selectedIndex {
            return Theme.Colors.selectedTabBarItem
        } else {
            return Theme.Colors.defaultTabBarItem
        }
    }
    
    private func tabItemView(item: TabItem) -> some View {
        ZStack(alignment: .center) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .foregroundStyle(iconColor(at: item.index))
        }
        .frame(width: 44, height: 44)
    }
    
}

#Preview {
    TabBar(selectedIndex: .constant(1))
}


