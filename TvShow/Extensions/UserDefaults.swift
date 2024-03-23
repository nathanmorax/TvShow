//
//  UserDefaults.swift
//  TvShow
//
//  Created by Nathan Mora on 21/03/24.
//

import Foundation

extension UserDefaults {
   
   static let favoritedTvShowKey = "favoritedTvShowKey"
   
   func savedTvShow() -> [TvShow] {
      guard let savedTvShowData = UserDefaults.standard.data(forKey: UserDefaults.favoritedTvShowKey) else { return [] }
      guard let savedTvShow = NSKeyedUnarchiver.unarchiveObject(with: savedTvShowData) as? [TvShow]? else { return [] }
      return savedTvShow ?? []
   }
   
   func deleteTvShow(tvShow: TvShow) {
      let tvShows = savedTvShow()
      let filteredTvShow = tvShows.filter { (p) -> Bool in
         return p.name != tvShow.name && p.id != tvShow.id
      }
      let data = NSKeyedArchiver.archivedData(withRootObject: filteredTvShow)
      UserDefaults.standard.set(data, forKey: UserDefaults.favoritedTvShowKey)
   }
   
}
