<template>
  <div id="app">
    <v-app>
      
      <v-container fluid grid-list-xl>
        <v-layout wrap align-center>
          <v-flex xs12 sm6 d-flex>
            <v-select
              :items="carNames"
              label="Выберите автомобиль"
              solo
            ></v-select>
          </v-flex>
        </v-layout>
      </v-container>
      
      <div>
        <v-form v-model="valid">
          <v-text-field
            v-model="name"
            :rules="nameRules"
            :counter="15"
            label="Name"
            required
          ></v-text-field>
          <ul v-if="errors && errors.length">
            <li v-for="error of errors" :key="error">
              {{error.message}}
            </li>
          </ul>
          <v-btn @click="getCarNames">
            submit
          </v-btn>
        </v-form>
      </div>
    </v-app>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      cars: [],
      carNames: [],
      valid: false,
      name: "",
      nameRules: [
        v => !!v || "Name is required",
        v => v.length <= 15 || "Имя должно быть меньше 15 символов!"
      ],
      errors: []
    };
  },
  created() {
    axios.get("http://localhost:5000/api/v1/cars.json").then(response => {
      this.cars = response.data;
      const carNames = []
      this.cars.forEach(function(car) {
        carNames.push(car.car_name)
      });
      this.carNames = carNames;
    });
  },
  methods: {
    postName() {
      axios
        .put("http://localhost:5000/api/v1/cars/1", {
          car_name: this.name
        })
        .catch(e => {
          this.errors.push(e);
        });
    },
    getCarNames(event) {
      console.log(this.carNames)
    }
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
