////
////  File.swift
////  TestBrightskies
////
////  Created by Magdy rizk on 3/25/21.
////  Copyright © 2021 Magdy rizk. All rights reserved.
////
//
//import Foundation
//import UIKit
//extension ListViewController : UITableViewDataSource,UITableViewDelegate  {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//           return 4
//       }
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return 1
//       }
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier:"ListTableViewCell", for: indexPath) as! UITableViewCell
//           return cell
//       }
//       func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//              let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//
//              footerView.backgroundColor = UIColor.clear
//
//              return footerView
//          }
//       func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//
//              return 8
//          }
//       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//           return 120
//       }
//}
