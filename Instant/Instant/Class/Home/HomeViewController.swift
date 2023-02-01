//
//  HomeViewController.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import UIKit
import Alamofire
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var presenter: HomeViewTheViewCommunicateToPresenterProtocol?
    var result: Result?
    private var searchingWorkItem: DispatchWorkItem?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        HomeViewRouter.ConfigureViewController(viewcontroller: self)
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setupSearchBar()
    }
    
    
    func setupTableView() {
        self.tableView.delegate  = self
        self.tableView.dataSource = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.rowHeight = 139
    }
    
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func presentAlertView(title: String, messsage: String) {
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
}



extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection() ?? 00
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = indexPath.row == 0 ? "HeadlineCell" : "NewsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let result = self.result, result.getCountOfArticles() > indexPath.row {
            guard let article = self.result?.articles?[indexPath.row] else {
                return cell
            }
            if let headline = cell as? HeadlineTableViewCell {
                headline.didReceiveAn(article: article)
            } else if let newsCell = cell as? NewsTableViewCell {
                newsCell.didReceiveAn(article: article)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRowAt(index: indexPath)
    }
}

extension HomeViewController: HomeViewPresentComunnicateToViewProtocol {
    func onFetchNewsFailure(error: AFError) {
        self.presentAlertView(title: "Erreur", messsage: error.localizedDescription)
    }
    
    func onFetchNewsSuccess(result: Result) {
        self.result = result
        self.tableView.reloadData()
    }
    
    func deselectRowAt(index: IndexPath) {
        self.presenter?.didSelectRowAt(index: index)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        self.presenter?.interactor?.userDidFinishToTypeText(text: searchText)

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // i do that because i dont want make request for every char tapped
        searchingWorkItem?.cancel()
        
        
        let currentWorkItem = DispatchWorkItem {
            
            if searchText == "" {
                self.presenter?.viewDidLoad()
            } else {
                self.presenter?.interactor?.userDidFinishToTypeText(text: searchText)
            }
        }
        
        searchingWorkItem = currentWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2,
                                      execute: currentWorkItem)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter?.viewDidLoad()
    }
    
    
}
