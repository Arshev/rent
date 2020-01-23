<template>
  <div id="app">
    <div class="col-sm-8">
      <div class="row">
        <div class="form-group col-sm-12">
          <h5 class="this-label">Выбранный автомобиль </h5>
          <template v-if="carId === ''">
            <select v-model="carName">
              <option disabled value="" >Выберите автомобиль</option>
              <option v-for="name in carNames" :key="name.index" >{{ name }}</option>
            </select>
          </template>
          <template v-else>
            <select disabled >
              <option selected :value="carNameWithId" >{{carNameWithId}}</option>
            </select>
          </template>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Имя <span style="color: tomato;">*</span>
            <span style="color: tomato;" v-if="!$v.nameClient.minLength"> - должно содержать минимум {{$v.nameClient.$params.minLength.min}} буквы</span>
            <span style="color: tomato;" v-if="!$v.nameClient.maxLength"> - должно содержать максимум {{$v.nameClient.$params.maxLength.max}} букв</span>
          </h5>
          <input v-model.trim.lazy="$v.nameClient.$model" placeholder="Введите имя" class="form-control" v-bind:class="{ 'error-input': nameError }" required>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Фамилия <span style="color: tomato;">*</span> 
            <span style="color: tomato;" v-if="!$v.lastnameClient.minLength"> - должна содержать минимум {{$v.lastnameClient.$params.minLength.min}} буквы</span>
          </h5>
          <input v-model.trim.lazy="$v.lastnameClient.$model" placeholder="Введите фамилию" class="form-control" v-bind:class="{ 'error-input': lastnameError }" >
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Email <span style="color: tomato;">*</span>
           <span style="color: tomato;" v-if="!$v.emailClient.email"> - неправильный Email</span>
          </h5>
          <input v-model.trim.lazy="$v.emailClient.$model" placeholder="Введите email" class="form-control" v-bind:class="{ 'error-input': emailError }" >
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Телефон <span style="color: tomato;">*</span>
            <span style="color: tomato;" v-if="!$v.phoneClient.minLength"> - неправильный телефон</span>
          </h5>
          <input v-model.trim.lazy="$v.phoneClient.$model" type="tel" placeholder="Введите телефон" class="form-control" v-bind:class="{ 'error-input': phoneError }">
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Дата и время начала аренды<span style="color: tomato;">*</span></h5>
          <flat-pickr v-model="dateStart" :config="configStart" placeholder="Дата и время начала аренды" id="startDate" v-bind:class="{ 'error-input': dateStartError }"></flat-pickr>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Дата окончания <span style="color: tomato;">*</span></h5>
          <flat-pickr v-model="dateEnd" :config="configEnd" placeholder="Дата и время окончания аренды" required></flat-pickr>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Место получения автомобиля</h5>
          <select v-model="locationStart">
            <option value="Офис">Офис (бесплатно)</option>
            <option v-for="location in locations" :key="location.index" >{{ location }}</option>
          </select>
        </div>
        <div class="form-group col-sm-6">
          <h5 class="this-label">Место возврата автомобиля</h5>
          <select v-model="locationEnd">
            <option value="Офис">Офис (бесплатно)</option>
            <option v-for="location in locations" :key="location.index" >{{ location }}</option>
          </select>
        </div>
        <div class="form-group col-sm-12">
          <h5 class="this-label">Дополнительные опции</h5>
          <input type="checkbox" id="checkbox" value=true v-model="babyChair">
          <label for="checkbox">Детское кресло</label>
          <input type="checkbox" id="checkbox" value=true v-model="navigator">
          <label for="checkbox">Навигатор</label>
        </div>
        <div class="form-group col-sm-12">
          <h5 class="this-label">Подтвердите согласие <span>*</span></h5>
          <input type="checkbox" id="checkbox" value="true" v-model="personData">
          <label for="checkbox">Даю согласие на обработку персональных данных, согласно <a href="https://base.garant.ru/12148567/" rel="nofollow">152-ФЗ</a></label>
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
            <li>Цена (за сутки) <span id="car_price"  v-if="price != null ">{{ price }} <small>руб</small></span></li>
            <li>Всего суток<span id="car_days" >{{ days }}</span></li>
            <li id="start_delivery" v-if="(additional_hours * price_hour) > 0 && this.additional_hours * this.price_hour < this.price" >Дополнительные часы <span id="delivery_price">{{ additional_hours * price_hour }} <small>руб</small></span></li>
            <li id="start_delivery" v-if="(locationStartPrice + locationEndPrice) > 0" >Доставка <span id="delivery_price">{{ locationStartPrice + locationEndPrice }} <small>руб</small></span></li>
            <li id="extra_options" v-if="(babyChairPrice + navigatorPrice) > 0">Дополнительные опции <span id="extra_price">{{ babyChairPrice + navigatorPrice }} руб</span></li>
            <li style="color: red;">Итого <span id="total_price" v-if="price != null ">{{ total }} <small>руб</small></span></li>
            <li>Залог <span id="deposit_price" v-if="deposit > 0">{{ deposit }} <small>руб</small></span></li>
          </ul>
          
          <button class="btn btn-primary btn-block" @click="sendBooking()">ОТПРАВИТЬ ЗАЯВКУ</button>
          <ul id="errors">
            <li v-for="error in errors" :key="error.index" class="errors">{{ error }}</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="form-group col-sm-12">
      <details>
        <summary class="summary-booking"><span style="font-size: 120%;font-weight: bold; color:#f77d0a; border: none;"><a>Чтобы оформление документов было быстрее, загрузите фото или сканы документов</a></span></summary>
        <label style="margin-top: 5px;">Копия паспорта
          <input type="file" id="file" ref="file" v-on:change="handleFilesUpload()" style="border: none; margin-top: 5px;"/>
        </label>
        <label style="margin-top: 5px;">Копия водительского удостоверения
          <input type="file" id="file2" ref="file2" v-on:change="handleFilesUpload()" style="border: none; margin-top: 5px;"/>
        </label>
      </details>
    </div>
    <modal
        v-show="isModalVisible"
        @close="closeModal"
      />
  </div>
