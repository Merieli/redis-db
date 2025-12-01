# Redis DB

É um banco de dados que utiliza a estrutura chave-valor para armazenamento de dados. Esse tipo de estrutura e banco tem se tornado cada vez mais popular como um banco de dados complementar a sistemas transacionais e gerenciais.

Não funciona da mesma forma que um banco de dados relacional, e para começar a utilizá-lo não é neccessário criar um schema ou um banco de dados. Ele não é feito para armazenar grandes volumes de dados, mas sim para armazenar dados temporários que precisam ser acessados rapidamente.

Usa um modelo chave-valor, e não suporta consultas complexas como SQL, tem altíssima performance para escalar.

É altamente particionável e permite a escalabilidade horizontal, por isso é muito mais rápido e permite um gerenciamento muito eficiente de um formato de dados muito grande.

Não armazena vídeos, imagens ou som, mas o que se costuma fazer que é possível é armazenar em uma chave o link para acessar o arquivo armazenado em outro local, como um servidor de arquivos ou um serviço de armazenamento em nuvem.

## Vantagens e Desvantagens dos Bancos de Dados Chave-Valor

### Vantagens

- Desempenho superior: Operações rápidas de leitura e gravação, devido à ausência de complexidade relacional.
- Escalabilidade horizontal: Permite distribuir dados entre vários servidores, aumentando a capacidade sem comprometer o desempenho.
- Flexibilidade: Pode armazenar diferentes tipos de dados sem necessidade de esquemas rígidos.
- Fácil implementação: A estrutura chave-valor é simples, tornando a configuração e uso mais intuitivos.
- Baixo consumo de recursos: Otimizado para armazenar e recuperar dados com o mínimo de processamento.

### Desvantagens

- Falta de suporte a consultas complexas: Não permite buscas avançadas sem indexação externa.
- Ausência de relacionamentos: Não é adequado para aplicações que exigem integridade referencial e normalização de dados.
- Gerenciamento de grandes volumes pode ser desafiador: Pode exigir estratégias adicionais para garantir consistência em bancos distribuídos.


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


## Como usar?

**Para registrar algo:**
```
SET {key} {value}
```

A key a ser definida não pode conter espaços e tem que ser única, e o valor pode ser uma string, número, lista, conjunto, hash, etc.

Se eu inserir um dado com uma determinada key e em seguida inserir outro dado com a mesma key, o valor anterior será sobrescrito, substituindo os valores. O que pode ser interessante ao corrigir um texto ou pode ser ruim ao apagar um valor acidentalmente. Por isso para garantir que o valor não seja sobrescrito, pode-se usar o comando NX (Set if Not eXists) no final do comando, exemplo:

```
SET {key} {value} NX
```

Para definir um valor somente se a chave já existir, pode-se usar o comando XX (Set if eXists), assim será apenas possível alterar o valor, exemplo:

```
SET {key} {value} XX
```

Para atualizar aproveitando o valor existente e só acrescentar algo ao final do valor, pode-se usar o comando APPEND, exemplo:

```
APPEND {key} {value}
```

Para incluir vários valores ao mesmo tempo:
```
MSET {key1} {value1} {key2} {value2} ...
```


**Para visualizar todas as chaves no banco:**
```
KEYS *
```

**Para obter o valor de uma chave no banco:**
```
GET {key}
```

Para efetuar a substituição de uma chave por um novo valor e retornar o valor antigo:
```
GETSET {key} {new_value}
```

Para visualizar mais de uma chave ao mesmo tempo:
```
MGET {key1} {key2} {key3} ...
```

**Para deletar uma chave no banco:**
```
DEL {key}
```

**Para armazenar uma lista:**
```
ZADD {key} {score} {value}
```

Key é o nome da lista, Value é o valor a ser armazenado na posição definida pelo Score. E score é um número que define a ordem dos elementos na lista.

**Para consultar elementos em uma lista:**
````
ZRANGE {key} {start} {end}
````

Key é o nome da lista, start é a posição inicial e end é a posição final em índices.

**Para armazenar uma lista não ordenada:**
```
LPUSH {key} {value}
```

O LPUSH adiciona o valor em uma lista onde o último valor adicionado fica na primeira posição.


**Para consultar uma lista não ordenada:**
```
LRANGE {key} {start} {end}
```

**Para armazenar múltiplos campos ao mesmo tempo:**
```
HSET {key} {field1} {value1} {field2} {value2} ...
```

**Para consultar todos campos de uma chave:**
```
HKEYS {key}   
```

**Para consultar valores dos campos de uma chave:**
```
HVALS {key}   
```

**Para limpar todas as chaves do banco:**
```
FLUSHDB
```

## Principais Bancos de Dados Chave-Valor

### Bancos de Dados Open Source e On-Premises

- Redis: Popular para caching, filas e armazenamento em memória.
- Memcached: Simples e eficiente para caching distribuído.
- Berkeley DB: Antigo e confiável, usado em sistemas embarcados.
- RocksDB: Desenvolvido pelo Facebook para alto desempenho em escrita.
- LevelDB: Criado pelo Google, usado em armazenamento de chaves de pequeno porte.


### Bancos de Dados Chave-Valor em Nuvem

- Amazon DynamoDB (AWS) – Banco de dados NoSQL totalmente gerenciado, altamente escalável e usado para aplicações web e mobile.
- Azure Cosmos DB (Microsoft) – Suporte a múltiplos modelos, incluindo chave-valor, com alta disponibilidade global.
- Google Cloud Firestore (Google) – Banco de dados NoSQL que suporta pares chave-valor e sincronização em tempo real.
- IBM Cloudant – Banco de dados NoSQL gerenciado, projetado para aplicações distribuídas.


Ao administrar o ambiente é neccessário considerar os seguintes aspectos:
- Persistência
- Backup
- Segurança

