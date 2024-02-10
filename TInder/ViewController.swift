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

        let xFromCenter = card.center.x - view.center.x
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: card.center.x - 250, y: card.center.y)
                    return
                }
            } else if card.center.x > self.view.frame.width - 75 {
                UIView.animate(withDuration: 0.2) {
                    card.center = CGPoint(x: card.center.x + 250, y: card.center.y)

                }
                return
            }

            UIView.animate(withDuration: 0.2) {
                card.center = self.cardOfCenter
                card.transform = .identity
            }
        }
    }
}

