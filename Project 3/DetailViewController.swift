//
//  DetailViewController.swift
//  Project 1
//
//  Created by Tendai Prince Dzonga on 12/16/15.
//  Copyright © 2015 Tendai Prince Dzonga. All rights reserved.
//

import Social
import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!


    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }
    
    override func viewWillAppear(animated: Bool){
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool){
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped(){
        
        let bc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        bc.setInitialText("look at this fool!")
        bc.addImage(detailImageView.image!)
        bc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController( bc, animated: true, completion: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

