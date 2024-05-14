//
//  ViewController.swift
//  Alphabet_2_testing
//
//  Created by Pavel Nikipelov on 14.05.2024.
//

import UIKit

final class ViewController: UIViewController {

    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    private let letters = [
                "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к",
                "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц",
                "ч", "ш" , "щ", "ъ", "ы", "ь", "э", "ю", "я"
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
              
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.addSubview(collectionView)
        setupCollectionView()
    }

    func setupCollectionView() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self

    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LetterCollectionViewCell
        
        cell?.titleLabel.text = letters[indexPath.row]
        cell?.titleLabel.textColor = .white
        cell?.titleLabel.font = .systemFont(ofSize: 24)
        cell?.titleLabel.textAlignment = .center
        cell?.titleLabel.numberOfLines = 1

        cell?.contentView.backgroundColor = .blue
        cell?.contentView.alpha = 0.5
        
        return cell!
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
