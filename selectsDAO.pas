unit selectsDAO;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, System.SysUtils, System.Classes;

function SelectSUMDepositosAndSaques(_AQuery: TFDQuery; _AOperacao: Boolean): Double;
function SelectTotalDepositosAndSaques(_AQuery: TFDQuery): Double;

implementation

function SelectSUMDepositosAndSaques(_AQuery: TFDQuery; _AOperacao: Boolean): Double;
begin
  Result := 0;
  if _AOperacao then begin
    _AQuery.Close;
    _AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) as total_depositos FROM movimentacoes m WHERE m.operacao = :operacao';
    _AQuery.ParamByName('operacao').AsString := 'Deposito';
    _AQuery.Open;
    Result := _AQuery.FieldByName('total_depositos').AsFloat;
  end else begin
    _AQuery.Close;
    _AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) as total_depositos FROM movimentacoes m WHERE m.operacao = :operacao';
    _AQuery.ParamByName('operacao').AsString := 'Saque';
    _AQuery.Open;
    Result := _AQuery.FieldByName('total_depositos').AsFloat;
  end;
end;

function SelectTotalDepositosAndSaques(_AQuery: TFDQuery): Double;
var
  ADepositos : Double;
  ASaques : Double;
begin
  Result := 0;
  _AQuery.Close;
  _AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) AS total_depositos FROM movimentacoes m WHERE m.operacao = :operacao';
  _AQuery.ParamByName('operacao').AsString := 'Deposito';
  _AQuery.Open;
  ADepositos := _AQuery.FieldByName('total_depositos').AsFloat;
  _AQuery.Close;
  _AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) AS total_saques FROM movimentacoes m WHERE m.operacao = :operacao';
  _AQuery.ParamByName('operacao').AsString := 'Saque';
  _AQuery.Open;
  ASaques := _AQuery.FieldByName('total_saques').AsFloat;
  Result := ADepositos - ASaques;
end;

end.
