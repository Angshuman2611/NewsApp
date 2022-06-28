//
//  NewsCell.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    
    var articlesData: Article?{
        didSet {
            setup()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setup() {
        newsTitle.text = articlesData?.title
        newsAuthor.text = articlesData?.author
        newsDescription.text = articlesData?.articleDescription
        newsImage.load(url: URL(string: (articlesData?.urlToImage)!)!, placeHolder: "placeHolderImg")
    }
}
