//
//  AppVersionRow.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import SwiftUI

struct AppVersionRow: View {
    
    // View
    
    var body: some View {
        
        ShareLink(item: "Personal Guide App v\(getAppVersion())") {
            LabeledContent("Settings.Versioning.Version.Label") {
                Text("\(getAppVersion())")
            }
        }
        
    }
    
    // Func
    
    func getAppVersion() -> String {
        if let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Settings.Versioning.Version.Unavailable"
    }
    
}

#Preview {
    Form {
        AppVersionRow()
    }
}
