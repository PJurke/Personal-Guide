//
//  AutoFocused.swift
//  Personal Guide
//
//  Created by Philip Jurke on 05.05.24.
//

import Foundation
import SwiftUI

struct AutoFocusedModifier: ViewModifier {
    
    // Variables
    @FocusState private var isFocused: Bool
    
    // Body
    func body(content: Content) -> some View {
        
        content
            .focused($isFocused)
            .onAppear {
                DispatchQueue.main.async {
                    self.isFocused = true
                }
            }
        
    }
    
}

extension TextField {
    
    func autoFocused() -> some View {
        
        modifier(AutoFocusedModifier())
        
    }
    
}
