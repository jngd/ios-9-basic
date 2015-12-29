//
//  ViewController.swift
//  T17E3JuanGarcia
//
//  Created by jgd on 29/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit
import Contacts
import AVFoundation

class ViewController: UIViewController {

  @IBOutlet weak var nombre: UITextField!
  @IBOutlet weak var apellidos: UITextField!
  
  @IBOutlet weak var email: UITextField!
 
  @IBOutlet weak var telefono: UITextField!
  
  @IBOutlet weak var guardar: UIButton!
  
  @IBOutlet weak var recordar: UIButton!
  var sintetizador: AVSpeechSynthesizer = AVSpeechSynthesizer()
  
  func leer(lectura: String){
    sintetizador = AVSpeechSynthesizer()
    var letra: AVSpeechUtterance = AVSpeechUtterance(string: lectura)
    letra.rate = AVSpeechUtteranceDefaultSpeechRate - 10
    letra.voice = AVSpeechSynthesisVoice(language: "es-es")
    sintetizador.speakUtterance(letra)
  }
  
  @IBAction func guardarAction(sender: AnyObject) {
    var contact = CNMutableContact()
    let nombre2 = nombre.text!
    contact.givenName  = nombre2
    contact.familyName = apellidos.text!
    
    let emailCasa = CNLabeledValue(label: CNLabelHome, value: email.text!)
    contact.emailAddresses = [emailCasa]
    let store = CNContactStore()

    contact.phoneNumbers = [CNLabeledValue(
      label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: telefono.text!))]
    let saveRequest = CNSaveRequest()
    saveRequest.addContact(contact, toContainerWithIdentifier: nil)
    do {
      try store.executeSaveRequest(saveRequest)
    } catch _ {
      print("error")
    }
    leer("Se ha guardado un contacto con nombre:" + nombre.text!)
  }
  
  @IBAction func recordarAction(sender: AnyObject) {
    let store = CNContactStore()
    
    let namePredicate : NSPredicate! = CNContact.predicateForContactsMatchingName(nombre.text!)
    
    let toFetch = [CNContactGivenNameKey]
    do {
      let contacts = try store.unifiedContactsMatchingPredicate(
        namePredicate, keysToFetch: toFetch)
      
      for contact in contacts {
        print(contact.givenName)
        leer("Se ha encontrado un contacto con el nombre:" + contact.givenName)
      }
    } catch _ {
      print("error")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Looks for single or multiple taps.
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    view.addGestureRecognizer(tap)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  func dismissKeyboard() {
    view.endEditing(true)
  }
}

