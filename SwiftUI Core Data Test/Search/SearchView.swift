//
//  SearchView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var searchPredicate: NSPredicate? = NSPredicate(format: "name contains[c] %@", "")

    @ObservedObject private var dataSource = CoreDataDataSource<Attribute>()

    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(text: $searchText, predicate: $searchPredicate)
                List {
                    Section(header: Text("ATTRIBUTES CONTAINING: '\(self.searchText)'"))
                    {
                        ForEach(self.dataSource.loadDataSource(predicate: self.searchPredicate)) { attribute in

                            AttributeListCell(name: attribute.name, itemdescription: attribute.itemdescription,
                                              order: attribute.order)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Search"), displayMode: .large)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
