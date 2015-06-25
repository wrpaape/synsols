/* globals React */
'use strict';
var Paginate = React.createClass({
  render: function () {
    var rows = [];
    for (var i = 0; i < this.props.data.length; i++) {
      rows.push(<DataRow elem={ this.props.data[i] } type={ this.props.type } />);
    }
    return (<div>{rows}</div>);
  }
});

var DataRow = React.createClass({
  render: function () {
    return (
      <div className="row">
        <div className="col-sm-1"></div>
        <div className="col-sm-11">
          <h3>{ this.props.elem.name }</h3>
          <NavLink name='Show' url={ '/' + this.props.type + '/' + this.props.elem.id } method='get' />
          <NavLink name='Edit' url={ '/' + this.props.type + '/' + this.props.elem.id + '/edit' } method='get' />
          <NavLink name='Destroy' url={ '/' + this.props.type + '/' + this.props.elem.id } method='delete' />
        </div>
      </div>
    );
  }
});

var NavLink = React.createClass({
  render: function () {
    return (<a onClick={this.clicked} dataMethod={this.props.method} className='btn btn-default'>{this.props.name}</a>);
  },
  clicked: function () {
    window.location.href = this.props.url;
  }
});
