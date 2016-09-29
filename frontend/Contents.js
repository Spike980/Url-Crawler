import React from 'react';
import ReactDOM from 'react-dom';

class Contents extends React.Component {
	render() {
		return (
			<div id="url-content">
				<h2><u>{this.props.url.url.toUpperCase()}:</u></h2>
				<h4><em>h1</em></h4>
				{this.props.url.url_contents.map((url_content) => {
					if(url_content.content_type === 'h1') {
						return (<li>{url_content.content}</li>)
					}
				})}

				<br/>
				<h4><em>h2</em></h4>
				{this.props.url.url_contents.map((url_content) => {
					if(url_content.content_type == 'h2') {
						return (<li>{url_content.content}</li>)
					}
				})}

				<br/>
				<h4><em>h3</em></h4>
				{this.props.url.url_contents.map((url_content) => {
					if(url_content.content_type == 'h3') {
						return (<li>{url_content.content}</li>)
					}
				})}
				<br/>

				<h4><em>links</em></h4>
				{this.props.url.url_contents.map((url_content) => {
					if(url_content.content_type == 'link') {
						return (<li>{url_content.content}</li>)
					}
				})}
				<br/>
			</div>
		)
	}
}

export default Contents;