//
//  DestinationDetailViewController.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import UIKit
import MapKit

class DestinationDetailViewController: UIViewController {
    
    private let presenter: DestinationDetailPresenterProtocol
    private let destinationData: DestinationsResult
    private var locationManager: CLLocationManager
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        return map
    }()
        
    init (presenter: DestinationDetailPresenterProtocol) {
        self.presenter = presenter
        self.destinationData = presenter.destinationData
        locationManager = CLLocationManager()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Destination Detail"
        setUpMapViewLayout()
        locationManager.delegate = self
        mapView.delegate = self
        let destinationLocation = CLLocation(latitude: destinationData.location?.latitude ?? 0.0, longitude: destinationData.location?.longitude ?? 0.0)
        
        let artwork = AnnotationData(
            title: destinationData.name ?? "",
            locationName: destinationData.address ?? "",
            discipline: destinationData.type?.rawValue ?? "",
          coordinate: CLLocationCoordinate2D(latitude: destinationData.location?.latitude ?? 0.0, longitude: destinationData.location?.longitude ?? 0.0))
        mapView.addAnnotation(artwork)
        
        mapView.centerToLocation(destinationLocation)
    }
    
    private func setUpMapViewLayout() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func openDeviceLocationSetting() {
        let alertController = UIAlertController(title: "", message:"For best results, let your device turn on location service.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            let settingsUrl = URL(string: UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.openURL(url)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension DestinationDetailViewController: DestinationDetailViewProtocol{
    // TODO: Implement View Output Methods
}


extension DestinationDetailViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            openDeviceLocationSetting()
            break
        case .authorizedAlways:
            manager.startMonitoringVisits()
            break
        case .authorizedWhenInUse:
            manager.startMonitoringVisits()
            break
        @unknown default:
            break
        }
    }
}

extension DestinationDetailViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard let destinationData = annotation as? AnnotationData else {
            return nil
        }
        let identifier = "destinationData"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        return view
    }
    
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
        
    
      guard let destinationData = view.annotation as? AnnotationData else {
        return
      }
        
        let alertController = UIAlertController(title: destinationData.title ?? "" , message: destinationData.locationName ?? "", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "How to get there", style: .default, handler: { action in
            let launchOptions = [
              MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ]
              destinationData.mapItem?.openInMaps(launchOptions: launchOptions)
        }))
        
        self.present(alertController, animated: true, completion: nil)
     
    }
    
}
