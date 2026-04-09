# 🛒 Projeto Banco de Dados - E-commerce


## 📖 Descrição
Este projeto foi desenvolvido como parte de um desafio de modelagem de banco de dados.  
O objetivo é replicar a modelagem lógica, criar o esquema relacional, inserir dados de teste e elaborar consultas SQL que respondam perguntas de negócio utilizando cláusulas fundamentais.

---

## 🔧 Mudanças Necessárias
- **Cliente PJ e PF**: uma conta pode ser PJ ou PF, mas não ambas.
- **Pagamento**: cada cliente pode ter múltiplas formas de pagamento.
- **Entrega**: possui status e código de rastreio.

---

## 📂 Estrutura do Repositório

├── docs/
│   ├── er_diagram.png             # Diagrama EER
│   ├── schema.relacional.sql      # Criação do esquema
│   ├── data_insertion.sql         # Inserção de dados fictícios
│   ├── queries.sql                # Consultas SQL
│
└── README.md                       # Documentação principal
---

## 🗂️ Estrutura do Banco de Dados

### Principais Tabelas
- **clients** → dados de clientes  
- **clientPF / clientPJ** → especialização de clientes  
- **product** → catálogo de produtos  
- **payments** → formas de pagamento  
- **orders** → pedidos realizados  
- **delivery** → status e rastreio de entregas  
- **supplier** → fornecedores  
- **seller** → vendedores  
- **productStorage** → estoques  
### Relacionamentos M:N
- **productSupplier** → produtos e fornecedores  
- **productSeller** → produtos e vendedores  
- **productOrder** → produtos e pedidos  
- **storageLocation** → produtos e estoques  

---

### Cláusulas Exigidas

SELECT → consultas básicas
WHERE → filtros de dados
ORDER BY → ordenação de resultados
HAVING → filtros em grupos agregados
JOIN → junções entre tabelas
Atributos derivados → uso de funções como CONCAT, SUM, AVG

---

## 🔎 Perguntas que podem ser respondidas com queries

Quantos pedidos foram feitos por cada cliente?
Algum vendedor também é fornecedor?
Relação de produtos, fornecedores e estoques.
Relação de nomes dos fornecedores e nomes dos produtos.
Quais clientes não possuem pedidos?
Quais produtos não possuem fornecedores cadastrados?
Qual o valor total de pedidos por cliente?
Quais estoques estão com quantidade zerada?
Quais categorias de produto têm média de avaliação maior que 3?
Liste os clientes ordenados pelo número de formas de pagamento cadastradas.