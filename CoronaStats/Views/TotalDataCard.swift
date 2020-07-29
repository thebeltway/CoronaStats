//
//  TotalDataCard.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/24/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Err"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
            } //end of stack
                .frame(width: geometry.size.width, height: 85,alignment: .center)
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8.0)
        } //end of geometry

    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
