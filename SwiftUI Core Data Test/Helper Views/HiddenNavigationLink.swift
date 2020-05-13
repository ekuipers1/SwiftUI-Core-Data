//
//  HiddenNavigationLink.swift
//  MyContainers
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct HiddenNavigationLink<Destination : View>: View {
    
    var destination:  Destination
    var isActive: Binding<Bool>
    
    var body: some View {
        
        NavigationLink(destination: self.destination, isActive: self.isActive)
        { EmptyView() }
            .frame(width: 0, height: 0)
            .disabled(true)
            .hidden()
    }
}

struct HiddenNavigationLink_Previews: PreviewProvider {
    
    static var previews: some View {
        HiddenNavigationLink(destination: EmptyView(), isActive: .constant(false))
    }
}
