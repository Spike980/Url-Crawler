import React from 'react';
import ReactDOM from 'react-dom';
import Contents from './Contents';

class Main extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			urls = []
		};
	}

	componentDidMount() {
	    $.ajax({
		    url: "http://localhost:3000/retrieveurl",
		 
		    // The name of the callback parameter, as specified by the YQL service
		    jsonp: "callback",
		 
		    // Tell jQuery we're expecting JSONP
		    dataType: "jsonp",
		 
		    // Tell YQL what we want and that we want JSON
		    data: {
		        format: "json"
		    },
		 
		    // Work with the response
		    success: function( response ) {
		    	this.setState({
		    		urls = response.json
		    	})
		    }.bind(this);
		});
  
	},

	storeUrl(event) {
		event.preventDefault();
		let url = this.refs.indexing_url.value;

	    $.ajax({
		    url: "http://localhost:3000/indexing_url/",
		 
		    // The name of the callback parameter, as specified by the YQL service
		    jsonp: "callback",
		 
		    // Tell jQuery we're expecting JSONP
		    dataType: "jsonp",
		 
		    // Tell YQL what we want and that we want JSON
		    data: {
		    	url: url,
		        format: "json"
		    },
		 
		    // Work with the response
		    success: function( response ) {
		    	this.setState({
		    		urls = this.state.urls.concat(response.json)
		    	})
		    }.bind(this);
		});

	}

	render() {
		return (
			<div id="main">
				<form onSubmit={this.storeUrl.bind(this)} ref="index_form">
					<input type="url" ref="indexing_url"/>
					<button type="submit">Submit</button>
				</form>

				{this.state.urls.map((url, index) => {
					<h2 key={index}><u>{url.url.toUpperCase()}</u></h2>
				})}

				{this.state.urls.map((url, index) => {
					<Contents key={index} url={url} />
				})}
			</div>
		)
	}
}