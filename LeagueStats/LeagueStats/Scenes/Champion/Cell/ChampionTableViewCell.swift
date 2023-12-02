//
//  ChampionTableViewCell.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 25/11/2023.
//

import UIKit
import LeagueAPI
import Then
import Reusable
import SDWebImage

class ChampionTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var championImageView: UIImageView!
    @IBOutlet weak var championNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCell(thisChampion: ChampionDetails, index: Int) {
        indexLabel.text = String(index + 1)
        guard let image = thisChampion.images?.square.url else { return }
        championImageView.sd_setImage(with: URL(string: image), placeholderImage: nil)
        championImageView.layer.cornerRadius = 10
        championNameLabel.text = thisChampion.name
    }

}
