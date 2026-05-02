object frmMovimentacoes: TfrmMovimentacoes
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 274
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 71
    Height = 15
    Caption = 'Valor em R$ : '
  end
  object Label2: TLabel
    Left = 343
    Top = 10
    Width = 60
    Height = 15
    Caption = 'Descri'#231#227'o : '
  end
  object eValor: TEdit
    Left = 84
    Top = 8
    Width = 253
    Height = 23
    TabOrder = 0
  end
  object eDescricao: TEdit
    Left = 406
    Top = 8
    Width = 253
    Height = 23
    TabOrder = 1
  end
  object bExecutar: TButton
    Left = 262
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 2
    OnClick = bExecutarClick
  end
  object bLimpar: TButton
    Left = 343
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = bLimparClick
  end
  object DBGridMovimentacoes: TDBGrid
    Left = 8
    Top = 123
    Width = 651
    Height = 141
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Data'
        Width = 107
        Visible = True
      end>
  end
  object eOperacaoGroup: TRadioGroup
    Left = 8
    Top = 37
    Width = 651
    Height = 36
    Caption = 'Opera'#231#227'o'
    Columns = 2
    Items.Strings = (
      'Dep'#243'sito'
      'Saque')
    TabOrder = 5
  end
  object DataSourcemMovimentacoes: TDataSource
    Left = 72
    Top = 80
  end
  object FDQueryMovimentacoes: TFDQuery
    Left = 200
    Top = 80
  end
end
