/* globals React */
'use strict';
var Paginate = React.createClass({
  getInitialState: function () {
    return {
      page: 1
    };
  },
  render: function () {
    var rows = [];
  // switch (this.state.page) {
  //   case 1:
  //     var i_0 = ;
  //     var i_f = ;
  //     break;
  //   case 2:
  //     var i_0 = ;
  //     var i_f = ;
  //     break;
  //   case 3:
  //     var i_0 = ;
  //     var i_f = ;
  //     break;
  // }
    for (var i = 0; i < this.props.data.length; i++) {
      rows.push(<DataRow elem={ this.props.data[i] } type={ this.props.type } />);
    }
    return (<div>{rows}</div>)
  }
});

var DataRow = React.createClass({
  getInitialState: function () {
    return {
      show: 'true'
    };
  },
  render: function () {
    if (this.state.show === 'true') {
    return (
      <div className='row'>
        <div className='col-sm-1'></div>
        <div className='col-sm-11'>
          <h3>{ this.props.elem.name }</h3>
          <NavLink name='Show' url={ '/' + this.props.type + '/' + this.props.elem.id } method='GET' parent={ this } />
          <NavLink name='Edit' url={ '/' + this.props.type + '/' + this.props.elem.id + '/edit' } method='GET' parent={ this } />
          <NavLink name='Destroy' url={ '/' + this.props.type + '/' + this.props.elem.id } method='DELETE' parent={ this } />
        </div>
      </div>
    )
    } else {
      return (<div></div>)
    }
  }
});

var NavLink = React.createClass({
  getInitialState: function () {
    return {
        grandparent: this.props.parent
    };
  },
  render: function () {
    return (<a onClick={ this.clicked } className='btn btn-default'>{ this.props.name }</a>)
  },
  clicked: function () {
    if (this.props.method === 'DELETE') {
      $.ajax({
        url: this.props.url,
        type: 'DELETE',
        error: function () {
          this.state.grandparent.setState({ show: 'false'});
        }.bind(this)
      });
    } else {
        window.location.href = this.props.url;
    }
  }
});
