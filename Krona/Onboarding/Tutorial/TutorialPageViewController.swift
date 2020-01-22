//
//  TutorialPageViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

protocol TutorialPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Properties
    
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    
    // Provide the information for each page in the tutorial. 
    var pageHeadings = ["Browse the Latest Offers",
                        "Explore Your Favorites",
                        "See, Deals, Promotions, and Rewards from Businesses",
                        "View Your Profile Settings"]
    var pageImages = ["Feed",
                      "Favorites",
                      "Business",
                      "Settings"]
    var pageSubheadings = ["Get the latest on nearby offers that have been personalized for you.",
                           "Explore the latest offers from your favorites.",
                           "Discover all the current offers from any business on our platform.",
                           "Manage your Krona profile and settings."]
    
    // Track the current page of the tutorial
    var currentIndex = 0

    override func viewDidLoad() {
        // Setup ViewController.
        
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        // Create first tutorial screen.
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - Tutorial LifeCycle Functions
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Go back one page in the tutorial.
        
        var index = (viewController as! TutorialContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Go forward one page in the tutorial.
        
        var index = (viewController as! TutorialContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> TutorialContentViewController? {
        // Generate the correct page of the tutorial.
        
        // If index out of range, return nil.
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Set the correct data to be displayed based on the current page of the tutorial.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "TutorialContentViewController") as? TutorialContentViewController {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.subheading = pageSubheadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage() {
        // Go forward in the tutorial. 
        
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // Transition ViewControllers.
        
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? TutorialContentViewController {
                currentIndex = contentViewController.index
                tutorialDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
    }
}
