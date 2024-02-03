//
//  AppColorSchemeModifier.swift
//  Personal Guide
//
//  Created by Philip Jurke on 03.02.24.
//

import Foundation
import SwiftUI

struct AppColorSchemeModifier: ViewModifier {
    
    @AppStorage("appColorScheme") private var appColorScheme: AppColorScheme = AppColorScheme.system
    
    func body(content: Content) -> some View {
            
        switch appColorScheme {
        case .dark:
            return content.preferredColorScheme(.dark)
        case .light:
            return content.preferredColorScheme(.light)
        default:
            return content.preferredColorScheme(ColorScheme(.unspecified))
        }
        
    }
    
}
