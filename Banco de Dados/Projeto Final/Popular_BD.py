import tkinter as tk
import mysql.connector
from datetime import datetime

# Conecta ao banco de dados
db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="",
    database="Clinica"
)

# Cria uma instância do Tkinter
window = tk.Tk()
window.title("Registro na Clínica")

# Função para inserir um paciente no banco de dados
def inserir_paciente():
    cpf = entry_cpf.get()
    nome = entry_nome.get()
    email = entry_email.get()
    telefone = entry_telefone.get()
    dt_nascimento = entry_dt_nascimento.get()

    dt_nascimento = datetime.strptime(dt_nascimento, "%d/%m/%Y").strftime("%Y-%m-%d")
    
    
    cursor = db.cursor()
    sql = "INSERT INTO Paciente (CPF, nome, email, telefone, dt_nascimento) VALUES (%s, %s, %s, %s, %s)"
    values = (cpf, nome, email, telefone, dt_nascimento)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_cpf.delete(0, tk.END)
    entry_nome.delete(0, tk.END)
    entry_email.delete(0, tk.END)
    entry_telefone.delete(0, tk.END)
    entry_dt_nascimento.delete(0, tk.END)
    

    cursor.close()

# Função para inserir um exame no banco de dados
def inserir_exame():
    nome = entry_nome_exame.get()
    descricao = entry_descricao_exame.get()
    valor = entry_valor_exame.get()

    cursor = db.cursor()
    sql = "INSERT INTO Exame (nome, descricao, valor) VALUES (%s, %s, %s)"
    values = (nome, descricao, valor)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_nome_exame.delete(0, tk.END)
    entry_descricao_exame.delete(0, tk.END)
    entry_valor_exame.delete(0, tk.END)

    cursor.close()

# Função para inserir um convênio no banco de dados
def inserir_convenio():
    nome = entry_nome_convenio.get()
    taxa = entry_taxa_convenio.get()

    cursor = db.cursor()
    sql = "INSERT INTO Convenio (nome, taxa) VALUES (%s, %s)"
    values = (nome, taxa)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_nome_convenio.delete(0, tk.END)
    entry_taxa_convenio.delete(0, tk.END)

    cursor.close()

# Função para inserir uma especialidade no banco de dados
def inserir_especialidade():
    nome = entry_nome_especialidade.get()

    cursor = db.cursor()
    sql = "INSERT INTO Especialidade (nome) VALUES (%s)"
    values = (nome,)

    cursor.execute(sql, values)
    db.commit()

    # Limpa o campo de entrada após a inserção
    entry_nome_especialidade.delete(0, tk.END)

    cursor.close()

# Função para inserir um médico no banco de dados
def inserir_medico():
    crm = entry_crm_medico.get()
    email = entry_email_medico.get()
    nome = entry_nome_medico.get()
    telefone = entry_telefone_medico.get()

    cursor = db.cursor()
    sql = "INSERT INTO Medico (CRM, email, nome, telefone) VALUES (%s, %s, %s, %s)"
    values = (crm, email, nome, telefone)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_crm_medico.delete(0, tk.END)
    entry_email_medico.delete(0, tk.END)
    entry_nome_medico.delete(0, tk.END)
    entry_telefone_medico.delete(0, tk.END)

    cursor.close()

# Função para inserir um pedido no banco de dados
def inserir_pedido():
    cpf = entry_cpf_pedido.get()
    crm = entry_crm_pedido.get()
    cod_exame = entry_cod_exame_pedido.get()
    data_hora = entry_data_hora_pedido.get()
    cod_convenio = entry_cod_convenio_pedido.get()

    cursor = db.cursor()
    sql = "INSERT INTO Pedido (CPF, CRM, cod_exame, data_hora, cod_convenio) VALUES (%s, %s, %s, %s, %s)"
    values = (cpf, crm, cod_exame, data_hora, cod_convenio)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_cpf_pedido.delete(0, tk.END)
    entry_crm_pedido.delete(0, tk.END)
    entry_cod_exame_pedido.delete(0, tk.END)
    entry_data_hora_pedido.delete(0, tk.END)
    entry_cod_convenio_pedido.delete(0, tk.END)

    cursor.close()

