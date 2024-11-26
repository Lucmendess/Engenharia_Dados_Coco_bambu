# Engenharia_Dados_Coco_bambu

DESAFIO 1
## 1. Descreva o esquema JSON correspondente ao exemplo acima.
O esquema foi feito no visual studio code e feito o upload do arquivo nomeado de codigo_json
  
## 2. Contexto
Cada item de OrderDetail faz referência ao MenuItem, ao Discount, ao ServiceCharge, ao TenderMedia e ao ErrorCode.
A tabela OrderDetail é a principal tabela que armazena os detalhes do pedido, associando um item do menu, a quantidade, os descontos, as taxas de serviço, os meios de pagamento e os códigos de erro.
Feita a criação das tabelas estruturadas SQL e da tabela sem estruturadas JSON de menu e tabelas dimensões
## 2.1. Transcreva o JSON para tabelas SQL. A implementação deve fazer sentido para operações de restaurante.
Criada as tabelas em SQL da rede do restaurante, assim como a tabela menu, sendo anexada.

## 3. Descreva a abordagem escolhida em detalhes. Justifique a escolha.
A tabela guest_checks mostra os detalhes de pedido dos clientes, sendo tabela principal com informações gerais de transações dos pedidos. A tabela taxes armazenará as informações de impostos aplicados ao pedido, sendo a tabela dimensão da tabela fato que é guest_checks. A tabela detail_lines armazenará os itens do pedido (itens do menu), incluindo o menuItem, descontos, taxas de serviço, meios de pagamento e códigos de erro, conforme mencionado Tabela menu_items armazena informações sobre os itens do menu, sendo comidas e bebidas. Tabela discounts armazena informações sobre descontos aplicados a itens ou ao pedido. Tabela service_charges armazenará informações sobre taxas de serviço aplicadas ao pedido. Tabela tender_media armazenará informações sobre os meios de pagamento usados no pedido e se o pagamento foi efetuado. Tabela error_codes armazena informações sobre erros associados ao pedido, se o pagamento apresentou falhas.

DESAFIO 2

## 1. Por que armazenar as respostas das APIs?
O armazenamento em API por permitir acesso centralizado de volumes grandes de dados que são gerados pelas lojas de rede de restaurantes, onde a empresa tem o armazenamento centralizado, ou seja, onde os dados podem ser encontrados para análise, relatórios, visualizações e auditorias. As análises historicas mostram como são comportamentos dos clientes, onde as análises de tendencia evidenciam as receitas, comportamento de pagamento, ou seja, modalidade, os padrões sazonais permitindo criar promoções e ajuste de preços. As APIs permitem coletar dados de diferentes fontes, onde será integrado os dados para uma análise completa. O data lake permite que os dados sejam consultados de forma rápida, onde são indexados permitindo que quem consulte encontre com de forma agil. O dados podem ser processados e modelados posteriormente para valimentar sistemas de BI, dashboards e relatórios financeiros.

## 2. Como você armazenaria os dados? Crie uma estrutura de pastas capaz de armazenar as respostas da API. Ela deve permitir manipulaçõe, verificações, buscas e pesquisas rápidas
As pastas devem ser estruturadas para que o armazenamento sejam de forma hierarquica e modular, onde permite fácil acesso e flexibilidade para manipular os dados. /data_lake/raw/: Pasta destinada ao armazenamento de dados brutos vindos das APIs. Cada API (como bi, res, org, trans, inv) terá sua subpasta, e dentro de cada subpasta, há uma organização por storeId (identificador da loja) e busDt (data de operação), com os arquivos JSON originais (response.json).
/data_lake/processed/: Pasta para dados processados e transformados. Após o processamento (ETL), os dados são convertidos em formatos como CSV ou Parquet e armazenados para consultas e análises rápidas. Cada loja e data terá seu próprio diretório.
/data_lake/metadata/: Pasta contendo metadados relacionados aos arquivos, como a descrição das colunas e tipos de dados. Isso é importante para garantir que as análises e transformações de dados estejam alinhadas com as expectativas.

## 3. Considere que a resposta do endpoint getGuestChecks foi alterada, por exemplo, guestChecks.taxes foi renomeado para guestChecks.taxation. O que isso implicaria?
A alteração faria com que tivesse problemas, onde seria necessário fazer modificações para ajustar, fazendo com que o ETL deveria ser refeito, pois alteração geraria nova chave e que o pipeline ETL não iria transformar os dados corretamente. As consultas, relatórios e visualização que estiver usando o campo guestChecks.taxes deverá ser atualizada para constar alteração do campo para guestChecks.taxation, em que será feita nas consultas em SQL ou deshboards em power BI, tableau e entre outros. Os dados devem ser consistente, ou seja, qualquer tipo de modificação deve ser realizado atualização no ETL para que os dados apresente inconsistencias para não afetar nas análises e relatórios. Os metadados devem ser atualizados, sendo importante para auditoria e para garantir que qualquer novo código ou consulta leve em conta a alteração de nome.
