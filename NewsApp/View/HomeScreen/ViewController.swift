//
//  ViewController.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import UIKit

class ViewController: UIViewController {
    
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
        mTableView.delegate = self
        mTableView.dataSource = self
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
        cell.newsTitle.text = article?[indexPath.row].title
        cell.newsAuthor.text = article?[indexPath.row].author
        cell.newsDescription.text = article?[indexPath.row].articleDescription
        cell.newsImage.load(url: article?[indexPath.row].urlToImage ?? "placeHoldeImg")
        return cell
    }
    
}

