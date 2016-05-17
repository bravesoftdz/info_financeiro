inherited frmCadCheques: TfrmCadCheques
  Left = 235
  Top = 80
  Caption = 'Cadastro de Cheques'
  ClientHeight = 482
  ClientWidth = 584
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 584
    Height = 453
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label2: TLabel [0]
        Left = 16
        Top = -1
        Width = 23
        Height = 13
        Caption = 'Loja:'
        Transparent = True
      end
      object lbl_NMLOJA: TLabel [1]
        Left = 144
        Top = 21
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 37
        Width = 50
        Height = 13
        Caption = 'CPF/CGC:'
        Transparent = True
      end
      object Label1: TLabel [3]
        Left = 16
        Top = 76
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = dbeNOME
        Transparent = True
      end
      object Label4: TLabel [4]
        Left = 16
        Top = 116
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        FocusControl = dbeENDERECO
        Transparent = True
      end
      object Label5: TLabel [5]
        Left = 16
        Top = 156
        Width = 30
        Height = 13
        Caption = 'Bairro:'
        FocusControl = dbeBAIRRO
        Transparent = True
      end
      object Label6: TLabel [6]
        Left = 307
        Top = 156
        Width = 36
        Height = 13
        Caption = 'Cidade:'
        FocusControl = dbeCIDADE
        Transparent = True
      end
      object Label7: TLabel [7]
        Left = 16
        Top = 196
        Width = 27
        Height = 13
        Caption = 'Fone:'
        FocusControl = dbeFONE
        Transparent = True
      end
      object Label8: TLabel [8]
        Left = 266
        Top = 196
        Width = 53
        Height = 13
        Caption = 'Identidade:'
        FocusControl = dbeIDENTIDADE
        Transparent = True
      end
      object Label9: TLabel [9]
        Left = 416
        Top = 196
        Width = 36
        Height = 13
        Caption = 'Emisso:'
        FocusControl = dbeEMISSOR
        Transparent = True
      end
      object Label10: TLabel [10]
        Left = 479
        Top = 196
        Width = 17
        Height = 13
        Caption = 'UF:'
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 383
        Width = 576
        inherited BtEditar: TBitBtn
          Visible = False
        end
        inherited BtExcluir: TBitBtn
          Visible = False
        end
        inherited BtPesquisar: TBitBtn
          Visible = False
        end
      end
      object edtCDLOJA: TEdit
        Left = 16
        Top = 15
        Width = 121
        Height = 21
        MaxLength = 3
        TabOrder = 1
        OnChange = edtCDLOJAChange
        OnEnter = edtCDLOJAEnter
        OnExit = edtCDLOJAExit
        OnKeyPress = edtCDLOJAKeyPress
      end
      object edtCPFCGC: TEdit
        Left = 16
        Top = 53
        Width = 121
        Height = 21
        MaxLength = 14
        TabOrder = 2
        OnEnter = edtCPFCGCEnter
        OnExit = edtCPFCGCExit
      end
      object dbeNOME: TDBEdit
        Left = 16
        Top = 92
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLC_NOME'
        DataSource = Dm.dsClientesCheque
        TabOrder = 3
      end
      object dbeENDERECO: TDBEdit
        Left = 16
        Top = 132
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLC_ENDERECO'
        DataSource = Dm.dsClientesCheque
        TabOrder = 4
      end
      object dbeBAIRRO: TDBEdit
        Left = 16
        Top = 172
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLC_BAIRRO'
        DataSource = Dm.dsClientesCheque
        TabOrder = 5
      end
      object dbeCIDADE: TDBEdit
        Left = 304
        Top = 172
        Width = 237
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLC_CIDADE'
        DataSource = Dm.dsClientesCheque
        TabOrder = 6
      end
      object dbeFONE: TDBEdit
        Left = 16
        Top = 212
        Width = 134
        Height = 21
        DataField = 'CLC_FONE'
        DataSource = Dm.dsClientesCheque
        TabOrder = 7
      end
      object dbeIDENTIDADE: TDBEdit
        Left = 266
        Top = 212
        Width = 147
        Height = 21
        DataField = 'CLC_IDENTIDADE'
        DataSource = Dm.dsClientesCheque
        TabOrder = 8
        OnExit = dbeIDENTIDADEExit
      end
      object dbeEMISSOR: TDBEdit
        Left = 416
        Top = 212
        Width = 56
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLC_ORGAOEMISSO'
        DataSource = Dm.dsClientesCheque
        TabOrder = 9
      end
      object cmbUFCLIE: TDBComboBox
        Left = 479
        Top = 211
        Width = 61
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'CLC_UFEMISSO'
        DataSource = Dm.dsClientesCheque
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 10
        OnExit = cmbUFCLIEExit
      end
      object Panel5: TPanel
        Left = 0
        Top = 215
        Width = 576
        Height = 168
        Align = alBottom
        TabOrder = 11
        object Label11: TLabel
          Left = 17
          Top = 36
          Width = 92
          Height = 13
          Caption = 'Data Recebimento:'
          FocusControl = dbeDTRECE
          Transparent = True
        end
        object Label12: TLabel
          Left = 233
          Top = 36
          Width = 85
          Height = 13
          Caption = 'Data Vencimento:'
          FocusControl = dbeDTVENC
          Transparent = True
        end
        object Label13: TLabel
          Left = 17
          Top = 76
          Width = 34
          Height = 13
          Caption = 'Banco:'
          FocusControl = dbeCDBANC
          Transparent = True
        end
        object Label14: TLabel
          Left = 233
          Top = 76
          Width = 42
          Height = 13
          Caption = 'Ag'#234'ncia:'
          FocusControl = dbeNRAGEN
          Transparent = True
        end
        object Label15: TLabel
          Left = 366
          Top = 76
          Width = 49
          Height = 13
          Caption = 'N'#186'. Conta:'
          FocusControl = dbeNRCONT
          Transparent = True
        end
        object Label16: TLabel
          Left = 17
          Top = 116
          Width = 76
          Height = 13
          Caption = 'N'#186'. Documento:'
          FocusControl = dbeNRDOCU
          Transparent = True
        end
        object Label17: TLabel
          Left = 233
          Top = 116
          Width = 82
          Height = 13
          Caption = 'Valor do Cheque:'
          FocusControl = dbeVALOR
          Transparent = True
        end
        object lbl_NMBANC: TLabel
          Left = 64
          Top = 99
          Width = 161
          Height = 13
          AutoSize = False
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbeDTRECE: TDBEdit
          Left = 17
          Top = 52
          Width = 134
          Height = 21
          DataField = 'CHE_DTRECEBIMENTO'
          DataSource = Dm.dsCheques
          TabOrder = 0
        end
        object dbeDTVENC: TDBEdit
          Left = 233
          Top = 52
          Width = 134
          Height = 21
          DataField = 'CHE_DTVENCIMENTO'
          DataSource = Dm.dsCheques
          TabOrder = 1
          OnExit = dbeDTVENCExit
        end
        object dbeCDBANC: TDBEdit
          Left = 17
          Top = 92
          Width = 43
          Height = 21
          DataField = 'BAN_CODIGO'
          DataSource = Dm.dsCheques
          TabOrder = 2
          OnChange = dbeCDBANCChange
          OnExit = dbeCDBANCExit
        end
        object dbeNRAGEN: TDBEdit
          Left = 233
          Top = 92
          Width = 69
          Height = 21
          DataField = 'CHE_AGENCIA'
          DataSource = Dm.dsCheques
          TabOrder = 3
          OnExit = dbeNRAGENExit
        end
        object dbeNRCONT: TDBEdit
          Left = 366
          Top = 92
          Width = 160
          Height = 21
          DataField = 'CHE_CONTA'
          DataSource = Dm.dsCheques
          TabOrder = 4
          OnExit = dbeNRCONTExit
        end
        object dbeNRDOCU: TDBEdit
          Left = 17
          Top = 132
          Width = 108
          Height = 21
          DataField = 'CHE_DOCUMENTO'
          DataSource = Dm.dsCheques
          TabOrder = 5
          OnExit = dbeNRDOCUExit
        end
        object dbeVALOR: TDBEdit
          Left = 233
          Top = 132
          Width = 212
          Height = 21
          DataField = 'CHE_VALORDOCUMENTO'
          DataSource = Dm.dsCheques
          TabOrder = 6
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 574
          Height = 29
          Align = alTop
          BevelInner = bvRaised
          Caption = 'Dados do Cheque'
          Color = clBlue
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 576
      end
      inherited Panel3: TPanel
        Left = 542
        Height = 365
      end
      inherited grdConsultar: TDBGrid
        Width = 542
        Height = 365
      end
    end
  end
  inherited Panel4: TPanel
    Width = 584
  end
  object qryProcurar: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from EMPRESAS')
    SQLConnection = Dm.SqlAdmin
    Left = 396
    Top = 54
  end
end
