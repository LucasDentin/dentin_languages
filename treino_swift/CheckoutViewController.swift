//
//  CheckoutViewController.swift
//  Tag Trainer
//
//  Created by Ruth Ellen on 22/02/21.
//

import UIKit
import FirebaseAnalytics

class CheckoutViewController: UIViewController {

    @IBOutlet weak var lbTotalsFrete: UILabel!
    @IBOutlet weak var lbTotalcFrete: UILabel!
    @IBOutlet weak var swEntrega: UISwitch!
    @IBOutlet weak var scPagamento: UISegmentedControl!
    
    let cart = Cart.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTotalsFrete.text = "Total carrinho: R$\(String(format: "%.02f", somaTotal()))"
        lbTotalcFrete.text = "Total com Frete: R$\(String(format: "%.02f", somaTotal()+5.99))"
    }
    
    func somaTotal() -> Double {
        var total = 0.00
        let carrinho = cart.getCartList()
        let produtos = Array(carrinho.values)
        for i in produtos {
            total += Double(i.getTotalPrice())
        }
        return total
    }
    
    @IBAction func checkout(_ sender: UIButton) {
        var total: String
        var pagamento: String = ""
        if swEntrega.isOn {
            total = String(format: "%.02f", somaTotal())
        } else {
            total = String(format: "%.02f", somaTotal()+5.99)
        }
        switch scPagamento.selectedSegmentIndex {
        case 0:
            pagamento = "Cartão"
        case 1:
            pagamento = "Boleto"
        default:
            break
        }
        showAlert(total, pagamento)
    }
    
    func showAlert(_ total: String, _ pagamento: String) {
        let alert = UIAlertController(title: "Compra finalizada com Sucesso", message: "Total da compra: \(total) / Forma de pagamento: \(pagamento)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.cart.emptyCart()
            self.performSegue(withIdentifier: "products", sender: nil)
        }))
        
        present(alert, animated: true)
    }
    

}

