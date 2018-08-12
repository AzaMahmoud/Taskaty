//
//  ChatVC.swift
//  Taskatyy
//
//  Created by zoza on 24/07/2018.
//  Copyright © 2018 zoza. All rights reserved.
//

import UIKit

class ChatVC: UIViewController , UITextViewDelegate{
    
    @IBOutlet weak var sendbutonOutlet: UIButton!
    var chatResult = [GChatResult]()
    var chatResultemp = [String]()
    var text: String = ""

    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        sendbutonOutlet.isEnabled = false
        sendbutonOutlet.isUserInteractionEnabled = false
        message.text = "اكتب الرساله"
        message.textColor = UIColor.lightGray
        message!.layer.borderWidth = 1
        message!.layer.borderColor = UIColor.lightGray.cgColor
        message.layer.cornerRadius = 5
        message.clipsToBounds = true

        startLoading()
        API.loadChat(itemId: "10723", completion: { (error:Error?,success:Bool,data:AnyObject?) in
            DispatchQueue.main.async
                {
                    if success {
                        let r = chatting(fromDictionary: data as! [String : Any])
                        self.chatResult = r.gChatResult
                        self.chatResult.forEach({ (chat) in
                            if chat.chatMessage != ""{
                            self.chatResultemp.append(chat.chatMessage ?? "")
                            }
                        })
                        self.stopLoading()
                        self.tableView.reloadData()
                        print("chat")
                    }
                    else {
                        print("ERROR")
                        return
                        
                    }
            }
        })
    }

    
    
    @IBAction func sendAction(_ sender: Any) {
        if message.text != "" {
            startLoading()
            API.chaPost(itemId: "\(ShowResultVC.text_Band_No)" , userId: UserStore.loadUser()?.id ?? 0, message: message.text ?? "", username: "yah", completion: { (error:Error?,success:Bool,data:AnyObject?) in
                DispatchQueue.main.async
                    {
                        self.stopLoading()
                        if success {
                            self.chatResultemp.append(self.message.text ?? "")
                            let index = IndexPath(row: self.chatResultemp.count - 1, section: 0)
                            self.tableView.insertRows(at: [index], with: .automatic)
                            
                            self.message.text = ""
                            self.sendbutonOutlet.isEnabled = false
                            self.sendbutonOutlet.isUserInteractionEnabled = false
                            if self.message.text.isEmpty {
                                self.message.text = "اكتب الرساله"
                                self.message.textColor = UIColor.lightGray
                            }
                            
                            
                            print("chat")
                        }
                        else {
                            print("ERROR")
                            return
                            
                        }
                }
            })
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count == 0 {
            self.sendbutonOutlet.isEnabled = false
            self.sendbutonOutlet.isUserInteractionEnabled = false
        }else{
            self.sendbutonOutlet.isEnabled = true
            self.sendbutonOutlet.isUserInteractionEnabled = true

        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        text = textView.text ?? ""
        if text != "" {
            startLoading()
            API.chaPost(itemId: "10723", userId: 0, message: textView.text ?? "", username: "yah", completion: { (error:Error?,success:Bool,data:AnyObject?) in
                DispatchQueue.main.async
                    {
                        self.stopLoading()
                        if success {
                            self.chatResultemp.append(textView.text ?? "")
                            let index = IndexPath(row: self.chatResultemp.count - 1, section: 0)
                            self.tableView.insertRows(at: [index], with: .automatic)
                            
                            self.message.text = ""
                            self.sendbutonOutlet.isEnabled = false
                            self.sendbutonOutlet.isUserInteractionEnabled = false
                            if self.message.text.isEmpty {
                                self.message.text = "اكتب الرساله"
                                self.message.textColor = UIColor.lightGray
                            }

                            
                            print("chat")
                        }
                        else {
                            print("ERROR")
                            return
                            
                        }
                }
            })
            

        }
    }
    
        
    
    
    
}

extension ChatVC: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatResultemp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ResverCell") as! ResverCell
            cell.messageReciver.text = chatResultemp[indexPath.row]
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderCell") as! SenderCell
            cell.messageSender.text = chatResultemp[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
