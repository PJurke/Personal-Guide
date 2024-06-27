//
//  DataRemovalConfirmation.swift
//  Personal Guide
//
//  Created by Philip Jurke on 27.06.24.
//

import Foundation
import SwiftUI

struct DataRemovalConfirmationModifier: ViewModifier {
    
    @Binding var isAlertPresented: Bool
    var onConfirmRemoval: () -> Void
    
    func body(content: Content) -> some View {
        
        content
            .alert("Data.Operations.RemoveAll.Confirmation.Headline", isPresented: $isAlertPresented) {
                Button("Data.Operations.RemoveAll.Confirmation.Button", role: .destructive) {
                    onConfirmRemoval()
                }
                Button("Cancel", role: .cancel) {}
            }
    }
    
}

extension View {
    func removalConfirmation(isAlertPresented: Binding<Bool>, onConfirmRemoval: @escaping () -> Void) -> some View {
        modifier(DataRemovalConfirmationModifier(
            isAlertPresented: isAlertPresented,
            onConfirmRemoval: onConfirmRemoval
        ))
    }
}
