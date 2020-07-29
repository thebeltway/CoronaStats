//
//  TotalDataView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/24/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct TotalDataView: View {
    var totalData: TotalData
    
    var body: some View {
        VStack {
            HStack {
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .yellow)
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Deaths", color: .red)
            } //end hstack
            
            
            HStack {
                TotalDataCard(number: String(format: "%.2f", totalData.recoveredRate), name: "Recovery%")
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered", color: .yellow)
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death%", color: .red)
            } //end hstack
        } //end vstack
            .frame(height: 170)
            .padding(10)
    }
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