</template>

<script>
import axios from "axios";
import flatPickr from 'vue-flatpickr-component'
import { Russian } from "flatpickr/dist/l10n/ru"
import ConfirmDatePlugin from 'flatpickr/dist/plugins/confirmDate/confirmDate';
import { required, minLength, maxLength, email, phone } from 'vuelidate/lib/validators'
// import {TheMask} from 'vue-the-mask'
import modal from './packs/components/modal.vue';
import moment from 'moment'
    import 'moment/locale/ru'
    moment.locale('ru')


flatpickr.localize(Russian);

export default {
  data: function() {
    return {
      cars: [],
      carsArr: [],
      carNames: [],
      carId: '',
      carNameWithId: '',
      carName: '',
      price_1: '',
      price_2: '',
      price_3: '',
      price_4: '',
      price_5: '',
      price_hour: '',
      babyChair: false,
      navigator: false,
      babyChairPrice: 0,
      navigatorPrice: 0,
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
          disableMobile: "true",
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateStart = dateObj[0]
          }  
        },
      dateEnd: null,
      additional_hours: 0,
      hours: 0,
      personData: false,
      errors: [],
      configEnd: {
          altFormat: 'j M H:i',
          enableTime: true,
          altInput: true,
          dateFormat: 'm-d-Y H:i',
          minDate: "today",
          time_24hr: true,
          disableMobile: "true",
          plugins: [new ConfirmDatePlugin({confirmText: 'Ok'})],
          onChange: function(dateObj,selectedDates, dateStr, instance) {
            this.dateEnd = dateObj[0]
          }
        },
      locations: [
        'Аэропорт', 
        'Светлогорск', 
        'Зеленоградск', 
        'Другой адрес в Калининграде',
        'Офис'
      ],
      locationStart: 'Офис',
      locationEnd: 'Офис',
      locationStartPrice: 0,
      locationEndPrice: 0,
      price: null,
      deposit: 0,
      total: 0,
      carError: false,
      nameError: false,
      lastnameError: false,
      emailError: false,
      phoneError: false,
      dateStartError: false,
      dateEndError: false,
      personDataError: false,
      isModalVisible: false,
      files: '',
      file: '',
      file2: ''
    };
  },
  validations: {
    nameClient: {
      required,
      minLength: minLength(3),
      maxLength: maxLength(15)
    },
    lastnameClient: {
      required,
      minLength: minLength(2),
      maxLength: maxLength(15)
    },
    emailClient: {
      required,
      email
    },
    phoneClient: {
      required,
      minLength: minLength(5),
      maxLength: maxLength(20)
    }
  },
  created() {
    axios.get("https://amigorent.ru/api/v1/cars.json").then(response => {
      this.cars = response.data;
      const carsArr = []
      this.cars.forEach(function(car) {
        const carId = car.id
        const carName = car.car_name
        carsArr.push({'id': carId, 'car_name': carName, 'price_1': car.price_1, 'price_2': car.price_2, 'price_3': car.price_3, 'price_4': car.price_4, 'price_5': car.price_5, 'price_hour': car.price_hour,'deposit': car.deposit })
      });
      this.carsArr = carsArr
      this.carNames = carsArr.map(obj => obj.car_name)

      if (window.location.search) {
        let uri = window.location.href.split('?');
        if (uri.length == 2)
        {
          let vars = uri[1].split('&');
          let carId = {};
          let tmp = '';
          vars.forEach(function(v){
            tmp = v.split('=');
            if(tmp.length == 2)
            carId[tmp[0]] = tmp[1];
          });
          this.carId = carId.car_id
          let currentCar = carsArr.filter(obj => obj.id == this.carId)
          this.carNameWithId = currentCar[0].car_name
        }
      }
    });
  },
  methods: {
    sendBooking () {
      
      if (this.carName === '') {
        this.errors.push(' - Выберите автомобиль')
        this.carError = true
      }
      if (this.nameClient === '') {
        this.errors.push(' - Заполните имя')
        this.nameError = true
      }
      if (this.lastnameClient === '') {
        this.errors.push(' - Заполните фамилию')
        this.lastnameError = true
      }
      if (this.emailClient === '' || !this.$v.emailClient.email) {
        this.errors.push(' - Заполните корректный Email')
        this.emailError = true
      }
      if (this.phoneClient === '' || !this.$v.phoneClient.minLength) {
        this.errors.push(' - Заполните корректный телефон')
        this.phoneError = true
      }
      if (this.dateStart === null) {
        this.errors.push(' - Выберите дату начала аренды')
        this.dateStartError = true
      }
      if (this.dateEnd === null) {
        this.errors.push(' - Выберите дату окончания аренды')
        this.dateEndError = true
      }
      if (this.personData === false) {
        this.errors.push(' - Подтверите согласие с обработкой персональных данных')
        this.personDataError = true
      }
      if (this.days === 'Минимум 2-е суток') {
        this.errors.push(' - Минимальный срок аренды 2-е суток')
        this.personDataError = true
      }

      if (this.carError === false && this.nameError === false && this.lastnameError === false && this.emailError === false && this.phoneError === false && this.dateStartError === false && this.dateEndError === false && this.personDataError === false && this.days != 'Минимум 2-е суток') {
        
        var self=this;
        // this.file = this.$refs.file.files[0];
        // this.file2 = this.$refs.file2.files[0];
        let formData = new FormData();

        
        formData.append('booking[picture]', this.file);
        if (this.file2 != '') {
          formData.append('booking[prava]', this.file2);
        }
        

        formData.append('booking[start_date]', this.dateStart);
        formData.append('booking[end_date]', this.dateEnd);
        formData.append('booking[location_start]', this.locationStart);
        formData.append('booking[location_end]', this.locationEnd);
        formData.append('booking[firstname]', this.nameClient);
        formData.append('booking[lastname]', this.lastnameClient);
        formData.append('booking[baby_chair]', this.babyChair);
        formData.append('booking[navigator]', this.navigator);
        formData.append('booking[phone]', this.phoneClient);
        formData.append('booking[email]', this.emailClient);
        formData.append('booking[car]', this.carName);
        formData.append('booking[days]', this.days);
        formData.append('booking[price]', this.price);
        formData.append('booking[total]', this.total);

        axios.post('https://amigorent.ru/api/v1/booking.json',
          formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
              }
        )
        .then(function (response) {

          self.dateStart = null
          self.dateEnd = null
          self.locationStart = 'Офис'
          self.locationEnd = 'Офис'
          self.nameClient = ''
          self.lastnameClient = ''
          self.babyChair = false
          self.navigator = false
          self.phoneClient = ''
          self.emailClient = ''
          self.days = 0
          self.price = 0
          self.deposit = 0
          self.total = 0

          self.showModal()
        })
        .catch(function (error) {
          console.log(error);
        });
      
      }
    },
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
    handleFilesUpload(){
      this.file = this.$refs.file.files[0];
      console.log(this.$refs.file.files[0])
      if (this.$refs.file2.files[0] != undefined) {
        this.file2 = this.$refs.file2.files[0];
      }

      console.log(this.$refs.file2.files[0])
    }
  },
  watch: {
    nameClient () {
      this.errors = []
      this.nameError = false
    },
    lastnameClient () {
      this.errors = []
      this.lastnameError = false
    },
    emailClient () {
      this.errors = []
      this.emailError = false
    },
    phoneClient () {
      this.errors = []
      this.phoneError = false
    },
    personData () {
      this.errors = []
      this.personDataError = false
    },
    dateEnd () {
      let start_date = moment(this.dateStart, "MM-DD-YYYY H:mm")
      let end_date = moment(this.dateEnd, "MM-DD-YYYY H:mm")
      
      let hours = moment.duration(end_date.diff(start_date)).asHours()
      
      let start_date_days = moment(this.dateStart, "MM-DD-YYYY")
      let end_date_days = moment(this.dateEnd, "MM-DD-YYYY")
      this.additional_hours = 0
      if (hours > (moment.duration(end_date_days.diff(start_date_days)).asDays() * 24)) {
          this.hours = hours
          let additionalHours = (hours % 24)
          this.additional_hours = Math.trunc(additionalHours)
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();
      //let diff =  Math.floor(( Date.parse(this.dateEnd) - Date.parse(this.dateStart) ) / 86400000)

      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff
        }
        if (diff < 2) {
          this.days = 'Минимум 2-е суток'
        }
        if (diff >=2 && diff <= 3) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_1
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_1
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 3 && diff <= 7) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_2
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_2
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 7 && diff <= 14) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_3
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_3
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 14 && diff <= 30) {
         if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_4
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_4
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 30 ) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_5
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_5
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
      }
      this.errors = []
      this.dateEndError = false
    },
    dateStart () {
      let start_date = moment(this.dateStart, "MM-DD-YYYY H:mm")
      let end_date = moment(this.dateEnd, "MM-DD-YYYY H:mm")
      
      let hours = moment.duration(end_date.diff(start_date)).asHours()
      
      let start_date_days = moment(this.dateStart, "MM-DD-YYYY")
      let end_date_days = moment(this.dateEnd, "MM-DD-YYYY")
      this.additional_hours = 0
      if (hours > (moment.duration(end_date_days.diff(start_date_days)).asDays() * 24)) {
          this.hours = hours
          let additionalHours = (hours % 24)
          this.additional_hours = Math.trunc(additionalHours)
      }
      let diff = moment.duration(end_date_days.diff(start_date_days)).asDays();
      
      //let diff =  Math.floor(( Date.parse(this.dateEnd) - Date.parse(this.dateStart) ) / 86400000)

      if (!isNaN(diff)) {
        if (diff >= 2) {
          this.days = diff
        }
        if (diff < 2) {
          this.days = 'Минимум 2-е суток'
        }
        if (diff >=2 && diff <= 3) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_1
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_1
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 3 && diff <= 7) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_2
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_2
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 7 && diff <= 14) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_3
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_3
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 14 && diff <= 30) {
         if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_4
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_4
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
        if (diff > 30 ) {
          if (this.additional_hours > 0 && this.additional_hours * this.price_hour >= this.price) {
            this.days = diff + 1
            this.price = this.price_5
            this.total = (this.days * this.price) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          } else {
            this.days = diff
            this.price = this.price_5
            this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          }
        }
      }
      this.errors = []
      this.dateStartError = false
    },
    locationStart () {
      switch (this.locationStart) {
        case 'Офис':
          this.locationStartPrice = 0
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Аэропорт':
          this.locationStartPrice = 400
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Зеленоградск':
          this.locationStartPrice = 800
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Светлогорск':
          this.locationStartPrice = 1000
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Другой адрес в Калининграде':
          this.locationStartPrice = 300
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
      }
    },
    locationEnd () {
      switch (this.locationEnd) {
        case 'Офис':
          this.locationEndPrice = 0
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Аэропорт':
          this.locationEndPrice = 400
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Зеленоградск':
          this.locationEndPrice = 800
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Светлогорск':
          this.locationEndPrice = 1000
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
        case 'Другой адрес в Калининграде':
          this.locationEndPrice = 300
          this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
          break;
      }
    },
    carName () {
      let obj = this.carsArr.find(o => o.car_name === this.carName);

      this.price_1 = obj.price_1
      this.price_2 = obj.price_2
      this.price_3 = obj.price_3
      this.price_4 = obj.price_4
      this.price_5 = obj.price_5
      this.price_hour = obj.price_hour
      this.deposit = obj.deposit

      this.errors = []
      this.carError = false
    },
    carNameWithId () {
      let obj = this.carsArr.find(o => o.car_name === this.carNameWithId);
      this.carName = this.carNameWithId

      this.price_1 = obj.price_1
      this.price_2 = obj.price_2
      this.price_3 = obj.price_3
      this.price_4 = obj.price_4
      this.price_5 = obj.price_5
      this.deposit = obj.deposit
    },
    babyChair () {
      if (this.babyChair === true) {
        this.babyChairPrice = 500
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      } else {
        this.babyChairPrice = 0
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      }
    },
    navigator () {
      if (this.navigator === true) {
        this.navigatorPrice = 500
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      } else {
        this.navigatorPrice = 0
        this.total = (this.days * this.price) + (this.additional_hours * this.price_hour) + this.babyChairPrice + this.navigatorPrice + this.locationStartPrice + this.locationEndPrice
      }
    }
  },
  computed: {
        
  },
  components: { 
      flatPickr,
      modal
  }
};
</script>

<style>

</style>
