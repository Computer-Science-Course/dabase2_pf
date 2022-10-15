from random import randint, choice
import names

ALPHABET = list(map(chr, range(65, 91)))

estados: list[str] = [
    f'Estado {n_estado}' for n_estado in range(1, 28)
]
ruas: list[str] = [
    f'Rua {n_rua}' for n_rua in range(1, 1001)
]
cidades: list[str] = [
    f'Cidade {n_cidade}' for n_cidade in range(1, 201)
]

ENDERECOS: list[dict[str, str]] = [
        {
            'estado': choice(estados),
            'cidade': choice(cidades),
            'rua': choice(ruas)
        }
        for n_endereco in range(1, 51)
    ]

CLIENTES: list[dict[str, str]] = [
    {
        'cpf': str(randint(11111111111, 99999999999)),
        'nome': names.get_full_name(),
        'endereco_id': id_endereco
    }
    for id_endereco in range(1, len(ENDERECOS) + 1)
]

VENDEDORES: list[dict[str, str]] = [
    {
        'num_vend': num_vend,
        'nome': names.get_full_name(),
    }
    for num_vend in range(1, 21)
]

VEICULOS: list[dict[str, str]] = [
    {
        'preco': randint(30000, 150000),
        'modelo': f'Modelo {cod_veiculo}'
    }
    for cod_veiculo in range(1, 91)
]

CARROS: list[dict[str, str]] = [
    {
        'tamanho_motor': randint(10, 30)/10,
        'veiculo_cod_veiculo': cod_veiculo,
    }
    for cod_veiculo in range(1, 31)
]

CAMINHOES: list[dict[str, str]] = [
    {
        'capacidade_peso': randint(500, 2000),
        'veiculo_cod_veiculo': cod_veiculo,
    }
    for cod_veiculo in range(31, 61)
]

UTILITARIOS: list[dict[str, str]] = [
    {
        'nr_assentos': choice([8, 15, 50]),
        'veiculo_cod_veiculo': cod_veiculo,
    }
    for cod_veiculo in range(61, 91)
]

VENDAS: list[dict[str, str]] = [
    {
        'data': '-'.join([str(randint(2000, 2022)), str(randint(1, 12)).zfill(2), str(randint(1, 28)).zfill(2)]),
        'vendedor_num_vend': randint(1, len(VENDEDORES)),
        'veiculo_cod_veiculo': randint(1, len(VEICULOS)),
        'cliente_cpf': cliente['cpf'],
    }
    for cliente in CLIENTES
]

TABLES: list[dict[str, str]] = [
    {'name': 'endereco','values': ENDERECOS},
    {'name': 'cliente','values': CLIENTES},
    {'name': 'vendedor','values': VENDEDORES},
    {'name': 'veiculo','values': VEICULOS},
    {'name': 'carro','values': CARROS},
    {'name': 'caminhao','values': CAMINHOES},
    {'name': 'utilitario','values': UTILITARIOS},
    {'name': 'venda','values': VENDAS},
]

