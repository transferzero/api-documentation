{% include corridors/recipient_name.md %}

## BRL::Bank

<div class="alert alert-info" markdown="1">
**Note** Please be aware that for `BRL::Bank` the field `postal_code` on the `Recipient` is mandatory for transaction/recipient above the following limits - $10,000/Month and $50,000/Year.
</div>

### PIX Payments
For Brazilian bank account payments via PIX please use:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "city": "Brasilia",
  "postal_code": "70070",
  "phone_number": "+552112345678", // recipient phone number in international format
  "pix_key_type": "email",
  "pix_key_value": "person@example.com",
  "identity_card_type": "ID",
  "identity_card_id": "01234567890",
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="brl-bank-pix" raw=data-raw %}

The supported values for `pix_key_type` are:
```
cnpj
cpf
email
evp
phone
```

### TED Payments
For Brazilian bank account payments using bank code and account number please use:

{% capture data-raw %}
```javascript
"details" : {
  {{ recipient_name }},
  "city": "Brasilia",
  "postal_code": "70070",
  "phone_number": "+552112345678", // recipient phone number in international format
  "bank_code": "104",
  "branch_code": "00001",
  "bank_account": "0009795493",
  "bank_account_type": "10", // 10 for savings, 20 for current, 30 for payment, 40 for salary
  "identity_card_type": "ID",
  "identity_card_id": "01234567890",
  "transfer_reason": "personal_account"
}
```
{% endcapture %}

{% include language-tabbar.html prefix="brl-bank-ted" raw=data-raw %}

The current banks supported and their `bank_code` values are:

