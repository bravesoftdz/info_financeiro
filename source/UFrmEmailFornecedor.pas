unit UFrmEmailFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  FMTBcd, DB, SqlExpr, Provider, DBClient, Shellapi;

type
  TfrmEmailForn = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    grdConsultar: TDBGrid;
    BtSair: TBitBtn;
    dstConsulta: TSQLDataSet;
    cdsConsultaForn: TClientDataSet;
    dsConsulta: TDataSource;
    dspConsulta: TDataSetProvider;
    cdsConsultaFornMOV_PEDIDO: TIntegerField;
    cdsConsultaFornFOR_FANTASIA: TStringField;
    cdsConsultaFornMOV_DATAVENDA: TDateField;
    cdsConsultaFornMOV_CLIENTE: TIntegerField;
    cdsConsultaFornMOV_VALOR: TFMTBCDField;
    cdsConsultaFornMOV_NOMECLIENTE: TStringField;
    cdsConsultaFornMOV_SITUACAO: TStringField;
    cdsConsultaFornMOV_VENDEDOR: TIntegerField;
    cdsConsultaFornMOV_DESCONTO: TFMTBCDField;
    cdsConsultaFornMOV_HORAVENDA: TStringField;
    cdsConsultaFornMOV_TABELA: TIntegerField;
    cdsConsultaFornMOV_ACRESCIMO: TFMTBCDField;
    cdsConsultaFornMOV_TIPO_FRETE: TStringField;
    cdsConsultaFornMOV_PERC_FRETE: TFMTBCDField;
    cdsConsultaFornMOV_IDTRANSPORTADORA: TIntegerField;
    cdsConsultaFornMOV_TABELA_PLANO: TIntegerField;
    btnEmail: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtDTINIC: TDateEdit;
    btConfirma: TBitBtn;
    cmbFornecedor: TComboBox;
    ListBox1: TListBox;
    btnOutlook: TBitBtn;
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure dsConsultaStateChange(Sender: TObject);
    procedure btnOutlookClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fornecedores;
  public
    { Public declarations }
  end;

var
  frmEmailForn: TfrmEmailForn;

implementation

uses udmConsulta, Udm, uFuncoes, uFrmEnviarEmailNew, UFrmAdmin,
  uDmRelatorios;

{$R *.dfm}

procedure TfrmEmailForn.BtSairClick(Sender: TObject);
begin
       Close;
end;

procedure TfrmEmailForn.Fornecedores;
begin
     // Fornecedores
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select FOR_FANTASIA from FORNECEDORES order by FOR_FANTASIA';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  cmbFornecedor.Clear;
                  //cmbFornecedor.Items.Add(' ');
                  //
                  While not (Eof) do
                    begin
                         cmbFornecedor.Items.Add(FieldByName('FOR_FANTASIA').AsString);
                         //
                         Next;
                    End;
             End;
      End;
      //
end;

procedure TfrmEmailForn.FormShow(Sender: TObject);
begin
     Fornecedores;
     //
     edtDTINIC.Date := Date();
     btnEmail.Enabled := False;
     btnOutlook.Enabled := False;
end;

procedure TfrmEmailForn.edtDTINICExit(Sender: TObject);
begin
    If (edtDTINIC.Text <> '  /  /    ') Then
      try
          StrToDate(edtDTINIC.Text);
      except
          on EConvertError do
          Begin
              ShowMessage ('Data Inv�lida!');
              edtDTINIC.Date := Date();
              Exit;
          End;
      end;
end;

