from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Create a engine to the database
engine = create_engine('sqlite:///database.db')

# Create a base class for declarative class definitions
Base = declarative_base()

# Define the classes for each table
class Endereco(Base):
    __tablename__ = 'endereco'
    id = Column(Integer, primary_key=True)
    cep = Column(String)
    bairro = Column(String)
    cidade = Column(String)
    rua = Column(String)
    numero = Column(String)
    complemento = Column(String)

class Telefone(Base):
    __tablename__ = 'telefone'
    id = Column(Integer, primary_key=True)
    pessoal = Column(String)
    residencial = Column(String)
    profissional = Column(String)

class Email(Base):
    __tablename__ = 'email'
    id = Column(Integer, primary_key=True)
    pessoal = Column(String)
    profissional = Column(String)

# Create the tables in the database
Base.metadata.create_all(engine)

# Create a session to interact with the database
Session = sessionmaker(bind=engine)
session = Session()

# CRUDs for Endereco
endereco = Endereco(cep='12345', bairro='Test', cidade='Test', rua='Test', numero='123', complemento='Test')
session.add(endereco)
session.commit()

endereco = session.query(Endereco).filter_by(id=endereco.id).first()
print(endereco.cep)  # Should print '12345'

endereco.cep = 'Updated 12345'
session.commit()

endereco = session.query(Endereco).filter_by(id=endereco.id).first()
print(endereco.cep)  # Should print 'Updated 12345'

session.delete(endereco)
session.commit()

endereco = session.query(Endereco).filter_by(id=endereco.id).first()
print(endereco)  # Should print None

# CRUDs for Telefone
telefone = Telefone(pessoal='1234567890', residencial='1234567890', profissional='1234567890')
session.add(telefone)
session.commit()

telefone = session.query(Telefone).filter_by(id=telefone.id).first()
print(telefone.pessoal)  # Should print '1234567890'

telefone.pessoal = 'Updated 1234567890'
session.commit()

telefone = session.query(Telefone).filter_by(id=telefone.id).first()
print(telefone.pessoal)  # Should print 'Updated 1234567890'

session.delete(telefone)
session.commit()

telefone = session.query(Telefone).filter_by(id=telefone.id).first()
print(telefone)  # Should print None

# CRUDs for Email
email = Email(pessoal='test@example.com', profissional='test@example.com')
session.add(email)
session.commit()

email = session.query(Email).filter_by(id=email.id).first()
print(email.pessoal)  # Should print 'test@example.com'

email.pessoal = 'Updated test@example.com'
session.commit()

email = session.query(Email).filter_by(id=email.id).first()
print(email.pessoal)  # Should print 'Updated test@example.com'

session.delete(email)
session.commit()

email = session.query(Email).filter_by(id=email.id).first()
print(email)  # Should print None

# Close the session
session.close()