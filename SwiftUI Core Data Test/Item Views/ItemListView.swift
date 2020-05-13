//
//  ItemListView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI
import CoreData

struct ItemListView : View {
    
    @State private var editMode: EditMode = .inactive

    @ObservedObject private var dataSource = CoreDataDataSource<Item>()
    
    @State private var sortAscending: Bool = true
    @State private var showingItemAddView: Bool = false

    var body: some View {
        
        NavigationView {
            VStack {
                List() {
        
                    Section(header:
                        HStack {
                            Text("Active Items ".uppercased() )
                            Spacer()
                            Image(systemName: (sortAscending ? "arrow.down.circle" : "arrow.up.circle"))
                                .foregroundColor(Color("GreenArrow"))
                                .font(.title)
                                .onTapGesture(perform: self.onToggleSort )
                        }
                        )
                    {

                        ForEach(dataSource.fetchedObjects) { item in
                            
                            if self.editMode == .active {
                                ItemListCell(name: item.name, itemdescription: item.itemdescription, order: item.order, check: item.selected)
                            } else {
                                NavigationLink(destination: ItemEditView(item: item))
                                { ItemListCell(name: item.name, itemdescription: item.itemdescription, order: item.order, check: item.selected) }
                            }
                        }
                            .onMove(perform: (self.sortAscending ? self.dataSource.move : nil))    // Move only allowed if ascending sort
                            .onDelete(perform: self.dataSource.delete)
                    }
                }
                HiddenNavigationLink(destination: ItemAddView(), isActive: self.$showingItemAddView)
            }
            .onAppear(perform: { self.onAppear() })
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Overview List"), displayMode: .large)
            .navigationBarItems(leading:
                HStack {
                    EditButton()
                }, trailing:
                HStack {
                    Spacer()
                    ActivateButton(activates: self.$showingItemAddView) { Image(systemName: "plus.square.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color("GreenArrow"))
                    }
                })
            .environment(\.editMode, self.$editMode)
         }
    }
    
    public func onAppear() {
        
        self.dataSource.loadDataSource()
    }
    
    public func onToggleSort() {
        
        self.sortAscending.toggle()
        self.dataSource.changeSort(key: "order", ascending: self.sortAscending)
    }
    
}

#if DEBUG
struct ItemListView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            ItemListView()
        }
    }
}
#endif
