unit untIConexao;

interface

Uses Data.DB;


type

    iModelQuery = interface;

    iModelConexao = interface
        function Connection : TObject;
    end;

    iModelConexaoFactory = interface
        function Conexao : iModelConexao;
        function Query : iModelQuery;
    end;

    iModelQuery = interface
        function Query : TObject;
        function Open(aSQL : String) : iModelQuery;
        function ExecSQL(aSQL : String) : iModelQuery;
    end;

    iModelEntidade = interface
        function DataSet ( aValue : TDataSource ) : iModelEntidade;
        procedure Open;
        procedure Busca (aTipo: Integer; aFiltro: String);
        procedure Grava;
    end;
    iModelEntidadeFactory = interface
        function Produto : iModelEntidade;
        function Fornecedor : iModelEntidade;
    end;


implementation

end.
