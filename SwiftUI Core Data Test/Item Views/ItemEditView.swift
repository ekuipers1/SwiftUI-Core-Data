//
//  ItemEditView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct ItemEditView : View {
    
    var item: Item
    
    @State private var editMode: EditMode = .inactive

    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    @State private var textName: String = ""
    @State private var textOrder: String = ""
    @State private var itemdescription: String = ""
    
    @ObservedObject private var dataSource = CoreDataDataSource<Attribute>(predicateKey: "item")
    
    @State private var showingAttributeAddView = false
    
    var body: some View {
        
        VStack {
            Form {
                
                ItemFormView(textName: self.$textName,
                             textOrder: self.$textOrder,
                             itemdescription: self.$itemdescription,
                             editMode: self.$editMode)
                 
                Section(header: Text("Objects".uppercased())) {
                    ForEach(dataSource.loadDataSource(relatedTo: item)) { attribute in
                        
                        if self.editMode == .active {
                            AttributeListCell(name: attribute.name, itemdescription: attribute.itemdescription, order: attribute.order)
                        } else {
                            NavigationLink(destination: AttributeEditView(attribute: attribute))
                            { AttributeListCell(name: attribute.name, itemdescription: attribute.itemdescription, order: attribute.order) }
                        }
                    }
                    .onMove(perform: self.dataSource.move)
                    .onDelete(perform: self.dataSource.delete)
                }
            }
            HiddenNavigationLink(destination: AttributeAddView(item: item), isActive: self.$showingAttributeAddView)
        }
        .onAppear(perform: { self.onAppear() })
        .navigationBarTitle(Text("\(self.editMode == .active ? "Edit" : "View") Item Details"),
                            displayMode: .large)
        .navigationBarItems(trailing:
            HStack {
                ActivateButton(activates: self.$showingAttributeAddView) { Image(systemName: "plus") }
                EditSaveDoneButton(editAction: { self.editMode = .active },
                                   saveAction: { self.saveAction() },
                                   doneAction: { self.editMode = .inactive },
                                   dirty: self.dirty() )
            }
        )
        .environment(\.editMode, self.$editMode)
    }
    
    func onAppear() {
        
        self.textName = self.item.name
        self.textOrder = String(self.item.order)
        self.itemdescription = String(self.item.itemdescription)

    }
    
    func cancelAction() {
        
        self.textName = ""
        self.textOrder = ""
        self.itemdescription = ""
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        
        self.item.update(name: self.textName, order: self.textOrder, itemdescription: self.itemdescription)
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        
        return !self.textName.isEmpty && self.textOrder.isInt &&
            ((self.textName != self.item.name) || (self.itemdescription != self.item.name) || (Int32(self.textOrder)  != self.item.order))

    }
}

#if DEBUG
struct ItemEditView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemEditView(item: Item.preview() )
        }
    }
}
#endif
