//
//  ReviewListTableViewCell.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 10.04.2023.
//

import UIKit

class ReviewListTableViewCell: UITableViewCell {

    let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        
        self.addSubview(reviewLabel)
        reviewLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(33)
            make.height.equalTo(12)
            make.width.equalTo(170)
        }
    }

}
