//
//  ViewController.swift
//  TInder
//
//  Created by 澤木柊斗 on 2024/02/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var likeImageView: UIImageView!

    @IBOutlet weak var badImageView: UIImageView!
    @IBOutlet weak var basicCard: UIView!


    @IBOutlet weak var person1: UIView!
    @IBOutlet weak var person2: UIView!
    @IBOutlet weak var person3: UIView!
    @IBOutlet weak var person4: UIView!

    @IBAction func didGoodBtnTapped(_ sender: UIButton) {
            self.resetCard()
            UIView.animate(withDuration: 0.2) {
                self.people[self.selectedCordCount].center = CGPoint(
                    x: self.people[self.selectedCordCount].center.x - 550,
                    y: self.self.people[self.selectedCordCount].center.y
                )
                self.likeImageView.alpha = 0
                self.badImageView.alpha = 0
            }

            self.selectedCordCount += 1
            if self.selectedCordCount >= people.count{
               print(likedName)
                performSegue(withIdentifier: "PushList", sender: self)
            }
        }


    @IBAction func didBadBtnTapped(_ sender: UIButton) {
        self.resetCard()
        UIView.animate(withDuration: 0.2) {
            self.people[self.selectedCordCount].center = CGPoint(
                x: self.people[self.selectedCordCount].center.x + 550,
                y: self.people[self.selectedCordCount].center.y
            )
            self.likeImageView.alpha = 0
            self.badImageView.alpha = 0
        }
        likedName.append(name[self.selectedCordCount])
        self.selectedCordCount += 1
        if self.selectedCordCount >= people.count {
            print(likedName)
            performSegue(withIdentifier: "PushList", sender: self)
        }
    }
    
    var cardOfCenter: CGPoint!
    var people = [UIView]()
    var selectedCordCount: Int = 0
    var likedName = [String]()
    var name: [String] = ["ほのか", "あかね", "みほ", "カルロス"]

    override func viewDidLoad() {
        super.viewDidLoad()
        people.append(person1)
        people.append(person2)
        people.append(person3)
        people.append(person4)
        cardOfCenter = basicCard.center
        // Do any additional setup after loading the view.
    }
    func resetCard() {
        basicCard.center = self.cardOfCenter
        basicCard.transform = .identity

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PushList" {
            let vc = segue.destination as! ListViewController
            vc.likedName = likedName
        }
    }

    @IBAction func swipeCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)

        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
        people[self.selectedCordCount].center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)

        let xFromCenter = card.center.x - view.center.x

        if xFromCenter > 0 {
            likeImageView.alpha = 1
            likeImageView.tintColor = UIColor.blue
        } else if xFromCenter < 0 {
            badImageView.alpha = 1
            badImageView.tintColor = UIColor.red
        }


        card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)
        people[selectedCordCount].transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2) * -0.785)



        if sender.state == UIGestureRecognizer.State.ended {

            if card.center.x < 75 {
                self.resetCard()
                UIView.animate(withDuration: 0.2) {
                    self.people[self.selectedCordCount].center = CGPoint(
                        x: self.people[self.selectedCordCount].center.x - 250,
                        y: self.self.people[self.selectedCordCount].center.y
                    )
                    self.likeImageView.alpha = 0
                    self.badImageView.alpha = 0
                }
                
                self.selectedCordCount += 1
                if self.selectedCordCount >= people.count{
                   print(likedName)
                    performSegue(withIdentifier: "PushList", sender: self)
                }

                return

            } else if card.center.x > self.view.frame.width - 75 {
                self.resetCard()
                UIView.animate(withDuration: 0.2) {
                    self.people[self.selectedCordCount].center = CGPoint(
                        x: self.people[self.selectedCordCount].center.x + 250,
                        y: self.people[self.selectedCordCount].center.y
                    )
                    self.likeImageView.alpha = 0
                    self.badImageView.alpha = 0
                }
                likedName.append(name[self.selectedCordCount])
                self.selectedCordCount += 1
                if self.selectedCordCount >= people.count {
                    print(likedName)
                    performSegue(withIdentifier: "PushList", sender: self)
                }

                return
            }
            self.resetCard()
            UIView.animate(withDuration: 0.2) {
                self.people[self.selectedCordCount].center = self.cardOfCenter
                self.people[self.selectedCordCount].transform = .identity
            }

        }
        self.likeImageView.alpha = 0
        self.badImageView.alpha = 0
    }
}

