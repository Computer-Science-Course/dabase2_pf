"""Script to create queries to fill database used in AP2 of BD2
"""

import random
from mock_values import TABLES
from utils import (
    toString
)

def storeQuery(
    query: str,
    filename: str
) -> None:
    with open(filename, 'w', encoding='utf8') as file:
        file.write(query)

def createQuery(
    list_data: list[dict[str, str]],
    fields: list[str],
    table_name: str
) -> str:

    query: list[str] = [f'INSERT INTO {table_name} ({", ".join([f"`{field}`" for field in fields])})']
    query.append('VALUES')
    values: str = []
    for data in list_data:
        values.append(
            f'\t({", ".join([f"{toString(data[field])}" for field in fields])})'
        )
    query.append(
        ",\n".join(values)
    )
    
    return '\n'.join(query) + ';'

random.seed(42)

DATABASE_NAME = 'pf_veiculos'

for table in TABLES:
    storeQuery(
        f'USE {DATABASE_NAME};\n\n' + 
        createQuery(
            list_data = table['values'],
            fields = table['values'][0].keys(),
            table_name = table['name']
        ),
        f'{table["name"]}_values.sql'
    )
