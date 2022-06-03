//
//  DetailVC.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 3/6/2022.
//

import UIKit

class DetailVC: UIViewController {
    
    var movie: Movie!
    
    private var img_movie = UIImageView()
    private var viewContent = UIView()
    private var title_movie = UILabel()
    private var date_movie = UILabel()
    private var descpt_movie = UILabel()
    
    private let screenSize = UIScreen.main.bounds
    
    lazy var scrollview: UIScrollView = {
            let view = UIScrollView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.isScrollEnabled = true
            view.showsVerticalScrollIndicator = false
            view.contentSize.height = 850
            
            return view
        }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(named: "col_background")
        
        self.view.addSubview(scrollview)
        setupScrollView()
        
        self.img_movie = ImageUtilities.init().createImageWithURL(x: 0, y: 0, width: screenSize.width, height: screenSize.height/2, urlImage: "\(Common.LINK_IMAGE_ORIGINALE)\(movie.poster_path)")
        self.scrollview.addSubview(self.img_movie)
        
        self.viewContent = ViewUtilities.init().createView(x: 0, y: self.img_movie.bounds.height, width: screenSize.width, height: screenSize.height/2, background: "col_background", cornerRadius: 0)
        self.scrollview.addSubview(viewContent)
        
        self.title_movie = LabelUtilities.init().createLabelView(x: 15, y: 10, width: screenSize.width - 30, height: 50, fontName: "HelveticaNeue-Bold", fontSize: 18, textColor: "col_title", numberLine: 0)
        self.title_movie.text = movie.original_title
        self.viewContent.addSubview(self.title_movie)
        
        self.date_movie = LabelUtilities.init().createLabelView(x: 15, y: self.title_movie.bounds.height + 10, width: screenSize.width - 30, height: 30, fontName: "HelveticaNeue", fontSize: 18, textColor: "col_accent", numberLine: 1)
        self.viewContent.addSubview(self.date_movie)
        self.date_movie.text = movie.release_date
        
        self.descpt_movie = LabelUtilities.init().createLabelView(x: 15, y: 90, width: screenSize.width - 30, height: self.viewContent.bounds.height, fontName: "HelveticaNeue", fontSize: 16, textColor: "col_content", numberLine: 0)
        self.viewContent.addSubview(self.descpt_movie)
        self.descpt_movie.text = movie.overview
        self.descpt_movie.sizeToFit()
        
    }

    func setupScrollView(){
        scrollview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}
