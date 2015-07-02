<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CertificadosInversiones.aspx.cs" Inherits="OSEF.ERP.APP.CertificadosInversiones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type='text/javascript' src="js/certificadosInversiones.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;

        //Funcion que valida que tema va a ser utilizadp
        function cargarEstilo() {
            //Validamos la cookie
            if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
                //Asiganmos los elementos en el header
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/login.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/customControls.css')
                var fileref3 = document.createElement("link")
                fileref3.setAttribute("rel", "stylesheet")
                fileref3.setAttribute("type", "text/css")
                fileref3.setAttribute("href", 'css/xMask.css')
                var fileref4 = document.createElement("link")
                fileref4.setAttribute("rel", "stylesheet")
                fileref4.setAttribute("type", "text/css")
                fileref4.setAttribute("href", 'css/xDatePicker.css')
                var fileref5 = document.createElement("link")
                fileref5.setAttribute("rel", "stylesheet")
                fileref5.setAttribute("type", "text/css")
                fileref5.setAttribute("href", 'css/xSplitButton.css')
                var fileref6 = document.createElement("link")
                fileref6.setAttribute("rel", "stylesheet")
                fileref6.setAttribute("type", "text/css")
                fileref6.setAttribute("href", 'css/xGridPanel.css')
                var fileref7 = document.createElement("link")
                fileref7.setAttribute("rel", "stylesheet")
                fileref7.setAttribute("type", "text/css")
                fileref7.setAttribute("href", 'css/xWindowPopup.css')
                var fileref8 = document.createElement("link")
                fileref8.setAttribute("rel", "stylesheet")
                fileref8.setAttribute("type", "text/css")
                fileref8.setAttribute("href", 'css/xPanel.css')
                var fileref9 = document.createElement("link")
                fileref9.setAttribute("rel", "stylesheet")
                fileref9.setAttribute("type", "text/css")
                fileref9.setAttribute("href", 'css/xComboBox.css')
                var fileref10 = document.createElement("link")
                fileref10.setAttribute("rel", "stylesheet")
                fileref10.setAttribute("type", "text/css")
                fileref10.setAttribute("href", 'css/xCustomChart.css')
                var fileref11 = document.createElement("link")
                fileref11.setAttribute("rel", "stylesheet")
                fileref11.setAttribute("type", "text/css")
                fileref11.setAttribute("href", 'css/xToolbar.css')
                var fileref12 = document.createElement("link")
                fileref12.setAttribute("rel", "stylesheet")
                fileref12.setAttribute("type", "text/css")
                fileref12.setAttribute("href", 'css/xLabel.css')
                var fileref13 = document.createElement("link")
                fileref13.setAttribute("rel", "stylesheet")
                fileref13.setAttribute("type", "text/css")
                fileref13.setAttribute("href", 'css/xTreePanel.css')
                var fileref14 = document.createElement("link")
                fileref14.setAttribute("rel", "stylesheet")
                fileref14.setAttribute("type", "text/css")
                fileref14.setAttribute("href", 'css/xHiperlink.css')
                var fileref15 = document.createElement("link")
                fileref15.setAttribute("rel", "stylesheet")
                fileref15.setAttribute("type", "text/css")
                fileref15.setAttribute("href", 'css/xTextField.css')
                var fileref16 = document.createElement("link")
                fileref16.setAttribute("rel", "stylesheet")
                fileref16.setAttribute("type", "text/css")
                fileref16.setAttribute("href", 'css/xFieldSet.css')
                var fileref17 = document.createElement("link")
                fileref17.setAttribute("rel", "stylesheet")
                fileref17.setAttribute("type", "text/css")
                fileref17.setAttribute("href", 'css/xButton.css')
                var fileref18 = document.createElement("link")
                fileref18.setAttribute("rel", "stylesheet")
                fileref18.setAttribute("type", "text/css")
                fileref18.setAttribute("href", 'css/metroButtons.css')
                var fileref19 = document.createElement("link")
                fileref19.setAttribute("rel", "stylesheet")
                fileref19.setAttribute("type", "text/css")
                fileref19.setAttribute("href", 'css/metroButtons.css')
                var fileref20 = document.createElement("link")
                fileref20.setAttribute("rel", "stylesheet")
                fileref20.setAttribute("type", "text/css")
                fileref20.setAttribute("href", 'css/xDisplayImages.css')
                var fileref21 = document.createElement("link")
                fileref21.setAttribute("rel", "stylesheet")
                fileref21.setAttribute("type", "text/css")
                fileref21.setAttribute("href", 'css/xIcons.css')
                var fileref22 = document.createElement("link")
                fileref22.setAttribute("rel", "stylesheet")
                fileref22.setAttribute("type", "text/css")
                fileref22.setAttribute("href", 'css/xTabPanel.css')

                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
                document.getElementsByTagName("head")[0].appendChild(fileref3);
                document.getElementsByTagName("head")[0].appendChild(fileref4);
                document.getElementsByTagName("head")[0].appendChild(fileref5);
                document.getElementsByTagName("head")[0].appendChild(fileref6);
                document.getElementsByTagName("head")[0].appendChild(fileref7);
                document.getElementsByTagName("head")[0].appendChild(fileref8);
                document.getElementsByTagName("head")[0].appendChild(fileref9);
                document.getElementsByTagName("head")[0].appendChild(fileref10);
                document.getElementsByTagName("head")[0].appendChild(fileref11);
                document.getElementsByTagName("head")[0].appendChild(fileref12);
                document.getElementsByTagName("head")[0].appendChild(fileref13);
                document.getElementsByTagName("head")[0].appendChild(fileref14);
                document.getElementsByTagName("head")[0].appendChild(fileref15);
                document.getElementsByTagName("head")[0].appendChild(fileref16);
                document.getElementsByTagName("head")[0].appendChild(fileref17);
                document.getElementsByTagName("head")[0].appendChild(fileref18);
                document.getElementsByTagName("head")[0].appendChild(fileref19);
                document.getElementsByTagName("head")[0].appendChild(fileref20);
                document.getElementsByTagName("head")[0].appendChild(fileref21);
                document.getElementsByTagName("head")[0].appendChild(fileref22);
            }

            if (Ext.util.Cookies.get('osefTheme') == 'caja') {
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/customControls2.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/login2.css')
                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmCertificadosInversiones" runat="server" HideInDesign="true" />

        <ext:GridPanel
            ID="gpCertificadosInversiones"
            runat="server"
            Height="420"
            Width="960"
            Title="CERTIFICADOS DE INVERSIONES"
            EnableColumnHide="false"
            EnableColumnMove="false"
            Header="true"
            TitleAlign="Left"
            StyleSpec="margin:0 auto; margin-top: 20px;">
            <TopBar>
                <ext:Toolbar ID="tbCertificadosInversiones" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            Height="50"
                            Width="50">
                            <Listeners>
                                <Click Fn="imgbtnNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnEditar"
                            runat="server"
                            ImageUrl="assets/img/controles/edit-normal.png"
                            DisabledImageUrl="assets/img/controles/edit-disable.png"
                            OverImageUrl="assets/img/controles/edit-over.png"
                            PressedImageUrl="assets/img/controles/edit-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
<%--                            <Listeners>
                                <Click Fn="imgbtnEditar_Click" />
                            </Listeners>--%>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            Height="50"
                            Width="50"
                            Disabled="true">
<%--                            <Listeners>
                                <Click Fn="imgbtnBorrar_Click" />
                            </Listeners>--%>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer ID="tbsCertificadosInversiones" runat="server" Width="500">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnActualizar"
                            runat="server"
                            ImageUrl="assets/img/controles/update-normal.png"
                            DisabledImageUrl="assets/img/controles/update-disable.png"
                            OverImageUrl="assets/img/controles/update-hover.png"
                            PressedImageUrl="assets/img/controles/update-pressed.png"
                            Height="50"
                            Width="50">
<%--                            <Listeners>
                                <Click Handler="#{sGruposMenu}.reload(); App.imgbtnEditar.setDisabled(true); App.imgbtnBorrar.setDisabled(true);" />
                            </Listeners>--%>
                        </ext:ImageButton>
                        <ext:TextField 
                            ID="txtfBuscar"
                            runat="server"
                            AutoFocus="true"
                            EmptyText="Buscar"
                            Width="200">
<%--                            <Listeners>
                                <Change Fn="txtfBuscar_Change" />
                            </Listeners>--%>
                            <RightButtons>
                                <ext:ImageButton
                                    ID="imgbtnBuscar"
                                    runat="server"
                                    ImageUrl="assets/img/controles/search.png"
                                    OverImageUrl=""
                                    PressedImageUrl=""
                                    Height="22px"
                                    Width="22px">                                              
                                </ext:ImageButton>
                            </RightButtons>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Store>
                <ext:Store
                    ID="sCertificadosInversiones"
                    runat="server"
                    OnReadData="OnReadData_sCertificadosInversiones">
                    <Model>
                        <ext:Model ID="mCertificadosInversiones" runat="server">
                            <Fields>
                                <ext:ModelField Name="ID" Type="String" />
                                <ext:ModelField Name="Nombre" Type="String" />
                                <ext:ModelField Name="APaterno" Type="String" />
                                <ext:ModelField Name="AMaterno" Type="String" />
                                <ext:ModelField Name="NombreCompleto" Type="String" />
                                <ext:ModelField Name="ValorInversion" Type="Float" />
                                <ext:ModelField Name="UnidadCalculo" Type="Int" />
                                <ext:ModelField Name="Inicio" Type="Date" />
                                <ext:ModelField Name="FechaVencimiento" Type="Date" />
                            </Fields>
                        </ext:Model>
                    </Model>
                    <Sorters>
                        <ext:DataSorter Property="ID" Direction="ASC" />
                    </Sorters>
<%--                    <Listeners>
                        <DataChanged Fn="sGruposMenu_DataChanged" />
                    </Listeners>--%>
                </ext:Store>
            </Store>
            <ColumnModel>
                <Columns>
                    <ext:Column 
                        ID="cID"
                        runat="server"
                        Text="ID"
                        Align="Center"
                        Width="100"
                        DataIndex="ID">
                    </ext:Column>
                    <ext:Column
                        ID="cNombreCompleto"
                        runat="server"
                        Text="NOMBRE COMPLETO"
                        Align="Left"
                        Width="300"
                        DataIndex="NombreCompleto">
                    </ext:Column>
                    <ext:NumberColumn
                        ID="ncValorInversion"
                        runat="server"
                        Text="INVERSIÓN"
                        Width="125"
                        Align="Center"
                        DataIndex="ValorInversion">
                    </ext:NumberColumn>
                    <ext:NumberColumn
                        ID="ncUnidadCalculo"
                        runat="server"
                        Text="UNIDAD CALCULO"
                        Width="135"
                        Align="Center"
                        DataIndex="UnidadCalculo">
                    </ext:NumberColumn>
                    <ext:DateColumn
                        ID="dcInicio"
                        runat="server"
                        Text="INICIO"
                        Width="150"
                        Align="Center"
                        DataIndex="Inicio">
                    </ext:DateColumn>
                    <ext:DateColumn
                        ID="dcFechaVencimiento"
                        runat="server"
                        Text="VENCIMIENTO"
                        Width="150"
                        Align="Center"
                        DataIndex="FechaVencimiento">
                    </ext:DateColumn>
                </Columns>
            </ColumnModel>
            <View>
                <ext:GridView
                    ID="gvCertificadosInversiones"
                    runat="server"
                    StripeRows="true">
                </ext:GridView>
            </View>
<%--            <Plugins>
                <ext:CellEditing ID="ceGruposMenu" runat="server" ClicksToEdit="2">
                    <Listeners>
                        <ValidateEdit Fn="ceGruposMenu_ValidateEdit" Delay="1" />
                    </Listeners>
                </ext:CellEditing>
            </Plugins>--%>
<%--            <Listeners>
                <ItemClick Fn="gpGruposMenu_ItemClick" />
            </Listeners>--%>
            <SelectionModel>
                <ext:RowSelectionModel
                    ID="rsmCertificadosInversiones"
                    runat="server">
                </ext:RowSelectionModel>
            </SelectionModel>
            <FooterBar>
                <ext:StatusBar
                    ID="sbCertificadosInversiones"
                    runat="server"
                    Text=""
                    StatusAlign="Left">
                </ext:StatusBar>
            </FooterBar>
        </ext:GridPanel>

    </form>
</body>
</html>
