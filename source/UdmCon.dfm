object DmCon: TDmCon
  OldCreateOrder = False
  Left = 238
  Top = 142
  Height = 294
  Width = 424
  object SdsEmpresas: TSQLDataSet
    CommandText = 'SELECT EMP_CODIGO, EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM EMPRESAS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 120
    Top = 16
  end
  object DspEmpresas: TDataSetProvider
    DataSet = SdsEmpresas
    Left = 192
    Top = 16
  end
  object CdsEmpresas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DspEmpresas'
    Left = 264
    Top = 16
    object CdsEmpresasEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object CdsEmpresasEMP_CNPJ: TStringField
      FieldName = 'EMP_CNPJ'
      Required = True
      Size = 14
    end
    object CdsEmpresasEMP_FANTASIA: TStringField
      FieldName = 'EMP_FANTASIA'
      Size = 50
    end
    object CdsEmpresasEMP_RAZAO: TStringField
      FieldName = 'EMP_RAZAO'
      Size = 50
    end
  end
  object DsEmpresas: TDataSource
    AutoEdit = False
    DataSet = CdsEmpresas
    Left = 336
    Top = 16
  end
  object SdsClientes: TSQLDataSet
    CommandText = 'SELECT CLI_CODIGO,CLI_FANTASIA,CLI_RAZAO  FROM CLIENTES'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dm.SqlAdmin
    Left = 120
    Top = 72
  end
  object DsClientes: TDataSource
    AutoEdit = False
    DataSet = CdsClientes
    Left = 336
    Top = 72
  end
  object CdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspClientes'
    Left = 256
    Top = 72
  end
  object DspClientes: TDataSetProvider
    DataSet = SdsClientes
    Left = 192
    Top = 72
  end
end
