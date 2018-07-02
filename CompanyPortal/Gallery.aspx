<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="CompanyPortal.Gallery" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainCOntent" runat="server">
    <div class="fh5co-narrow-content">
				<div class="row">
					<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
						<h1 class="fh5co-heading-colored">Gallery</h1>
					</div>
				</div>
    <%--</div>--%>
				<%--<div class="row">--%>

					<div class="fh5co-gallery">

				<a class="gallery-item" href="PhotoView.aspx">
					<img src="images/work_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div class="overlay">
						<h2>Convocation</h2>
						<span>Photos</span>
					</div>
				</a>
				<a class="gallery-item" href="PhotoView.aspx">
					<img src="images/work_2.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div class="overlay">
						<h2>People</h2>
						<span>Photos</span>
					</div>
				</a>
				<a class="gallery-item" href="PhotoView.aspx">
					<img src="images/work_3.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div class="overlay">
						<h2>Construction</h2>
						<span>Photos</span>
					</div>
				</a>
				<a class="gallery-item" href="PhotoView.aspx">
					<img src="images/work_4.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
					<div class="overlay">
						<h2>Other</h2>
						<span>Photos</span>
					</div>
				</a>
				
				
			<%--</div>
					<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
						<p class="fh5co-lead">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
					
				</div>--%>
			</div>
                    </div>
</asp:Content>

