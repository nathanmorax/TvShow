//
//  ViewController.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {
   
   fileprivate let HomeDetailCell = "cell"
   let tableView = UITableView(frame: .zero)
   var tvShow = [TvShow]()
   var savedTvShow = UserDefaults.standard.savedTvShow()
   
   var imageView = UIImageView()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
      fetchDataScheduleRace()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      tabBarController?.tabBar.isHidden = false
   }
   
   private func configure() {
      navigationController?.navigationBar.prefersLargeTitles = true
      
   }
   
   private func constraint() {
      tableView.register(HomeDetailsCell.self, forCellReuseIdentifier: HomeDetailCell)
      tableView.delegate = self
      tableView.dataSource = self
      view.addSubview(tableView)
      
      tableView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         view.topAnchor.constraint(equalTo: tableView.topAnchor),
         view.leftAnchor.constraint(equalTo: tableView.leftAnchor),
         view.rightAnchor.constraint(equalTo: tableView.rightAnchor),
         view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
      ])
   }
   
   func fetchDataScheduleRace() {
      
      APIService.shared.fetchDataShowsTV { result, error in
         guard let result, error == nil else { return }
         
         self.tvShow = result
         DispatchQueue.main.async {
            self.tableView.reloadData()
         }
      }
   }
   
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return tvShow.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: HomeDetailCell, for: indexPath)
      if let cell = cell as? HomeDetailsCell {
         cell.titleLabel.text = tvShow[indexPath.row].name
         cell.subtitleLabel.text = tvShow[indexPath.row].language?.rawValue
         let url = URL(string: tvShow[indexPath.row].image?.medium ?? "")
         cell.image.sd_setImage(with: url)
         cell.accessoryType = .disclosureIndicator
      }
      return cell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let showId = tvShow[indexPath.row]
      let viewController = ShowTvDetailView()
      viewController.tvShow = showId.self
      navigationController?.pushViewController(viewController, animated: true)
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 110
   }
   
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
      let saveFavoriteAction = UIContextualAction(style: .normal, title: "Favorite") { _ ,_ , completion in
         
         
         let index = self.tvShow[indexPath.row]
         
         // 1. Transform Podcast into Data
         var listOfTvShow = UserDefaults.standard.savedTvShow()
         listOfTvShow.append(index)
         let data = NSKeyedArchiver.archivedData(withRootObject: listOfTvShow)
         
         UserDefaults.standard.set(data, forKey: UserDefaults.favoritedTvShowKey)
         completion(true)
         Alert.showFavoriteAlert(on: self, with: "Favorite", message: "Add favorite")
         
      }
      
      saveFavoriteAction.image = UIImage(systemName: "heart")
      saveFavoriteAction.backgroundColor = .green
      
      let config = UISwipeActionsConfiguration(actions: [saveFavoriteAction])
      config.performsFirstActionWithFullSwipe = false
      return config
      
   }
}

