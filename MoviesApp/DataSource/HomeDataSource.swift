//
//  HomeDataSource.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 3/6/2022.
//

import Foundation
import SwiftyJSON

protocol HomeDataSourceProtocol{
    
    func getMovies(completion: @escaping (_ success: Bool, _ results: Movies?, _ error: String?) -> ())
}

class HomeDataSource: HomeDataSourceProtocol{
    
    
    func getMovies(completion: @escaping (Bool, Movies?, String?) -> ()) {
        
        HttpRequestHelper().GET(url: Common.BASE_URL, params: ["api_key": Common.API_KEY, "language": "en-US", "sort_by":"popularity.desc", "include_adult":"false", "include_video": "true", "page":"1", "with_watch_monetization_types": "flatrate"], httpHeader: .application_json, complete: {success, data in
            
            if success {
                let json = JSON(data as Any)
                let jArray = json["results"].array
                var jMovie: JSON
                var movie: Movie
                for i in 1...jArray!.count {
                    
                    jMovie = JSON(jArray?[i - 1] as Any)
                    movie = Movie(adult: jMovie["adult"].boolValue, backdrop_path: jMovie["backdrop_path"].stringValue, id: jMovie["id"].intValue, original_language: jMovie["original_language"].stringValue, original_title: jMovie["original_title"].stringValue, overview: jMovie["overview"].stringValue, popularity: jMovie["popularity"].int64Value, poster_path: jMovie["poster_path"].stringValue, release_date: jMovie["release_date"].stringValue, title: jMovie["title"].stringValue, video: jMovie["title"].boolValue, vote_average: jMovie["vote_average"].doubleValue, vote_count: jMovie["vote_count"].int64Value)
                    
                    Common.Movies.append(movie)
                }
                
                if Common.Movies.count > 0{
                    
                    completion(true, Common.Movies, nil)
                }else{
                    
                    completion(false, nil, "Error: Trying to parse Movies to model")
                }
            } else {
                 
                completion(false, nil, "Error: Movies GET Request failed")
            }
            
        })
    }
    
}
