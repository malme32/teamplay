 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<spring:url value="/resources/theme1" var="resources" />






	<!-- Main Content -->
	<main class="main-content">
		
		<!-- Match Detail -->
		<section class="theme-padding-bottom bg-fixed">
			<div class="container">

				<!-- Add Banners -->
				<div class="add-banners">
					<ul id="add-banners-slider" class="add-banners-slider">
						<li>
							<a href="#"><img src="${resources}/images/add-banners/img-01.jpg" alt=""></a>
						</li>
						<li>
							<a href="#"><img src="${resources}/images/add-banners/img-02.jpg" alt=""></a>
						</li>
						<li>
							<a href="#"><img src="${resources}/images/add-banners/img-03.jpg" alt=""></a>
						</li>
					</ul>
				</div>
				<!-- Add Banners -->

				<!-- Match Detail Content -->
				<div class="match-detail-content">
					<div class="row">
						<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
							<div class="row">

								<!-- Next Matches -->
								<div class="col-sm-4 col-xs-5 r-full-width">
									<div class="next-matches">
										<h4>Next Match</h4> 
										<div id="matches-detail-slider" class="matches-detail-slider">
											
											<!-- Item -->
											<div class="item matches-detail" style="background: url(${resources}/images/country-flags-bg.jpg);">
												<div class="time-left">
													<ul id="countdown-1" class="countdown">
													  	<li><span class="days">00</span>D:</li>
														<li><span class="hours">00</span>H:</li>
														<li><span class="minutes">00</span>M:</li>
														<li><span class="seconds">00</span>S</li>
													</ul>
												</div>
												<span class="left-date">12/02/2016 / 19:00</span>
												<div class="team-btw-match">
													<ul>
														<li>
															<img src="${resources}/images/team-logos/img-01.png" alt="">
															<span>Footbal<span>Team</span></span>
														</li>
														<li>
															<img src="${resources}/images/team-logos/img-02.png" alt="">
															<span>Super Team<span>Club</span></span>
														</li>
													</ul>
												</div>
											</div>
											<!-- Item -->

											<!-- Item -->
											<div class="item matches-detail" style="background: url(${resources}/images/country-flags-bg.jpg);">
												<div class="time-left">
													<ul id="countdown-2" class="countdown">
													  	<li><span class="days">00</span>D:</li>
														<li><span class="hours">00</span>H:</li>
														<li><span class="minutes">00</span>M:</li>
														<li><span class="seconds">00</span>S</li>
													</ul>
												</div>
												<span class="left-date">12/02/2016 / 19:00</span>
												<div class="team-btw-match">
													<ul>
														<li>
															<img src="${resources}/images/team-logos/img-01.png" alt="">
															<span>Footbal<span>Team</span></span>
														</li>
														<li>
															<img src="${resources}/images/team-logos/img-02.png" alt="">
															<span>Super Team<span>Club</span></span>
														</li>
													</ul>
												</div>
											</div>
											<!-- Item -->

										</div>
									</div>
								</div>
								<!-- Next Matches -->

								<!-- Upcoming Fixture -->
								<div class="col-sm-8 col-xs-7 r-full-width">
									<h3><span><i class="red-color">UPCOMING </i>FIXTURE</span><a class="view-all pull-right" href="#">view all<i class="fa fa-angle-double-right"></i></a></h3>
									<div class="upcoming-fixture">
										<div class="table-responsive">
											<table class="table table-bordered">
											    <tbody>
												    <tr>
												        <td>
												        	<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-01.png" alt="">Portugal</div>
												        </td>
												        <td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
												        <td>
												        	<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-02.png" alt="">Germany</div>
												        </td>
												    </tr>
												    <tr>
												        <td>
												        	<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-03.png" alt="">Spain</div>
												        </td>
												        <td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
												        <td>
												        	<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-04.png" alt="">Man Utd</div>
												        </td>
												    </tr>
												    <tr>
												        <td>
												        	<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-05.png" alt="">Hondrus</div>
												        </td>
												        <td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
												        <td>
												        	<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-06.png" alt="">Ivory Cost</div>
												        </td>
												    </tr>
												    <tr>
												        <td>
												        	<div class="logo-width-name"><img src="${resources}/images/team-logos-small/img-07.png" alt="">West Brom</div>
												        </td>
												        <td class="upcoming-fixture-date"><span>6 Feb 2016 15:00</span></td>
												        <td>
												        	<div class="logo-width-name w-icon"><img src="${resources}/images/team-logos-small/img-08.png" alt="">uruguay</div>
												        </td>
												    </tr>
											    </tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- Upcoming Fixture -->

								<!-- Latest News -->
								<div class="col-xs-12">
									<div class="latest-news-holder">
										<h3><span>Latest News</span></h3>

										<!-- latest-news Slider -->
										<div class="row no-gutters white-bg">

											<!-- Slider -->
											<div class="col-sm-9">
												<ul id="latest-news-slider" class="latest-news-slider">
													<li>
														<img src="${resources}/images/latest-news/img-01.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-02.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-03.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-04.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-01.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-02.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												    <li>
														<img src="${resources}/images/latest-news/img-03.jpg" alt="">
													    <p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness for next week's crunch...<a href="#">Read more</a></p>
												    </li>
												</ul>
											</div>
											<!-- Slider -->

											<!-- Thumnail -->
											<div class="col-sm-3">
												<ul id="latest-news-thumb" class="latest-news-thumb">
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
													<li>
														<p>Fancy footwork by Brito in build up to Atromitos</p>
														<span>February 11, 2016</span>
													</li>
												</ul>
												<ul class="news-thumb-arrows">
													<li class="prev"><span class="fa fa-angle-up"></span></li>
													<li class="next"><span class="fa fa-angle-down"></span></li>
												</ul>
											</div>
											<!-- Thumnail -->

										</div>
										<!-- latest-news Slider -->

									</div>
								</div>
								<!-- Latest News -->

							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="row">

								<!-- Last Match -->
								<div class="col-lg-12 col-md-12 col-sm-5 col-xs-6 r-full-width">
									<div class="last-matches theme-margin-bottom win-tag">
										<h4>Last Match</h4>
										<div class="matches-detail style-2" style="background: url(${resources}/images/keper-img.jpg);">
											<p>49 Chapel Lane ARNE BH20 12/02/2016 / 19:00</p>
											<div class="team-btw-match">
												<ul>
													<li>
														<img src="${resources}/images/team-logos/img-03.png" alt="">
														<span>Munchester<span>United</span></span>
													</li>
													<li>
														<img src="${resources}/images/team-logos/img-04.png" alt="">
														<span>Norwich<span>City</span></span>
													</li>
												</ul>
											</div>
											<div class="goals-detail">
												<ul>
													<li>
														<span>M. Johansen</span>
														<span>23 (FNA)</span>
													</li>
													<li>
														<span>G. Smith</span>
														<span>41 (FNA)</span>
													</li>
													<li>
														<span>T. Mosler</span>
														<span>59 (FNA)</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!-- Last Match -->

								<!-- Last Match -->
								<div class="col-lg-12 col-md-12 col-sm-7 col-xs-6 r-full-width">
									<div class="last-matches styel-1">
										<h3><span>POINTS TABLE</span></h3>
										<table class="table table-bordered table-hover">
										    <thead>
										    	<tr>
											        <th>#</th>
											        <th>Team</th>
											        <th>P</th>
											        <th>W</th>
											        <th>L</th>
										      	</tr>
										    </thead>
										    <tbody>
										    	<tr>
											        <td>1</td>
											        <td>Liverpool</td>
											        <td>10</td>
											        <td>12</td>
											        <td>20</td>
										      	</tr>
										      	<tr>
											        <td>2</td>
											        <td>Chelsea</td>
											        <td>10</td>
											        <td>12</td>
											        <td>20</td>
										      	</tr>
										      	<tr>
											        <td>3</td>
											        <td>Norwich City</td>
											        <td>20</td>
											        <td>15</td>
											        <td>20</td>
									      		</tr>
									      		<tr>
											        <td>4</td>
											        <td>West Brom</td>
											        <td>60</td>
											        <td>10</td>
											        <td>60</td>
									      		</tr>
									      		<tr>
											        <td>5</td>
											        <td>sunderland</td>
											        <td>30</td>
											        <td>06</td>
											        <td>30</td>
									      		</tr>
									      		<tr>
											        <td>6</td>
											        <td>Liverpool</td>
											        <td>12</td>
											        <td>03</td>
											        <td>40</td>
									      		</tr>
									      		<tr>
											        <td>7</td>
											        <td>Swansea city</td>
											        <td>12</td>
											        <td>15</td>
											        <td>12</td>
									      		</tr>
									      		<tr>
											        <td>8</td>
											        <td>Man UTD</td>
											        <td>12</td>
											        <td>15</td>
											        <td>12</td>
									      		</tr>
									      		<tr>
											        <td>9</td>
											        <td>Liverpool</td>
											        <td>22</td>
											        <td>14</td>
											        <td>22</td>
									      		</tr>
										    </tbody>
									  	</table>
									</div>
								</div>
								<!-- Last Match -->

							</div> 
						</div>
					</div>
				</div>
				<!-- Match Detail Content -->

			</div>
		</section>
		<!-- Match Detail -->

		<!-- Player Features And History -->
		<section class="red-section" style=" background: url(${resources}/images/red-bg.jpg) no-repeat;">

			<!-- Red Section Heading -->
			<div class="red-sec-heading">
				<div class="container">
					<h5>Player Features</h5>
				</div>
			</div>
			<!-- Red Section Heading -->

			<!-- Red saection Content -->
			<div class="container">
				<div class="row">
					
					<!-- Player Featuer -->
					<div class="col-sm-6">
						<div class="theme-padding top-profiler">
							<img class="player-img animate fadeInLeft" data-wow-delay="0.2s" src="${resources}/images/player-img.png" alt="">
							<strong class="number-batch style-1">13</strong>
							<strong class="number-batch style-2">06</strong>
						</div>
					</div>
					<!-- Player Featuer -->

					<!-- Player History -->
					<div class="col-sm-6">
						<ul id="video-slider" class="video-slider">
							<li class="red-sec-widget player-history h-white p-white">
								<h3>Related Match</h3>
								<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
								<div class="player-video-sec">
									<div class="video video-post">
										<img src="${resources}/images/video-bg.jpg" alt="">
										<span class="play-lable fa fa-video-camera"></span>
										<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
									</div>
								</div>
							</li>
							<li class="red-sec-widget player-history h-white p-white">
								<h3>Related Match</h3>
								<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
								<div class="player-video-sec">
									<div class="video video-post">
										<img src="${resources}/images/video-bg-2.jpg" alt="">
										<span class="play-lable fa fa-video-camera"></span>
										<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
									</div>
								</div>
							</li>
							<li class="red-sec-widget player-history h-white p-white">
								<h3>Related Match</h3>
								<p>The wait for a major title is weighing heavily on Argentina, and it showed as they lost again to Chile, Tim Vickery writes</p>
								<div class="player-video-sec">
									<div class="video video-post">
										<img src="${resources}/images/video-bg-3.jpg" alt="">
										<span class="play-lable fa fa-video-camera"></span>
										<a class="position-center-center play-icon" href="http://www.youtube.com/watch?v=cH6kxtzovew" data-rel="prettyPhoto[video]"><i class="fa fa-video-camera"></i></a>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- Player History -->

				</div>
			</div>
			<!-- Red saection Content -->
 
		</section>
		<!-- Player Features And History -->

		<!-- Facts Accounter -->
		<div class="facts-acounter">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 pull-right">
						<ul class="facts-list-acounter" id="tc-counters">
							<li>
								<strong class="facts-number" data-from="0" data-to="550" data-speed="1000"></strong>
								<span>Possession</span>
							</li>
							<li>
								<strong class="facts-number" data-from="0" data-to="30" data-speed="2000"></strong>
								<span>Team Members</span>
							</li>
							<li>
								<strong class="facts-number" data-from="0" data-to="158" data-speed="3000"></strong>
								<span>Match win</span>
							</li>
							<li>
								<strong class="facts-number" data-from="0" data-to="199" data-speed="4000"></strong>
								<span>football Shots</span>
							</li>
							<li>
								<strong class="facts-number" data-from="0" data-to="1254" data-speed="5000"></strong>
								<span>Stadium Security</span>
							</li>
							<li>
								<strong class="facts-number" data-from="0" data-to="32" data-speed="6000"></strong>
								<span>Match Fouls</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Facts Accounter -->

		<!-- Gallery And Team -->
		<div class="theme-padding gallery-holder">
			
			<!-- Gallery v-3 -->
			<div class="theme-padding-bottom">
				<div class="container">

					<!-- Main Heading -->
					<h3><span>Match Gallery</span></h3>
					<!-- Main Heading -->

					<!-- Gallery Columns -->
					<div class="gallery">
						<div class="col-sm-6">
							<div class="row">
								<div class="col-sm-12 col-xs-12 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-01.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-1.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-eye" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-6 col-xs-6 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-02.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-2.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-eye" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-6 col-xs-6 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-03.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-3.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-eye" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="row">
								<div class="col-sm-6 col-xs-6 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-04.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-4.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-eye" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-6 col-xs-6 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-05.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-5.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-eye" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
								<div class="col-sm-12 col-xs-12 r-full-width p-0">
									<figure class="gallery-figure">
										<img src="${resources}/images/gallery-v3/img-06.jpg" alt="">
										<figcaption class="overlay">
											<div class="position-center-center">
												<ul class="btn-list">
													<li><a href="${resources}/images/gallery-v3/img-1-6.jpg" data-rel="prettyPhoto[gallery-v3]"><i class="fa fa-search"></i></a></li>
													<li><a class="fa fa-link" href="#"></a></li>
												</ul>
											</div>
										</figcaption>
									</figure>
								</div>
							</div>
						</div>
					</div>
					<!-- Gallery Columns -->

				</div>
			</div>
			<!-- Gallery v-3 -->

			<!-- Separator -->
			<div class="container text-center">
				<span class="sprater"><i class="fa fa-futbol-o"></i></span>
			</div>
			<!-- Separator -->

			<!-- Team -->
			<div class="container">
				<div class="team-holder theme-padding-top">

					<!-- Main Heading -->
					<div class="main-heading-holder">
						<div class="main-heading">
							<h2>our Team member</h2>
							<p>Chelsea captain John Terry is not ready to start against Stoke on Saturday and is struggling to prove his fitness.</p>
						</div>
					</div>
					<!-- Main Heading -->

					<!-- Team Row -->
					<div id="team-slider" class="team-slider">

						<!-- Team Column -->
						<div class="item">
							<div class="team-column">
								<img src="${resources}/images/team/img-01.jpg" alt="">
								<span class="player-number">12</span>
								<div class="team-detail">
									<h5><a href="team-detail.html">Lionel Andres Messi</a></h5>
									<span class="desination">Defender</span>
									<div class="detail-inner">
										<ul>
											<li>Born</li>
											<li>Position</li>
											<li>Squad number</li>
											<li>Previous Club</li>
											<li>Fallow us on</li>
										</ul>
										<ul>
											<li>August 31, 1988</li>
											<li>Goalkeeper</li>
											<li>13</li>
											<li>Atletico Nacional</li>
											<li>
												<ul class="social-icons">
													<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
													<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Team Column -->

						<!-- Team Column -->
						<div class="item">
							<div class="team-column">
								<img src="${resources}/images/team/img-02.jpg" alt="">
								<span class="player-number">12</span>
								<div class="team-detail">
									<h5><a href="team-detail.html">Philipp Lahm</a></h5>
									<span class="desination">Middle player</span>
									<div class="detail-inner">
										<ul>
											<li>Born</li>
											<li>Position</li>
											<li>Squad number</li>
											<li>Previous Club</li>
											<li>Fallow us on</li>
										</ul>
										<ul>
											<li>August 31, 1988</li>
											<li>Goalkeeper</li>
											<li>13</li>
											<li>Atletico Nacional</li>
											<li>
												<ul class="social-icons">
													<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
													<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Team Column -->

						<!-- Team Column -->
						<div class="item">
							<div class="team-column">
								<img src="${resources}/images/team/img-03.jpg" alt="">
								<span class="player-number">12</span>
								<div class="team-detail">
									<h5><a href="team-detail.html">David Ospina</a></h5>
									<span class="desination">Defender</span>
									<div class="detail-inner">
										<ul>
											<li>Born</li>
											<li>Position</li>
											<li>Squad number</li>
											<li>Previous Club</li>
											<li>Fallow us on</li>
										</ul>
										<ul>
											<li>August 31, 1988</li>
											<li>Goalkeeper</li>
											<li>13</li>
											<li>Atletico Nacional</li>
											<li>
												<ul class="social-icons">
													<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
													<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Team Column -->

						<!-- Team Column -->
						<div class="item">
							<div class="team-column">
								<img src="${resources}/images/team/img-04.jpg" alt="">
								<span class="player-number">12</span>
								<div class="team-detail">
									<h5><a href="team-detail.html">Jerome Boateng</a></h5>
									<span class="desination">Defender</span>
									<div class="detail-inner">
										<ul>
											<li>Born</li>
											<li>Position</li>
											<li>Squad number</li>
											<li>Previous Club</li>
											<li>Fallow us on</li>
										</ul>
										<ul>
											<li>August 31, 1988</li>
											<li>Goalkeeper</li>
											<li>13</li>
											<li>Atletico Nacional</li>
											<li>
												<ul class="social-icons">
													<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
													<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
													<li><a class="youtube" href="#"><i class="fa fa-youtube-play"></i></a></li>
													<li><a class="pinterest" href="#"><i class="fa fa-pinterest-p"></i></a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- Team Column -->

					</div>
					<!-- Team Row -->

				</div>
			</div>
			<!-- Team -->

		</div>
		<!-- Gallery And Team -->

		<!-- Products -->
		<div class="products-holder gray-bg theme-padding">
			<div id="product-slider" class="product-slider nav-style-1">
				
				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-01.jpg" alt="">
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-02.jpg" alt="">
							<span class="sale-batch">sale</span>
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-03.jpg" alt="">
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-04.jpg" alt="">
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-05.jpg" alt="">
							<span class="sale-batch">sale</span>
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-06.jpg" alt="">
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->

				<!-- Product Column -->
				<div class="product-column">
					<div class="product-column-inner">
						<div class="product-img">
							<img src="${resources}/images/products/img-01.jpg" alt="">
						</div>
						<h5><a href="shop-detail.html">Sports T-Shirt</a></h5>
						<span class="product-use">Men’s Running Shirt</span>
					</div>
					<div class="btm">
						<a class="btn" href="shop-detail.html"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
						<span class="price">$39.00</span>
					</div>
				</div>
				<!-- Product Column -->
					
			</div>
		</div>
		<!-- Products -->

	</main>
	<!-- Main Content -->

