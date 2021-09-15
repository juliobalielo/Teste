unit untModelFiredacQuery;

interface

Uses untIConexao,FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.SysUtils;

Type
  TModelFiredacQuery = class(TInterfacedObject, iModelQuery)
    private
      FQuery : TFDQuery;
      FConexao : iModelConexao;
    public
      constructor Create(aValue : iModelConexao);
      destructor Destroy; override;
      class function New(aValue : iModelConexao) : iModelQuery;
      function Query : TObject;
      function Open(aSQL : String) : iModelQuery;
      function ExecSQL(aSQL : String) : iModelQuery;
  end;

implementation

{ TModelFiredacQuery }

constructor TModelFiredacQuery.Create(aValue: iModelConexao);
begin
  FConexao := aValue;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConexao.Connection);
end;

destructor TModelFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelFiredacQuery.ExecSQL(aSQL: String): iModelQuery;
begin
  Result := Self;
  FQuery.ExecSQL(aSQL);
end;

class function TModelFiredacQuery.New(aValue: iModelConexao): iModelQuery;
begin
  Result := Self.Create(aValue);
end;

function TModelFiredacQuery.Open(aSQL: String): iModelQuery;
begin
  Result := Self;
  FQuery.Open(aSQL);
end;

function TModelFiredacQuery.Query: TObject;
begin
  Result := FQuery;
end;

end.
