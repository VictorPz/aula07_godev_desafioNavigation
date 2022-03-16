//
//  DetailViewController.swift
//  NavigationTableView
//
//  Created by Victor Pizetta on 16/03/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailSubtitleLabel: UILabel!
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var ingredientsContentTextView: UITextView!
    @IBOutlet weak var prepareTitleLabel: UILabel!
    @IBOutlet weak var prepareTextView: UITextView!
    
    var receita: Receita?
    
    override func viewDidLoad() {
        setupDetailView()

    }
    
    func setupDetailView() {
        if let receita = receita {
            detailTitleLabel.text = "\(receita.name)"
            detailSubtitleLabel.text = "Tempo de preparo: \(receita.preparationTime) minutos"
            ingredientsTitleLabel.text = "Ingredientes:"
            ingredientsContentTextView.text = "\(receita.ingredients)"
            prepareTitleLabel.text = "Modo de preparo:"
            prepareTextView.text = "\(receita.preparationSteps)"
        }
    }
    
}
