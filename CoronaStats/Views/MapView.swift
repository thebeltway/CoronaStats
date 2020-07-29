//
//  MapView.swift
//  CoronaStats
//
//  Created by Chris Belt on 4/25/20.
//  Copyright © 2020 thebeltway. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit


struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    
    
    @Binding var countryData: [CountryData]
    
    
    func updateUIView(_ uiView:  MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in countryData {
            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Deaths " + data.deaths.formatNumber()
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        uiView.annotations.forEach {uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
    }
    
}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
