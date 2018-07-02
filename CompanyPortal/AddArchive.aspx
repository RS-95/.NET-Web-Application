<%@ Page Title="Add Archive" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddArchive.aspx.cs" Inherits="CompanyPortal.AddArchive" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="fh5co-narrow-content animate-box" data-animate-effect="fadeInLeft">
				
				<div class="row">
					<div class="col-md-4">
						<h1>Add an Archive File</h1>
					</div>
				</div>
				<form id="form1" runat="server">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
                                        <asp:TextBox ID="TextBoxID" class="form-control" runat="server" placeholder="ID"></asp:TextBox>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Name">
									</div>
                                    <div class="form-group">
										<textarea name="desc" id="desc" cols="30" rows="7" class="form-control" placeholder="Description"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									
									<div class="form-group">
                                        <div class="jumbotron">
										<asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                        <asp:Button ID="btnUpload" class="btn btn-primary btn-md" runat="server" Text="Upload" OnClick="Upload" />
									</div>
								</div>
								
							</div>
						</div>
						
					</div>
				</form>
			</div>	

			
</asp:Content>
