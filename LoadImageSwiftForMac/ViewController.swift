//
//  ViewController.swift
//  LoadImageSwiftForMac
//
//  Created by Marco Dalprato on 08/10/2018.
//  Copyright © 2018 Marco Dalprato. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var imagePath: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func loadImage(_ sender: Any) {
        
        // Create the dialog
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .jpg file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["jpg"]; // supported files (for multiple use ', "png"')
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file
            
            if (result != nil) {
                let path = result!.path
                
                imagePath.stringValue = path // set the text of the imageParth textbox
                
                if let image = NSImage(byReferencingFile: path){
                    imageView?.image = image // load the image
                }
                
            }
        } else {
            // User clicked on "Cancel"
            return
        }
        
    }
}

