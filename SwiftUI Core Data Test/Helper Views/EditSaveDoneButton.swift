//
//  EditSaveDoneButton.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct EditSaveDoneButton : View {
    
    var editAction: () -> Void
    var saveAction: () -> Void
    var doneAction: () -> Void
    var dirty: Bool
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        
        Button(action: {
            if self.editMode?.wrappedValue == .inactive {
                self.editMode?.wrappedValue = .active
                self.editAction()
            } else {
                self.editMode?.wrappedValue = .inactive
                if self.dirty {
                    self.saveAction()
                } else {
                    self.doneAction()
                }
            }
        }, label: {
            if self.editMode?.wrappedValue == .inactive {
                Text("Edit")
            } else {
                if self.dirty {
                    Text("Save")
                } else {
                    Text("Done")
                }
            }
        })
    }
    
}

#if DEBUG
struct EditSaveButton_Previews : PreviewProvider {
    static var previews: some View {
        
        EditSaveDoneButton(editAction: { },
                           saveAction: { },
                           doneAction: { },
                           dirty: false)
    }
}
#endif
