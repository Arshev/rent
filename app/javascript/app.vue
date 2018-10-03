<template>
  <div id="app">
    <div class="col-sm-8">
      <div class="row">
        <div class="form-group col-sm-12">
          <h5 class="this-label">Выбранный автомобиль </h5>
          <select v-model="carName">
            <option disabled value="">Выберите автомобиль</option>
            <option v-for="name in carNames" :key="name" >{{ name }}</option>
          </select>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Имя <span style="color: tomato;">*</span></h5>
          <input v-model="nameClient" placeholder="Введите имя" class="form-control">
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Фамилия <span style="color: tomato;">*</span></h5>
          <input v-model="lastnameClient" placeholder="Введите фамилию" class="form-control">
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Email <span style="color: tomato;">*</span></h5>
          <input v-model="emailClient" placeholder="Введите email" class="form-control">
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Телефон <span style="color: tomato;">*</span></h5>
          <input v-model="phoneClient" placeholder="Введите телефон" class="form-control">
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Дата и время начала аренды<span style="color: tomato;">*</span></h5>
          <flat-pickr v-model="dateStart" :config="configStart" placeholder="Дата и время начала аренды" id="startDate"></flat-pickr>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Дата окончания <span style="color: tomato;">*</span></h5>
          <flat-pickr v-model="dateEnd" :config="configEnd" placeholder="Дата и время окончания аренды"></flat-pickr>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Место получения автомобиля <span style="color: tomato;">*</span></h5>
          
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Место возврата автомобиля <span style="color: tomato;">*</span></h5>
          
        </div>
        <div class="form-group col-sm-12">
          <h5 class="this-label">Дополнительные опции</h5>
          
        </div>
        <div class="form-group col-sm-12">
          <h5 class="this-label">Подтвердите согласие <span>*</span></h5>
          
        </div>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="your-order row m0">
        <h4 class="this-heading">Стоимость</h4>
        <div class="row order-data">
          <div class="media name-of-car">
            <div class="media-left media-middle"><span>Название</span></div>
            <div class="media-body" id="car_name">
              {{ carName }}
            </div>
          </div>
          <ul class="nav other-infos-car">
            <li>Цена (за сутки) <span id="car_price"></span></li>
            <li>Всего суток<span id="car_days">{{ days }}</span></li>
            <li id="extra_options">Дополнительные опции <span id="extra_price"></span></li>
            <li style="color: red;">Итого <span id="total_price"></span></li>
            <li>Залог <span id="deposit_price">
              
            </span></li>
          </ul>
        </div>
        
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import flatPickr from 'vue-flatpickr-component'
import { Russian } from "flatpickr/dist/l10n/ru"
import ConfirmDatePlugin from 'flatpickr/dist/plugins/confirmDate/confirmDate';

flatpickr.localize(Russian);

export default {
  data: function() {
    return {
      cars: [],
      carsArr: [],
      carNames: [],
      carId: '',
      carName: '',
      price_1: '',
      days: null,
      nameClient: '',
      lastnameClient: '',
      emailClient: '',
      phoneClient: '',
      dateStart: null,
      configStart: {
          altFormat: 'j M H:i',
          enableTime: true,
          altInput: true,
          dateFormat: 'm-d-Y H:i',
          minDate: "today",
          time_24hr: true,
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateStart = dateObj[0]
          }  
        },
      dateEnd: null,
      configEnd: {
          altFormat: 'j M H:i',
          enableTime: true,
          altInput: true,
          dateFormat: 'm-d-Y H:i',
          minDate: "today",
          time_24hr: true,
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateEnd = dateObj[0]
          }
        }

    };
  },
  created() {
    axios.get("http://localhost:5000/api/v1/cars.json").then(response => {
      this.cars = response.data;
      const carsArr = []
      this.cars.forEach(function(car) {
        const carId = car.id
        const carName = car.car_name
        carsArr.push({'id': carId, 'car_name': carName, 'price_1': car.price_1})
      });
      this.carsArr = carsArr
      this.carNames = carsArr.map(obj => obj.car_name)
    });
  },
  methods: {
    getDates() {
      let diff =  Math.floor(( Date.parse(this.dateEnd) - Date.parse(this.dateStart) ) / 86400000)

    },
    postName() {
      axios
        .put("http://localhost:5000/api/v1/cars/1", {
          car_name: this.name
        })
        .catch(e => {
          this.errors.push(e);
        });
    },
    getCarName(name) {
      console.log(name)
    },
    getCarId(value) {
      let obj = this.carsArr.find(o => o.car_name === value);
        this.carName = obj.car_name
    }
  },
  watch: {
    dateEnd () {
      let diff =  Math.floor(( Date.parse(this.dateEnd) - Date.parse(this.dateStart) ) / 86400000)
      this.days = diff
    }
  },
  components: { 
      flatPickr
     }
};
</script>

<style scoped>

</style>
