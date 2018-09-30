<template>
  <div id="app">
    <v-app>
      <ul>
        <li v-for="car in cars" :key="car.id">
          {{car.car_name}}
        </li>
      </ul>
      <div>
        <v-btn color="success">Success</v-btn>
        <v-btn color="error">Error</v-btn>
        <v-btn color="warning">Warning</v-btn>
        <v-btn color="info">Info</v-btn>
      </div>
    </v-app>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      cars: []
    };
  },
  created() {
    axios.get('http://localhost:5000/api/v1/cars.json')
        .then(response => {
          this.cars = response.data
    })
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
