//
//  HomeScreen.swift
//  tododo
//
//  Created by Sandesh Naik on 28/01/25.
//

import SwiftUI
import CoreData

struct HomeScreen: View {
    

    
    @FetchRequest(sortDescriptors: []) private var items: FetchedResults<TodoItem>
    @State private var selectedIndex: Int = 0
    
    @Environment(\.managedObjectContext) var context
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(TabBar.tabs) { tab in
                Text(tab.title)
                    .tag(tab.id)
                    .toolbarVisibility(.hidden, for: .tabBar) 
            }
        }
        .onAppear {
            printfonts()
        }
        .safeAreaInset(edge: .bottom) {
            TabBar(selectedIndex: $selectedIndex)
        }
    }

    
    func printfonts() {
        for family in UIFont.familyNames.sorted() {
            print(family, UIFont.fontNames(forFamilyName: family))
        }
    }
}

#if DEBUG
#Preview {
    HomeScreen()
        .environment(\.managedObjectContext, MockPersistenceController.shared.container.viewContext)
}
#endif



/*
 
     
 }
 */
