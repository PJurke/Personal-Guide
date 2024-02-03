//
//  AppVersioningSection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppVersioningSection: View {
    
    // View
    
    var body: some View {
        
        Section("Versioning") {
            AppVersionRow()
            AppBuildRow()
        }
        
    }
    
}

#Preview {
    AppVersioningSection()
}
