//
//  MoveMapVC.swift
//  MoveMapGetOutTheWay
//
//  Created by Daniel J Janiak on 7/20/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit
import MapKit

class MoveMapVC: UIViewController {
    
    // MARK: - Properties
    var initialVerticalPosForView: CGFloat!
    var initialVerticalPosForMap: CGFloat!
    
    var isInEditMode: Bool = false
    
    // MARK: - Outlets
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var editAnnotationsView: UIView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        editAnnotationsView.hidden = true
        
        initialVerticalPosForView = self.view.frame.origin.y
        //initialVerticalPosForMap = mapView.frame.origin.y
        
        print("Here are the centers for the view and the map, respectively")
        print(initialVerticalPosForView)
        //print(initialVerticalPosForMap)
        print(editAnnotationsView.frame.origin.y)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        initialVerticalPosForMap = mapView.frame.origin.y
        
        if !isInEditMode {
            editButton.title = "Edit"
        } else {
            editButton.title = "Done"
        }
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func editTapped(sender: AnyObject) {
        print("Edit tapped")
        
        //mapView.frame.origin.y -= editAnnotationsView.frame.origin.y
        //self.view.frame.origin.y -= editAnnotationsView.frame.origin.y
        if !isInEditMode {
            if mapView.frame.origin.y >= initialVerticalPosForMap {
                mapView.frame.origin.y -= editAnnotationsView.frame.height
            }
            
            editButton.title = "Done"
            editAnnotationsView.hidden = false
            isInEditMode = true
            
        } else {
            
            editAnnotationsView.hidden = true
            mapView.frame.origin.y = initialVerticalPosForMap
            editButton.title = "Edit"
            isInEditMode = false
        }
    }
    
    
}
