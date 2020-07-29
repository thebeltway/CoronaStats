//
//  Model.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/23/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import Foundation

struct TotalData {
   let confirmed: Int;
   let critical: Int;
    let deaths: Int;
   let recovered: Int;
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    

    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}


struct CountryData {
    let country: String
    let confirmed: Int64;
    let critical: Int64;
    let deaths: Int64;
    let recovered: Int64;
    let longitude: Double;
    let latitude: Double;
     
     var fatalityRate: Double {
         return (100.00 * Double(deaths)) / Double(confirmed)
     }
     

     var recoveredRate: Double {
         return (100.00 * Double(recovered)) / Double(confirmed)
     }
}
