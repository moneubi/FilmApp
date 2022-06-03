//
//  HomeVC.swift
//  MoviesApp
//
//  Created by MBAYE Libasse on 2/6/2022.
//

import UIKit

private let CellId = "MovieCell"

class HomeVC: UIViewController {
    
    private var tableView = UITableView()
    private let screenSize = UIScreen.main.bounds
    
    private var movie: Movie!
    
    lazy var viewModel = {
        HomeViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(named: "col_background")
        self.title = "Movie App"
        
        self.tableView = TableViewUtilities.init().createtableView(x: 10, y: 10, width: screenSize.width - 20, height: screenSize.height - 20, rowHeight: 100)
        tableView.register(MovieCell.self, forCellReuseIdentifier: CellId)
        self.view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        
        initViewModel()
    }

    
    func initViewModel() {
        let child = SpinnerUtilities()

        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        viewModel.getMovies()
        
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                
                child.willMove(toParent: nil)
                child.view.removeFromSuperview()
                child.removeFromParent()
            }
        }
    }

}


extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.movieCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! MovieCell

        let cellVM = viewModel.getCellViewModel(at: indexPath)
        cell.setMovie(movie: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        movie = Common.Movies[indexPath.row]
        let vc = DetailVC()
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailVC{
            destination.movie = movie
        }
    }
}
