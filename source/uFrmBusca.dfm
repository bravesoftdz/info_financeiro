object frmBusca: TfrmBusca
  Left = 253
  Top = 200
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar'
  ClientHeight = 233
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 57
    Align = alTop
    TabOrder = 0
    object lblConsultar: TLabel
      Left = 8
      Top = 5
      Width = 84
      Height = 13
      Caption = 'Nome/Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtConsultar: TEdit
      Left = 7
      Top = 21
      Width = 386
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = edtConsultarChange
      OnKeyPress = edtConsultarKeyPress
    end
    object btnConsultar: TBitBtn
      Left = 317
      Top = 0
      Width = 75
      Height = 26
      Hint = 'Consultar'
      Caption = '&Consultar'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnClick = btnConsultarClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600D4F0FF00B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AAFF000092
        DC00007AB90000629600004A730000325000D4E3FF00B1C7FF008EABFF006B8F
        FF004873FF002557FF000055FF000049DC00003DB90000319600002573000019
        5000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000FF000000
        DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8EFF008F6B
        FF007348FF005725FF005500FF004900DC003D00B90031009600250073001900
        5000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00FF009200
        DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8EFF00FF6B
        FF00FF48FF00FF25FF00FF00FF00DC00DC00B900B90096009600730073005000
        5000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00AA00DC00
        9200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8EAB00FF6B
        8F00FF487300FF255700FF005500DC004900B9003D0096003100730025005000
        1900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FF000000DC00
        0000B9000000960000007300000050000000FFE3D400FFC7B100FFAB8E00FF8F
        6B00FF734800FF572500FF550000DC490000B93D000096310000732500005019
        0000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA0000DC92
        0000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF8E00FFFF
        6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B9000096960000737300005050
        0000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC
        00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF8E008FFF
        6B0073FF480057FF250055FF000049DC00003DB9000031960000257300001950
        0000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FF000000DC
        000000B90000009600000073000000500000D4FFE300B1FFC7008EFFAB006BFF
        8F0048FF730025FF570000FF550000DC490000B93D0000963100007325000050
        1900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FFAA0000DC
        920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFFFF006BFF
        FF0048FFFF0025FFFF0000FFFF0000DCDC0000B9B90000969600007373000050
        5000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAAAA009E9E
        9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A4A003E3E
        3E0032323200262626001A1A1A000E0E0E00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFF2F2F2
        F2F2F2F2F2F2F2FFFFFFFFFFF2EBE7E4E4E4E4E4E4E5F2F3F3FFFFF2E2F0E7E3
        E3E3E3E3E3EE1D0F1FF3F2EBF0EEE3E3E2E2E2E2EE1D0C241DF3F2E4E3E3E3E3
        E4E8E8EE1D0C241DF3FFF2E3E3E3E6EDF0F0F0F00C241DF3FFFFF2E3E3E6ED85
        858586791B1DF3FFFFFFF2E3E6EDE8839090858679F0F2FFFFFFF2E3E6ED838E
        8F90908586F0F2FFFFFFF2E3E6ED838E8F8F909086F0F2FFFFFFF2E3E6ED838E
        8F8F8F9086F0F2FFFFFFF2E3E4EDE6838E8F8F83E8F0F2FFFFFFF2E3E4E6EDE6
        838383E8F3E6F2FFFFFFF2E3E4E4E6EDEDEDEDEDE6E3F2FFFFFFF2E2E3E3E3E3
        E6E6E6E6E3E3F2FFFFFFF2F2F2F2F2F2F2F2F2F2F2F2F2FFFFFF}
    end
  end
  object grdConsultar: TDBGrid
    Left = 0
    Top = 57
    Width = 401
    Height = 176
    Align = alClient
    Ctl3D = False
    DataSource = dsBusca
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = grdConsultarDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'UNI_DESCRICAO'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 378
        Visible = True
      end>
  end
  object dstBusca: TSQLDataSet
    CommandText = 
      'Select UNI_CODIGO, UNI_DESCRICAO from UNIDADES '#13#10'Where UNI_DESCR' +
      'ICAO like :pNOME'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = '0'
      end>
    SQLConnection = Dm.SqlAdmin
    Left = 152
    Top = 112
  end
  object dspBusca: TDataSetProvider
    DataSet = dstBusca
    Options = [poAllowCommandText]
    Left = 192
    Top = 112
  end
  object cdsBusca: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = '0'
      end>
    ProviderName = 'dspBusca'
    Left = 232
    Top = 112
    object cdsBuscaUNI_CODIGO: TStringField
      FieldName = 'UNI_CODIGO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsBuscaUNI_DESCRICAO: TStringField
      FieldName = 'UNI_DESCRICAO'
      Size = 30
    end
  end
  object dsBusca: TDataSource
    DataSet = cdsBusca
    Left = 272
    Top = 112
  end
end
