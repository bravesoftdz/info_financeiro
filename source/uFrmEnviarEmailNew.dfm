object frmEnviarPedido: TfrmEnviarPedido
  Left = 144
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enviar Pedido'
  ClientHeight = 483
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 169
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 46
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object Label2: TLabel
      Left = 16
      Top = 86
      Width = 17
      Height = 13
      Caption = 'CC:'
    end
    object Label3: TLabel
      Left = 16
      Top = 126
      Width = 41
      Height = 13
      Caption = 'Assunto:'
    end
    object Label6: TLabel
      Left = 16
      Top = 8
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object edtPara: TEdit
      Left = 16
      Top = 62
      Width = 393
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 1
    end
    object edtCC: TEdit
      Left = 16
      Top = 102
      Width = 393
      Height = 21
      CharCase = ecLowerCase
      TabOrder = 2
    end
    object edtAssunto: TEdit
      Left = 16
      Top = 142
      Width = 393
      Height = 21
      TabOrder = 3
    end
    object edtFromDe: TEdit
      Left = 16
      Top = 24
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 548
    Height = 107
    Align = alTop
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 0
      Width = 39
      Height = 13
      Caption = 'Anexo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbxAnexos: TListBox
      Left = 16
      Top = 16
      Width = 513
      Height = 56
      ItemHeight = 13
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 368
      Top = 76
      Width = 75
      Height = 25
      Caption = '&Anexar'
      TabOrder = 1
      OnClick = BitBtn3Click
    end
    object btnRemover: TBitBtn
      Left = 450
      Top = 76
      Width = 75
      Height = 25
      Caption = '&Remover'
      TabOrder = 2
      OnClick = btnRemoverClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 276
    Width = 548
    Height = 148
    Align = alClient
    TabOrder = 2
    object Label5: TLabel
      Left = 16
      Top = 0
      Width = 65
      Height = 13
      Caption = 'Mensagem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mmMensagem: TMemo
      Left = 16
      Top = 15
      Width = 513
      Height = 130
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 424
    Width = 548
    Height = 40
    Align = alBottom
    Color = clNavy
    TabOrder = 3
    object btnEnviar: TBitBtn
      Left = 364
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Enviar'
      TabOrder = 0
      OnClick = btnEnviarClick
    end
    object btnSair: TBitBtn
      Left = 452
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
        4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
        4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
        41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
        575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
        43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
        6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
        C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
        65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
        6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
        824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
        D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
        76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
        FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
        4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
        4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object statusBar: TStatusBar
    Left = 0
    Top = 464
    Width = 548
    Height = 19
    Panels = <
      item
        Width = 100
      end>
  end
  object IdSMTP: TIdSMTP
    OnStatus = IdSMTPStatus
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 424
    Top = 16
  end
  object OpenDialogAnexo: TOpenDialog
    Left = 472
    Top = 48
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 472
    Top = 16
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvSSLv2
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 424
    Top = 64
  end
end
