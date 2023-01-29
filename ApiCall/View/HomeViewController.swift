//
//  HomeViewController.swift
//  ApiCall
//
//  Created by Rohan Sarkar on 27/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var chargerViewModel = ChargerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chargerViewModel.delegate = self
    }

    @IBAction func telemetry(_ sender: Any) {
        chargerViewModel.fetchChargerState()
    }
    
    @IBAction func transaction(_ sender: Any) {
        chargerViewModel.fetchChargingInformation()
    }
    
    @IBAction func act(_ sender: Any) {
        chargerViewModel.fetchLastCommandsInformation()
    }
    
    @IBAction func publish(_ sender: Any) {
        let parameters : [String : Any] = [ApiParameters.cmd : 8, ApiParameters.requestId : "sdjwheddw"]
        chargerViewModel.publish(parameters: parameters)
    }
}
