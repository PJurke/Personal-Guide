//
//  DataRemovalSuccessful.swift
//  Personal Guide
//
//  Created by Philip Jurke on 27.06.24.
//

import Foundation
import SwiftUI

struct DataRemovalSuccessfulModifier: ViewModifier {
    
    @Binding var isAlertPresented: Bool
    
    func body(content: Content) -> some View {
        
        content
            .alert("Data.Operations.RemoveAll.Successful.Headline", isPresented: $isAlertPresented) {
                Button("Okay", role: .cancel) {}
            } message: {
                Text("Data.Operations.RemoveAll.Successful.Description")
            }
    }
    
}

extension View {
    func removalSuccessful(isAlertPresented: Binding<Bool>) -> some View {
        modifier(DataRemovalSuccessfulModifier(
            isAlertPresented: isAlertPresented
        ))
    }
}
