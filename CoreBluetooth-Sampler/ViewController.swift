//
//  ViewController.swift
//  CoreBluetooth-Sampler
//
//  Created by ShinokiRyosei on 2016/07/26.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectStartScan() {
        
    }
    
    func startScan() {
        if !self.centralManager.isScanning {
            centralManager.scanForPeripheralsWithServices(nil, options: nil)
        }
    }
    
    func connectPeripheral() {
        self.centralManager.connectPeripheral(peripheral, options: nil)
    }
    
    func stopScan() {
        if self.centralManager.isScanning {
            self.centralManager.stopScan()
        }
    }
    //: MARK: Delegate
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        print("connected!")
    }
    
    func centralManager(central: CBCentralManager, didFailToConnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        print("failed")
    }
    
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        print("peripherial: \(peripheral)")
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager) {
        print("state: \(central.state)")
    }
}

