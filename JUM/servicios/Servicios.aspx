<%@ Page Title="Servicios" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"  enableEventValidation="false" CodeFile="Servicios.aspx.cs" Inherits="servicios_Servicios" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="Servicios" runat="server" CssClass="table table-striped"  
        AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
    OnSelectedIndexChanged="OnSelectedIndexChanged">
            <Columns>
        <asp:BoundField DataField="Nombre" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Descripcion" HeaderText="Country" ItemStyle-Width="150" />      
        <asp:BoundField DataField="Requisitos" HeaderText="Country" ItemStyle-Width="150" />       
        <asp:BoundField DataField="Duracion" HeaderText="Country" ItemStyle-Width="150" />      
        <asp:BoundField DataField="Activo" HeaderText="Country" ItemStyle-Width="150" />
    </Columns>
    </asp:GridView>
</asp:Content>

<%--<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
    OnSelectedIndexChanged="OnSelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Nombre" HeaderText="Name" ItemStyle-Width="150" />
        <asp:BoundField DataField="Descripcion" HeaderText="Country" ItemStyle-Width="150" />      
        <asp:BoundField DataField="Requisitos" HeaderText="Country" ItemStyle-Width="150" />       
        <asp:BoundField DataField="Duracion" HeaderText="Country" ItemStyle-Width="150" />      
        <asp:BoundField DataField="Activo" HeaderText="Country" ItemStyle-Width="150" />
    </Columns>
</asp:GridView>--%>