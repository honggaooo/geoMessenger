//
//  MapViewExtension.swift
//  geoMessenger
//
//  Created by Hong Gao on 10/16/17.
//  Copyright © 2017 Hong Gao. All rights reserved.
//

import UIKit
import MapKit

extension FirstViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if let annotation = annotation as? Message {
            let identifier = "Pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -8, y: -5)
                view.pinTintColor = .green
                view.animatesDrop = true
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIButton
            }
            return view
        }
        return nil
    }
    
    
    private func mapView(_ mapView: MKMapView, annotationView view: MKPinAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let message = view.annotation as! Message
        let palceName = message.title
        let placeInfo = message.subtitle
        
        let ac = UIAlertController(title: palceName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        
        ac.addAction(UIAlertAction(title: "Remove", style: .default) {
            (result : UIAlertAction) -> Void in
            mapView.removeAnnotation(message)
            
        })
        
        present(ac, animated: true)
}


}



