//
//  CreatedBySection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 04.11.24.
//

import SwiftUI

struct CreatedBySection: View {
    
    var body: some View {
        
        Section {
            
            Link(destination: URL(string: "https://philipjurke.de")!) {
                SettingsRow(iconName: "pencil", color: .orange)
                {
                    LabeledContent("Settings.DevelopedBy") {
                        Text("Philip Jurke")
                    }
                }
            }
            .foregroundStyle(.primary)
            
        }
        
    }
    
}

#Preview {
    CreatedBySection()
}
