//
//  OnboardingViewController.swift
//  Food Taxi
//
//  Created by mac on 06.03.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageConrol: UIPageControl!
    var slides: [OnboardingSlide] = [OnboardingSlide(title: "Order", description: "Make your order with App", image: UIImage(named: "order")!), OnboardingSlide(title: "Taxi", description: "Delivery at your door Steps", image: UIImage(named: "taxi")!), OnboardingSlide(title: "Meal", description: "Enjoy Your Meal", image: UIImage(named: "enjoy")!)
    ]
    
    var currentPage: Int = 0 {
        
        didSet{
            
            pageConrol.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Start", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        pageConrol.numberOfPages = slides.count
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setupSlide(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let windth = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / windth)
    }
}
