//
//  LocationModel.swift
//  FindMe
//
//  Created by Ryan Lin on 3/18/25.
//
import CoreLocation
import Foundation

@Observable
class LocationModel : LocationManagerDelegate{
    var locations = [CLLocation]()
    
    func didUpdateLocation(_ location: CLLocation){
        self.locations.append(location)
        print(location)
    }
}
