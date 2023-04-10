//
//  ReviewListViewController.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 03.04.2023.
//

import UIKit
import CoreData

class ReviewListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    var fetchresultController = NSFetchedResultsController<NSFetchRequestResult>()
    let coreDataManager = CoreDataManager.shared
    
        var reviewListTable: UITableView = {
        var table = UITableView()
        table.backgroundColor = .white
        return table
        }()
 
       

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "REVIEWS"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Review", style: .plain, target: self, action: #selector(addAction))
        
        reviewListTable.register(ReviewListTableViewCell.self, forCellReuseIdentifier: "Cell")
        reviewListTable.dataSource = self
        reviewListTable.delegate = self
        
        view.addSubview(reviewListTable)
        reviewListTable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(840)
            make.trailing.equalToSuperview().offset(-10)
        }

        
        
        
        
        
        
        
        
        
    }
    

    
    @objc func addAction() { //adding new review
         self.present(AddReviewViewController(), animated: true)
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       3
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = reviewListTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as?
                     ReviewListTableViewCell else { return UITableViewCell()}
           return cell
       }
}
