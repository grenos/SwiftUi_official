//
//  MapView.swift
//  SwiftUi_official
//
//  Created by Vasileios Gkreen on 29/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI
import MapKit



/*
The UIViewRepresentable protocol has two requirements you need to add: a makeUIView(context:) method that creates an MKMapView, and an updateUIView(_:context:) method that configures the view and responds to any changes.
*/
 
 
struct MapView: UIViewRepresentable {
    
    // Use makeUIView(context:) method that creates and returns an empty MKMapView.
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    
    // Create an updateUIView(_:context:) method that sets the map view’s region to the correct coordinates to center the map on Turtle Rock.
    func updateUIView(_ view: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(
            latitude: 34.011286, longitude: -116.166868
        )
        
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
        
    }
    
}







struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
