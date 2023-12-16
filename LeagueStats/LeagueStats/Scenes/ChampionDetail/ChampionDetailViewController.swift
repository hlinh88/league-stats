//
//  ChampionDetailViewController.swift
//  LeagueStats
//
//  Created by Hoang Linh Nguyen on 16/12/2023.
//

import UIKit
import SDWebImage
import LeagueAPI

class ChampionDetailViewController: UIViewController {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var coverLayerView: UIView!
    @IBOutlet weak var championNameLabel: UILabel!
    @IBOutlet weak var championTitleLabel: UILabel!
    
    private var thisChampion: ChampionDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func configView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(1.0).cgColor,
                                UIColor.black.withAlphaComponent(0.0).cgColor]
        gradientLayer.frame = coverLayerView.bounds
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        coverLayerView.layer.insertSublayer(gradientLayer, at: 0)
        if let thisChampion {
            guard let image = thisChampion.images?.splash.url else { return }
            coverImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            coverImageView.sd_setImage(with: URL(string: image), placeholderImage: nil)
            championNameLabel.text = thisChampion.name
            championTitleLabel.text = thisChampion.title.capitalized
        }
    }

    func setChampionDetails(thisChampion: ChampionDetails) {
        self.thisChampion = thisChampion
    }

    @IBAction private func handleBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
