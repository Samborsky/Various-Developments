//
//  ProfileViewController.swift
//  theSwiftDeveloperHomework
//
//  Created by Samborsky on 18.07.2022.
//

import UIKit
@IBDesignable
class ProfileViewController: UIViewController {

//MARK: - аутлеты

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var ageTextField: UITextField!

    @IBOutlet weak var sexTextField: UITextField!

    @IBOutlet weak var avatarImageView: UIImageView!

    @IBOutlet weak var instagramTextField: UITextField!

    //MARK: - переменные/константы

    let imagePicker = UIImagePickerController()

    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let sexPicker = UIPickerView()

    let toolBar = UIToolbar()

    let sexTypeArray = ["male", "female"]
    let ageArray = Array(1...90)

    //MARK: - методы жизненного цикла

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self

//рисуем линую под текстфилдом
        line(textField: nameTextField)
        line(textField: ageTextField)
        line(textField: sexTextField)
        line(textField: dateTextField)
        line(textField: instagramTextField)

//делегаты и дата соурс пикеров
        agePicker.delegate = self
        agePicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.dataSource = self

//присваем значения пикера, текстфилду
        universalPicker(textField: ageTextField)
        universalPicker(textField: sexTextField)
        universalPicker(textField: dateTextField)

//присваиваем индекс каждому пикеру
        agePicker.tag = 1
        sexPicker.tag = 2

//        dateTextField.text = datePicker.te
    }

    //MARK: - передаем информацию на другой ViewController

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
//делаем передаем информацию на другой View
        let contacts = UIStoryboard(name: "Main", bundle: nil)
                guard let nextVC = contacts.instantiateViewController(withIdentifier: "BirthdayViewController") as? BirthdayViewController else { return }
                nextVC.name = nameTextField.text ?? ""
                nextVC.newDateLabel = "Родился \(dateTextField.text ?? "")"
                nextVC.photo = avatarImageView.image
                nextVC.age = "Возраст: \(ageTextField.text ?? "")"
                nextVC.modalPresentationStyle = .fullScreen
                nextVC.newDaysForBirthdayLabel = "\(daysToBirthday(birthday: datePicker.date)) дней"
        show(nextVC, sender: nil)

    }

    //MARK: - экшены
//добавляем фото из галереи
    @IBAction func changePhotoButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        picker.allowsEditing = false
    }
//вызываем алерт при нажатии на текстфилд
    @IBAction func instagramTextFieldAction(_ sender: Any) {
        let alertVC = UIAlertController(title: "Введите имя пользователя", message: nil, preferredStyle: .alert)

        alertVC.addTextField { textTextField in
            textTextField.placeholder = "@avenger15"
        }
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.instagramTextField.text = alertVC.textFields?.first?.text
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)

        alertVC.addAction(action)
        alertVC.addAction(actionCancel)
        present(alertVC, animated: true)
    }

//считаем дни до следующего дня рождения
    func daysToBirthday(birthday: Date) -> String {

        //получаем текущий календарь пользователя(григорианский)
        let cal = Calendar.current

        let today = cal.startOfDay(for: Date())
        let date = cal.startOfDay(for: birthday)

        let components = cal.dateComponents([.day, .month], from: date)
// Вычисляет следующую дату, которая соответствует (или наиболее точно соответствует) заданному набору компонентов.
        let nextDate = cal.nextDate(after: today, matching: components, matchingPolicy: .nextTimePreservingSmallerComponents)

        return String(cal.dateComponents([.day], from: today, to: nextDate ?? today).day ?? 0)
    }
}

//MARK: - расширения

extension ProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
//количество компонентов пикера в зависимости от его идентификатора(tag)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return ageArray.count
        case 2: return sexTypeArray.count
        default: return 1
        }
    }

//выводимая информация в пикер в зависимости от его идентификатора(tag)
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(ageArray[row])"
        case 2:
            return "\(sexTypeArray[row])"
        default: return ""
        }
    }

//какую строку пикера выбрал пользователь
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = String(ageArray[row])
        case 2:
            sexTextField.text = sexTypeArray[row]
        default:  break
        }
    }

///передаем в текстфилд значение пикера
    func universalPicker(textField: UITextField) {

//при нажатии на текстфилд, будет появляться пикер( по умолчанию всплывает клавиатура)
        ageTextField.inputView = agePicker
        sexTextField.inputView = sexPicker
        dateTextField.inputView = datePicker

//стиль пикера
        datePicker.preferredDatePickerStyle = .wheels
//что будет отображаться на пикере
        datePicker.datePickerMode = .date


//создаем кнопку Done
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonSelector))

//настраиваем UIToolbar
        toolBar.barStyle = .default
        toolBar.tintColor = .systemBlue
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: true)

//добавляем дополнительный элемент над вызванным элементом(клавиатура, вью)
        textField.inputAccessoryView = toolBar
    }

    @objc func doneButtonSelector() {
//делаем кнопку Done рабочей
        ageTextField.resignFirstResponder()
        sexTextField.resignFirstResponder()

//преобразует отображаемую дату на выходе
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "ru_RU")
        self.dateTextField.text = dateFormatter.string(from: datePicker.date)
//MARK: - вычисляем возвраст автоматически исходя из года рождения

//вытягиваем дату из пикера
        let dateOfBirth = self.datePicker.date
//получаем текущий календарь пользователя(григорианский)
        let calendar = Calendar.current
//достаем нужные компоненты указывая их в массиве и указываем ОТ КУДА брать информацию и ДО КУДА
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
//вытягиваем нужный компонент и получаем результат в Int?
        let age = ageComponents.year ?? 0

        self.ageTextField.text = String(age)
        dateTextField.resignFirstResponder()
    }

}

//расширение для работы с галереей
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            avatarImageView.image = chosenImage
        }
        dismiss(animated: true)
    }
}
