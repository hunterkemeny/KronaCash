//
//  TutorialViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, TutorialPageViewControllerDelegate
{
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton!
    {
        didSet
        {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func skipTouched(_ sender: UIButton)
    {
        performSegue(withIdentifier: "tutorialToFavoritesSegue", sender: self)
    }
    
    @IBAction func nextTouched(  sender: UIButton)
    {
        if let index = tutorialPageViewController?.currentIndex
        {
            switch index
            {
            case 0...2:
                tutorialPageViewController?.forwardPage()
            case 3:
                performSegue(withIdentifier: "tutorialToFavoritesSegue", sender: self)
                
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI()
    {
        if let index = tutorialPageViewController?.currentIndex
        {
            switch index
            {
            case 0...2:
                nextButton.setTitle("NEXT", for: .normal)
                nextButton.isHidden = false
                
            case 3:
                nextButton.setTitle("GET STARTED", for: .normal)
                
            default: break
            }
            
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int)
    {
        updateUI()
    }
    
    var tutorialPageViewController: TutorialPageViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destination = segue.destination
        if let pageViewController = destination as? TutorialPageViewController
        {
            tutorialPageViewController = pageViewController
            tutorialPageViewController?.tutorialDelegate = self
        }
    }
}
