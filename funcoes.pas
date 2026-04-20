unit funcoes;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Winapi.Windows;

procedure LimparCampos(_AForm: TForm);
procedure FechaJanela(_ATecla: Word; _AForm: TForm);
procedure AtalhosAcesso(var Key: Word; _AUnit: TFormClass);

implementation

procedure LimparCampos(_AForm: TForm);
var
  i: Integer;
begin
  for i := 0 to _AForm.ComponentCount - 1 do begin
    if _AForm.Components[i] is TEdit then
      TEdit(_AForm.Components[i]).Clear
    else if _AForm.Components[i] is TMemo then
      TMemo(_AForm.Components[i]).Clear
    else if _AForm.Components[i] is TComboBox then
      TComboBox(_AForm.Components[i]).ItemIndex := -1
  end;
end;

procedure AtalhosAcesso(var Key: Word; _AUnit: TFormClass);
var
  AForm : TCustomForm; // Mesma coisa que o TForm, mas para funções genéricas
begin
  if Key = VK_F1 then begin
    AForm := _AUnit.Create(Application);
    Try
      AForm.ShowModal;
    finally
      AForm.Free;
    end;
  end;
end;

procedure FechaJanela(_ATecla: Word; _AForm: TForm);
begin
  if _ATecla = VK_ESCAPE then
    _AForm.Close;
end;

end.
