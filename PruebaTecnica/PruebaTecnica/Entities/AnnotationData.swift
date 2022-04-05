//
//  AnnotationData.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 5/4/22.
//

import MapKit
import Contacts

class AnnotationData: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let country: String?
    let coordinate: CLLocationCoordinate2D
    var mapItem: MKMapItem? {
        guard let location = locationName else {
            return nil
        }
        
        let addressDict = [CNPostalAddressStreetKey: location]
        let placemark = MKPlacemark(
            coordinate: coordinate,
            addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
    
    init(
        title: String?,
        locationName: String?,
        discipline: String?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.country = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

