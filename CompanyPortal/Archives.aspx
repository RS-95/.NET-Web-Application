<%@ Page Title="Archives" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Archives.aspx.cs" Inherits="CompanyPortal.Archives" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="fh5co-narrow-content">
        <div class="row">
			<div class="col-md-5">
						<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">Archives</h2>
						<p class="fh5co-lead animate-box" data-animate-effect="fadeInLeft">Some optional text here</p>
			</div>
		</div>
            		
    </div>

    <form id="form1" runat="server">
<%--        <div class="jumbotron">--%>
        <div class="container-fluid">
        <div class="row">
        <div class="table-responsive">
            <asp:GridView  ItemStyle-HorizontalAlign="Center" HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" Width="80%" CellPadding="4" GridLines="None" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id"/>
                <asp:BoundField DataField="Name" HeaderText="File Name"/>
                <asp:BoundField DataField="DocDesc" HeaderText="Description"/>
                <asp:BoundField DataField="DocType" HeaderText="File Type"/>
                <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                             CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>   
            </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            <br />
    </div>
    </div>
    </div>
    
    <div class="container"  style="margin-top:1px;">
    <div class="form-group text-center" >
			<asp:Button ID="Add" class="btn btn-primary btn-md" runat="server" Text="Add To Archives" OnClick="Unnamed1_Click" Visible="false"></asp:Button>
    </div>
    </div>
    
    </form>

    


</asp:Content>

