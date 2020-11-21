//
//  SecondViewController.swift
//  GCDlesson
//
//  Created by Анастасия Улитина on 21.11.2020.
//

import UIKit

class SecondViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        delay(3) {
            self.loginAlert()
        }
        // Do any additional setup after loading the view.
    }
    
    fileprivate func delay(_ delay: Int, closure: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    //MARK: - Login Alert method
    
    fileprivate func loginAlert() {
        let ac = UIAlertController(title: "Зарегистрироаны?", message: "Введите логин и пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (userLoginTF) in
            userLoginTF.placeholder = "Login"
        }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Password"
            userPasswordTF.isSecureTextEntry = true
        }
        
        self.present(ac, animated: true, completion: nil)
    }
    
    //MARK: - Fetch image method
    
    fileprivate func fetchImage() {
        activityIndicator.startAnimating()
        imageURL = URL(string: "https://i.pinimg.com/564x/31/7e/fa/317efa7c26404b7f2c316e68081776f3.jpg")
        DispatchQueue.main.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            self.image = UIImage(data: imageData)
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
