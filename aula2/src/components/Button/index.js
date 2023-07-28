import React, {Component} from "react";
import {View, Text, TouchableOpacity, Alert} from "react-native";
import PropTypes from "prop-types";

export default class extends Component {
    static PropTypes = {
        alerta: PropTypes.string
    };

    static defaultProps = {
        alerta: "Valor padrao"
    }

    render() {
        return (
            <TouchableOpacity onPress={() => {
                Alert.alert(this.props.alerta);
            }}
            >
              {this.props.children}
            </TouchableOpacity>
        )
    }
}