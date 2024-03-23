//
//  ShowTvDetailHeader.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//
import UIKit
import SDWebImage
import SafariServices

class ShowTvDetailHeader: UIViewController {
   let imageView = UIImageView()
   let stackView = UIStackView()
   let premieredlabel = UILabel()
   let languageLabel = UILabel()
   let dateLabel = UILabel()
   let moreInfoButton = UIButton(type: .roundedRect)
   
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
      view.backgroundColor = .black
      
      imageView.contentMode = .scaleAspectFill
      imageView.backgroundColor = .black
      
      stackView.axis = .horizontal
      stackView.spacing = 8
      stackView.alignment = .leading
      
      premieredlabel.font = .custom(style: .title2)
      premieredlabel.textColor = .white
      
      languageLabel.font = .custom(style: .title2)
      languageLabel.textColor = .white
      
      moreInfoButton.backgroundColor = .secondarySystemBackground
      moreInfoButton.layer.cornerRadius = 12
      moreInfoButton.setTitle("Explore in IMDB", for: .normal)
      moreInfoButton.setTitleColor(.label, for: .normal)
      moreInfoButton.titleLabel?.font = .custom(style: .button)
      moreInfoButton.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
      moreInfoButton.addTarget(self, action: #selector(openWebShowTv), for: .touchUpInside)
      
   }
   
   func constraint() {
      view.addSubviews(imageView, stackView, moreInfoButton)
      stackView.addArrangedSubviews(premieredlabel, languageLabel, dateLabel)
      
      imageView.translatesAutoresizingMaskIntoConstraints = false
      stackView.translatesAutoresizingMaskIntoConstraints = false
      moreInfoButton.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
         imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
         imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
         imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
         
         stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
         stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
         stackView.bottomAnchor.constraint(equalTo: moreInfoButton.topAnchor, constant: -28),
         
         
         moreInfoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
         moreInfoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
         moreInfoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
         moreInfoButton.heightAnchor.constraint(equalToConstant: 45)
         
      ])
   }
   
   func configureUI() {
      imageView.sd_setImage(with: URL(string: tvShow?.image?.original ?? ""))
      premieredlabel.text =  tvShow?.premiered?.dateFormatter(style: .long)
      languageLabel.text = tvShow?.language?.rawValue
   }
   
   @objc func openWebShowTv() {
      if  let url = URL(string: tvShow?.officialSite ?? "") {
         let safariVC = SFSafariViewController(url: url)
         present(safariVC, animated: true, completion: nil)
      }
   }
}
