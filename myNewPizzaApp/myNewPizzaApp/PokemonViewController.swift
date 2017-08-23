//
//  PokemonViewController.swift
//  myNewPizzaApp
//
//  Created by Anthony Rodriguez on 8/22/17.
//  Copyright © 2017 Anthony Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class PokemonViewController: UIViewController
{
    
    @IBOutlet weak var pokeIDLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokeType1Label: UILabel!
    @IBOutlet weak var pokeType2Label: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var basXPLabel: UILabel!
    @IBOutlet weak var ability1Label: UILabel!
    @IBOutlet weak var ability2Label: UILabel!
    @IBOutlet weak var ability3Label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    lazy var viewModel:ViewModel = ViewModel(delegate: self)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
        self.pokeIDLabel.text = ""
        self.pokemonNameLabel.text = ""
        self.pokeType1Label.text = ""
        self.pokeType2Label.text = ""
        self.heightLabel.text = ""
        self.weightLabel.text = ""
        self.basXPLabel.text = ""
        self.ability1Label.text = ""
        self.ability2Label.text = ""
        self.ability3Label.text = ""
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonPressed(_ sender:AnyObject)
    {
        guard let text = textField.text else {return}
        guard let id = Int(text) else {return}
        viewModel.getPokemon(id: id)
    }
}

extension PokemonViewController:UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension PokemonViewController:VMDelegate
{
    func updateLabels(pokemon:Pokemon?)
    {
        guard pokemon != nil else {return}
        self.pokemonNameLabel.text = pokemon?.name
        self.pokeIDLabel.text = "\(pokemon?.id ?? 0)"
        self.basXPLabel.text = "\(pokemon?.baseXP ?? 0)"
        self.heightLabel.text = "\(pokemon?.height ?? 0)"
        self.weightLabel.text = "\(pokemon?.weight ?? 0)"
        self.pokeType1Label.text = pokemon?.types[0]
        if pokemon!.types.count > 1
        {
            self.pokeType2Label.text = pokemon!.types[1]
        }
        else
        {
            self.pokeType2Label.text = ""
        }
        self.ability1Label.text = pokemon?.abilities[0]
        if pokemon!.abilities.count > 2
        {
            self.ability2Label.text = pokemon?.abilities[1]
            self.ability3Label.text = pokemon?.abilities[2]
        }
        else if pokemon?.abilities.count == 2
        {
            self.ability2Label.text = pokemon?.abilities[1]
        }
    }
}
