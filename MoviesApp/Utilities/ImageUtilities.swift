//
//  ImageUtilities.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import Foundation
import UIKit
import SDWebImage

class ImageUtilities{
    
    private let image = UIImageView()
    
    init() {
    }
    
    func createSimpleImage(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, imageName: String) -> UIImageView{
        
        image.frame = CGRect(x: x, y: y, width: width, height: height)
        image.image = UIImage(systemName: imageName)
        image.tintColor = UIColor(named: "col_accent")
        
        return image
    }
    
    func createImageWithURL(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, urlImage : String) -> UIImageView{
        
        image.frame = CGRect(x: x, y: y, width: width, height: height)
        let url = URL(string: urlImage)
        
        image.sd_setImage(with: url) { (image, error, cache, urls) in
            if (error != nil) {
                self.image.image = UIImage(systemName: "person.fill")
            } else {
                self.image.image = image
            }
        }
        
        return image
    }
}
