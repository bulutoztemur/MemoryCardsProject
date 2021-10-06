//
//  GameBoardVC.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 18.08.2021.
//

import UIKit
import RxCocoa
import RxSwift

class GameBoardVC: BaseVC {
    
    let screenWidth = UIScreen.main.bounds.size.width
    var viewModel: GameBoardVM? {
        didSet {
            bind()
            viewModel?.generateCards()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "MyCardCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemGreen
        return collectionView
    }()
    
    let scoreBoardView: ScoreboardView = {
        let view = ScoreboardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(collectionView)
        view.addSubview(scoreBoardView)
        navigationItem.viewControllerTag = .askUserForConfirmation
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Game Board"
        setupConstraints()
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scoreBoardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            scoreBoardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scoreBoardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: scoreBoardView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func finishGame() {
        scoreBoardView.stopTimer()
        let vc = ResultVC()
        vc.timerMilliseconds = scoreBoardView.milliseconds
        vc.category = viewModel?.category.value
        vc.mistakeCount = viewModel?.mismatched.value ?? 0
        navigationController?.pushViewController(vc, animated: true)
    }    
}

// MARK: - CollectionView Deletage Methods
extension GameBoardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel, let category = viewModel.category.value else { return 0 }
        return category.dimension.first * category.dimension.second
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCardCell", for: indexPath) as! CardCell
        cell.frontImageView.image = UIImage(named: viewModel.cardsArray[indexPath.row].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewModel = viewModel, let category = viewModel.category.value else { return CGSize(width: 0, height: 0)  }
        let dim = CGFloat(category.dimension.first)
        let cellWidth: CGFloat = ((screenWidth - 20) - ((dim - 1) * 12)) / dim
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        let cell = collectionView.cellForItem(at: indexPath) as? CardCell
        viewModel.cardTapped(card: cell!, index: indexPath.row)
    }
}

// MARK: - Bindings
private extension GameBoardVC {
    func bind() {
        guard let viewModel = viewModel else { return }
        viewModel.mismatched
            .subscribe(onNext: { [weak self] mismatchCount in
                self?.scoreBoardView.mismatchLabel.text = "Mismatch: \(mismatchCount)"
            })
            .disposed(by: viewModel.disposeBag)
        
        viewModel.totalMatched
            .filter { totalMatched in
                guard let category = viewModel.category.value else { return false }
                return totalMatched == category.dimension.first * category.dimension.second / 2
            }
            .subscribe(onNext: { [weak self] _ in
                self?.finishGame()
            })
            .disposed(by: viewModel.disposeBag)
    }
}

