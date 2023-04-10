//
//  BookListTableViewCell.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//


import UIKit
import SnapKit
import Cosmos


class BookListTableViewCell: UITableViewCell {
    let title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
//        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let authorName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let rating: CosmosView = {
        let label = CosmosView()
        return label
    }()
    
    let genre: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(18)
            make.width.equalTo(200)
        }
        
        self.addSubview(authorName)
        authorName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(33)
            make.height.equalTo(12)
            make.width.equalTo(170)
        }
        
        rating.settings.fillMode = .half
        rating.settings.updateOnTouch = false
        self.addSubview(rating)
        rating.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-45)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        
        self.addSubview(date)
        date.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(12)
            make.width.equalTo(170)
        }
        
        
    }
    
    override public func prepareForReuse() {
        // Ensures the reused cosmos view is as good as new
        rating.prepareForReuse()
      }
    
}


