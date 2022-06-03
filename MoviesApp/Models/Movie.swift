//
//  Movies.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import Foundation

typealias Movies = [Movie]

struct Movie: Codable{
    
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Int64
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int64
    
    init(adult: Bool, backdrop_path: String, id: Int, original_language: String, original_title: String, overview: String, popularity: Int64, poster_path: String, release_date: String, title: String, video: Bool, vote_average: Double, vote_count: Int64){
        
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
}
