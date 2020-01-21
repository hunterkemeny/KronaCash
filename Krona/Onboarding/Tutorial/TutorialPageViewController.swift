//
//  TutorialPageViewController.swift
//  Krona
//
//  Created by Aditya Gadiyar on 8/19/19.
//  Copyright © 2019 Krona Technologies Incorporated. All rights reserved.
//

import UIKit

protocol TutorialPageViewControllerDelegate: class
{
    func didUpdatePageIndex(currentIndex: Int)
}

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate
{
    weak var tutorialDelegate: TutorialPageViewControllerDelegate?
    
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
    
    var currentIndex = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        // create first tutorial screen
        if let startingViewController = contentViewController(at: 0)
        {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! TutorialContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! TutorialContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> TutorialContentViewController?
    {
        if index < 0 || index >= pageHeadings.count
        {
            return nil
        }
        
        // Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "TutorialContentViewController") as? TutorialContentViewController
        {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.subheading = pageSubheadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func forwardPage()
    {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex)
        {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if completed
        {
            if let contentViewController = pageViewController.viewControllers?.first as? TutorialContentViewController
            {
                currentIndex = contentViewController.index
                tutorialDelegate?.didUpdatePageIndex(currentIndex: currentIndex)
            }
        }
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
