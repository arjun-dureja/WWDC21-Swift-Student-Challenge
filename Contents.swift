import UIKit
import PlaygroundSupport

//Create view with navigation controller
let viewRect = CGRect(x: 0, y: 0, width: 770, height: 540)
let vc = HomeViewController()
let nc = UINavigationController(rootViewController: vc)
nc.navigationBar.isHidden = true
nc.view.frame = viewRect
PlaygroundPage.current.liveView = nc.view
