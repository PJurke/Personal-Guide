//
//  DataRemovalError.swift
//  Personal Guide
//
//  Created by Philip Jurke on 27.06.24.
//

import Foundation
import SwiftUI

struct DataRemovalErrorModifier: ViewModifier {
    
    @Binding var isAlertPresented: Bool
    
    func body(content: Content) -> some View {
        
        content
            .alert("Data.Operations.RemoveAll.Error.Headline", isPresented: $isAlertPresented) {
                Button("Okay", role: .cancel) {}
            } message: {
                Text("Data.Operations.RemoveAll.Error.Description")
            }
    }
    
}

extension View {
    func removalError(isAlertPresented: Binding<Bool>) -> some View {
        modifier(DataRemovalErrorModifier(
            isAlertPresented: isAlertPresented
        ))
    }
}
