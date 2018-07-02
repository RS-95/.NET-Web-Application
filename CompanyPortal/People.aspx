<%@ Page Title="People" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="People.aspx.cs" Inherits="CompanyPortal.People" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="fh5co-narrow-content">
        <div class="row">
			<div class="col-md-5">
						<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">About The People</h2>
						<p class="fh5co-lead animate-box" data-animate-effect="fadeInLeft">Some text here</p>
			</div>
		</div>
            		
    </div>

    <form id="form1" runat="server">
        <div class="container-fluid">
        <div class="row">
        <div class="table-responsive">
            <asp:GridView  ItemStyle-HorizontalAlign="Center" HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="150px" Width="150px"
                        ImageUrl='<%# "data:Image/png;base64,"
                        + Convert.ToBase64String((byte[])Eval("Image")) %>' />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Designation" HeaderText="Designation" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                
            </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    </div>
    </div>
    </form>
    
    
</asp:Content>

