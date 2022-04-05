//
//  AnnotationData.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 5/4/22.
//

import MapKit

class AnnotationData: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let country: String?
  let coordinate: CLLocationCoordinate2D

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

