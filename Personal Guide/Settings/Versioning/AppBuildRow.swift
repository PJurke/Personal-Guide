//
//  AppBuildRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppBuildRow: View {
    
    // View
    
    var body: some View {
        
        LabeledContent("Settings.Versioning.Build.Label") {
            Text("\(getAppBuildNumber())")
        }
        
    }
    
    // Func
    
    func getAppBuildNumber() -> String {
        if let version = Bundle.main.infoDictionary!["CFBundleVersion"] as? String {
            return version
        }
        return "Settings.Versioning.Build.Unavailable"
    }
    
}

#Preview {
    AppBuildRow()
}
