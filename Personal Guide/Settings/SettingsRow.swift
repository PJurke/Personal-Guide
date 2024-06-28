//
//  SettingsRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 29.05.24.
//

import SwiftUI

struct SettingsRow<Content: View>: View {
    
    // Variables
    
    var iconName: String
    var color: Color = .black
    @ViewBuilder var content: Content
    
    // Body
    
    var body: some View {
        
        HStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(color)
                    .frame(width: 26, height: 26)
                
                Image(systemName: iconName)
                    .foregroundStyle(.white)
                
            }
            
            content
                .foregroundStyle(.primary)
            
        }
        
    }
}

#Preview {
    SettingsRow(iconName: "trash") {
        Text("Delete Item")
    }
}
