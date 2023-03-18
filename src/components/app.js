import React, { Component } from "react";
import Navbar from "./Navbar";
import Marketplace from "./Marketplace";
import CreateBono from "./CreateBono";
import CreateProducto from "./CreateProducto";

class App extends Component {
  render() {
    return (
      <div>
        <Navbar />
        <Marketplace />
        <CreateBono />
        <CreateProducto />
      </div>
    );
  }
}

export default App;
