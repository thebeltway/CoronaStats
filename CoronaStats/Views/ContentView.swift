//
//  ContentView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/23/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    
    var body: some View {
        TabView {
            RecentView()
                .tabItem {
                    Tab(imageName: "chart.bar", text: "Recent")
            }
            .tag(0)

            MapContainerView()
                .edgesIgnoringSafeArea(.vertical)
                .tabItem {
                    Tab(imageName: "map", text: "Map")

            }
        .tag(1)
        }
    }
}

private struct Tab: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}
