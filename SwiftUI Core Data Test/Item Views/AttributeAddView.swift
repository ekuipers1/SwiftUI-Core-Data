//
//  AttributeAddView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct AttributeAddView: View {
    
    @ObservedObject var item: Item
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var textName: String = ""
    @State private var textOrder: String = ""
    @State private var itemdescription: String = ""
    
    var body: some View {
        
        Form {
            AttributeFormView(textName: self.$textName, textOrder: self.$textOrder, itemdescription: self.$itemdescription)
        }
            .onAppear(perform: { self.onAppear() })
            .navigationBarTitle(Text("Add Attribute"), displayMode: .large)
            .navigationBarItems(leading: Button(action:{ self.cancelAction() }) { Text("Cancel") },
                                trailing: Button(action:{ self.saveAction() }) { Text("Save") }.disabled(!self.dirty()) )
    }
    
    func onAppear() {
        
        let order = Attribute.nextOrderFor(item: item)
        self.textName = "Object \(item.order).\(order)"
        self.textOrder = String(order)
        self.itemdescription = String(itemdescription)
    }
    
    func cancelAction() {
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        
        _ = Attribute.createAttributeFor(item: item, name: self.textName, order: Int(self.textOrder), itemdescription: self.itemdescription)
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        
        return !self.textName.isEmpty && self.textOrder.isInt
    }
}

#if DEBUG
struct AttributeAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AttributeAddView(item: Item.allInOrder().first!)
        }
    }
}
#endif
