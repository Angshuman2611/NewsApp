//
//  ViewController.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    
    private var pullControl = UIRefreshControl()
    
    let viewModel = HomeViewModel()
    var article: [Article]?

    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = Constants.Strings.NewsFeed.title.rawValue
        viewModel.fetchNews()
        setup()
        addListener()
    }
    
    func addListener() {
        viewModel.newsData.bind { result in
            if (result?.count != 0) {
                guard let result = result else {
                    return
                }
                self.article = result
                self.mTableView.reloadData()
            }
        }
    }

    private func setup() {
        
        pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        mTableView.refreshControl = pullControl
        mTableView.delegate = self
        mTableView.dataSource = self
    }
    
    @objc private func refreshListData(_ sender: Any) {
        viewModel.fetchNews()
        self.pullControl.endRefreshing()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.articlesData = article?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "WebViewScreen", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
        vc.webURL = article?[indexPath.row].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

