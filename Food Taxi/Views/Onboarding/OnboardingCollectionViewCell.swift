//
//  OnboardingCollectionViewCell.swift
//  Food Taxi
//
//  Created by mac on 06.03.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    func setupSlide (_ slide: OnboardingSlide) {
        self.imageView.image = slide.image
        self.title.text = slide.title
        self.descriptionText.text = slide.description
    }
    
}
