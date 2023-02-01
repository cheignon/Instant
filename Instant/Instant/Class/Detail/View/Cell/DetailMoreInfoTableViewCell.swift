//
//  DetailMoreInfoTableViewCell.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

class DetailMoreInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var urlLabel: UILabel!
    var url: URL?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// this function permit to fille cell with dat
    /// - parameters:
    ///    - article: ``Article`` object ,  this object contain all information to  fille every object of this cel
    func didReceiveAn(article: Article) {
        self.setupLabelWith(article: article)
    }

    // this function will configure the label inside the cell
    /// - parameters:
    ///    - article:  ``Article`` Object, this dat permit to file text on this cell
    func setupLabelWith(article: Article) {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.linkLabelTapped(_:)))
        self.urlLabel.isUserInteractionEnabled = true
        self.urlLabel.addGestureRecognizer(labelTap)
        self.urlLabel.textColor = .systemBlue
        let urlString = article.url
        self.url = URL(string: urlString)
        self.urlLabel.text = self.url?.host()

    }
    
    @objc func linkLabelTapped(_ sender: UITapGestureRecognizer) {
        guard let url = self.url else { return }
        if  UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

}
