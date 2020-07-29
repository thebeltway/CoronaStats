//
//  CountryDetailRow.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/25/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct CountryDetailRow: View {
    
    var number: String = "Err"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                
                Spacer()
                
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
            } //end hstack
            Divider()
        } //vstack
            .padding(.leading)
            .padding(.trailing)
    }
}

struct CountryDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailRow()
    }
}
