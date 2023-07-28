import React, {Component, Fragment} from 'react';
import type {PropsWithChildren} from 'react';
import {
  SafeAreaView,
  StatusBar,
  Text,
  Touchable,
  TouchableOpacity,
  View
} from 'react-native';

import Button from './src/components/Button';


export default class App extends Component {
  state = {
    contador: 0,
    name: ''
  };
  apertou = () => {
    this.setState({contador: this.state.contador + 1});
  };

  mudouNome = nome => {
    this.setState({ name: nome });
  };

  render() {
    return (
      <Fragment>
        <StatusBar barStyle="dark-content"/>
        <SafeAreaView>
        <Text>{this.state.contador}</Text>
        <TouchableOpacity onPress={this.apertou}>
          <Text>Somar</Text>
        </TouchableOpacity>
        </SafeAreaView>
      </Fragment>
    );
  }
}
