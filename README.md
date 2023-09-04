#  `"«Дипломное задание»"` - `Дьяконов Алексей`


`Что работает - aplication balancer, elk(по крайней мере все стартует), zabbix`

##### Описание файлов :

- `main.tf - основной файл терраформа, описывающий созданные вм` [](./main.tf)
- `network.tf -  файл, описывающий созданную сеть и подсети` [](./network.tf)
- `ap-bal.tf -  файл, описывающий aplication balancer` [](./ap-bal.tf)
- `meta.txt - пользовательские данные` [](./meta.txt)
- `variables.tf - переменные` [](./variables.tf)




- `nginx.yaml - ansible-playbook для серверов nginx`[](./ansible/nginx.yaml)
- `elk.yaml - ansible-playbook для сервера elasticsearch`[](./ansible/elk.yaml)
- `kibana.yaml - ansible-playbook для сервера kibana`[](./ansible/kibana.yaml)
- `zabbix.yaml - ansible-playbook для сервера zabbix`[](./ansible/zabbix.yaml)

##### В папке /ansible/config находятся файлы docker-compose и конфиги для elk