# Função para associar uma especialidade a um médico no banco de dados
def associar_especialidade():
    crm = entry_crm_associar.get()
    cod_especialidade = entry_cod_especialidade_associar.get()

    cursor = db.cursor()
    sql = "INSERT INTO Medico_Especialidade (CRM, cod_especialidade) VALUES (%s, %s)"
    values = (crm, cod_especialidade)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_crm_associar.delete(0, tk.END)
    entry_cod_especialidade_associar.delete(0, tk.END)

    cursor.close()

# Função para associar um convênio a um paciente no banco de dados
def associar_convenio():
    cpf = entry_cpf_associar.get()
    cod_convenio = entry_cod_convenio_associar.get()

    cursor = db.cursor()
    sql = "INSERT INTO Paciente_Convenio (CPF, cod_convenio) VALUES (%s, %s)"
    values = (cpf, cod_convenio)

    cursor.execute(sql, values)
    db.commit()

    # Limpa os campos de entrada após a inserção
    entry_cpf_associar.delete(0, tk.END)
    entry_cod_convenio_associar.delete(0, tk.END)

    cursor.close()

# Cria os campos de entrada e rótulos para inserção de um paciente
label_cpf = tk.Label(window, text="CPF:")
label_cpf.grid(row=0, column=0)
entry_cpf = tk.Entry(window)
entry_cpf.grid(row=0, column=1)

label_nome = tk.Label(window, text="Nome:")
label_nome.grid(row=1, column=0)
entry_nome = tk.Entry(window)
entry_nome.grid(row=1, column=1)

label_email = tk.Label(window, text="Email:")
label_email.grid(row=2, column=0)
entry_email = tk.Entry(window)
entry_email.grid(row=2, column=1)

label_telefone = tk.Label(window, text="Telefone:")
label_telefone.grid(row=3, column=0)
entry_telefone = tk.Entry(window)
entry_telefone.grid(row=3, column=1)

label_dt_nascimento = tk.Label(window, text="Data de Nascimento:")
label_dt_nascimento.grid(row=4, column=0)
entry_dt_nascimento = tk.Entry(window)
entry_dt_nascimento.grid(row=4, column=1)

