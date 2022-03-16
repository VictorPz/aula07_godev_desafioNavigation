//
//  ViewController.swift
//  NavigationTableView
//
//  Created by Sandra Monteiro de Castro on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var receitas: [Receita] = []
    
    //MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        delegates()
        register()
        
        title = "Receitas!!!"
    }
    
    //MARK: -Delegates
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() {
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    func initData() {
        receitas.append(Receita(image: "pave",name: "Pavê de chocolate", preparationTime: 40, ingredients: "1/2 Pacote de bolacha. 1/2 copo de leite. 1 colher(sobremesa) de chocolate em pó. 1 Lata de leite condensado. 2 Gemas. 1 Caixa de leite de vaca", preparationSteps: "Em uma tigela, misture o leite e o chocolate em pó até que esteja completamente dissolvido. Molhe as bolachas no leite e reserve. Creme Branco: Em uma panela, leve todos os ingredientes ao fogo médio e misture até obter uma consistência grossa e cremosa. Creme de Chocolate: Repita o processo feito no creme branco. Cobertura: Bata as claras em neve com o açúcar até obter um creme consistente, adicione o creme de leite e misture delicadamente. Montagem: Em um refratário grande, despeje o creme branco, metade das bolachas, creme de chocolate, bolachas e claras em neve. Repita o processo até preencher todo o refratário e leve à geladeira por 40 minutos."))
        
        receitas.append(Receita(image: "pudim", name: "Pudim de Leite Condensado", preparationTime: 60, ingredients: "1 Lata de Leite condensado. 1 Lata de Leite. 3 ovos inteiros. 1 xícara(chá) de açúcar. 1/2 xícara de água", preparationSteps: "Pudim: Primeiro, bata bem os ovos no liquidificador. Acrescente o leite condensado e o leite, e bata novamente. Calda: Derreta o açúcar na panela até ficar moreno, acrescente a água e deixe engrossar. Coloque em uma forma redonda e despeje a massa do pudim por cima. Asse em forno médio por 45 minutos, com a assadeira redonda dentro de uma maior com água. Espete um garfo para ver se está bem assado. Deixe esfriar e desenforme." ))
        
        receitas.append(Receita(image: "bolo", name: "Bolo simples", preparationTime: 40, ingredients: "2 xícaras(chá) de açucar. 3 xícaras (chá) de farinha de trigo. 4 colheres(sopa) de margarina. 3 ovos. 1 e 1/2 xícara(chá) de leite. 1 colher (sopa) bem cheia de fermento em pó", preparationSteps: "Bata as claras em neve e reserve. Misture as gemas, a margarina e o açúcar até obter uma massa homogênea. Acrescente o leite e a farinha de trigo aos poucos, sem parar de bater. Por último, adicione as claras em neve e o fermento. Despeje a massa em uma forma grande de furo central untada e enfarinhada. Asse em forno médio 180 °C, preaquecido, por aproximadamente 40 minutos ou ao furar o bolo com um garfo, este saia limpo."))
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sender = receitas[indexPath.row]
        performSegue(withIdentifier: "detailViewController", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewController" {
            if let destination = segue.destination as? DetailViewController {
                destination.receita = sender as? Receita
            }
        }
    }
}

//MARK: -Extensions
extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receitas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        let receita = receitas[indexPath.row]
        cell.setup(title: receita.name, image: receita.image)
        return cell
    }
}

