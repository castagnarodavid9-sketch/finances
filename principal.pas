unit principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  movimentacoes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PGDef, FireDAC.Phys.PG, funcoes,
  Vcl.StdCtrls, selectsDAO, conexao;

type
    TfrmPrincipal = class(TForm)
    eMenu: TMainMenu;
    Movimentaes1: TMenuItem;
    EntradaSada1: TMenuItem;
    lblDepositos: TLabel;
    lblSaques: TLabel;
    lblTotal: TLabel;
    DSMovimentacoes: TDataSource;
    FDMovimentacoes: TFDQuery;
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
  ConectarBanco;
  FDMovimentacoes.Connection := financesDB;
  lblDepositos.Caption := 'Depósitos : R$' + FloatToStr(SelectSUMDepositosAndSaques(FDMovimentacoes, True)) + ',00';
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  AtalhosAcesso(Key, TfrmMovimentacoes);
end;

end.
