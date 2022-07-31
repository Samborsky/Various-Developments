//
//  ViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 06.07.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - аутлеты и переменные
    
    private var contactsArray: [ContactProtocol] = [] {
        //вызываем обсервер(наблюдатель) который сортирует массив при обращении к нему
        didSet {
            contactsArray.sort { contactOne, contactTwo in
                contactOne.name < contactTwo.name
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - жизненные циклы
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadContact()
    }
    
    //MARK: - наполняем массив контактов
    private func loadContact() {
        contactsArray.append(Contact(name: "valera", phone: "+756546465"))
        contactsArray.append(Contact(name: "ira", phone: "=84234234"))
        contactsArray.append(Contact(name: "max", phone: "223423423"))
        contactsArray.append(Contact(name: "boris", phone: "fdsf24234234"))
    }
    
    //MARK: - добавление нового контакта
    
    @IBAction func addContactButton(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "Добавить", message: "Введите данные", preferredStyle: .alert)
        
        //добавление текстфилдов
        alertVC.addTextField { text in
            text.placeholder = "Iron Mike"
        }
        alertVC.addTextField { text in
            text.placeholder = "+754653158783"
            text.keyboardType = .numbersAndPunctuation
        }
//кнопка отмены
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //присваиваем константе текстовое поле с именем и избавляем от опционала
        guard let contactName = alertVC.textFields?[0],
              let phoneNumber = alertVC.textFields?[1] else {return}
        
        //кнопка ок
        let actionOK = UIAlertAction(title: "OK", style: .default) { _ in
            
//делаем проверку нет ли совпадений нового имени с уже существующими контактами
            if self.contactsArray.contains(where: { name in
                name.name == contactName.text
            }) {
                let alertVCTwo = UIAlertController(title: "Ошибка!",
                                                   message: "Контакт с таким именем уже существует, попробуйте другое имя",
                                                   preferredStyle: .alert)
                
                //после нажатия ОК снова вызываем прошлое окно для ввода данных
                let action = UIAlertAction(title: "OK", style: .default) { _ in
                    //после ошибки поле становится красным, но через 2 секунды снова белым
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        contactName.backgroundColor = .white
                    }
                    contactName.backgroundColor = .red
                    self.present(alertVC, animated: true, completion: nil)
                }
                
                alertVCTwo.addAction(action)
                
                self.present(alertVCTwo, animated: true, completion: nil)
                
            } else {
                //добавляем в массив новый контакт
                self.contactsArray.append(Contact(name: contactName.text ?? "", phone: phoneNumber.text ?? ""))
                //перезагружаем таблицу
                self.tableView.reloadData()
            }
        }
        
        alertVC.addAction(actionCancel)
        alertVC.addAction(actionOK)
        
        present(alertVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
//MARK: - расширение ViewController UITableViewDelegate

//подписываем на делегат таблицы
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section \(indexPath.row) is pressed")
    }
    
    //при правом свайпе удаляем контакт
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
print("swipe right")
        
//MARK: - создаем меню с действием при свайпе  - кнопка удалить и изменить
        
//кнопка удалить
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            self.contactsArray.remove(at: indexPath.row)
                tableView.reloadData()
        }
        
//кнопка изменить
        let renameAction = UIContextualAction(style: .normal, title: "rename") { _, _, _ in
            let alertcVc = UIAlertController(title: "Изменить", message: nil, preferredStyle: .alert)
            
            
            //присваиваем константе текстовое поле с именем и избавляем от опционала
       
            alertcVc.addTextField { textField in
                textField.placeholder = "Введите новое имя"
                
                
            }
            alertcVc.addTextField { textField in
                textField.placeholder = "Введите новый номер"
                textField.keyboardType = .numbersAndPunctuation
                
            }
            
            let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            //при нажатии на кнопку ОК будут присвоены новые данные, если они введены
            let actionОК = UIAlertAction(title: "ОК", style: .default) { _ in
               
                //делаем проверку нет ли совпадений нового имени с уже существующими контактами
                            if self.contactsArray.contains(where: { name in
                                name.name == alertcVc.textFields![0].text ?? ""
                            }) {
                                let alertVCTwo = UIAlertController(title: "Ошибка!",
                                                                   message: "Контакт с таким именем уже существует, попробуйте другое имя",
                                                                   preferredStyle: .alert)
                                
                                //после нажатия ОК снова вызываем прошлое окно для ввода данных
                                let action = UIAlertAction(title: "OK", style: .default) { _ in
                                    //после ошибки поле становится красным, но через 2 секунды снова белым
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        alertcVc.textFields![0].backgroundColor = .white
                                    }
                                    alertcVc.textFields![0].backgroundColor = .red
                                    self.present(alertcVc, animated: true, completion: nil)
                                }
                                
                                alertVCTwo.addAction(action)
                                
                                self.present(alertVCTwo, animated: true, completion: nil)
                                
                            } else {
                                //проверка, если поля пустые, ничего не меняем, если заполнено одно поле, меняем только его, если оба, то меняем оба

                                if alertcVc.textFields![0].text!.isEmpty && alertcVc.textFields![1].text!.isEmpty {
                                    self.contactsArray[indexPath.row].name = self.contactsArray[indexPath.row].name
                                    self.contactsArray[indexPath.row].phone = self.contactsArray[indexPath.row].phone
                                    
                                } else if alertcVc.textFields![0].text!.isEmpty {
                                    self.contactsArray[indexPath.row].phone = alertcVc.textFields![1].text ?? ""
                                    
                                } else if alertcVc.textFields![1].text!.isEmpty{
                                    self.contactsArray[indexPath.row].name = alertcVc.textFields![0].text ?? ""
                                    
                                } else {
                                    self.contactsArray[indexPath.row].name = alertcVc.textFields![0].text ?? ""
                                    self.contactsArray[indexPath.row].phone = alertcVc.textFields![1].text ?? ""
                                }
                //перезагружаем данные в таблице
                                tableView.reloadData()
                            }
                            }

            //добавляем кнопки на алерт
            alertcVc.addAction(actionCancel)
            alertcVc.addAction(actionОК)
            
            self.present(alertcVc, animated: true, completion: nil)
            //перезагружаем еще раз скрывая меню свайпа
            tableView.reloadData()
        }
        
        //создаем массив действий при свайпе
        let actions = UISwipeActionsConfiguration(actions: [deleteAction, renameAction])

        return actions
    }
    
}
//MARK: - расширение ViewController: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //создаем переменную типа ячейки таблицы
        var cell: UITableViewCell
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: "OldCell") {
            print("use old cell \(indexPath.row)")
            cell = oldCell
        } else {
            print("use new cell \(indexPath.row)")

            cell = UITableViewCell(style: .default, reuseIdentifier: "OldCell")
        }
        //вызываем метод, который конфигурирует вид ячейки
        configure(cell: &cell, for: indexPath)
        return cell

    }
    
    
}

extension ViewController {
    //MARK: - настраиваем отображение ячейки
    
    private func configure (cell: inout UITableViewCell, for indexPath : IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "\(contactsArray[indexPath.row].name)"
        configuration.secondaryText = "\(contactsArray[indexPath.row].phone)"
        cell.contentConfiguration = configuration
        
    }
}

