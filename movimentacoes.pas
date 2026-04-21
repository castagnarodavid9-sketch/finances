unit movimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, conexao, funcoes, insertsDAO, selectsDAO, System.StrUtils;

type
  TfrmMovimentacoes = class(TForm)
    Label1: TLabel;
    eValor: TEdit;
    eOperacaoGroup: TPanel;
    Label2: TLabel;
    eDescricao: TEdit;
    eDeposito: TRadioButton;
    eSaque: TRadioButton;
    bExecutar: TButton;
    bLimpar: TButton;
    FDMovimentacoes: TFDQuery;
    DSMovimentacoes: TDataSource;
    lblDepositos: TLabel;
    lblSaques: TLabel;
    lblCaixa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bExecutarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bLimparClick(Sender: TObject);
  private
  public
  end;

var
  frmMovimentacoes: TfrmMovimentacoes;

implementation

{$R *.dfm}

procedure TfrmMovimentacoes.bExecutarClick(Sender: TObject);
var
  Operacao: string;
begin
  if eDeposito.Checked then
    Operacao := 'Deposito'
  else
    Operacao := 'Saque';
  if InsertTableMovimentacoes(FDMovimentacoes, eDescricao.Text, Operacao, StrToFloat(eValor.Text)) then
    Application.MessageBox('Movimentação salva com sucesso!', 'Aviso');
  LimparCampos(Self);
end;

procedure TfrmMovimentacoes.bLimparClick(Sender: TObject);
begin
  LimparCampos(frmMovimentacoes);
end;

procedure TfrmMovimentacoes.FormCreate(Sender: TObject);
begin
  ConectarBanco;
  FDMovimentacoes.Connection := conexao.financesDB;
  eDeposito.Checked := True;
  lblDepositos.Caption := 'Depósitos : R$ ' + IfThen((SelectSUMDepositosAndSaques(FDMovimentacoes, True) > 0), FloatToStr(SelectSUMDepositosAndSaques(FDMovimentacoes, True)), '0') + ',00';
  lblSaques.Caption := 'Saques : R$ ' + IfThen((SelectSUMDepositosAndSaques(FDMovimentacoes, False) > 0), FloatToStr(SelectSUMDepositosAndSaques(FDMovimentacoes, False)), '0') + ',00';
end;

procedure TfrmMovimentacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FechaJanela(Key, Self);
end;

end.
