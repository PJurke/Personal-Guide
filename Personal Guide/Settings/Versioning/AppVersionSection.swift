//
//  AppVersionSection.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppVersionSection: View {
    
    // View
    
    var body: some View {
        
        Section("Versioning") {
            AppVersionRow()
            AppBuildRow()
        }
        
    }
    
}

#Preview {
    AppVersionSection()
}
