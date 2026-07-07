import pytest
from main import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home(client):
    """Prueba que la ruta principal responda con un código 200 y el texto correcto"""
    rv = client.get('/')
    assert rv.status_code == 200
    assert b"Aplicacion DevOps Funcionando Exitosamente!" in rv.data
