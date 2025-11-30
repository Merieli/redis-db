# Redis DB

É um banco de dados que utiliza a estrutura chave-valor para armazenamento de dados. Esse tipo de estrutura e banco tem se tornado cada vez mais popular como um banco de dados complementar a sistemas transacionais e gerenciais.

Não funciona da mesma forma que um banco de dados relacional, e para começar a utilizá-lo não é neccessário criar um schema ou um banco de dados.

Usa um modelo chave-valor, e não suporta consultas complexas como SQL, tem altíssima performance para escalar.

## Para que se aplica na prática?

Não tem como objetivo substituir um banco de dados relacional ou não relacional, mas sim complementar o sistema de armazenamento de dados, podendo atuar em conjunto com os outros bancos de dados tradicionais. É um banco de dados em memória, cuja toda informação fica na memória da máquina e que é extremamente rápido para:
- Cache de dados - dados temporários para acelerar apps web 
- Comunicação entre serviços - facilitando o uso de filas e messageria 
- Gerenciar sessões de internet - proporcionando o aumento da escalabilidade um site sem prejudicar o banco de dados que gerencia as informações do site
- Ranking e contadores internos - como ranking de usuários para pontuação, dados termporários que expiram em um determinado tempo, contadores de visitas, etc.

Exemplos de apps que usam muito o Redis DB:
- Instagram -  para armazenar feeds e caches de postagens
- Twitter -  para armazenar feeds e caches de postagens
- Uber
- Stackoverflow - para gerenciar sessões de usuários
- Github - para indexar e rankear os repositórios dos usuários




Ao administrar o ambiente é neccessário considerar os seguintes aspectos:
- Persistência
- Backup
- Segurança

