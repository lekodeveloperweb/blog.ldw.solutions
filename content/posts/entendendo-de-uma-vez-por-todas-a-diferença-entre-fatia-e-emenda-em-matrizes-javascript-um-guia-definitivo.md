---
title: "Entendendo de uma vez por todas a diferença entre fatia e emenda em matrizes javascript, um guia definitivo"
date: 2024-03-17T10:00:00+03:00
lastmod: 2023-03-17T10:00:00+03:00
author: Alex Leko
tags: ["javascript", "array"]
categories: ["Tutorial", "Essentials"]
toc:
  enable: true
---

# Entendendo de uma vez por todas a diferença entre fatia e emenda em matrizes javascript, um guia definitivo

Fala galera!!! Olha eu aqui de novo. O assunto que vamos discutir hoje, não é novo, e nem de longe complexo, mas ainda causa bastante confusão. Eu mesmo no início me confundia bastante, e quero hoje, te ajudar a nunca mais errar a diferença entre slice e splice, creio que a própria entonação da pronuncia já faz com que nossa mente se engane. Traduzindo ao pé da letra, Slice é uma fatia, um pedaço de algo, já Splice é emenda. Tendo isso em mente, vamos contar uma história que defina de um jeito que não vamos esquecer:

## Slice

magine três garotos, Pedro, Tiago e João, olhando pela vitrine de uma confeitaria uma torta gigante, imaginou?

Então acompanha o diálogo:

  > Pedro diz: Eu vou querer o primeiro slice!
Tiago Eu prefiro o slice do meio, tem mais recheio.
João Então o resto é meu!😝
Vejamos isso na prática.

```javascript
var boloInteiro = [1,2,3,4,5,6,7,8,9,10];
var oPrimeiroPedacoEhMeu = boloInteiro.slice(0,1);
console.log(oPrimeiroPedacoEhMeu);
// [1]

var prefiroDoMeio = boloInteiro.slice(4,5);
console.log(prefiroDoMeio);
// [5]

var oRestoEhMeu = boloInteiro.slice(8)
console.log(oRestoEhMeu);
// [9,10]
// Como os garotos estavam apenas imaginando, mesmo depois de distribuir todas essas "slices",
// o bolo ainda tá inteirinho
console.log(boloInteiro);
// [1,2,3,4,5,6,7,8,9,10]
```
Melhor que isso, só dois disso né.🤓 Creio que essa é a maneira mais fácil de entender, trazendo coisas do dia a dia para a programação, à la orientação a objetos. E se mesmo assim não conseguir entender, deixa o seu comentário aí que tento te ajudar a entender de uma vez por todas.

  > **Nota técnica:**
O método slice() retorna uma cópia de parte de um array a partir de um subarray criado entre as posições begin e end (end não é necessário) de um array original.
O Array original não é modificado.

Assinatura: `arr.slice([begin[, end]]) Array.prototype.slice()`

Traduzindo: `bolo.pedacos(posição da faca imaginária, quantos pedaços corta)`

## Splice

Esse eu acho ainda mais interessante, para trazer ao mundo real, continuaremos com o bolo, mas dessa vez, um feito pela vovó, quer mais histórias? (Siiiiiiim!!!!)

  Era uma daquelas tarde de domingo, a vovó fez um bolo de fubá, e deixou cortadinho e esfriando em cima da mesa. Seu neto, Pedro, malandro, nem esperou esfriar, foi lá e pegou dois pedaços, guloso! Enquanto ainda comia o primeiro, sua avó o pegou no flagra, e disse: “larga de ser olho grande menino!” Pode Splice um desses pedaços no lugar. (forte essa hein 😂)

  Diferente do bolo da vitrine, onde os garotos só imaginavam estar comendo o bolo, aqui, ele foi comigo, ou seja, não existe mais aquele pedaço, porém, se vocês prestaram atenção na história, o Pedro, comeu um pedaço e sua avó, mandou ele colocar o outro no lugar, pra fazer isso, usaremos o Splice.

```javascript
var boloInteiro = [1,2,3,4,5,6,7,8,9,10];
var pegandoDoisPedacos = boloInteiro.splice(0,2);
console.log(pegandoDoisPedacos);
// [1,2]
console.log(boloInteiro);
// [3,4,5,6,7,8,9,10]
```

**Devolvendo o segundo pedaço:**
Observe que como quero devolver pedaço, escolho a posição que quero colocar esse pedaço, no caso a posição 0. Como nçao quero pegar, informo que não quero "andar" no array, neste caso, coloco 0 e por fim, devolvo o pedaço número 2.

```javascript
boloInteiro.splice(0,0,2)
console.log(boloInteiro)
// [2,3,4,5,6,7,8,9,10]
```

E aí, pegou o esquema? Mais complicado?

> **Nota técnica:**
O método splice() altera o conteúdo de uma lista, adicionando novos elementos enquanto remove elementos antigos.

**Assinatura:**
`array.splice(indice[, deleteCount[, elemento1[, ...[, elementoN]]]) Array.prototype.splice()`

**Traduzindo:**
`bolo.pedacos(posição da faca, quantos pedaços cortar, ...infinitos pedaços para colocar no lugar, se quiser)`

## Os Finalmentes

O método **Slice** é usado para consultar posições de um Array, trazer uma determinada parte dele, sem modificá-lo, já com o **Splice**, você remove os elementos de uma determinada posição de Array, com a possibilidade de colocar outros no lugar, ambos os métodos, retornam as posições manipuladas. As funcionalidades de ambos, são realmente parecidas, mas como costumo repetir: *Parecido não é igual*.

É isso, espero ter ajudado, e finalmente você tenha entendido essa diferença, qualquer coisa estou a disposição, deixe seu comentário, compartilhe com seus amigos, e eu vejo vocês no próximo post.

*Um forte abraço e sucesso!!!*
