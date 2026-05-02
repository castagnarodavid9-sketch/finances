unit movimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, conexao, funcoes, insertsDAO, selectsDAO, System.StrUtils,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMovimentacoes = class(TForm)
    Label1: TLabel;
    eValor: TEdit;
    Label2: TLabel;
    eDescricao: TEdit;
    bExecutar: TButton;
    bLimpar: TButton;
    DBGridMovimentacoes: TDBGrid;
    eOperacaoGroup: TRadioGroup;
    DataSourcemMovimentacoes: TDataSource;
    FDQueryMovimentacoes: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure bExecutarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bLimparClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure CarregarGrid;
    procedure ConfigurarColunasGrid;
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
  if eOperacaoGroup.ItemIndex = 0 then
    Operacao := 'Deposito'
  else
    Operacao := 'Saque';
  if InsertTableMovimentacoes(TConexao.GetConexao, eDescricao.Text, Operacao, StrToFloat(eValor.Text)) then
    Application.MessageBox('Movimentação salva com sucesso!', 'Aviso');
  LimparCampos(Self);
end;

procedure TfrmMovimentacoes.bLimparClick(Sender: TObject);
begin
  LimparCampos(frmMovimentacoes);
end;

procedure TfrmMovimentacoes.FormCreate(Sender: TObject);
begin
  FDQueryMovimentacoes := TFDQuery.Create(Self);
  DataSourcemMovimentacoes := TDataSource.Create(Self);
  FDQueryMovimentacoes.Connection := TConexao.GetConexao;
  DataSourcemMovimentacoes.DataSet := FDQueryMovimentacoes;
  DBGridMovimentacoes.DataSource := DataSourcemMovimentacoes;
  eOperacaoGroup.ItemIndex := 0;
  CarregarGrid;
end;

procedure TfrmMovimentacoes.FormDestroy(Sender: TObject);
begin
  FDQueryMovimentacoes.Close;
end;

procedure TfrmMovimentacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FechaJanela(Key, Self);
end;

procedure TfrmMovimentacoes.CarregarGrid;
begin
  FDQueryMovimentacoes.Close;
  FDQueryMovimentacoes.SQL.Clear;
  FDQueryMovimentacoes.SQL.Add('SELECT id, descricao, operacao, vlr_operacao, created_at FROM movimentacoes');
  FDQueryMovimentacoes.Open;
  ConfigurarColunasGrid;
end;

procedure TfrmMovimentacoes.ConfigurarColunasGrid;
begin
  DBGridMovimentacoes.Columns[0].FieldName := 'id';
  DBGridMovimentacoes.Columns[0].Title.Caption := 'Código';
  DBGridMovimentacoes.Columns[0].Width := 80;
  DBGridMovimentacoes.Columns[1].FieldName := 'descricao';
  DBGridMovimentacoes.Columns[1].Title.Caption := 'Descrição';
  DBGridMovimentacoes.Columns[1].Width := 250;
  DBGridMovimentacoes.Columns[2].FieldName := 'operacao';
  DBGridMovimentacoes.Columns[2].Title.Caption := 'Operação';
  DBGridMovimentacoes.Columns[2].Width := 120;
  DBGridMovimentacoes.Columns[3].FieldName := 'vlr_operacao';
  DBGridMovimentacoes.Columns[3].Title.Caption := 'Valor';
  DBGridMovimentacoes.Columns[3].Width := 100;
  DBGridMovimentacoes.Columns[3].Alignment := taRightJustify;
end;

end.
