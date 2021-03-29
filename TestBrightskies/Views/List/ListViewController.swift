//
//  ViewController.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 3/24/21.
//  Copyright © 2021 Magdy rizk. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa


class ListViewController: UIViewController, UIScrollViewDelegate{
    var listViewModel = ListViewModel()
    @IBOutlet weak var recipesTableView: UITableView!
    public var recipes = PublishSubject<[Recipes]>()
//    var selectedResipe = Recipes()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        recipesTableView.rowHeight = UITableView.automaticDimension
        recipesTableView.estimatedRowHeight = 100
        setupBindingsTV()
        setupBindings()
        listViewModel.requestData()
        
       
       
        // Do any additional setup after loading the view.
    }
    private func setupBindings() {
        
        // binding loading to vc
        
        listViewModel.loading
            .bind(to: self.rx.isAnimating).disposed(by: disposeBag)
        
        
        // observing errors to show
        
        listViewModel
            .error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
                switch error {
                case .internetError(let message):
                    MessageView.sharedInstance.showOnView(message: message, theme: .error)
                case .serverMessage(let message):
                    MessageView.sharedInstance.showOnView(message: message, theme: .warning)
                }
            })
            .disposed(by: disposeBag)
        
        

        
        listViewModel
            .recipes
            .observeOn(MainScheduler.instance)
            .bind(to: self.recipes)
            .disposed(by: disposeBag)
        print(self.recipes)
    }
    private func setupBindingsTV() {
        
        recipesTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: ListTableViewCell.self))
        listViewModel.recipes.bind(to: recipesTableView.rx.items(cellIdentifier: "ListTableViewCell", cellType: ListTableViewCell.self)) {  (row,Recipe,cell) in
            
            cell.cellTrack = Recipe
            }.disposed(by: disposeBag)

        recipesTableView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in

                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
        
        
        recipesTableView.rx
            .modelSelected(Recipes.self)
            .subscribe(onNext: { (model) in
                print(model)
                
                self.performSegue(withIdentifier: "Detail", sender: model)
            }).disposed(by: disposeBag)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail"{
            if let nextViewController = segue.destination as? RecipeDetailViewController {
               
                nextViewController.recipe = sender as! Recipes
                
            }
            
        }
        
    }
}
    
extension ListViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//                let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//
//                footerView.backgroundColor = UIColor.clear
//
//                return footerView
//            }
//         func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//
//                return 8
//            }
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 140
         }
//
}
