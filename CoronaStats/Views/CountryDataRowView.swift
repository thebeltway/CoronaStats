//
//  CountryDataRowView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/23/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
                .lineLimit(2)
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .font(.subheadline)
                .frame(height: 40, alignment: .center)
                    .padding(.leading, 5)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(height: 40, alignment: .center)
                        .foregroundColor(.green)
        
        }
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
