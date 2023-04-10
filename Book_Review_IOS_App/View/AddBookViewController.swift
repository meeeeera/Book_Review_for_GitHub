//
//  AddBookViewController.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import UIKit
import Cosmos
import TinyConstraints

class AddBookViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
   
    let coreDataManager = CoreDataManager.shared
let genresInPicker = ["Иностранная классика", "Фантастика", "Научная литература", "Детская литература", "Поэзия", "Современная литература", "Русская классика", "Отечественная классика", "Психология", "Бизнес", "Саморазвитие"]
    
private var addBookVM = AddBookViewModel()




    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        return view
    }()
    
    let titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter title"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    let authorNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Author's name"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    let bookGenrePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        return picker
    }()
    
    let saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.615, green: 0.929, blue: 0.588, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "Рейтинг"
        return label
    }()
    
    let genreText: UILabel = {
        let label = UILabel()
        label.text = "Выбери жанр:"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        bookGenrePicker.delegate = self
        bookGenrePicker.dataSource = self
        
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(125)
            make.width.equalTo(340)
            make.height.equalTo(40)
        }
        
        view.addSubview(authorNameTextField)
        authorNameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(185)
            make.width.equalTo(340)
            make.height.equalTo(40)
        }
        
        cosmosView.settings.fillMode = .half
       
        cosmosView.didFinishTouchingCosmos = { rating in
            self.rateLabel.text = String(rating)
        }

        view.addSubview(cosmosView)
        cosmosView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(245)
            make.top.equalToSuperview().offset(250)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.snp.makeConstraints { make in
            make.leading.equalTo(160)
            make.bottom.equalToSuperview().offset(-200)
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        
        view.addSubview(genreText)
        genreText.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(145)
            make.top.equalToSuperview().offset(290)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        view.addSubview(bookGenrePicker)
        bookGenrePicker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(305)
            make.width.equalTo(340)
            make.height.equalTo(100)
        }
        
        view.addSubview(rateLabel)
        rateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(25)
            make.top.equalToSuperview().offset(235)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(AddBookViewController.datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(55)
            make.top.equalToSuperview().offset(430)
            make.width.equalTo(240)
            make.height.equalTo(30)
        }
    
    }
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
       }
       
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           genresInPicker.count
       }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return genresInPicker[row]
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
            let selectedDate: String = dateFormatter.string(from: sender.date)
        }


    @objc func save() {
        if titleTextField.text?.isEmpty == true ||  ((authorNameTextField.text!.isEmpty) == true) {

            let alert = UIAlertController(title: "Error", message: "Fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        } else {
            guard let title = titleTextField.text else { return }
            guard let authorName = authorNameTextField.text else { return }
            let bookGenres = genresInPicker
            let date = datePicker.date
            let rating = Double(rateLabel.text!)

            coreDataManager.createObject(title: title, authorName: authorName, rating: rating ?? 1.0, releaseDate: date, bookGenre: bookGenres.joined(separator: " "))
            
            dismiss(animated: true)
        }
    }
    
    private class func formatValue(_ value: Double) -> Int {
               return Int(value)
           }
    
    private func didTouchCosmos(_ rating: Double) {
         rateLabel.text = "\(AddBookViewController.formatValue(rating))"
           }
    
}
