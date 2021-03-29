//
//  RecipeDetailViewController.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 29/03/2021.
//  Copyright © 2021 Magdy rizk. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var Calories: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var Fats: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var numberOfFev: UILabel!
    @IBOutlet weak var recipeDis: UILabel!
    @IBOutlet weak var Ingredients: UILabel!
    var recipe:Recipes?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(recipe)
        fillData()
        // Do any additional setup after loading the view.
    }
    func fillData()  {
        Calories.text = self.recipe?.calories
        Fats.text = self.recipe?.fats
        recipeDis.text = self.recipe?.description
        
        numberOfFev.text = (String(describing: self.recipe!.favorites))
        self.recipeImg.loadImage(fromURL: self.recipe!.image)
        for i in  self.recipe!.ingredients{
            Ingredients.text?.append(i+"\t")
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
