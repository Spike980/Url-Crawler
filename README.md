# README
<h1>Url Crawler</h1>
<p>This is a small sample application to crawl through a requested url and store its contents in the database.
Rails API is used in the backend with a React application consuming the data in the frontend. Both React and Rails
should run on seperate servers. Minitest is used for testing Rails API</p>

<h2>Requirements:</h2>
<ul>
	<li>Ruby 2.3.1 or higher</li>
	<li>Rails 5.0.x </li>
	<li>Nokogiri</li>
	<li>React 0.14</li>
	<li>Webpack 1.13.x and Webpack-dev-server 1.9.0</li>
	<li>Babel</li>
</ul>


<h2>Installation:</h2>
Clone this application and then run:
<pre><code>
	bundle install
	rake db:migrate
	cd frontend/
	npm install
</code></pre>

<h2>Usage</h2>
Start Rails server:
<pre><code>
	rails s
</code></pre>

Start webpack-dev server:
<pre><code>
	cd frontend/
	webpack-dev-server --progress
</code></pre>




