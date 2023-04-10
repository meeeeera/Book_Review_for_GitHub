//
//  AddReviewViewController.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 03.04.2023.
//

import UIKit

class AddReviewViewController: UIViewController {

    let titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Title of the review"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    let reviewTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Type your opinion"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(105)
            make.width.equalTo(310)
            make.height.equalTo(50)
        }
        
        view.addSubview(reviewTextField)
        reviewTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(220)
            make.width.equalTo(310)
            make.height.equalTo(250)
        }
      
    }
    



}
