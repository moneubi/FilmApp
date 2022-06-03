//
//  MovieCell.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import Foundation
import UIKit
import SDWebImage

class MovieCell: UITableViewCell {
    private var viewEnglobe = UIView()
    private var txt_Title = UILabel()
    private var image_movie = UIImageView()
    private var descprt_movie = UILabel()
    
    let screenSize = UIScreen.main.bounds
    
    private var movieModel : MovieCellViewModel!
    
    func setMovie(movie: MovieCellViewModel){
        
        self.movieModel = movie
        self.txt_Title.text = movie.original_title
        self.descprt_movie.text = movie.overview
        
        let url = URL(string: "\(Common.LINK_IMAGE_200)\(movieModel.poster_path)")
        
        self.image_movie.sd_setImage(with: url) { (image, error, cache, urls) in
            if (error != nil) {
                self.image_movie.image = UIImage(named: "placeholder")
            } else {
                self.image_movie.image = image
            }
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.viewEnglobe = ViewUtilities.init().createView(x: 0, y: 0, width: screenSize.width - 20, height: 90, background: "col_card", cornerRadius: 10)
        addSubview(viewEnglobe)
        
        self.image_movie = ImageUtilities.init().createSimpleImageUI(x: 0, y: 0, width: 90, height: 90)
        viewEnglobe.addSubview(image_movie)
        
        self.txt_Title = LabelUtilities.init().createLabelView(x: 100, y: 5, width: self.bounds.width - 100, height: 35, fontName: "HelveticaNeue-Bold", fontSize: 14.0, textColor: "col_title", numberLine: 2)
        viewEnglobe.addSubview(txt_Title)
        
        self.descprt_movie = LabelUtilities.init().createLabelView(x: 100, y: 40, width: self.bounds.width - 100, height: 45, fontName: "HelveticaNeue", fontSize: 14.0, textColor: "col_title", numberLine: 3)
        viewEnglobe.addSubview(descprt_movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
