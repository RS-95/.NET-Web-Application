<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="CompanyPortal.Feedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="fh5co-narrow-content animate-box" data-animate-effect="fadeInLeft">

   <style type="text/css">

    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        width: 40%;
        height: 40%;
        border: 3px solid #0DA9D0;
    }
    .modalPopup .header
    {
        background-color: #2FBDF1;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .body
    {
        min-height: 40%;
        line-height: 30px;
        text-align: center;
        padding:5px
    }
    .modalPopup .footer
    {
        padding: 3px;
    }
    .modalPopup .button
    {
        height: 23px;
        color: White;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
    }
    .modalPopup td
    {
        text-align:left;
    }
</style>

        <div class="row">
					<%--<div class="col-md-4">--%>
						<h1 style="text-align:center">Feedback By People</h1>
					<%--</div>--%>
		</div>

        <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
        <asp:LinkButton Text="" ID = "lnkFake" runat="server" />

        <ajaxtoolkit:modalpopupextender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkFake" CancelControlID="btnClose" BackgroundCssClass="modalBackground"></ajaxtoolkit:modalpopupextender>
        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">

        <div class="body">
            <asp:TextBox ID="outputfeed" runat="server" TextMode="MultiLine" Width="100%" Rows="6" Scrollable="true" readonly="true"></asp:TextBox>
        </div>
        <div class="footer">
            <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="button" />
        </div>
        </asp:Panel>

        <div class="table-responsive container-fluid" style="height:250px">
        <asp:GridView  ItemStyle-HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="2" GridLines="None" ForeColor="Black" OnSelectedIndexChanged="OnSelectedIndexChanged" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" style="overflow-y:scroll">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:TemplateField visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblfeed" Text='<%# Eval("Message") %>' runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField Text="View" CommandName="Select" /> 
            </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>

        </div>
            <br/>
            <br/>
				
		<div class="row">
					<%--<div class="col-md-4">--%>
						<h1 style="text-align:center">Post a Feedback</h1>
					<%--</div>--%>
		</div>
               
        
				
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
                                        <input name="input1" ID="input1" runat="server" type="text" class="form-control" placeholder="Name">
									</div>
									<div class="form-group">
                                        <input name="input2" ID="input2" runat="server" type="text" class="form-control" placeholder="Email">
									</div>
									<div class="form-group">
                                        <input name="input3" ID="input3" runat="server" type="text" class="form-control" placeholder="Phone">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group" >
										<textarea name="messagetext" id="messagetext" cols="30" rows="7" class="form-control" placeholder="Message" ></textarea>
									</div>
									<div class="form-group" >
                                        <asp:Button ID="btnUpload" class="btn btn-primary btn-md" runat="server" Text="Submit" OnClick="UploadFeed" />
									</div>
							    </div>
								
							</div>
						</div>
						
					</div>
				</form>
			</div>	

			<div class="fh5co-more-contact">
				<div class="fh5co-narrow-content">
					<div class="row">
						<div class="col-md-4">
							<div class="fh5co-feature fh5co-feature-sm animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-envelope-o"></i>
								</div>
								<div class="fh5co-text">
									<p><a href="#">info@domain.com</a></p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="fh5co-feature fh5co-feature-sm animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-map-o"></i>
								</div>
								<div class="fh5co-text">
									<p>Address</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="fh5co-feature fh5co-feature-sm animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-phone"></i>
								</div>
								<div class="fh5co-text">
									<p><a href="tel://">+123 456 7890</a></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</asp:Content>

