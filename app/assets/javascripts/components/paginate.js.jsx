/* globals React */
'use strict';
var Paginate = React.createClass({

  getInitialState: function () {
      return {
          isFavorite: false
      };
  },

  render: function () {
    return (
      <nav>
        <NavLink name='Home' url='/' />
        <NavLink name='Posts' url='/posts' />
        <NavLink name='About' url='/about' />
      </nav>
    );
  }
});

var NavLink = React.createClass({
  render: function () {
    return (<a onClick={this.clicked} className='btn btn-default'>{this.props.name}</a>);
  },
  clicked: function () {
    window.location.href = this.props.url;
  }
});
