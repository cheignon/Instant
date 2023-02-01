//
//  DetailViewController.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit
import Alamofire
class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailViewTheViewComunicateToPresenterProtocol?
    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupTableView()
        // Do any additional setup after loading the view.
        
    }
    func setupTableView() {
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension DetailViewController: DetailViewPresenterCommunicateToViewProtocol {
    
}


extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return UITableView.automaticDimension
       }

       func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           cell.layoutIfNeeded()
       }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifiers = ["headerCell", "titleCell", "authorCell", " descriptionCell", "moreInfoCell"]
        let identifier = identifiers[indexPath.row]
        var cell =  tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
            guard let article = self.article else {
                return cell
            }
            if let header = cell as? DetailHeaderTableViewCell {
                header.didReceiveAn(article: article)
            } else if let titleCell = cell as? DetailTitleTableViewCell {
                titleCell.didReceiveAn(article: article)
            } else if let authorCell = cell as? DetailAuthorTableViewCell {
                authorCell.didReceiveAn(article: article)
            }  else if let descriptionell = cell as? DetailDescriptionTableViewCell {
                descriptionell.didReceiveAn(article: article)
            } else if let moreInfoCell = cell as? DetailMoreInfoTableViewCell {
                moreInfoCell.didReceiveAn(article: article)
           }
        
        return cell
    }
    
    
}
