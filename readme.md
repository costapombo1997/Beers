


    => ViewController => ViewModel => Model
                        |
                        |
                         --- Repositiories

O ViewController tem acesso ao ViewModel mas nao o contrário (impossibilita delegates)

O ViewModel tem acesso ao Model mas não o contrário (impossibilida delegates)


Os repositiories fazem fetch de dados seja de bdd local ou do server.
Apenas o ViewModel comunica com Repositories/*
