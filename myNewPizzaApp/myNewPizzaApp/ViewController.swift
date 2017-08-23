//
//  ViewController.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/21/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController
{
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var degreesLabel: UILabel!
    
    lazy var viewModel:ViewModel = ViewModel(delegate: self)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Got user location
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlChanged(sender:UISegmentedControl)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            guard let text = degreesLabel.text else {return}
            guard let temp = Int(text) else {return}
            self.degreesLabel.text = "\(viewModel.changeCtoF(temp: temp))"
        default:
            guard let text = degreesLabel.text else {return}
            guard let temp = Int(text) else {return}
            self.degreesLabel.text = "\(viewModel.changeFtoC(temp: temp))"
        }
    }

}

extension ViewController:VMDelegate
{
    func updateLabels(pokemon:Pokemon?)
    {
        
    }
    
    /*func updateWeatherLabel(temp:Int)
    {
        self.degreesLabel.text = "\(temp)"
    }*/
}