{% capture data-raw %}
```
Accredito - Sociedade De Crédito Direto: 406
Acesso Soluções De Pagamento - Instituição De Pagamento: 332
Asaas Gestão Financeira Instituição De Pagamento: 461
Banco Abc Brasil: 246
Banco Afinz - Banco Múltiplo: 299
Banco Agibank: 121
Banco Alfa: 025
Banco Arbi: 213
Banco Bari De Investimentos E Financiamentos: 330
Banco Bmg: 318
Banco Bradesco: 237
Banco Bs2: 218
Banco Btg Pactual: 208
Banco Bv: 413
Banco C6: 336
Banco Citibank: 745
Banco Cooperativo Sicoob - Banco Sicoob: 756
Banco Cooperativo Sicredi: 748
Banco Crefisa: 069
Banco Csf: 368
Banco Da Amazonia: 003
Banco Daycoval: 707
Banco Digimais: 654
Banco Digio: 335
Banco Do Brasil: 001
Banco Do Estado De Sergipe: 047
Banco Do Estado Do Pará: 037
Banco Do Estado Do Rio Grande Do Sul: 041
Banco Do Nordeste Do Brasil: 004
Banco Fibra: 224
Banco Genial: 125
Banco Guanabara: 612
Banco Hsbc: 269
Banco Inbursa: 012
Banco Industrial Do Brasil: 604
Banco Inter: 077
Banco J.P. Morgan: 376
Banco Keb Hana Do Brasil: 757
Banco Letsbank: 630
Banco Luso Brasileiro: 600
Banco Master S/A: 243
Banco Mercantil Do Brasil: 389
Banco Modal: 746
Banco Original: 212
Banco Ourinvest: 712
Banco Pan: 623
Banco Randon: 088
Banco Rendimento: 633
Banco Ribeirao Preto: 741
Banco Safra: 422
Banco Santander (Brasil): 033
Banco Semear: 743
Banco Senff: 276
Banco Sofisa: 637
Banco Topázio: 082
Banco Triangulo: 634
Banco Voiter: 653
Banco Votorantim: 655
Banco Vr: 610
Banco Western Union Do Brasil: 119
Banco Woori Bank Do Brasil: 124
Banco Xp: 348
Banestes Banco Do Estado Do Espirito Santo: 021
Bank Of America Merrill Lynch Banco Múltiplo: 755
Bexs Banco De Câmbio S/A: 144
Bmp Sociedade De Crédito Ao Microempreendedor E A Empresa De Pequeno Porte Ltda.: 274
Bonuspago Sociedade De Crédito Direto: 408
Brb - Banco De Brasilia: 070
Caixa Economica Federal: 104
Capital Consig Sociedade De Crédito Direto: 465
Cartos Sociedade De Crédito Direto: 324
Caruana - Sociedade De Crédito, Financiamento E Investimento: 130
Casa Do Crédito Sociedade De Crédito Ao Microempreendedor: 159
Celcoin Instituicao De Pagamento: 509
Cielo - Instituição De Pagamento: 362
Cobuccio S/A - Sociedade De Crédito, Financiamento E Investimentos: 402
Confederação Nacional Das Cooperativas Centrais De Crédito E Economia Familiar E: 133
Confederação Nacional Das Cooperativas Centrais Unicred Ltda. - Unicred Do Brasi: 136
Cooperativa Central De Crédito - Ailos: 085
Cooperativa De Credito Dos Servidores Da Universidade Federal Do Espirito Santo: 427
Cooperativa De Crédito Mútuo Dos Despachantes De Trânsito De Santa Catarina E Ri: 016
Cooperativa De Crédito Rural Coopavel: 281
Cooperativa De Crédito Rural De Abelardo Luz - Sulcredi/Crediluz: 322
Cooperativa De Crédito Rural De Pequenos Agricultores E Da Reforma Agrária Do Ce: 350
Cooperativa De Crédito Rural De São Miguel Do Oeste - Sulcredi/São Miguel: 273
Cooperativa De Credito Rural Seara - Crediseara: 430
Cora Sociedade De Crédito Direto: 403
Credialiança Cooperativa De Crédito Rural: 098
Credicoamo Credito Rural Cooperativa: 010
Credifit Sociedade De Crédito Direto: 452
Credisan Cooperativa De Crédito: 089
Credisis - Central De Cooperativas De Crédito Ltda.: 097
Credsystem Sociedade De Crédito Direto: 428
Delcred Sociedade De Crédito Direto: 435
Dock Instituição De Pagamento: 301
Ebanx Instituicao De Pagamentos Ltda.: 383
Efí - Instituição De Pagamento: 364
Ewally Instituição De Pagamento: 534
Fidúcia Sociedade De Crédito Ao Microempreendedor E À Empresa De Pequeno Porte L: 382
Fitbank Instituição De Pagamentos Eletrônicos: 450
Gazincred Sociedade De Crédito, Financiamento E Investimento: 478
Global Finanças Sociedade De Crédito Ao Microempreendedor E À Empresa De Pequeno: 384
Hscm - Sociedade De Crédito Ao Microempreendedor E À Empresa De Pequeno Porte Lt: 312
Hub Instituição De Pagamento: 396
Id Corretora De Títulos E Valores Mobiliários: 439
Índigo Investimentos Distribuidora De Títulos E Valores Mobiliários Ltda.: 407
Itaú Unibanco: 341
Iugu Instituição De Pagamento: 401
Lar Cooperativa De Crédito - Lar Credi: 421
Listo Sociedade De Credito Direto: 397
Magnum Sociedade De Crédito Direto: 511
Mercado Pago Instituição De Pagamento Ltda.: 323
Microcash Sociedade De Crédito Ao Microempreendedor E À Empresa De Pequeno Porte: 537
Midway - Crédito, Financiamento E Investimento: 358
Neon Pagamentos - Instituição De Pagamento: 536
Nu Pagamentos - Instituição De Pagamento: 260
Numbrs Sociedade De Crédito Direto: 419
Omni Banco: 613
Ótimo Sociedade De Crédito Direto: 355
Pagseguro Internet Instituição De Pagamento: 290
Paraná Banco: 254
Parati - Credito, Financiamento E Investimento: 326
Pefisa - Crédito, Financiamento E Investimento: 174
Picpay Bank - Banco Original S.A: 079
Picpay Instituição De Pagamento: 380
Pinbank Brasil Instituição De Pagamento: 529
Portoseg - Credito, Financiamento E Investimento: 468
Primacredi Cooperativa De Crédito De Primavera Do Leste: 279
Qi Sociedade De Crédito Direto: 329
Realize Crédito, Financiamento E Investimento: 374
Sisprime Do Brasil - Cooperativa De Crédito: 084
Social Bank Banco Múltiplo S/A: 412
Socinal - Crédito, Financiamento E Investimento: 425
Socred - Sociedade De Crédito Ao Microempreendedor E À Empresa De Pequeno P: 183
Stark Sociedade De Crédito Direto: 462
Stone Instituição De Pagamento: 197
Sumup Sociedade De Crédito Direto: 404
Superdigital Instituição De Pagamento: 340
Travelex Banco De Câmbio: 095
Trinus Sociedade De Crédito Direto: 444
U4c Instituição De Pagamento: 546
Uniprime Central Nacional - Central Nacional De Cooperativa De Credito: 099
Uy3 Sociedade De Crédito Direto S/A: 457
Via Certa Financiadora - Crédito, Financiamento E Investimentos: 411
Vortx Distribuidora De Titulos E Valores Mobiliarios Ltda.: 310
Zema Crédito, Financiamento E Investimento S/A: 359
```
{% endcapture %}

{% include language-tabbar.html prefix="brl-bank-options" raw=data-raw %}

{% include corridors/transfer_reasons.md %}
