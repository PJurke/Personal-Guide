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
                    Text("LifeGoals.Label")
                }
            
            SettingsView()
                .tabItem {
                    Text("Settings.Label")
                }
            
        }
        
    }
    
}

#Preview {
    MainView()
}