button_inserir_paciente = tk.Button(window, text="Inserir Paciente", command=inserir_paciente)
button_inserir_paciente.grid(row=5, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para inserção de um exame
label_nome_exame = tk.Label(window, text="Nome:")
label_nome_exame.grid(row=6, column=0)
entry_nome_exame = tk.Entry(window)
entry_nome_exame.grid(row=6, column=1)

label_descricao_exame = tk.Label(window, text="Descrição:")
label_descricao_exame.grid(row=7, column=0)
entry_descricao_exame = tk.Entry(window)
entry_descricao_exame.grid(row=7, column=1)

label_valor_exame = tk.Label(window, text="Valor:")
label_valor_exame.grid(row=8, column=0)
entry_valor_exame = tk.Entry(window)
entry_valor_exame.grid(row=8, column=1)

button_inserir_exame = tk.Button(window, text="Inserir Exame", command=inserir_exame)
button_inserir_exame.grid(row=9, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para inserção de um convênio
label_nome_convenio = tk.Label(window, text="Nome:")
label_nome_convenio.grid(row=10, column=0)
entry_nome_convenio = tk.Entry(window)
entry_nome_convenio.grid(row=10, column=1)

label_taxa_convenio = tk.Label(window, text="Taxa:")
label_taxa_convenio.grid(row=11, column=0)
entry_taxa_convenio = tk.Entry(window)
entry_taxa_convenio.grid(row=11, column=1)

button_inserir_convenio = tk.Button(window, text="Inserir Convênio", command=inserir_convenio)
button_inserir_convenio.grid(row=12, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para inserção de uma especialidade
label_nome_especialidade = tk.Label(window, text="Nome:")
label_nome_especialidade.grid(row=13, column=0)
entry_nome_especialidade = tk.Entry(window)
entry_nome_especialidade.grid(row=13, column=1)

button_inserir_especialidade = tk.Button(window, text="Inserir Especialidade", command=inserir_especialidade)
button_inserir_especialidade.grid(row=14, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para inserção de um médico
label_crm_medico = tk.Label(window, text="CRM:")
label_crm_medico.grid(row=15, column=0)
entry_crm_medico = tk.Entry(window)
entry_crm_medico.grid(row=15, column=1)

label_email_medico = tk.Label(window, text="Email:")
label_email_medico.grid(row=16, column=0)
entry_email_medico = tk.Entry(window)
entry_email_medico.grid(row=16, column=1)

label_nome_medico = tk.Label(window, text="Nome:")
label_nome_medico.grid(row=17, column=0)
entry_nome_medico = tk.Entry(window)
entry_nome_medico.grid(row=17, column=1)

label_telefone_medico = tk.Label(window, text="Telefone:")
label_telefone_medico.grid(row=18, column=0)
entry_telefone_medico = tk.Entry(window)
entry_telefone_medico.grid(row=18, column=1)

button_inserir_medico = tk.Button(window, text="Inserir Médico", command=inserir_medico)
button_inserir_medico.grid(row=19, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para inserção de um pedido
label_cpf_pedido = tk.Label(window, text="CPF do Paciente:")
label_cpf_pedido.grid(row=20, column=0)
entry_cpf_pedido = tk.Entry(window)
entry_cpf_pedido.grid(row=20, column=1)

label_crm_pedido = tk.Label(window, text="CRM do Médico:")
label_crm_pedido.grid(row=21, column=0)
entry_crm_pedido = tk.Entry(window)
entry_crm_pedido.grid(row=21, column=1)

label_cod_exame_pedido = tk.Label(window, text="Código do Exame:")
label_cod_exame_pedido.grid(row=22, column=0)
entry_cod_exame_pedido = tk.Entry(window)
entry_cod_exame_pedido.grid(row=22, column=1)

label_data_hora_pedido = tk.Label(window, text="Data e Hora:")
label_data_hora_pedido.grid(row=23, column=0)
entry_data_hora_pedido = tk.Entry(window)
entry_data_hora_pedido.grid(row=23, column=1)

label_cod_convenio_pedido = tk.Label(window, text="Código do Convênio:")
label_cod_convenio_pedido.grid(row=24, column=0)
entry_cod_convenio_pedido = tk.Entry(window)
entry_cod_convenio_pedido.grid(row=24, column=1)

button_inserir_pedido = tk.Button(window, text="Inserir Pedido", command=inserir_pedido)
button_inserir_pedido.grid(row=25, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para associar uma especialidade a um médico
label_crm_associar = tk.Label(window, text="CRM do Médico:")
label_crm_associar.grid(row=26, column=0)
entry_crm_associar = tk.Entry(window)
entry_crm_associar.grid(row=26, column=1)

label_cod_especialidade_associar = tk.Label(window, text="Código da Especialidade:")
label_cod_especialidade_associar.grid(row=27, column=0)
entry_cod_especialidade_associar = tk.Entry(window)
entry_cod_especialidade_associar.grid(row=27, column=1)

button_associar_especialidade = tk.Button(window, text="Associar Especialidade ao Médico", command=associar_especialidade)
button_associar_especialidade.grid(row=28, column=0, columnspan=2)

# Cria os campos de entrada e rótulos para associar um convênio a um paciente
label_cpf_associar = tk.Label(window, text="CPF do Paciente:")
label_cpf_associar.grid(row=29, column=0)
entry_cpf_associar = tk.Entry(window)
entry_cpf_associar.grid(row=29, column=1)

label_cod_convenio_associar = tk.Label(window, text="Código do Convênio:")
label_cod_convenio_associar.grid(row=30, column=0)
entry_cod_convenio_associar = tk.Entry(window)
entry_cod_convenio_associar.grid(row=30, column=1)

button_associar_convenio = tk.Button(window, text="Associar Convênio ao Paciente", command=associar_convenio)
button_associar_convenio.grid(row=31, column=0, columnspan=2)

window.mainloop()
