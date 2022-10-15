def toString(data: str | int | float) -> str | int | float:
    if type(data) == str:
        return f'\'{data}\''
    else:
        return data
