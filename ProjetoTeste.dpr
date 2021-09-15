program ProjetoTeste;

uses
  Vcl.Forms,
  untPrincipal in '..\Geral\untPrincipal.pas' {frmPrincipal},
  untIConexao in 'untIConexao.pas',
  untModelFiredacConexao in 'untModelFiredacConexao.pas',
  untModelFiredacQuery in 'untModelFiredacQuery.pas',
  untModelConexaoFactory in 'untModelConexaoFactory.pas',
  untModelEntidadeProdutos in '..\Entidades\untModelEntidadeProdutos.pas',
  untModelEntidadesFactory in '..\Entidades\untModelEntidadesFactory.pas',
  untIController in 'untIController.pas',
  untController in '..\Controller\untController.pas',
  untCadProdutos in '..\View\untCadProdutos.pas' {frmCadProdutos},
  untModelEntidadeFornecedores in '..\Entidades\untModelEntidadeFornecedores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  //Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.Run;
end.
