unit uFrmCadPerdas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, DBXpress,
  jpeg, ToolEdit, CurrEdit;

type
  TfrmCadPerdas = class(TfrmCadastro)
    Label2: TLabel;
    cmbTipo: TDBLookupComboBox;
    Label3: TLabel;
    cmbProduto: TDBLookupComboBox;
    Label4: TLabel;
    cmbPerda: TDBLookupComboBox;
    Label5: TLabel;
    dbeQUANT: TDBEdit;
    Label1: TLabel;
    cdsConsultarPRO_CODIGO: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    Label6: TLabel;
    cmbLoja: TComboBox;
    Image1: TImage;
    qryProdutos: TSQLQuery;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    cmbLoja2: TComboBox;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel5: TPanel;
    BtAdicionar2: TBitBtn;
    BtEditar2: TBitBtn;
    BtExcluir2: TBitBtn;
    BtPesquisar2: TBitBtn;
    BtCancelar2: TBitBtn;
    BtGravar2: TBitBtn;
    BtSair2: TBitBtn;
    Image2: TImage;
    Label10: TLabel;
    edtDTVEND: TDateEdit;
    Label11: TLabel;
    edtEST_ATUAL: TCurrencyEdit;
    Label12: TLabel;
    edtTOTVendido: TCurrencyEdit;
    edtPercentual: TCurrencyEdit;
    edtPerda: TCurrencyEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    qryTotVendido: TSQLQuery;
    qryTotVendidoTOTAL: TFMTBCDField;
    qryEstoque: TSQLQuery;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure cmbTipoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPerdaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeQUANTKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionar2Click(Sender: TObject);
    procedure BtCancelar2Click(Sender: TObject);
    procedure BtGravar2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTVENDExit(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure edtPercentualChange(Sender: TObject);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure edtDTVENDKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    novo, alterar, apagar : String;
     procedure MOSTRA_DADOS;
     procedure tratabotoes;
     procedure tratabotoes2;
     procedure buscar;
     procedure CMB_LOJAS;
     function CDLOJA(M_NMLOJA : String) : integer;
     procedure DERIVADOS;
     procedure CONTROLES(M_FLUXO : String);
     function TOTAL_VENDIDO(M_CDPROD : String; M_DTVEND : TDate) : Double;
     function ESTOQUE_ATUAL(M_CDPROD : String; M_CDLOJA : Integer) : Double;     
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPerdas: TfrmCadPerdas;
  TD : TTransactionDesc;

implementation

uses Udm, uFuncoes, uFrmAdmin, udmConsulta;

{$R *.dfm}

{ TfrmCadPerdas }

procedure TfrmCadPerdas.MOSTRA_DADOS;
begin
     dm.parametros;
     dm.cdsPerda.Close;
     With dm.dstPerda do
     Begin
          Active := False;
          CommandText := 'Select * from HISTORICO_PERDA Where (HPD_SEQUENCIA = :pSEQUENCIA)';
          Params.ParamByName('pSEQUENCIA').AsInteger := uFuncoes.mvcodigo('HPD_SEQUENCIA','HISTORICO_PERDA');
          Active := True;
     End;
     dm.cdsPerda.Open;
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadPerdas.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select PRO_CODIGO, PRO_DESCRICAO from PRODUTOS ';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where PRO_CODIGO = ' + uFuncoes.StrZero(edtConsultar.Text,13);
      1: CommandText := CommandText + ' where UPPER(PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by PRO_CODIGO';
    Open;
    if IsEmpty then
    begin
      MessageDlg('Nenhum registro encontrado!' + #13 + 'Refa�a a pesquisa', mtInformation, [mbOk], 0);
      edtConsultar.Clear;
      if edtConsultar.CanFocus then
        edtConsultar.SetFocus;
    end;
  end;
end;

procedure TfrmCadPerdas.buscar;
begin
    dm.cdsPerda.Close;
    With dm.dstPerda do
    Begin
         Active := False;
         CommandText := 'Select * from HISTORICO_PERDA '+
                        'Where (HPD_PRODUTO = :pPRODUTO)';
         ParamByName('pPRODUTO').AsInteger := cdsConsultar.FieldByName('PRO_CODIGO').AsInteger;
         Active := True;
    End;
    dm.cdsPerda.Open;
end;

procedure TfrmCadPerdas.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled  := not BtCancelar.Enabled;
   BtGravar.Enabled    := not BtGravar.Enabled;
   BtSair.Enabled      := not BtSair.Enabled;
   cmbLoja.Enabled     := not cmbLoja.Enabled;
end;

procedure TfrmCadPerdas.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  CMB_LOJAS;
  dm.parametros;
  If (dm.cdsPerda.Active = False) Then
      dm.cdsPerda.Open;
  //     
  dm.cdsPerda.Append;
  cmbLoja.Enabled := True;
  dm.cdsPerdaHPD_SEQUENCIA.Value := dm.CdsConfigCFG_HISTORICOPERDA.Value+1;
  dm.cdsPerdaHPD_USUARIO.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
  cmbLoja.SetFocus;
end;

procedure TfrmCadPerdas.BtEditarClick(Sender: TObject);
begin
  inherited;
  if (dm.cdsPerda.RecordCount > 0) then
  Begin
      tratabotoes;
      dm.cdsPerda.Edit;
      cmbTipo.SetFocus;
  End;
end;

procedure TfrmCadPerdas.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dm.cdsPerda.Cancel;
  cmbLoja.Enabled := False;
end;

procedure TfrmCadPerdas.BtGravarClick(Sender: TObject);
Var
   M_QTANTE, M_QTATUA : Double;
   M_DTMOVI : TDate;
   M_HOMOVI  :String;
   M_CDLOJA, M_NRSEQU : Integer;
   M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;   
begin
  inherited;
  If uFuncoes.Empty(cmbLoja.Text) Then
  Begin
       Application.MessageBox('Selecione a loja!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbLoja.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(cmbProduto.Text) Then
  Begin
       Application.MessageBox('Selecione o produto!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbProduto.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(cmbPerda.Text) Then
  Begin
       Application.MessageBox('Selecione a descri��o da perda!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbPerda.SetFocus;
       Exit;
  End;
  //
  {If uFuncoes.Empty(cmbTipo.Text) Then
  Begin
       Application.MessageBox('Selecione o tipo!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbTipo.SetFocus;
       Exit;
  End;}
  //
  Try
      // Inicia um transa��o no BD
      TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
      TD.IsolationLevel := xilREADCOMMITTED;
      Dm.SqlAdmin.StartTransaction(TD);
      //
      M_CDLOJA := CDLOJA(cmbLoja.Text);
      M_DTMOVI := Date();
      M_HOMOVI := TimetoStr(Time);
      //
      tratabotoes;
      //
      if dm.cdsPerda.State in [dsinsert] then
      begin
          dm.parametros;
          dm.CdsConfig.Edit;
          dm.CdsConfigCGF_BAIRRO.Value   := dm.CdsConfigCGF_BAIRRO.Value+1;
          dm.CdsConfigCFG_HISTORICOPERDA.AsInteger := dm.CdsConfigCFG_HISTORICOPERDA.AsInteger+1;
          dm.cdsPerdaHPD_SEQUENCIA.Value := dm.CdsConfigCFG_HISTORICOPERDA.Value;
          dm.CdsConfig.ApplyUpdates(0);
      end;
      //
      dm.cdsPerdaHPD_DATA.Value      := M_DTMOVI;
      dm.cdsPerdaHPD_HORA.AsString   := M_HOMOVI;
      dm.cdsPerda.Post;
      dm.cdsPerda.ApplyUpdates(0);
      // Estoque
      Dm.cdsEstoque.Close;
      With Dm.dstEstoque do
      Begin
           Active := False;
           CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
           //
           Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
           Params.ParamByName('pCODIGO').AsString      := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Active := True;
      End;
      Dm.cdsEstoque.Open;
      //
      M_QTANTE := 0;
      If (Dm.cdsEstoque.IsEmpty) Then  // Se n�o encontrar
      begin
           Dm.cdsEstoque.Append;
           Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
           Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString      := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime   := M_DTMOVI;
           Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           //
           M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.Post;
           Dm.cdsEstoque.ApplyUpdates(0);
      End
      Else
      Begin
           Dm.cdsEstoque.Edit;
           //
           M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           //
           Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime   := M_DTMOVI;
           Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           //
           M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.Post;
           Dm.cdsEstoque.ApplyUpdates(0);
      End;
      // Historico
      dm.parametros;
      dm.CdsConfig.Edit;
      Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
             Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
      dm.CdsConfig.Post;
      dm.CdsConfig.ApplyUpdates(0);
      //
      M_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
      //
      With qryProdutos do
      Begin
           Close;
           Params.ParamByName('pCODIGO').AsString := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Open;
      End;
      //
      If not (qryProdutos.IsEmpty) Then
      Begin
           M_VLCOMP     := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
           M_VLCUST     := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
           M_VLVENDPRO  := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
      End;
      //
      Dm.cdsHistorico.Close;
      With Dm.dstHistorico do
      Begin
           Active := False;
           CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                         +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
           Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
           Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
           Params.ParamByName('pPRODUTO').AsString    := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Active := True;
      End;
      Dm.cdsHistorico.Open;
      //
      With Dm.cdsHistorico do
      Begin
           Append;
           FieldByName('HIS_SEQUENCIA').AsInteger := M_NRSEQU;
           FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
           FieldByName('HIS_PRODUTO').AsString    := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           FieldByName('HIS_UNIDADE').AsString    := Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString; 
           FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
           FieldByName('HIS_HORA').AsString       := M_HOMOVI;
           FieldByName('HIS_TIPO').AsString       := 'FP';
           FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
           FieldByName('HIS_MOVIMENTO').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
           FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
           FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
           FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;           
           FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
           // Grava
           Post;
           ApplyUpdates(0);
      End;
      //
      dm.cdsPerda.Close; 
      cmbLoja.Enabled := False;
      // Grava
      Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
      //
      Application.MessageBox('Registro gravado com sucesso!!!','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //  Cancelar transa��o no BD.
           Dm.SqlAdmin.Rollback(TD);
        End;
  End;
end;

procedure TfrmCadPerdas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  //tratabotoes;
  buscar;
  PageControl1.ActivePageIndex := 0;
  If (dm.cdsPerda.IsEmpty) Then
  Begin
      tratabotoes;
      dm.parametros;
      dm.cdsPerda.Append;
      dm.cdsPerdaHPD_SEQUENCIA.Value := dm.CdsConfigCFG_HISTORICOPERDA.Value+1;
      dm.cdsPerdaHPD_PRODUTO.AsString := cdsConsultar.FieldByName('PRO_CODIGO').AsString;
      dm.cdsPerdaHPD_DATA.Value      := Date();
      dm.cdsPerdaHPD_HORA.AsString   := TimetoStr(Time);
      dm.cdsPerdaHPD_USUARIO.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
      cmbTipo.SetFocus;
  End
  Else
  begin
      tratabotoes;
      dm.cdsPerda.Edit;
      cmbTipo.SetFocus;
  End;
end;

procedure TfrmCadPerdas.cmbTipoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(cmbTipo.Text) Then
     Begin
          Key := #0;
          //
          cmbProduto.SetFocus;
     End;
end;

procedure TfrmCadPerdas.cmbProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(cmbProduto.Text) Then
     Begin
          Key := #0;
          //
          cmbPerda.SetFocus;
     End;
end;

procedure TfrmCadPerdas.cmbPerdaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(cmbPerda.Text) Then
     Begin
          Key := #0;
          //
          dbeQUANT.SetFocus;
     End;
end;

procedure TfrmCadPerdas.dbeQUANTKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(dbeQUANT.Text) Then
     Begin
          Key := #0;
          //
          BtGravar.SetFocus;
     End;
end;

function TfrmCadPerdas.CDLOJA(M_NMLOJA: String): integer;
begin
     With dmConsultas.qryLoja do
     Begin
          SQL.Clear;
          Close;
          Sql.Add('Select EMP_CODIGO, EMP_FANTASIA from EMPRESAS');
          Sql.Add('Where (EMP_FANTASIA = :pNOME)');
          Params.ParamByName('pNOME').AsString := M_NMLOJA;
          Open;
     End;
     //
     If not (dmConsultas.qryLoja.IsEmpty) Then
       result := dmConsultas.qryLoja.FieldByname('EMP_CODIGO').AsInteger;
end;

procedure TfrmCadPerdas.CMB_LOJAS;
begin
    dm.CdsEmpresas.Close;
     With dm.SdsEmpresas do
     Begin
          Active := False;
          CommandText := 'Select * from EMPRESAS order by EMP_FANTASIA';
          Active := True;
     End;
     dm.CdsEmpresas.Open;
     //
     dm.CdsEmpresas.First;
     cmbLoja.Clear;
     cmbLoja2.Clear; 
     While not (dm.CdsEmpresas.Eof) do
     Begin
          cmbLoja.Items.Add(dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString);
          cmbLoja2.Items.Add(dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString);
          //
          dm.CdsEmpresas.Next;
     End;
     //
     dm.CdsEmpresas.Close;
end;

procedure TfrmCadPerdas.DERIVADOS;
begin
     dm.cdsDerivados.Close;
     With dm.dstDerivados do
     Begin
          Active := False;
          Commandtext := 'Select * from DERIVADOS Where (DER_ID = :pID)';
          Params.ParamByName('pID').AsInteger := dm.cdsPerdaHPD_TIPOABATE.AsInteger;
          Active := True;
     End;
     DM.cdsDerivados.Open;
end;

procedure TfrmCadPerdas.cmbTipoExit(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(cmbTipo.Text) Then
          DERIVADOS;
end;

procedure TfrmCadPerdas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dm.cdsPerda.Close;
    //
    Action := caFree;
end;

procedure TfrmCadPerdas.tratabotoes2;
begin
   BtAdicionar2.Enabled := not BtAdicionar2.Enabled;
   BtEditar2.Enabled    := not BtEditar2.Enabled;
   BtExcluir2.Enabled   := not BtExcluir2.Enabled;
   BtPesquisar2.Enabled := not BtPesquisar2.Enabled;
   BtCancelar2.Enabled  := not BtCancelar2.Enabled;
   BtGravar2.Enabled    := not BtGravar2.Enabled;
   BtSair2.Enabled      := not BtSair2.Enabled;
   cmbLoja2.Enabled     := not cmbLoja2.Enabled;
end;

procedure TfrmCadPerdas.BtAdicionar2Click(Sender: TObject);
begin
  inherited;
  tratabotoes2;
  CONTROLES('H');
  CMB_LOJAS;
  dm.parametros;
  If (dm.cdsPerda.Active = False) Then
      dm.cdsPerda.Open;
  //
  dm.cdsPerda.Append;
  cmbLoja.Enabled := True;
  dm.cdsPerdaHPD_SEQUENCIA.Value := dm.CdsConfigCFG_HISTORICOPERDA.Value+1;
  dm.cdsPerdaHPD_USUARIO.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
  cmbLoja2.SetFocus;
end;

procedure TfrmCadPerdas.BtCancelar2Click(Sender: TObject);
begin
  inherited;
      tratabotoes2;
      CONTROLES('D');
      dm.cdsPerda.Cancel;
end;

procedure TfrmCadPerdas.BtGravar2Click(Sender: TObject);
Var
   M_QTANTE, M_QTATUA : Double;
   M_DTMOVI : TDate;
   M_HOMOVI  :String;
   M_CDLOJA, M_NRSEQU : Integer;
   M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
begin
  inherited;
  If uFuncoes.Empty(cmbLoja2.Text) Then
  Begin
       Application.MessageBox('Selecione a loja!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       cmbLoja2.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(DBLookupComboBox1.Text) Then
  Begin
       Application.MessageBox('Selecione o produto!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       DBLookupComboBox1.SetFocus;
       Exit;
  End;
  //
  If uFuncoes.Empty(DBLookupComboBox2.Text) Then
  Begin
       Application.MessageBox('Selecione a descri��o da perda!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       DBLookupComboBox2.SetFocus;
       Exit;
  End;
  //
      If (edtDTVEND.Text = '  /  /    ') Then
      Begin
           Application.MessageBox('Digite a data da venda!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDTVEND.SetFocus;
           Exit;
      End;
      //
      If uFuncoes.Empty(edtPercentual.Text) Then
      Begin
           Application.MessageBox('Digite o percentual da perda!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtPercentual.SetFocus;
           Exit;
      End;
      //
  // Inicia um transa��o no BD
  TD.TransactionID  := StrtoInt(UFrmAdmin.M_CDUSUA);
  TD.IsolationLevel := xilREADCOMMITTED;
  Dm.SqlAdmin.StartTransaction(TD);
  //
  try
      //
      M_CDLOJA := CDLOJA(cmbLoja2.Text);
      M_DTMOVI := Date();
      M_HOMOVI := TimetoStr(Time);
      //
      tratabotoes2;
      //
      if dm.cdsPerda.State in [dsinsert] then
      begin
          dm.parametros;
          dm.CdsConfig.Edit;
          dm.CdsConfigCGF_BAIRRO.Value   := dm.CdsConfigCGF_BAIRRO.Value+1;
          dm.CdsConfigCFG_HISTORICOPERDA.AsInteger := dm.CdsConfigCFG_HISTORICOPERDA.AsInteger+1;
          dm.cdsPerdaHPD_SEQUENCIA.Value := dm.CdsConfigCFG_HISTORICOPERDA.Value;
          dm.CdsConfig.ApplyUpdates(0);
      end;
      //
      dm.cdsPerdaHPD_DATA.Value      := M_DTMOVI;
      dm.cdsPerdaHPD_HORA.AsString   := M_HOMOVI;
      dm.cdsPerdaHPD_QUANTIDADE.AsFloat := edtPerda.Value;
      //
      dm.cdsPerda.Post;
      dm.cdsPerda.ApplyUpdates(0);
      // Estoque
      Dm.cdsEstoque.Close;
      With Dm.dstEstoque do
      Begin
           Active := False;
           CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
           //
           Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
           Params.ParamByName('pCODIGO').AsString      := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Active := True;
      End;
      Dm.cdsEstoque.Open;
      //
      M_QTANTE := 0;
      If (Dm.cdsEstoque.IsEmpty) Then  // Se n�o encontrar
      begin
           Dm.cdsEstoque.Append;
           Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
           Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString      := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime   := M_DTMOVI;
           Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           //
           M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.Post;
           Dm.cdsEstoque.ApplyUpdates(0);
      End
      Else
      Begin
           Dm.cdsEstoque.Edit;
           //
           M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           //
           Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime   := M_DTMOVI;
           Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat   :=
                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           //
           M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
           Dm.cdsEstoque.Post;
           Dm.cdsEstoque.ApplyUpdates(0);
      End;
      // Historico
      dm.parametros;
      dm.CdsConfig.Edit;
      Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
             Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
      dm.CdsConfig.Post;
      dm.CdsConfig.ApplyUpdates(0);
      //
      M_NRSEQU := Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsInteger;
      //
      With qryProdutos do
      Begin
           Close;
           Params.ParamByName('pCODIGO').AsString := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Open;
      End;
      //
      If not (qryProdutos.IsEmpty) Then
      Begin
           M_VLCOMP     := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
           M_VLCUST     := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
           M_VLVENDPRO  := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
      End;
      //
      Dm.cdsHistorico.Close;
      With Dm.dstHistorico do
      Begin
           Active := False;
           CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                         +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
           Params.ParamByName('pSEQUENCIA').AsInteger := M_NRSEQU;
           Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
           Params.ParamByName('pPRODUTO').AsString    := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           Active := True;
      End;
      Dm.cdsHistorico.Open;
      //
      With Dm.cdsHistorico do
      Begin
           Append;
           FieldByName('HIS_SEQUENCIA').AsInteger := M_NRSEQU;
           FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
           FieldByName('HIS_PRODUTO').AsString    := dm.cdsPerda.FieldByName('HPD_PRODUTO').AsString;
           FieldByName('HIS_UNIDADE').AsString    := Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString;
           FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
           FieldByName('HIS_HORA').AsString       := M_HOMOVI;
           FieldByName('HIS_TIPO').AsString       := 'FP';
           FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
           FieldByName('HIS_MOVIMENTO').AsFloat   := dm.cdsPerda.FieldByName('HPD_QUANTIDADE').AsFloat;
           FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
           FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
           FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
           FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
           FieldByName('HIS_USUARIO').AsInteger   := StrtoInt(UFrmAdmin.M_CDUSUA);
           // Grava
           Post;
           ApplyUpdates(0);
      End;
      //
      dm.cdsPerda.Close;
      cmbLoja.Enabled := False;
      // Grava
      Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
      //
      Application.MessageBox('Registro gravado com sucesso!!!','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
      //
      CONTROLES('D');
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //  Cancelar transa��o no BD.
           Dm.SqlAdmin.Rollback(TD);
        End;
  End;
end;

procedure TfrmCadPerdas.CONTROLES(M_FLUXO: String);
begin
     If (M_FLUXO = 'H') Then
      begin
           edtDTVEND.Enabled     := True;
           edtPercentual.Enabled := True;
           edtEST_ATUAL.Enabled  := True;
           edtTOTVendido.Enabled := True;
           edtPerda.Enabled      := True;
      End
      Else
      begin
           edtDTVEND.Enabled     := False;
           edtPercentual.Value   := 0;
           edtPercentual.Enabled := False;
           //
           edtEST_ATUAL.Value    := 0;
           edtEST_ATUAL.Enabled  := False;
           edtTOTVendido.Value   := 0;
           edtTOTVendido.Enabled := False;
           edtPerda.Value        := 0;
           edtPerda.Enabled      := False;
           //
           cmbLoja2.Clear;
           edtDTVEND.Clear;  
      End;
end;

procedure TfrmCadPerdas.FormShow(Sender: TObject);
begin
  inherited;
      CONTROLES('D');
end;

procedure TfrmCadPerdas.edtDTVENDExit(Sender: TObject);
begin
  inherited;
     If (edtDTVEND.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTVEND.Text);
              edtDTVEND.Text := DatetoStr(StrToDate(edtDTVEND.Text));
              //
              If (StrToDate(edtDTVEND.Text)>Date()) Then
              Begin
                   Application.MessageBox(PChar('Data do pedido deve ser menor que a atual!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTVEND.Clear;
                   edtDTVEND.SetFocus;
                   Exit;
              End;
              //
              edtEST_ATUAL.Value  := ESTOQUE_ATUAL(dm.cdsPerdaHPD_PRODUTO.AsString,
                            CDLOJA(cmbLoja2.Text));
              edtTOTVendido.Value := TOTAL_VENDIDO(dm.cdsPerdaHPD_PRODUTO.AsString ,
                                      edtDTVEND.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTVEND.Clear;
                     edtDTVEND.SetFocus;
                End;
           end;
     End;
end;

function TfrmCadPerdas.TOTAL_VENDIDO(M_CDPROD: String; M_DTVEND : TDate): Double;
begin
     With qryTotVendido do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Params.ParamByName('pDATA').AsDate     := M_DTVEND;
           Params.ParamByName('pTIPO').AsString   := 'V';
           Open;
      End;
      //
      If not (qryTotVendido.IsEmpty) Then
          result := qryTotVendido.FieldByName('TOTAL').AsCurrency
      Else
          result := 0;
end;

function TfrmCadPerdas.ESTOQUE_ATUAL(M_CDPROD: String;
  M_CDLOJA: Integer): Double;
begin
     With qryEstoque do
      begin
           Close;
           Params.ParamByName('pCODIGO').AsString := M_CDPROD;
           Params.ParamByName('pLOJA').AsInteger  := M_CDLOJA;
           Open;
      End;
      //
      result := qryEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
end;

procedure TfrmCadPerdas.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(DBLookupComboBox1.Text) Then
     Begin
          Key := #0;
          //
          DBLookupComboBox2.SetFocus;
     End;
end;

procedure TfrmCadPerdas.edtPercentualChange(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(edtPercentual.Text)
       and (edtPercentual.Value > 0) Then
          edtPerda.Value := uFuncoes.Gerapercentual(edtTOTVendido.Value, edtPercentual.Value)
     Else
          edtPerda.Value := 0;
end;

procedure TfrmCadPerdas.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (Key = #13) and not uFuncoes.Empty(DBLookupComboBox2.Text) Then
     Begin
          Key := #0;
          //
          edtDTVEND.SetFocus;
     End;
end;

procedure TfrmCadPerdas.edtDTVENDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If (Key = #13) and (edtDTVEND.Text <> '  /  /    ') Then
     Begin
          Key := #0;
          //
          edtPercentual.SetFocus;
     End;
end;

procedure TfrmCadPerdas.FormCreate(Sender: TObject);
begin
  inherited;
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Abate...'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
   End;
end;

end.
