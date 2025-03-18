//
//  LocationManager.swift
//  FindMe
//
//  Created by Ryan Lin on 3/18/25.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func didUpdateLocation(_ location: CLLocation)
}

class LocationManager : NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    public var delegate: LocationManagerDelegate?
    
    static let shared = LocationManager()
    
    private override init(){
        super.init()
        self.locationManager.delegate = self
        
    }
    
    func requestPermission(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdating(){
        locationManager.startUpdatingLocation()
    }
    
    // Mark: Delegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        for location in locations{
            delegate?.didUpdateLocation(location)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("AuthorizationChanged:  \(manager.authorizationStatus)")
        
        switch(manager.authorizationStatus){
            case .authorizedWhenInUse:
                print("Authorized for when in use")
            case .notDetermined:
                print("Waiting for user to grant permission")
            case .authorizedAlways:
                print("we can access location in background")
            default:
                print("Not Authorized")
        }
        
    }
    
    
}
