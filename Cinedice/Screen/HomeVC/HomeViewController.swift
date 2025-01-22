//
//  HomeViewController.swift
//  Netflix
//
//  Created by samet on 26.11.2024.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    var viewModal:HomeViewModal?
    var arrUpComing = [MovieResult]()
    var arrPopular = [MovieResult]()
    var arrToprated = [MovieResult]()
    var sectionMoview = ["Popular", "Top Rated", "Upcoming Movies"]
    private var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModal?.delegate = self
        viewModal?.load()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        let headerView = MainView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 0.35))
        tableView.tableHeaderView = headerView
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.snp.makeConstraints { make in
            make.top.bottom.right.left.equalToSuperview()
        }
        
    }
}

extension HomeViewController:MovieListViewModalDelegate {
    func handleOutput(_ output: MovieListViewModalOutPut) {
        switch output {
        case .popular(let popular):
            self.arrPopular = popular
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .topRated(let topRated):
            self.arrToprated = topRated
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .upComing(let upComing):
            self.arrUpComing = upComing
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            print(error)
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionMoview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        switch indexPath.section {
        case SectionTableView.popular.rawValue:
            cell.configure(movie: arrPopular)
        case SectionTableView.topRated.rawValue:
            cell.configure(movie: arrToprated)
        case SectionTableView.upComing.rawValue:
            cell.configure(movie: arrUpComing)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
