
//
//  ViewController.swift
//  URLSession
//
//  Created by Aceleradora Mobile Perú on 2/07/18.
//  Copyright © 2018 Aceleradora Mobile Perú. All rights reserved.
//
import UIKit
import FavoriteTableView

class ViewController: UIViewController, FavoriteTableViewDelegate {

    @IBOutlet weak var botn: UIButton!
    
    @IBOutlet weak var URLfavoritos: FavoriteTableView!
    
    var listFavoritos2 = [String] ()
    var numerosDeCuenta2 = [String] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.URLfavoritos.delegateFavorite = self
        urlSession()
//        self.URLfavoritos.configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func urlSession(){
        guard let  url = URL( string : "http://192.168.1.63:2081/bancamovil-fakes-1/rest/favoriteService/favoritespasantia/1/1891") else { return }
        let session = URLSession.shared
        let decoder = JSONDecoder()
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let gitdata = try decoder.decode(favoritosentity.self, from : data)
                    gitdata.interbankTransferFavoriteList.forEach({ (lista) in
                        print("ALIAS",lista.alias)
                        self.listFavoritos2.append(lista.alias)
                        print("LISTA FAVORITOS ", self.listFavoritos2[0])
                        print("NUMERO DE CUENTA",lista.interbankTransfer.interbankAccount.number)
                        self.numerosDeCuenta2.append(lista.interbankTransfer.interbankAccount.number)
                        print("LISTA FAVORITOS ", self.numerosDeCuenta2[0])
                    })
                }catch{
                    print(error)
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                let favoriteTableView = FavoriteTableView.init(frame: self.view.bounds, style: UITableViewStyle.plain )
                self.URLfavoritos.configure(listTitles: self.listFavoritos2, listSubTitles: self.numerosDeCuenta2, heightCell: 50.0, bounces: false)
//                self.URLfavoritos.addSubview(favoriteTableView)
            }
        }.resume()
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        print(indexPath.row)
    }
}

