program Project1;

uses
  Vcl.Forms,
  principal in 'principal.pas' {frmPrincipal},
  movimentacoes in 'movimentacoes.pas' {frmMovimentacoes},
  conexao in 'conexao.pas',
  funcoes in 'funcoes.pas',
  insertsDAO in 'insertsDAO.pas',
  selectsDAO in 'selectsDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMovimentacoes, frmMovimentacoes);
  Application.Run;
end.
