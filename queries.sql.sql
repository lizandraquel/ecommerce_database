use ecommerce;

-- 1. quantos pedidos foram feitos por cada cliente?
-- select + group by | conta quantos pedidos cada cliente realizou.
select c.idClient, concat(c.Fname,' ',c.Lname) as Cliente, count(o.idOrder) as TotalPedidos
from clients c
inner join orders o on c.idClient = o.idOrderClient
group by c.idClient, c.Fname, c.Lname;

-- 2. algum vendedor também é fornecedor?
-- join | verifica se algum vendedor aparece também como fornecedor comparando o cnpj.
select s.SocialName as Vendedor, f.SocialName as Fornecedor
from seller s
inner join supplier f on s.CNPJ = f.CNPJ;

-- 3. relação de produtos, fornecedores e estoques
-- join | mostra quais produtos são fornecidos por quais fornecedores e em quais estoques estão armazenados.
select p.Pname as Produto, f.SocialName as Fornecedor, ps.quantity as QuantidadeFornecida,
       st.storageLocation as LocalEstoque, st.quantity as EstoqueDisponivel
from product p
inner join productSupplier ps on p.idProduct = ps.idPsProduct
inner join supplier f on ps.idPsSupplier = f.idSupplier
inner join storageLocation sl on p.idProduct = sl.idLproduct
inner join productStorage st on sl.idLstorage = st.idProdStorage;

-- 4. relação de nomes dos fornecedores e nomes dos produtos
-- join | lista os fornecedores e os produtos que eles fornecem.
select f.SocialName as Fornecedor, p.Pname as Produto
from supplier f
inner join productSupplier ps on f.idSupplier = ps.idPsSupplier
inner join product p on ps.idPsProduct = p.idProduct;

-- 5. quais clientes não possuem pedidos?
-- select + left join + where | mostra clientes que não têm pedidos associados.
select c.idClient, concat(c.Fname,' ',c.Lname) as Cliente
from clients c
left join orders o on c.idClient = o.idOrderClient
where o.idOrder is null;

-- 6. quais produtos não possuem fornecedores cadastrados?
-- select + left join + where | lista produtos que não estão vinculados a nenhum fornecedor.
select p.idProduct, p.Pname
from product p
left join productSupplier ps on p.idProduct = ps.idPsProduct
where ps.idPsSupplier is null;

-- 7. qual o valor total de pedidos por cliente?
-- select + sum + group by | calcula o valor total dos pedidos de cada cliente.
select c.idClient, concat(c.Fname,' ',c.Lname) as Cliente, sum(o.sendValue) as ValorTotalPedidos
from clients c
inner join orders o on c.idClient = o.idOrderClient
group by c.idClient, c.Fname, c.Lname;

-- 8. quais estoques estão com quantidade zerada?
-- select + where | mostra estoques que não possuem produtos disponíveis.
select idProdStorage, storageLocation, quantity
from productStorage
where quantity = 0;

-- 9. quais categorias de produto têm média de avaliação maior que 3?
-- select + avg + group by + having | calcula a média de avaliação por categoria e filtra apenas as que têm média acima de 3.
select category, avg(avaliação) as MediaAvaliacao
from product
group by category
having avg(avaliação) > 3;

-- 10. liste os clientes ordenados pelo número de formas de pagamento cadastradas.
-- select + count + group by + order by | mostra clientes com suas formas de pagamento ordenados do maior para o menor.
select c.idClient, concat(c.Fname,' ',c.Lname) as Cliente, count(p.idPayment) as TotalPagamentos
from clients c
inner join payments p on c.idClient = p.idClient
group by c.idClient, c.Fname, c.Lname
order by TotalPagamentos desc;
