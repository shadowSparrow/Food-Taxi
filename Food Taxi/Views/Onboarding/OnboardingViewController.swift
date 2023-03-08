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
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [OnboardingSlide(title: "order", description: "order", image: UIImage(named: "order")!)]
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setupSlide(slides[indexPath.row])
        
        return cell
    }
    
    
}
