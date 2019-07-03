//
//  InputCategoryViewController.swift
//  taskapp
//
//  Created by Mika on 2019/07/01.
//  Copyright © 2019 daichi987. All rights reserved.
//

import UIKit
import RealmSwift

class InputCategoryViewController: UIViewController {

    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var addCategoryBtn: UIButton!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        addCategoryBtn.isEnabled = false
    }
    
    @IBAction func addCategory(_ sender: Any) {
        let category = Category()
        
        let allCategories = realm.objects(Category.self)
        if allCategories.count != 0 {
            category.id = allCategories.max(ofProperty: "id")! + 1
        }

        try! realm.write {
        category.name = self.categoryTextField.text!
        self.realm.add(category, update: true)
        }
        
        showAlert(category.name)
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
        addCategoryBtn.isEnabled = !(categoryTextField.text?.isEmpty ?? true)
    }
    
    func showAlert(_ categoryName:String) {
        
        // アラートを作成
        let alert = UIAlertController(
            title: "以下カテゴリーを追加しました",
            message: categoryName,
            preferredStyle: .alert)
        
        // アラートにボタンをつける
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        // アラート表示
        self.present(alert, animated: true, completion: nil)
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
