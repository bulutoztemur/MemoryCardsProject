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
    
    var sizeOne: Int
    var sizeTwo: Int
    let screenWidth = UIScreen.main.bounds.size.width
    let viewModel = GameBoardVM() 
    
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

    init(_ category1: Int, _ category2: Int) {
        sizeOne = category1
        sizeTwo = category2
        super.init(nibName: nil, bundle: nil)
        viewModel.generateCards(size: sizeOne * sizeTwo)
        viewModel.sizeOne.accept(sizeOne)
        viewModel.sizeTwo.accept(sizeTwo)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        view.addSubview(collectionView)
        view.addSubview(scoreBoardView)
        self.navigationItem.viewControllerTag = .askUserForConfirmation
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
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - CollectionView Deletage Methods
extension GameBoardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeOne * sizeTwo
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCardCell", for: indexPath) as! CardCell
        cell.frontImageView.image = UIImage(named: viewModel.cardsArray[indexPath.row].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = ((screenWidth - 20) - ((CGFloat(sizeOne) - 1) * 10)) / CGFloat(sizeOne)
        let cellHeight = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardCell
        viewModel.cardTapped(card: cell!, index: indexPath.row)
    }
}

// MARK: - Bindings
private extension GameBoardVC {
    func bind() {
        viewModel.mismatched
            .subscribe(onNext: { [weak self] mismatchCount in
                self?.scoreBoardView.mismatchLabel.text = "Mismatch: \(mismatchCount)"
            })
            .disposed(by: viewModel.disposeBag)
        
        Observable.combineLatest(viewModel.totalMatched, viewModel.sizeOne, viewModel.sizeTwo)
            .filter { totalMatched, sizeOne, sizeTwo in
                guard let sizeOne = sizeOne, let sizeTwo = sizeTwo else { return false }
                return totalMatched == sizeOne * sizeTwo / 2
            }
            .subscribe(onNext: { [weak self] _ in
                self?.finishGame()
            })
            .disposed(by: viewModel.disposeBag)
    }
}

