//
//  ContentView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            ItemListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Item List")
                    }
            }
//            .tag(0)
//            HStack {
//                ItemListView()
//                ItemListView()
//            }
//            .tabItem {
//                VStack {
//                    Image(systemName: "arrow.up.arrow.down.circle")
//                    Text("Side by Side")
//                }
//            }
            .tag(1)
            AttributesGroupedView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("Grouped Items")
                    }
            }
//            .tag(2)
//            ItemSelectionView()
//                .tabItem {
//                    VStack {
//                        Image(systemName: "list.bullet")
//                        Text("Selections")
//                    }
//            }
            .tag(3)
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(4)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}
#endif
