unit uFrmCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, ExtDlgs, DBXpress,
  QuickRpt, QRCtrls;

type
  TfrmCadProdutos = class(TfrmCadastro)
    cdsConsultarPRO_CODIGO: TStringField;
    cdsConsultarPRO_DESCRICAO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbeBARRAS: TDBEdit;
    Label3: TLabel;
    dbeNMDESC: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    dbeCDFORN: TDBEdit;
    Label6: TLabel;
    dbeCDUNID: TDBEdit;
    TabSheet3: TTabSheet;
    spLocFornecedor: TSpeedButton;
    Label9: TLabel;
    cmbSecao: TDBLookupComboBox;
    Label10: TLabel;
    cdmSubSecao: TDBLookupComboBox;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    imgProduto: TDBImage;
    spLocUnidade: TSpeedButton;
    btFoto: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Label12: TLabel;
    dbeVLCOMP: TDBEdit;
    Label13: TLabel;
    dbeVLCUST: TDBEdit;
    Label14: TLabel;
    dbeVLVEND: TDBEdit;
    Label15: TLabel;
    dbeVLFRAC: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    dbeVLICMS: TDBEdit;
    Label18: TLabel;
    dbeVLTAXA: TDBEdit;
    Label19: TLabel;
    dbeVALIPI: TDBEdit;
    Label20: TLabel;
    dbeVLFRET: TDBEdit;
    Label21: TLabel;
    dbeLIMDES: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Label22: TLabel;
    DBEdit10: TDBEdit;
    qryBusca: TSQLQuery;
    Panel5: TPanel;
    BtAdicionar2: TBitBtn;
    BtEditar2: TBitBtn;
    BtExcluir2: TBitBtn;
    BtPesquisar2: TBitBtn;
    BtCancelar2: TBitBtn;
    BtGravar2: TBitBtn;
    BtSair2: TBitBtn;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    lbl_CODIGO: TLabel;
    Label29: TLabel;
    dbeLucroBruto: TDBEdit;
    Label30: TLabel;
    dbeLucroLiquido: TDBEdit;
    Label31: TLabel;
    cmbControle: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    cdsConsultarPRO_BARRAS: TStringField;
    Label34: TLabel;
    cmbCor: TDBLookupComboBox;
    Label35: TLabel;
    dbeReferencia: TDBEdit;
    rbtTipo: TDBRadioGroup;
    Label36: TLabel;
    dbeAntICMS: TDBEdit;
    Label37: TLabel;
    spbFornecedor: TSpeedButton;
    cdsConsultarPRO_VLVENDA: TFMTBCDField;
    cdsConsultarPRO_IPI: TFMTBCDField;
    cdsConsultarPRO_REFERENCIA: TStringField;
    dstConsProduto: TSQLDataSet;
    dspConsProduto: TDataSetProvider;
    cdsConsProduto: TClientDataSet;
    dsConsProduto: TDataSource;
    DBNavigator1: TDBNavigator;
    cdsConsProdutoPRO_CODIGO: TStringField;
    cdsConsProdutoPRO_DESCRICAO: TStringField;
    lbl_NMFORC: TEdit;
    cdsConsultarPRO_APLICACAO: TStringField;
    procedure btFotoClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure dbeBARRASExit(Sender: TObject);
    procedure dbeCDFORNExit(Sender: TObject);
    procedure dbeCDARMAExit(Sender: TObject);
    procedure dbeCDUNIDExit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure cdmSubSecaoEnter(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure spLocUnidadeClick(Sender: TObject);
    procedure spLocFornecedorClick(Sender: TObject);
    procedure spArmazenClick(Sender: TObject);
    procedure dbeBARRASKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVLCOMPExit(Sender: TObject);
    procedure dbeVLVENDExit(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCDFORNKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCDUNIDKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLucroLiquidoExit(Sender: TObject);
    procedure dbeLucroBrutoExit(Sender: TObject);
    procedure dbeNMDESCExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbFornecedorClick(Sender: TObject);
    procedure dbeReferenciaExit(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure rgConsultarClick(Sender: TObject);
  private
     novo, alterar, apagar : String;
     procedure tratabotoes;
     procedure buscar;
     procedure validar_fornecedor;
     procedure validar_unidade;
     procedure validar_armazenamento;
     procedure subsecao;
     procedure CALCULAR;
     procedure CALCULAR2;
     procedure Validar_CDBARRAS;
     procedure CONTROLE_LOTE;
     procedure CALCULO_LUCROS;
     procedure REGISTRO;
     procedure Navegar(aCodigo : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;
  M_VLCOMP, M_VLCUST, M_VLVEND, M_VLFLAC : Real;
  M_VLICMS, M_VLTAXA, M_VALIPI, M_VLFRET : Real;
  M_LIMDES : Real;

implementation

uses Udm, uFuncoes, uFrmBusca, uFrmLocFornec, udmConsulta, UFrmAdmin, UFrmFornecedor;

{$R *.dfm}

procedure TfrmCadProdutos.btFotoClick(Sender: TObject);
begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgProduto.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir foto!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  inherited;
end;

procedure TfrmCadProdutos.buscar;
begin
  dm.cdsProdutos.Close;
  With dm.dstProdutos do
  Begin
       Active := False;
       CommandText := 'Select * from PRODUTOS '+
                      'Where (PRO_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := cdsConsultar.FieldByName('PRO_CODIGO').AsString;
       Active := True;
  End;
  dm.cdsProdutos.FetchParams;
  dm.cdsProdutos.Open;
  //
  lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
end;

procedure TfrmCadProdutos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   cmbControle.Enabled := not cmbControle.Enabled;
   DBNavigator1.Enabled := not DBNavigator1.Enabled;  
   //
   BtAdicionar2.Enabled := not BtAdicionar2.Enabled;
   BtEditar2.Enabled := not BtEditar2.Enabled;
   BtExcluir2.Enabled := not BtExcluir2.Enabled;
   BtPesquisar2.Enabled := not BtPesquisar2.Enabled;
   BtCancelar2.Enabled := not BtCancelar2.Enabled;
   BtGravar2.Enabled := not BtGravar2.Enabled;
   BtSair2.Enabled := not BtSair2.Enabled;
   //
   spLocFornecedor.Enabled := not spLocFornecedor.Enabled;
   spLocUnidade.Enabled    := not spLocUnidade.Enabled;
   //spArmazen.Enabled       := not spArmazen.Enabled;
   spbFornecedor.Enabled   := not spbFornecedor.Enabled; 
   //
   btFoto.Enabled := not btFoto.Enabled;
end;

procedure TfrmCadProdutos.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI, aOperacao  : String;
   iUsuario : Integer;
begin
  If uFuncoes.Empty(dbeNMDESC.Text) Then
  Begin
       Application.MessageBox('Digite a descri��o do produto!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       PageControl1.ActivePageIndex := 0;
       dbeNMDESC.SetFocus;
       Exit;
  End;
  //
  if (rbtTipo.ItemIndex = -1) Then
  Begin
       Application.MessageBox('Selecione o tipo de produto!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       PageControl1.ActivePageIndex := 0;
       rbtTipo.SetFocus;
       Exit;
  End;
  //
  If (Dm.cdsProdutosPRO_VLCOMPRA.AsFloat <= 0)
   or uFuncoes.Empty(Dm.cdsProdutosPRO_VLCOMPRA.AsString) Then
   begin
       Application.MessageBox('Valor de compra inv�lido','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
       PageControl1.ActivePageIndex := 1;
       dbeVLCOMP.SetFocus;
       Exit;
   End;
   //
   iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
   M_HOMOVI := Copy(TimetoStr(time),1,5);
   tratabotoes;
  //
  Try
      //
      Dm.Start;
      If (dm.cdsProdutos.State in [dsinsert]) Then
       begin
           dm.parametros;
           dm.CdsConfig.Edit;
           dm.CdsConfigCFG_PRODUTO.Value := dm.CdsConfigCFG_PRODUTO.Value+1;
           dm.cdsProdutosPRO_CODIGO.Value := uFuncoes.StrZero(dm.CdsConfigCFG_PRODUTO.AsString,13);
           dm.cdsProdutosPRO_DTCADASTRO.AsDateTime := Date();
           dm.CdsConfig.ApplyUpdates(0);
           //
           Dm.cdsprodutosPRO_HOCADA .AsString   := M_HOMOVI;
           dm.cdsProdutosPRO_USUARIO_CAD.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
           //
           aOperacao := 'I';
       end
       Else
           aOperacao := 'A';
       //
       if dm.cdsProdutos.State in [dsEdit] then
         begin
              dm.cdsProdutosPRO_DTALTERACAO.AsDateTime := Date();
              Dm.cdsProdutosPRO_HOALTE.AsString        := M_HOMOVI;
              dm.cdsProdutosPRO_USUARIO_ALT.AsInteger  := StrtoInt(uFrmAdmin.M_CDUSUA);
         End;
       //
       If (cmbControle.Text = 'SIM') Then
           dm.cdsProdutos.FieldByName('PRO_CONTROLELOTE').AsString := 'S'
       Else
            dm.cdsProdutos.FieldByName('PRO_CONTROLELOTE').AsString := 'N';
       //
       dm.cdsProdutos.Post;
       dm.cdsProdutos.ApplyUpdates(0);
       //
       Dm.Comit(Dm.Transc);
       //
       Dm.Start;
       try
         If (aOperacao = 'I') Then
         begin
             If not (dm.IncluirTarefaUsuario( iUsuario,
              'Incluiu Produto : '+uFuncoes.StrZero(dm.cdsProdutosPRO_CODIGO.AsString,7)+' *F*')) Then
               ShowMessage('Erro ao adicionar tarefa do usu�rio.');
         End
         Else
         begin
             If not (dm.IncluirTarefaUsuario( iUsuario,
              'Alterou Produto : '+uFuncoes.StrZero(dm.CdsProdutosPRO_CODIGO.AsString,7)+' *F*')) Then
                ShowMessage('Erro ao adicionar tarefa do usu�rio.');
         End;
         Dm.Comit(Dm.Transc);
       Except
            Dm.Rollback;
       End;
       //
       lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           Dm.Rollback;
           dm.cdsProdutos.Cancel;
        End;
  End;
  //
  inherited;
end;

procedure TfrmCadProdutos.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  PageControl1.ActivePageIndex := 0;
  dm.parametros;
  dm.cdsProdutos.Append;
  lbl_NMFORC.Clear;
  DBRadioGroup1.ItemIndex := 0;
  dm.cdsProdutosPRO_CODIGO.Value := uFuncoes.StrZero(FloattoStr(dm.CdsConfigCFG_PRODUTO.Value + 1),13);
  dm.cdsProdutosPRO_COMISSIONADO.AsString := 'N';
  dm.cdsProdutosSEN_CODIGO.AsInteger := StrtoInt(uFrmAdmin.M_CDUSUA);
  dm.cdsProdutosPRO_FLPROD.AsString := 'P';
  lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
  //
  dbeBARRAS.SetFocus;
end;

procedure TfrmCadProdutos.BtEditarClick(Sender: TObject);
begin
  inherited;
  if dm.cdsProdutos.RecordCount > 0 then
  Begin
       tratabotoes;
       dm.cdsProdutos.Edit;
       CONTROLE_LOTE;
       lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
       If not (dm.cdsProdutosFOR_CODIGO.IsNull) or (dm.cdsProdutosFOR_CODIGO.AsInteger > 0) Then
            validar_fornecedor;
       If (PageControl1.ActivePageIndex = 0) Then
          dbeBARRAS.SetFocus
       Else
          dbeVLCOMP.SetFocus;
  End;
end;

procedure TfrmCadProdutos.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
  inherited;
  if dm.cdsProdutos.RecordCount > 0 then
     If Application.MessageBox('Deseja excluir este produto?', 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
     Begin
       aCodigo  := uFuncoes.StrZero(dm.cdsProdutosPRO_CODIGO.AsString,13);
       iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
       //
       dm.cdsProdutos.Delete;
       dm.cdsProdutos.ApplyUpdates(0);
       //
       If not (dm.IncluirTarefaUsuario(iUsuario,
          'Excluiu Produto : '+aCodigo+' *F*')) Then
            ShowMessage('Erro ao adicionar tarefa do usu�rio.');
       //
       REGISTRO;
     end
  else
      Application.MessageBox('N�o ha registro a ser excluido','ATEN��O',
        MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
end;

procedure TfrmCadProdutos.BtCancelarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  //
  If (dm.cdsProdutos.State in [dsInsert, dsEdit]) Then
   begin
       dm.cdsProdutos.Cancel;
       lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
   End;    
  //
  If (dm.cdsProdutos.IsEmpty) Then
     Close;
end;

procedure TfrmCadProdutos.btnConsultarClick(Sender: TObject);
begin
  inherited;
  with cdsConsultar do
  begin
    Close;
    CommandText := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS';
    case rgConsultar.ItemIndex of
      0: CommandText := CommandText + ' where PRO_CODIGO like ' + QuotedStr(uFuncoes.StrZero(edtConsultar.Text,13)+ '%');
      1: CommandText := CommandText + ' where UPPER(PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
    end;
    CommandText := CommandText + 'order by PRO_DESCRICAO';
    Open;
    //
    if IsEmpty then
    begin
        Close;
        CommandText := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS';
          case rgConsultar.ItemIndex of
              0: CommandText := CommandText + ' where PRO_BARRAS like ' + QuotedStr(uFuncoes.StrZero(edtConsultar.Text,13)+ '%');
          End;
       CommandText := CommandText + 'order by PRO_DESCRICAO';
       Open;
       //
       If IsEmpty then
        begin
            MessageDlg('Nenhum registro encontrado!' + #13 + 'Refa�a a pesquisa', mtInformation, [mbOk], 0);
              edtConsultar.Clear;
            if edtConsultar.CanFocus then
              edtConsultar.SetFocus;
        End;
    end;
  end;
end;

procedure TfrmCadProdutos.btnAlterarClick(Sender: TObject);
begin
  inherited;
    If not (cdsConsultar.IsEmpty) Then
    begin
         buscar;
         //
         cdsConsProduto.Locate('PRO_CODIGO',Dm.cdsProdutosPRO_CODIGO.AsString,[]);
         PageControl1.ActivePageIndex := 0;
         CONTROLE_LOTE;
         If not (dm.cdsProdutosFOR_CODIGO.IsNull) or (dm.cdsProdutosFOR_CODIGO.AsInteger > 0) Then
            validar_fornecedor;
         //
         subsecao;   
         dbeBARRAS.SetFocus;
    End;
end;

procedure TfrmCadProdutos.BtPesquisarClick(Sender: TObject);
begin
  inherited;
    PageControl1.ActivePageIndex := 2;
end;

procedure TfrmCadProdutos.dbeBARRASExit(Sender: TObject);
begin
  inherited;
     If (dm.cdsProdutos.State in [dsInsert])
     and not uFuncoes.Empty(dm.cdsProdutosPRO_BARRAS.AsString) Then
     begin
          //If uFuncoes.StrIsFloat(dm.cdsProdutosPRO_BARRAS.AsString) Then
             dm.cdsProdutosPRO_BARRAS.AsString :=
                uFuncoes.StrZero(dm.cdsProdutosPRO_BARRAS.AsString,13);
          //
          Validar_CDBARRAS;
     End;
     //
     If (dm.cdsProdutos.State in [dsEdit])
     and not uFuncoes.Empty(dm.cdsProdutosPRO_BARRAS.AsString) Then
     begin
          //If uFuncoes.StrIsFloat(dm.cdsProdutosPRO_BARRAS.AsString) Then
             dm.cdsProdutosPRO_BARRAS.AsString :=
                   uFuncoes.StrZero(dm.cdsProdutosPRO_BARRAS.AsString,13);
     End;
end;

procedure TfrmCadProdutos.validar_fornecedor;
var qraux : TSQLquery;
    texto : string;
begin
    texto := 'Select FOR_CODIGO, FOR_FANTASIA from FORNECEDORES Where (FOR_CODIGO = :pCODIGO)';
    QrAux := TSqlquery.Create(nil);
    with QrAux do
     try
       SQLConnection := dm.SQLAdmin;
       sql.Add(texto);
       Params.ParamByName('pCODIGO').AsInteger :=
             dm.cdsProdutosFOR_CODIGO.AsInteger;
       Open;
       //
       if (IsEmpty) Then
        begin
          Application.MessageBox('C�digo de fornecedor n�o cadastro!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          lbl_NMFORC.Clear;
          dbeCDFORN.Clear;
          dbeCDFORN.SetFocus;
          Exit;
        End
        Else
            lbl_NMFORC.Text := FieldByName('FOR_FANTASIA').AsString;
       finally
         free;
       end;

{  If not uFuncoes.Empty(dbeCDFORN.text) Then
  Begin
     With qryBusca do
     Begin
          SQL.Clear;
          Close;
          SQL.Add(' ');
          SQL.Add('');
          //
          Params.ParamByName('').AsInteger :=
             dm.cdsProdutosFOR_CODIGO.AsInteger;
          //
          Open;
     End;
     //
     If (qryBusca.IsEmpty) Then
     Begin

  End;}
end;

procedure TfrmCadProdutos.dbeCDFORNExit(Sender: TObject);
begin
  inherited;
     If (dm.cdsProdutos.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeCDFORN.Text) Then
      begin
          If not (dm.cdsProdutosFOR_CODIGO.IsNull) or (dm.cdsProdutosFOR_CODIGO.AsInteger > 0) Then
             validar_fornecedor;
           //
           If (dm.cdsProdutos.State in [dsInsert, dsEdit])
            and not uFuncoes.Empty(dbeCDFORN.Text) Then
              Dm.cdsProdutosPRO_IPI.AsFloat :=
                  uFuncoes.GetIpiFornecedor(Dm.cdsProdutosFOR_CODIGO.AsInteger);
      End;
end;

procedure TfrmCadProdutos.validar_armazenamento;
begin
    { With qryBusca do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select UNI_CODIGO from UNIDADES ');
          SQL.Add('Where (UNI_CODIGO = :pCODIGO)');
          //
          Params.ParamByName('pCODIGO').AsString :=
             dm.cdsProdutosUNI_ARMAZENAMENTO.AsString;
          //
          Open;
     End;
     //
     If (qryBusca.IsEmpty) Then
     Begin
          Application.MessageBox('C�digo n�o cadastrado!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCDARMA.SetFocus;
          dbeCDARMA.Clear;
          Exit;
     End; }
end;

procedure TfrmCadProdutos.validar_unidade;
begin
     With qryBusca do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select UNI_CODIGO from UNIDADES ');
          SQL.Add('Where (UNI_CODIGO = :pCODIGO)');
          //
          Params.ParamByName('pCODIGO').AsString :=
             dm.cdsProdutosUNI_CODIGO.AsString;
          //
          Open;
     End;
     //
     If (qryBusca.IsEmpty) Then
     Begin
          Application.MessageBox('C�digo n�o cadastrado!!!','ATEN��O',
             MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeCDUNID.SetFocus;
          dbeCDUNID.Clear;
          Exit;
     End;
end;

procedure TfrmCadProdutos.dbeCDARMAExit(Sender: TObject);
begin
  inherited;
{     If (dm.cdsProdutos.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeCDARMA.Text) Then
          validar_armazenamento;}
end;

procedure TfrmCadProdutos.dbeCDUNIDExit(Sender: TObject);
begin
  inherited;
     If (dm.cdsProdutos.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeCDUNID.Text) Then
         validar_unidade;
end;

procedure TfrmCadProdutos.TabSheet2Show(Sender: TObject);
begin
  inherited;
    Panel1.Visible := True;
end;

procedure TfrmCadProdutos.TabSheet3Show(Sender: TObject);
begin
  inherited;
    Panel1.Visible := False;
end;

procedure TfrmCadProdutos.TabSheet1Show(Sender: TObject);
begin
  inherited;
    Panel1.Visible := True;
end;

procedure TfrmCadProdutos.subsecao;
begin
   If not ufuncoes.Empty(cmbSecao.Text) Then
    begin
     dm.cdsSubSecao.Close;
     With dm.dstSubSecao do
     Begin
          Active := False;
          CommandText := 'Select * from SUBSECAO '+
                         'Where (SEC_CODIGO = :pCODIGO) '+
                         'order by SUB_DESCRICAO';
          ParamByName('pCODIGO').AsInteger := cmbSecao.KeyValue;
          Active := True;
     End;
     dm.cdsSubSecao.Open;
   End;
end;

procedure TfrmCadProdutos.cdmSubSecaoEnter(Sender: TObject);
begin
  inherited;
     If not uFuncoes.Empty(cmbSecao.Text) Then
     Begin
          subsecao;
     End
     Else
     Begin
          dm.cdsSubSecao.Close;
          cmbSecao.SetFocus;
     End;
end;

procedure TfrmCadProdutos.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    Key:= Upcase(Key);
end;

procedure TfrmCadProdutos.spLocUnidadeClick(Sender: TObject);
begin
  inherited;
  with TfrmBusca.create(self) do
  try
     uFrmBusca.M_NRFROM := 1;
     showmodal;
  finally
    free;
    If not uFuncoes.Empty(dbeCDUNID.Text) Then
      //  dbeCDARMA.SetFocus
    Else
        dbeCDUNID.SetFocus;
  end;
end;

procedure TfrmCadProdutos.spLocFornecedorClick(Sender: TObject);
begin
  inherited;
  with TfrmBuscaFornec.create(self) do
  try
     uFrmLocFornec.M_NRFROM := 1;
     showmodal;
  finally
    free;
    If not uFuncoes.Empty(dbeCDFORN.Text) Then
    begin
       If not (dm.cdsProdutosFOR_CODIGO.IsNull) or (dm.cdsProdutosFOR_CODIGO.AsInteger > 0) Then
           validar_fornecedor;
        dbeCDUNID.SetFocus
    End
    Else
        dbeCDFORN.SetFocus;
  end;
end;

procedure TfrmCadProdutos.spArmazenClick(Sender: TObject);
begin
  inherited;
 { with TfrmBusca.create(self) do
  try
     uFrmBusca.M_NRFROM := 2;
     showmodal;
  finally
    free;
    If not uFuncoes.Empty(dbeCDARMA.Text) Then
        dbeFracionado.SetFocus 
    Else
        dbeCDARMA.SetFocus;
  end;   }
end;

procedure TfrmCadProdutos.dbeBARRASKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    {If not( key in['0'..'9',#8, #13] ) then
      key:=#0;}
end;

procedure TfrmCadProdutos.CALCULAR;
begin
     M_VLCOMP := dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
     M_VLICMS := dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency;
     M_VLTAXA := dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency;
     M_VALIPI := dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency;
     M_VLFRET := dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency;
     M_VLVEND := dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
     //
     M_VLCUST := M_VLCOMP-uFuncoes.Gerapercentual(M_VLCOMP,M_VLICMS)+uFuncoes.Gerapercentual(M_VLCOMP,M_VLTAXA)
                 +uFuncoes.Gerapercentual(M_VLCOMP,M_VALIPI)+uFuncoes.Gerapercentual(M_VLCOMP,M_VLFRET);
     M_VLVEND := M_VLCOMP-uFuncoes.Gerapercentual(M_VLCOMP,M_VLICMS)+uFuncoes.Gerapercentual(M_VLCOMP,M_VLTAXA)
                 +uFuncoes.Gerapercentual(M_VLCOMP,M_VALIPI)+uFuncoes.Gerapercentual(M_VLCOMP,M_VLFRET);
     //
     dm.cdsProdutos.FieldByName('PRO_VLCUSTO').AsCurrency := M_VLCUST;
     dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency := M_VLVEND;
end;

procedure TfrmCadProdutos.dbeVLCOMPExit(Sender: TObject);
begin
    If (dm.cdsProdutos.State in [dsInsert, dsEdit] ) Then
    begin
         dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency :=
            uFuncoes.CALCULA_PRECOVENDA(dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                Dm.cdsProdutos.FieldByname('PRO_ANTECIPACAO_ICMS').AsFloat, 
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
         //
         dm.cdsProdutos.FieldByName('PRO_VLFRACAO').AsCurrency :=
           dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
         //CALCULO_LUCROS;
    End;
    //     CALCULAR;
  inherited;
end;

procedure TfrmCadProdutos.CALCULAR2;
begin
     M_VLCOMP := dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
     M_VLICMS := dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency;
     M_VLTAXA := dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency;
     M_VALIPI := dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency;
     M_VLFRET := dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency;
     M_VLVEND := dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
     //
     M_VLVEND := M_VLVEND-uFuncoes.Gerapercentual(M_VLVEND,M_VLICMS)+uFuncoes.Gerapercentual(M_VLVEND,M_VLTAXA)
                 +uFuncoes.Gerapercentual(M_VLVEND,M_VALIPI)+uFuncoes.Gerapercentual(M_VLVEND,M_VLFRET);
     //
     dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency := M_VLVEND;
end;

procedure TfrmCadProdutos.dbeVLVENDExit(Sender: TObject);
begin
    // Valor de venda
    If (dm.cdsProdutos.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsString)  Then
    begin
         dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency :=
            uFuncoes.VALOR_VENDA(dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
         //
         dm.cdsProdutos.FieldByName('PRO_VLFRACAO').AsCurrency :=
           dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
    End;
  inherited;
end;

procedure TfrmCadProdutos.Validar_CDBARRAS;
begin
     With dmConsultas.qryProdutos do
     Begin
          SQL.Clear;
          Close;
          SQL.Add('Select PRO_CODIGO, PRO_BARRAS from PRODUTOS Where (PRO_BARRAS = :pBARRAS)');
          Params.ParamByName('pBARRAS').AsString := dbeBARRAS.Text;
          Open;
     End;
     //
     If not (dmConsultas.qryProdutos.IsEmpty) Then
     Begin
          Application.MessageBox('C�digo de barras j� cadastrado!!!','ATEN��O',
                 MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbeBARRAS.SetFocus;
          dbeBARRAS.Clear;
          Exit;
     End;
end;

procedure TfrmCadProdutos.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
//  inherited;
  {if Key =#13 then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;}
  If (key = #37) Then
    key :=#0;
  //
  if (Key =#13) and not uFuncoes.Empty(edtConsultar.Text)then
  begin
      key :=#0;
      Perform(Wm_NextDlgCtl,0,0);
  end;  
  //
  if rgConsultar.ItemIndex = 0 then
  begin
    if not( key in['0'..'9', #8] ) then
    begin
      beep;
      key:=#0;
    end;
  end;

end;

procedure TfrmCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dm.cdsProdutos.Close;
     dmConsultas.cdsCores.Close;
     Dm.cdsTributacao.Close;
     //
     cdsConsProduto.Close;  
     //
     Action := caFree;
end;

procedure TfrmCadProdutos.CONTROLE_LOTE;
begin
     If not uFuncoes.Empty(dm.cdsProdutos.FieldByName('PRO_CONTROLELOTE').AsString ) Then
     Begin
          If (dm.cdsProdutos.FieldByName('PRO_CONTROLELOTE').AsString = 'S') Then
              cmbControle.ItemIndex := 0
          Else
              cmbControle.ItemIndex := 1;
     End
     Else
        cmbControle.ItemIndex := -1;
end;

procedure TfrmCadProdutos.dbeCDFORNKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (Key = #13)
       and uFuncoes.Empty(dbeCDFORN.Text) Then
     Begin
          Key := #0;
          spLocFornecedorClick(Sender);
     End;
end;

procedure TfrmCadProdutos.dbeCDUNIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If (Key = #13)
       and uFuncoes.Empty(dbeCDUNID.Text) Then
     Begin
          Key := #0;
          spLocUnidadeClick(Sender);
     End;
end;

procedure TfrmCadProdutos.dbeLucroLiquidoExit(Sender: TObject);
begin
  inherited;
    If (dm.cdsProdutos.State in [dsInsert, dsEdit] ) Then
    begin
         //
         dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency :=
            uFuncoes.CALCULA_LUCROLIQUIDO(
                dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
         //
         dm.cdsProdutos.FieldByName('PRO_VLFRACAO').AsCurrency :=
           dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
    End;
end;

procedure TfrmCadProdutos.dbeLucroBrutoExit(Sender: TObject);
begin
  inherited;
    If (dm.cdsProdutos.State in [dsInsert, dsEdit] ) Then
    begin
         dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency :=
           uFuncoes.CALCULA_LUCROBRUTO(dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
         //
         dm.cdsProdutos.FieldByName('PRO_VLFRACAO').AsCurrency :=
           dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
    End;
end;

procedure TfrmCadProdutos.CALCULO_LUCROS;
begin
     // Bruto
         dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency :=
           uFuncoes.CALCULA_LUCROBRUTO(dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
     // Liquido
         dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency :=
            uFuncoes.CALCULA_LUCROLIQUIDO(
                dm.cdsProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_IPI').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_FRETE').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_REDUCAOICMS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_TAXAS').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROBRUTO').AsCurrency,
                dm.cdsProdutos.FieldByName('PRO_LUCROLIQUIDO').AsCurrency,
                dm.cdsProdutos.FieldByName('TRI_CODIGO').AsInteger);
     //
     dm.cdsProdutos.FieldByName('PRO_VLFRACAO').AsCurrency :=
         dm.cdsProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
end;

procedure TfrmCadProdutos.dbeNMDESCExit(Sender: TObject);
begin
  inherited;
  If (Dm.cdsProdutos.State in [dsInsert])
    and not uFuncoes.Empty(dbeNMDESC.Text) Then
  begin
     With dmConsultas.qryConsulta do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select PRO_DESCRICAO from PRODUTOS Where (PRO_DESCRICAO = :pDESCRICAO)');
           Params.ParamByName('pDESCRICAO').AsString := dbeNMDESC.Text;
           Open;
           //
           If not (IsEmpty) Then
            begin
                 Application.MessageBox('Descri��o de produto j� cadastrado!!!','ATEN��O',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 dbeNMDESC.SetFocus;
                 dbeNMDESC.Clear;
                 Exit;
            End;
      End;
   End;
end;

procedure TfrmCadProdutos.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
   begin
         with cdsConsultar do
         begin
              Close;
              CommandText := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLVENDA, PRO_IPI, PRO_REFERENCIA, PRO_APLICACAO from PRODUTOS';
              case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' where PRO_CODIGO like ' + QuotedStr(uFuncoes.StrZero(edtConsultar.Text,13)+ '%');
                1: CommandText := CommandText + ' where UPPER(PRO_DESCRICAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                2: CommandText := CommandText + ' where UPPER(PRO_REFERENCIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                3: CommandText := CommandText + ' where UPPER(PRO_APLICACAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
              end;
              CommandText := CommandText + 'order by PRO_DESCRICAO';
              Open;
              //
              if (IsEmpty) and (rgConsultar.ItemIndex = 0) then
              begin
                  Close;
                  CommandText := 'Select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO from PRODUTOS';
                    case rgConsultar.ItemIndex of
                        0: CommandText := CommandText + ' where PRO_BARRAS like ' + QuotedStr(uFuncoes.StrZero(edtConsultar.Text,13)+ '%');
                    End;
                 CommandText := CommandText + 'order by PRO_DESCRICAO';
                 Open;
                 //
              end;
         end;  // fim-with
   End;  //fim-do-se
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
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
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Produtos e Servi�os...'));
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
     //
 
end;

procedure TfrmCadProdutos.REGISTRO;
begin
     With dm.cdsProdutos do
      begin
           Active := False;
           CommandText := 'Select * from PRODUTOS Where (PRO_CODIGO = :pCODIGO)';
           Params.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('PRO_CODIGO','PRODUTOS');
           Active := True;
      End;
end;

procedure TfrmCadProdutos.FormShow(Sender: TObject);
begin
  inherited;
  dm.RefreshCDS(Dm.CdsConfig);
  dm.cdsTributacao.Open;
  dmConsultas.cdsCores.Open;
  //
  If (dm.CdsConfigCFG_PRODUTO.AsInteger = 0) Then
  Begin
      {dm.cdsProdutos.Close;
      With dm.cdsProdutos do
      Begin
           Active := False;
           CommandText := 'Select * from PRODUTOS ';
           Active := True;
      End;
      dm.cdsProdutos.Open;}
      DM.FilterCDS(dm.cdsProdutos, fsInteger, '1');
  end
  Else
      REGISTRO;
  //
  If (dm.cdsProdutos.IsEmpty) Then
     BtAdicionarClick(Sender);
  //    
  CONTROLE_LOTE;
  lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
  lbl_NMFORC.Clear;
  If not (dm.cdsProdutosFOR_CODIGO.IsNull) or (dm.cdsProdutosFOR_CODIGO.AsInteger > 0) Then
      validar_fornecedor;
  //
  cdsConsProduto.Open;
end;

procedure TfrmCadProdutos.spbFornecedorClick(Sender: TObject);
begin
  inherited;
  with TfrmFornecedor.create(self) do
  try
    showmodal;
  finally
    free;
  end;
end;

procedure TfrmCadProdutos.dbeReferenciaExit(Sender: TObject);
begin
  inherited;
     if (Dm.cdsProdutos.State in [dsInsert]) Then
      begin
           If (uFuncoes.GetReferencia(dbeReferencia.Text) ) Then
            begin
                 Application.MessageBox('Refer�ncia j� cadastrada!!!','ATEN��O',
                      MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dbeReferencia.SetFocus;
               dbeReferencia.Clear;
               Exit;
            End;
      End;
end;

procedure TfrmCadProdutos.Navegar(aCodigo : String);
begin
  dm.cdsProdutos.Close;
  With dm.dstProdutos do
  Begin
       Active := False;
       CommandText := 'Select * from PRODUTOS '+
                      'Where (PRO_CODIGO = :pCODIGO)';
       ParamByName('pCODIGO').AsString := uFuncoes.StrZero(aCodigo,13) ;
       Active := True;
  End;
  dm.cdsProdutos.FetchParams;
  dm.cdsProdutos.Open;
  //
  lbl_CODIGO.Caption := Copy(dm.cdsProdutosPRO_CODIGO.Value,7,7);
  subsecao;
end;

procedure TfrmCadProdutos.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
          Navegar(cdsConsProdutoPRO_CODIGO.AsString);
end;

procedure TfrmCadProdutos.rgConsultarClick(Sender: TObject);
begin
//  inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'C�digo:';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Descri��o do Produto:';
      edtConsultar.Clear;
    end;
    2:
    begin
      lblConsultar.Caption := 'Refer�ncia:';
      edtConsultar.Clear;
    end;
    3:
    begin
      lblConsultar.Caption := 'Aplica��o/Localiza��o:';
      edtConsultar.Clear;
    end;

  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

end.
