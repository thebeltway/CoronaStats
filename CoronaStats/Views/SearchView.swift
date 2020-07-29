//
//  SearchView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/25/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            TextField("Country...", text: $searchText)
            .padding()
        }
        .frame(height: 50)
    .background(Color("cardBackgroundGray"))
        
    }
}
