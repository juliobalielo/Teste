unit untModelFiredacConexao;

interface

Uses untIConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.SysUtils;

Type
    TModelFiredacConexao = class(TInterfacedObject, iModelConexao)
    private
        FConexao : TFDConnection;
        Fdriver  : TFDPhysMySQLDriverLink;
    public
       constructor Create;
       destructor Destroy; override;
       class function New : iModelConexao;
       function Connection : TObject;
    end;

implementation

{ TModelFiredacConexao }

function TModelFiredacConexao.Connection: TObject;
begin
    Result := FConexao;
end;

constructor TModelFiredacConexao.Create;
begin
    Fdriver := TFDPhysMySQLDriverLink.Create(nil);
    Fdriver.VendorLib := 'C:\mysql-8.0.26-winx64\mysql-8.0.26-winx64\lib\libmysql.dll';
    FConexao := TFDConnection.Create(nil);
    FConexao.Params.DriverID := 'MySQL';//'FB';
    FConexao.Params.Database := 'db_teste';//'localhost/3050:C:\MVC_Blog\Database\DADOS.FDB';
    FConexao.Params.UserName := 'root';//'SYSDBA';
    FConexao.Params.Password := '61425546';//'masterkey';
    FConexao.Connected := true;
end;

destructor TModelFiredacConexao.Destroy;
begin
    FreeAndNil(FConexao);
    FreeAndNil(Fdriver);
    inherited;
end;

class function TModelFiredacConexao.New: iModelConexao;
begin
  Result := Self.Create;
end;

end.
