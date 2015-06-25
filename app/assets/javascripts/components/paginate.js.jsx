/* globals React */
'use strict';
var Paginate = React.createClass({

  // getInitialState: function () {
  //     return {
  //         page: 1;
  //     };
  // },

  render: function () {
    for (var i = 0; i < this.props.data.length; i++) {
      return (
        <div class="row">
          <div class="col-sm-1" ></div>
          <div class="col-sm-11">
            <h3>{ this.props.data[i].name }</h3>
            <NavLink name='Show' url={ '/' + this.props.type + '/' + this.props.data[i].id } />
            <NavLink name='Edit' url={ '/' + this.props.type + '/' + this.props.data[i].id + '/edit' } />
            <NavLink name='Destroy' url={ '/' + this.props.type + '/' + this.props.data[i].id + '/delete' } />
          </div>
        </div>
      );
    };
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
