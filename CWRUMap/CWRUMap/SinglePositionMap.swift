//
//  SinglePositionMap.swift
//  CWRUMap
//
//  Created by Ryan Lin on 3/31/25.
//

import SwiftUI
import MapKit


struct View1: View {
    private let locations = [
        InterestingPlace(name: "Olin", coordinate: CLLocationCoordinate2D(latitude: 41.502183, longitude: -81.697837)),
        InterestingPlace(name: "Wade Lagoon", coordinate: CLLocationCoordinate2D(latitude: 41.506145, longitude: -81.611097)),
        InterestingPlace(name: "Cleveland Museum of Art", coordinate: CLLocationCoordinate2D(latitude: 41.508636, longitude: -81.611392))
    ]
    
    @State var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.511020, longitude: -81.611563), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    
    var body: some View {
        
        Map(position:$position)
        .mapStyle(.imagery(elevation: .realistic))
    }
}

#Preview {
    View1()
}
