//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/25/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    var countryData: CountryData
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailRow(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                CountryDetailRow(number: countryData.critical.formatNumber(), name: "Critical", color: .yellow)
                CountryDetailRow(number: countryData.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryData.fatalityRate), name: "Death%", color: .red)
                CountryDetailRow(number: countryData.recovered.formatNumber(), name: "Recovered", color: .yellow)
                CountryDetailRow(number: String(format: "%.2f", countryData.recoveredRate), name: "Recovery%")
            }
        .background(Color("cardBackgroundGray"))
        .cornerRadius(8)
        .padding()
        
        Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryData.country)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
