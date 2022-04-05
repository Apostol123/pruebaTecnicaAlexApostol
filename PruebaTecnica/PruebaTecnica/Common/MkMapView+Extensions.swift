//
//  MkMapView+Extensions.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 5/4/22.
//

import Foundation
import MapKit

extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
