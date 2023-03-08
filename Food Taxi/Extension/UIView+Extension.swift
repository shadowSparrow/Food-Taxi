//
//  UIView+Extension.swift
//  Food Taxi
//
//  Created by mac on 06.03.2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
        
    }
}

