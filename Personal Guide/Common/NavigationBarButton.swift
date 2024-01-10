//
//  NavigationBarButton.swift
//  Personal Guide
//
//  Created by Philip Jurke on 09.01.24.
//

import SwiftUI

struct NavigationBarButton: View {
    
    // Parameters
    
    var action: () -> Void
    var systemImage: String
    
    // View
    
    var body: some View {
        
        Button(action: self.action, label: {
            Image(systemName: self.systemImage)
        })
        
    }
}

#Preview {
    NavigationBarButton(action: {}, systemImage: "plus")
}
