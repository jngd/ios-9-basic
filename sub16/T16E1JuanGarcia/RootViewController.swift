//
//  RootViewController.swift
//  T16E1JuanGarcia
//
//  Created by jgd on 28/12/15.
//  Copyright © 2015 jgd. All rights reserved.
//

import UIKit

var songs: NSMutableArray = []
var song: Song = Song(title: "")
var currentStringValue: NSMutableString? = NSMutableString()

class RootViewController: UITableViewController, NSURLConnectionDelegate, NSXMLParserDelegate {

    var xmlData: NSMutableData? = nil
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCellWithIdentifier("celda")
        var elem = songs[indexPath.row] as! Song
        cell!.textLabel!.text = (elem.title) as! String
  
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if (!userDefaults.boolForKey("FirstExecution")) {
            userDefaults.setBool(true, forKey: "FirstExecution")
            print("FirstExecution")
            let url = NSURL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml")
            var request = NSURLRequest (URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 30)
            self.xmlData = NSMutableData()
            NSURLConnection(request: request, delegate: self)
        } else {
            print("Not FirstExecution")
            self.xmlData = nil
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        print("Error getting URL")
        self.xmlData = nil
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        
        self.xmlData!.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        var xmlCheck = NSString(data: self.xmlData!, encoding: NSUTF8StringEncoding)
        print("XML received is \(xmlCheck)")
        
        var parser:NSXMLParser = NSXMLParser(data: self.xmlData!)
        parser.delegate = self
        parser.shouldResolveExternalEntities = true
        parser.parse()
        for (var i = 0; i < songs.count; i++) {
            var elem = songs[i] as! Song
            print(elem.title)
        }
        
        self.tableView.reloadData()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        switch elementName {
            case "feed":
                songs = NSMutableArray()
            return
            case "entry":
                song = Song(title: "")
                
            return
            case "title":
                currentStringValue = NSMutableString(capacity: 50)
        default:
            print("DIDSTARTELEMENT: Error parsing XML. ElementName not expected" + elementName)
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if (currentStringValue != nil) {
           currentStringValue = NSMutableString(capacity: 50)
        }
        currentStringValue?.appendString(string)
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case "entry":
            songs.addObject(song)
        case "title":
            song.title = currentStringValue! as String
        default:
            print("DIDENDELEMENT: Error parsing XML. ElementName not expected" + elementName)
        }
    }
    
}
