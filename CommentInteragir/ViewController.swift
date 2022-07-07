//
//  ViewController.swift
//  CommentInteragir
//
//  Created by kenter on 07/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dareBtn: UIButton!
    @IBOutlet weak var viewMiddle: UIView!
    @IBOutlet var colorsBtn: [UIButton]!
    
    var backgroundColor: UIColor = .systemBackground
    var centerView: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerView = viewMiddle.center
        // Do any additional setup after loading the view.
        updateBg()
        viewMiddle.isUserInteractionEnabled = true
        let gesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(roundView))
        viewMiddle.addGestureRecognizer(gesture)
    }
    
    // On la met dans cette fonction parce qu'on va la réutiliser à chaque fois
    func isView(_ touches: Set<UITouch>) -> Bool {
        // Est ce que l'on en a eu au moin une (touche)
        guard let touch = touches.first else { return false }
        // Est ce qu'on a une vue sur laquelle on a touché
        guard let view = touch.view else { return false }
        // Est ce que cette vue en question est "viewMiddle"
        guard view == viewMiddle else { return false }
        
        return true
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else { return }
        print("C'est parti")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else { return }
        // on re-centre par rapport à la position de notre doigt
        let newCenter = touches.first!.location(in: self.view)
        viewMiddle.center = newCenter
        print("la je bouge")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isView(touches) else { return }
        viewMiddle.center = centerView
        print("la je lache")
    }
    
    func updateBg() {
//        view.backgroundColor = backgroundColor
        UIView.animate(withDuration: 1) {
            self.view.backgroundColor = self.backgroundColor
        }
    }
    
    @objc func roundView() {
        print("tapped")
        let corner = viewMiddle.layer.cornerRadius
        let newValue: CGFloat = corner == 0 ? 25: 0
        viewMiddle.layer.cornerRadius = newValue
    }
    
    @IBAction func dareBtnPressed(_ sender: UIButton) {
        print("On a appuyer sur le bouton")
        backgroundColor =
        (backgroundColor == .systemBackground)
        ? .systemMint
        : .systemBackground
        updateBg()
    }
    
    @IBAction func colorBtnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0: viewMiddle.backgroundColor = .systemGreen
        case 1: viewMiddle.backgroundColor = .systemPurple
        case 2: viewMiddle.backgroundColor = .systemIndigo
        default:break
        }
    }
}

