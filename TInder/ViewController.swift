//
//  ViewController.swift
//  TInder
//
//  Created by 澤木柊斗 on 2024/02/10.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var basicCard: UIView!

    var cardOfCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        cardOfCenter = basicCard.center
        // Do any additional setup after loading the view.
    }



    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)

        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
    }
    
}

