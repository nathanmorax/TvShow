//
//  ShowTvDetailsInformation.swift
//  TvShow
//
//  Created by Nathan Mora on 22/03/24.
//

import UIKit

class ShowTvDetailsInformation: UIViewController {
   
   let informationLabel = UILabel()
   var tvShow: TvShow?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
      configureUI()
   }
   
   init(tvShow: TvShow) {
      super.init(nibName: nil, bundle: nil)
      self.tvShow = tvShow
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   func configure() {
      
      informationLabel.backgroundColor = .darkGray
      informationLabel.layer.cornerRadius = 10
      informationLabel.font = .custom(style: .headline)
      informationLabel.textAlignment = .center
      informationLabel.textColor = .white
      informationLabel.numberOfLines = 0
      
   }
   
   func constraint() {
      view.addSubview(informationLabel)
      informationLabel.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         informationLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
         informationLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
         informationLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
         informationLabel.heightAnchor.constraint(equalToConstant: 100)
         
      ])
   }
   
   func configureUI() {
      
      let text = tvShow?.summary
      let data = Data(text!.utf8)
      if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
         informationLabel.attributedText = attributedString
         let font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
         informationLabel.font = font
      }
   }
}

