//
//  HomeViewController.swift
//  Roll The Dice
//
//  Created by furkan on 17.02.2024.
//

import UIKit
import AudioToolbox

class HomeViewController: UIViewController {

    
    @IBOutlet weak var DiceİmageViewOne: UIImageView!
    @IBOutlet weak var DiceİmageViewTwo: UIImageView!
    @IBOutlet weak var ButtonView: UIButton!
    
   
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        View()
        
    }
    
    //MARK: - Functions
    func View(){
        ButtonView.layer.cornerRadius = 10.0
    }
    func randomSayi() {
            //Birinci yöntemimiz için bir sayı dizisi oluşturuyoruz ve içine zar numaralarını giriyoruz.
            let sayilar = [1,2,3,4,5,6]
            //.randomElement() komutu ile dizimizden rastgele bir sayı seçip sayi1 değişkenine aktarıyoruz.//Ayrıca burada dizinin tipi olmadığı için
            //gelen değişkeni "!" kullanarak kesin integer değer olduğunu belirtiyoruz.
            var sayi1 : Int = sayilar.randomElement()!
            
            //İkinci Yöntem ise "arc4random_uniform" fonksiyonu
            //Bu fonksiyon ile 0'dan fonksiyonun içine gönderilen değer arasından bir değer seçilir. Biz sıfır gelmemesini istediğimiz için
            // +1 ile bu durumun önüne geçiyoruz.
            var sayi2 = arc4random_uniform(UInt32(6))+1
            
            //Görselleri seçmek
            DiceİmageViewOne.image = UIImage(named: "Dice\(sayi1)")
            DiceİmageViewTwo.image = UIImage(named: "Dice\(sayi2)")
        }
  
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
           AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
           randomSayi()
       }
}
