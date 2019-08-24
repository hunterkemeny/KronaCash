//
//  TutorialContentViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class TutorialContentViewController: UIViewController
{
    @IBOutlet var headingLabel: UILabel!
    {
        didSet
        {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var subheadingLabel: UILabel!
    {
        didSet
        {
            subheadingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    var index = 0
    var heading = ""
    var subheading = ""
    var imageFile = ""

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        headingLabel.text = heading
        subheadingLabel.text = subheading
        contentImageView.image = UIImage(named: imageFile)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
