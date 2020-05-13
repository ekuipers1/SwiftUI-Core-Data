//
//  ActivateButton.swift
//  MyContainers
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct ActivateButton<Label> : View where Label : View {
    
    var activates: Binding<Bool>
    var label: Label
    
    public init(activates: Binding<Bool>, @ViewBuilder label: () -> Label) {
        self.activates = activates
        self.label = label()
    }

    var body: some View {
        Button(action: { self.activates.wrappedValue = true }, label: { self.label } )
    }
}

struct ActivateButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ActivateButton(activates: .constant(false)) { Text("Activate Link") }
    }
}
