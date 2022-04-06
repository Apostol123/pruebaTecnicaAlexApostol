//
//  DestinationDetailPresenterProtocol.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation
import MapKit

protocol DestinationDetailPresenterProtocol: AnyObject {
    var destinationData: DestinationsResult {get}
    var annotationData: AnnotationData {get}
    var annotationLocation: CLLocation {get}
    var viewTitle: String {get}
    var noMapPermissionAlertSubtitle: String {get}
    var annotationID: String {get}
    var mapAnotationAlertTitle: String {get}
    var commonCancel: String {get}
    var commonOK: String {get}
}