procedure TfrmEmailForn.btConfirmaClick(Sender: TObject);
begin
      if (edtDTINIC.Text <> '  /  /    ') and
        NOT uFuncoes.Empty(cmbFornecedor.Text) Then
        begin
             ListBox1.Clear;
             //  
             With cdsConsultaForn do
              Begin
                   Close;
                   Params.ParamByName('pDTINIC').AsDate := edtDTINIC.Date;
                   Params.ParamByName('pDTFINA').AsDate := edtDTINIC.Date;
                   Params.ParamByName('pCODIGO').AsInteger := uFuncoes.CDFABRICANTE(cmbFornecedor.Text); 
                   Open;
                   //
                   If (IsEmpty) Then
                    begin
                         Application.MessageBox(PChar('N�o h� pedidos para este fornecedor neste periodo.')
                              , 'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);

                    End;
              End;
        End;
end;

procedure TfrmEmailForn.btnEmailClick(Sender: TObject);
Var
   iCodForn, i : Integer;
begin
  If not (cdsConsultaForn.IsEmpty) Then
   begin
        ListBox1.Clear;
        With dmConsultas.cdsVendas do
          begin
               Close;
               Params[0].AsDate := edtDTINIC.Date;
               Open;
          End;
         //
         With cdsConsultaForn do
         begin
            DisableControls;
            First;
            //
            While not (Eof) do
              begin
                   dmConsultas.cdsVendas.Locate('MOV_PEDIDO',cdsConsultaFornMOV_PEDIDO.AsInteger,[]);
                   //uFuncoes.GERAR_ARQUIVO_EMAIL(cdsConsultaFornMOV_PEDIDO.AsInteger, 1);
                   // Novo
                   uFuncoes.CARREGAR_ITENS(cdsConsultaFornMOV_PEDIDO.AsInteger);
                   dmRelatorios.VIA_PEDIDO_NOVO(cdsConsultaFornMOV_PEDIDO.AsInteger,
                                uFuncoes.GetModaPedido(cdsConsultaFornMOV_PEDIDO.AsInteger)
                                 ,'S', '', 'S');
                   ListBox1.Items.Add(udm.aArquivoAnexo);
                   //
                   Next;
              End;
           EnableControls;
          End;
     //FrmAdmin.AbreForm(TfrmEnviarPedido,frmEnviarPedido);
     Application.CreateForm(TfrmEnviarPedido, frmEnviarPedido);{Carrega form na mem�ria}
     try
          iCodForn := uFuncoes.CDFABRICANTE(cmbFornecedor.Text);
          uFrmEnviarEmailNew.aEmail := uFuncoes.GetEmailFornecedor(iCodForn);
          //
          If not uFuncoes.Empty(ListBox1.Items.Text) Then
               frmEnviarPedido.lbxAnexos.Items := ListBox1.Items;
          //
          frmEnviarPedido.ShowModal;
     Finally
          frmEnviarPedido.Free;
          //
          for i := 0 to ListBox1.Items.Count - 1 do
             DeleteFile(ListBox1.Items.Strings[i]);
     End;
   End;
end;

procedure TfrmEmailForn.dsConsultaStateChange(Sender: TObject);
begin
    btnEmail.Enabled := not cdsConsultaForn.IsEmpty;
    btnOutlook.Enabled := not cdsConsultaForn.IsEmpty;
end;

procedure TfrmEmailForn.btnOutlookClick(Sender: TObject);
Var
   iCodForn, i : Integer;
begin
  If not (cdsConsultaForn.IsEmpty) Then
   begin
        ListBox1.Clear;
        //
        With dmConsultas.cdsVendas do
          begin
               Close;
               Params[0].AsDate := edtDTINIC.Date;
               Open;
          End;
         //
         With cdsConsultaForn do
         begin
              DisableControls;
              //
                   dmConsultas.cdsVendas.Locate('MOV_PEDIDO',cdsConsultaFornMOV_PEDIDO.AsInteger,[]);
                   //uFuncoes.GERAR_ARQUIVO_EMAIL(cdsConsultaFornMOV_PEDIDO.AsInteger, 1);
                   // Novo
                   uFuncoes.CARREGAR_ITENS(cdsConsultaFornMOV_PEDIDO.AsInteger);
                   dmRelatorios.VIA_PEDIDO_NOVO(cdsConsultaFornMOV_PEDIDO.AsInteger,
                                uFuncoes.GetModaPedido(cdsConsultaFornMOV_PEDIDO.AsInteger)
                                 ,'S', '', 'S');
                   ListBox1.Items.Add(udm.aArquivoAnexo);
               //
           EnableControls;
          End;
     //FrmAdmin.AbreForm(TfrmEnviarPedido,frmEnviarPedido);
     Application.CreateForm(TfrmEnviarPedido, frmEnviarPedido);{Carrega form na mem�ria}
     try
          iCodForn := uFuncoes.CDFABRICANTE(cmbFornecedor.Text);
          uFrmEnviarEmailNew.aEmail := uFuncoes.GetEmailFornecedor(iCodForn);
          //
          If not uFuncoes.Empty(ListBox1.Items.Text) Then
               frmEnviarPedido.lbxAnexos.Items := ListBox1.Items;
          //
          frmEnviarPedido.ShowModal;
     Finally
          frmEnviarPedido.Free;
          //
          for i := 0 to ListBox1.Items.Count - 1 do
             DeleteFile(ListBox1.Items.Strings[i]);
     End;
   End;
end;

end.
