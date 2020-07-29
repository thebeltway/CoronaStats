//
//  CovidFetchRequest.swift
//  
//
//  Created by Chris Belt on 4/23/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    
    @Published var totalData: TotalData = testTotalData
    @Published var allCountries: [CountryData] = []

    let headers: HTTPHeaders = [
        "x-rapidapi-host": "your host here",
        "x-rapidapi-key": "your key here"
    ]
    
    init() {
        getAllCountries()
        getCurrentTotals()
    }
    
    func getCurrentTotals () {

        let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-data.p.rapidapi.com/totals?format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            
            let result = response.data
            
            if result != nil {
                let json = JSON(result)
                //debugPrint(response)
                let confirmed = json[0]["confirmed"].intValue;
                let deaths = json[0]["deaths"].intValue;
                let critical = json[0]["critical"].intValue;
                let recovered = json[0]["recovered"].intValue;
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalData = testTotalData
            }
        }
    }
    
    func getAllCountries() {
        let request = NSMutableURLRequest(url: NSURL(string: "https://covid-19-data.p.rapidapi.com/totals?format=json")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        AF.request("https://covid-19-data.p.rapidapi.com/country/code?format=json&code=US", headers: headers).responseJSON { response in
            
            let result = response.value
            var arrayCountries: [CountryData] = []
            
            if result != nil {
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                for countryData  in dataDictionary {
                    print(countryData)
                    let country = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0;
                    let critical = countryData["critical"] as? Int64 ?? 0;
                    let recovered = countryData["recovered"] as? Int64 ?? 0;
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    arrayCountries.append(countryObject)
                }
            } else {
                self.totalData = testTotalData
            }
            self.allCountries = arrayCountries.sorted(by: { $0.confirmed > $1.confirmed})
        }
    }
}


let testTotalData = TotalData(confirmed: 0, critical: 0, deaths: 0, recovered: 0)
let testCountryData = CountryData(country: "", confirmed: 0, critical: 0, deaths: 0, recovered: 0, longitude: 0, latitude: 0)
