## Observações

- Não soube como criar uma API que fizesse pesquisa no Google, com isso optei por usar uma Search API, o que fez com que a aplicação funcionasse igualmente.
- A gerência de estado se fez muito pouco necessária na aplicação, por isso optei em apenas usar Stateful e Snapshot.
- Arquitetura Limpa e Testes Unitários não foram aplicados por falta de tempo, visto que tenho feito Freelances e outros processos seletivos com desafios.


## Instação

- Acesse o link (https://developers.google.com/custom-search/v1/overview) e clique em "Get a key"
- Cole a chave em ```config/api_keys.dart```
E Então rode os seguintes comandos:
```bash
  flutter pub get
  open -a simulator
  flutter run
```

