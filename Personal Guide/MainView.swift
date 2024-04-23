//
//  MainView.swift
//  Personal Guide
//
//  Created by Philip Jurke on 21.04.24.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {
            
            LifeGoalOverview()
                .tabItem {
                    Label("LifeGoals.Label", systemImage: "flag")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings.Label", systemImage: "gear")
                }
            
        }
        
    }
    
}

#Preview {
    MainView()
}
