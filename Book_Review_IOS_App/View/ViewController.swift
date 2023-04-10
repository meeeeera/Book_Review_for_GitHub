//
//  ViewController.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import UIKit
import SnapKit
import CoreData
import Cosmos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let subMenuVC = ReviewListViewController()
    var fetchresultController = NSFetchedResultsController<NSFetchRequestResult>()
    let coreDataManager = CoreDataManager.shared
    
    var bookListTable: UITableView = {
    var table = UITableView()
        table.backgroundColor = .white
    return table
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "BOOKS"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Book", style: .plain, target: self, action: #selector(addAction))
        
        fetchresultController = coreDataManager.getResultContainer(entityName: "Book", sortingKey: "title")
        
        do {
            try fetchresultController.performFetch()
        } catch {
            print(error)
        }

        
        fetchresultController.delegate = self

        bookListTable.register(BookListTableViewCell.self, forCellReuseIdentifier: "myCell")
        bookListTable.dataSource = self
        bookListTable.delegate = self
        
        
        view.addSubview(bookListTable)
        bookListTable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(840)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchresultController.sections?[section] else {
            print("dd")
            return 0
        }
        return sectionInfo.numberOfObjects
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = bookListTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as?
                    BookListTableViewCell else { return UITableViewCell()}
           let item = fetchresultController.object(at: indexPath) as! Book
          cell.title.text = item.title
          cell.authorName.text = item.authorName
          cell.date.text = item.releaseDate?.asFormattedString()
          cell.genre.text = item.bookGenre
          let starCount = Int(round(item.rating / 2))
          cell.rating.rating = Double(starCount)
           return cell
      } //adding values in each tableviewCell and labels
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(subMenuVC, animated: true)
                    tableView.deselectRow(at: indexPath, animated: true)
    } //cell push new vc
    
  
    @objc func addAction() { //adding new book
        self.present(AddBookViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let objectToDelete = fetchresultController.object(at: indexPath)
            coreDataManager.persistentContainer.viewContext.delete(objectToDelete as! NSManagedObject)
            do {
                try coreDataManager.persistentContainer.viewContext.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    } //deleting row in tableview function
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 //row height
    }
    
}


extension ViewController: NSFetchedResultsControllerDelegate {
    //deleting function's extension
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        bookListTable.beginUpdates()
    }
        
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                bookListTable.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                bookListTable.deleteRows(at: [indexPath], with: .fade)
            }
        default :
            print("sdfsfd")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        bookListTable.endUpdates()
    }
    
    
    

}
