//
//  DestinationDetailPresenter.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation
import MapKit

class DestinationDetailPresenter {
    private var interactor: DestinationDetailInteractorProtocol
    weak var view: DestinationDetailViewProtocol?
    private var coordinatorOutput: (DestinationDetailOutput) -> Void
    private var destinationResult: DestinationsResult

    init(destinationResult: DestinationsResult, interactor: DestinationDetailInteractorProtocol, coordinnatorOutput: @escaping (DestinationDetailOutput) -> Void) {
        self.destinationResult = destinationResult
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension DestinationDetailPresenter: DestinationDetailPresenterProtocol {
    var destinationData: DestinationsResult {
         destinationResult
    }
    
    var annotationData: AnnotationData {
        AnnotationData(
            title: destinationData.name ?? "",
            locationName: destinationData.address ?? "",
            discipline: destinationData.type?.rawValue ?? "",
          coordinate: CLLocationCoordinate2D(latitude: destinationData.location?.latitude ?? 0.0, longitude: destinationData.location?.longitude ?? 0.0))
    }
    
    var annotationLocation: CLLocation {
        CLLocation(latitude: destinationData.location?.latitude ?? 0.0, longitude: destinationData.location?.longitude ?? 0.0)
    }
    
    var viewTitle: String {
        "Destination Detail"
    }
    
    var noMapPermissionAlertSubtitle: String {
        "For best results, let your device turn on location service."
    }
    
    var annotationID: String {
        "destinationData"
    }
    
    var mapAnotationAlertTitle: String {
        "How to get there"
    }
    
    var commonCancel: String {
        "Cancel"
    }
    
    var commonOK: String {
        "OK"
    }
}
