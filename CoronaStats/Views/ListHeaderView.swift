//
//  ListHeaderView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/23/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {
    
    
    
    var body: some View {
        
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
                .padding(.leading, 15)
            Spacer()
            
            Text("Conf.")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text("Deaths")
                    .fontWeight(.bold)
                    .font(.subheadline)
                .frame(height: 40)
                    .padding(.leading, 5)
            
            Spacer()
            
            Text("Recover")
                        .fontWeight(.bold)
                        .font(.subheadline)
                .frame(height: 40)
                        .padding(.trailing, 15)
        
        }
        .background(Color.gray)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
