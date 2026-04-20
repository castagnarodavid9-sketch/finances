unit insertsDAO;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, System.SysUtils;

function InsertTableMovimentacoes(_AQuery: TFDQuery; const ADescricao, AOperacao: string; AValor: Double): Boolean;

implementation

function InsertTableMovimentacoes(_AQuery: TFDQuery; const ADescricao, AOperacao: string; AValor: Double): Boolean;
begin
  Result := False;
  try
    _AQuery.Close;
    _AQuery.SQL.Text :=
      'INSERT INTO movimentacoes ' +
      '(descricao, operacao, vlr_operacao, created_at, updated_at) ' +
      'VALUES (:descricao, :operacao, :vlr_operacao, :created_at, :updated_at)';
    _AQuery.ParamByName('descricao').AsString := ADescricao;
    _AQuery.ParamByName('operacao').AsString := AOperacao;
    _AQuery.ParamByName('vlr_operacao').AsFloat := AValor;
    _AQuery.ParamByName('created_at').AsDateTime := Now;
    _AQuery.ParamByName('updated_at').AsDateTime := Now;
    _AQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

end.
