//
//  Task.swift
//  taskapp
//
//  Created by Mika on 2019/07/01.
//  Copyright © 2019 daichi987. All rights reserved.
//

import RealmSwift

class Task: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // タイトル
    @objc dynamic var title = ""
    
    // 内容
    @objc dynamic var contents = ""
    
    /// 日時
    @objc dynamic var date = Date()
    
    @objc dynamic var category_id: Category?
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Category: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let tasks = List<Task>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
