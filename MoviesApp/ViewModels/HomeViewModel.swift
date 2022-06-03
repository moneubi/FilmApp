//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import Foundation

class HomeViewModel: NSObject{
    
    private var homeDatasource : HomeDataSourceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var movies = Common.Movies
    
    var movieCellViewModels = [MovieCellViewModel](){
        
        didSet{
            
            reloadTableView?()
        }
    }
    
    func getMovies() {
        homeDatasource.getMovies(completion: { success, model, error in
            
            if success, let movies = model {
                self.fetchData(movies: movies)
            } else {
                print(error!)
            }
        })
    }
        
    func fetchData(movies: [Movie]) {
        self.movies = movies
        var vms = [MovieCellViewModel]()
        for movie in movies {
            vms.append(createCellModel(movie: movie))
        }
        movieCellViewModels = vms
    }
    
    func createCellModel(movie: Movie) -> MovieCellViewModel {
        let id = movie.id
        let backdrop_path = movie.backdrop_path
        let adult = movie.adult
        let original_language = movie.original_language
        let original_title = movie.original_title
        let overview = movie.overview
        let popularity = movie.popularity
        let poster_path = movie.poster_path
        let release_date = movie.release_date
        let title = movie.title
        let video = movie.video
        let vote_average = movie.vote_average
        let vote_count = movie.vote_count
        
        return MovieCellViewModel(adult: adult, backdrop_path: backdrop_path, id: id, original_language: original_language, original_title: original_title, overview: overview, popularity: popularity, poster_path: poster_path, release_date: release_date, title: title, video: video, vote_average: vote_average, vote_count: vote_count)
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> MovieCellViewModel {
        
        return movieCellViewModels[indexPath.row]
    }
    
    init(homeDatasource: HomeDataSourceProtocol = HomeDataSource()) {
        
        self.homeDatasource = homeDatasource
    }
}
