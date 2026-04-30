unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  movimentacoes, funcoes, Vcl.StdCtrls, selectsDAO, conexao;

type
    TfrmPrincipal = class(TForm)
    eMenu: TMainMenu;
    Movimentaes1: TMenuItem;
    EntradaSada1: TMenuItem;
    lblDepositos: TLabel;
    lblSaques: TLabel;
    lblCaixa: TLabel;
    procedure EntradaSada1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.EntradaSada1Click(Sender: TObject);
begin

  frmMovimentacoes := TfrmMovimentacoes.Create(nil);
  frmMovimentacoes.ShowModal;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TConexao.Conectar;
  lblDepositos.Caption := 'Depósitos : R$' + FloatToStr(SelectSUMDepositosAndSaques(TConexao.GetConexao, True));
  lblSaques.Caption := 'Saques : R$' + FloatToStr(SelectSUMDepositosAndSaques(TConexao.GetConexao, False));
  lblCaixa.Caption := 'Total : R$' + FloatToStr(SelectTotalDepositosAndSaques(TConexao.GetConexao));
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AtalhosAcesso(Key, TfrmMovimentacoes);
end;

end.
