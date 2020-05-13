//
//  AttributeEditView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct AttributeEditView: View {
    
    var attribute: Attribute
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @State private var textName: String = ""
    @State private var textOrder: String = ""
    @State private var itemdescription: String = ""
    
    var body: some View {
        
        Form {
            AttributeFormView(textName: self.$textName, textOrder: self.$textOrder, itemdescription: self.$itemdescription)
        }
        .onAppear(perform: { self.onAppear() })
        .navigationBarTitle(Text("Edit Objects"), displayMode: .large)
        .navigationBarItems(leading: Button(action:{ self.cancelAction() }) { Text("Cancel") },
                            trailing: Button(action:{ self.saveAction() }) { Text("Save") }.disabled(!self.dirty()) )
    }
    
    func onAppear() {
        
        self.textName = self.attribute.name
        self.textOrder = String(self.attribute.order)
        self.itemdescription = self.attribute.itemdescription
    }
    
    func cancelAction() {
        
        self.textName = ""
        self.textOrder = ""
        self.itemdescription = ""
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        
        self.attribute.update(name: self.textName, order: self.textOrder, itemdescription: self.itemdescription)
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        
        return !self.textName.isEmpty && self.textOrder.isInt &&
            ((self.textName != self.attribute.name) || (self.itemdescription != self.attribute.name) || (Int32(self.textOrder)  != self.attribute.order))
    }
}

#if DEBUG
struct AttributeEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AttributeEditView(attribute: Attribute.preview() )
        }
    }
}
#endif
