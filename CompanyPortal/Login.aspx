<%@ Page Title="Login" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CompanyPortal.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    

    <form id="loginform" runat="server">
    

    <div class="fh5co-narrow-content animate-box" data-animate-effect="fadeInLeft">
    <div class="row" style="margin-left:auto;margin-right:auto;">
    <div class="col-md-6">
	    <div style="max-width: 400px;">
        <div class="jumbotron" style="border-radius: 40px">
            <h2 class="form-signin-heading" style="text-align:center">Login</h2>
            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" required="true" Width="100%" />
            <br />
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" required="true" Width="100%" />
            
            <br />
            
            <asp:Button ID="btnLogin" Text="Login" runat="server"  Class="btn btn-primary" OnClick="btnLogin_Click" />
            <br />
            <div id="dvMessage" runat="server"  Visible="false" class="alert alert-danger" Width="100%">
                <strong>Error!</strong>
                <asp:Label ID="lblMessage" runat="server" Visible="false"/>
            </div>
            </div>
            <%--<asp:Login ID = "Login1" runat = "server" OnAuthenticate= "ValidateUser" Height="140px" Width="438px"></asp:Login>--%>
        </div>
    </div>
	</div>
    </div>
        


</form>

</asp:Content>
