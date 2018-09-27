document.addEventListener("turbolinks:load", function() {
  var value = 0, car = 0, total = 0, extra_price = 0, baby_chair = 0, nav = 0, delivery_price = 0, delivery_price_start = 0, delivery_price_end = 0, total_price = 0;

  $("#booking_car").click( function() {
    if (gon.cars_info) {
      value = $("#booking_car").val();
      car = gon.cars_info[value-1]
      $(".car_name").remove();
      $( `<p class="car_name" id="car_name_${car.id}">${car.car_name}</p>` ).appendTo( "#car_name" );
      // Залог
      $(".deposit_price").remove();
      $( `<p class="deposit_price">${car.deposit} руб</p>` ).appendTo( "#deposit_price" );
    }
  });
    if (gon.cars_info) {
      $('#reservation_start_date').datepicker({
        dateFormat: 'dd-mm-yy',
        minDate: 0,
        maxDate: '6m',
        onSelect: function(selected) {
          $('#reservation_end_date').datepicker("option", "minDate", selected);
          $('#reservation_end_date').attr("disabled", false);
        }
      });

      $('#reservation_end_date').datepicker({
        dateFormat: 'dd-mm-yy',
        minDate: 0,
        maxDate: '6m',
        onSelect: function(selected) {

          $('#reservation_start_date').datepicker("option", "maxDate", selected);
          var start_date = $('#reservation_start_date').datepicker('getDate');
          var end_date = $('#reservation_end_date').datepicker('getDate');
          var nights = (end_date - start_date)/1000/60/60/24;
          var price;

          if (nights > 3 && nights <= 7) {
            price  = car.price_2;
          } else if (nights > 7 && nights <= 14) {
            price  = car.price_3;
          } else if (nights > 14) {
            price  = car.price_4;
          } else {
            price  = car.price_1;
          }

          total = nights * price;
          $('#car_price').text(price + " руб");
          $('#car_days').text(nights);
          $('#reservation_total').text(total);
          // Активирую кнопку ОТПРАВИТЬ
          $('#btn_book').attr("disabled", false);

          // Итого
          total_price = total + extra_price + delivery_price;
          $('#total_price').text(total_price + " руб");
        }
      });
      // Доставка
      $("#booking_location_start").click( function() {
        delivery_start = $("#booking_location_start").val();
        switch (delivery_start) {
          case "Аэропорт":
            delivery_price_start = 400;
            break;
          case "Светлогорск":
            delivery_price_start = 1000;
            break;
          case "Зеленоградск":
            delivery_price_start = 800;
            break;
          case "Другой адрес в Калининграде":
            delivery_price_start = 300;
            break;
          default:
            delivery_price_start = 0;
        }
        delivery_price = delivery_price_end + delivery_price_start;

        if (delivery_price > 0) {
          $("#start_delivery").remove();
          $("#extra_options").append(`<li id="start_delivery">Доставка <span id="delivery_price">${delivery_price} руб</span></li>`)
        } else {
          $("#start_delivery").remove();
        }
        // Итого
        total_price = total + extra_price + delivery_price;
        $('#total_price').text(total_price + " руб");
      });

      $("#booking_location_end").click( function() {
        delivery_end = $("#booking_location_end").val();
        switch (delivery_end) {
          case "Аэропорт":
            delivery_price_end = 400;
            break;
          case "Светлогорск":
            delivery_price_end = 1000;
            break;
          case "Зеленоградск":
            delivery_price_end = 800;
            break;
          case "Другой адрес в Калининграде":
            delivery_price_end = 300;
            break;
          default:
            delivery_price_end = 0;
        }
        delivery_price = delivery_price_end + delivery_price_start;

        if (delivery_price > 0) {
          $("#start_delivery").remove();
          $("#extra_options").append(`<li id="start_delivery">Доставка <span id="delivery_price">${delivery_price} руб</span></li>`)
        }
        // Итого
        total_price = total + extra_price + delivery_price;
        $('#total_price').text(total_price + " руб");
      });

      // Залог
      if (value !== 0) {
        $('#deposit_price').text(car.deposit + " руб");
      }
    };
    // Считаю доп услуги
    $("#booking_baby_chair").on("change", function() {
      if(this.checked) {
        baby_chair = 500;
        extra_price += baby_chair;
        $('#extra_price').text(extra_price + " руб");
      } else {
          extra_price -= baby_chair;
        $('#extra_price').text(extra_price + " руб");
      }
      // Итого
      total_price = total + extra_price + delivery_price;
      $('#total_price').text(total_price + " руб");
    });
    $("#booking_navigator").on("change", function() {
      if(this.checked) {
        nav = 500;
        extra_price += nav;
        $('#extra_price').text(extra_price + " руб");
      } else {
          extra_price -= nav;
        $('#extra_price').text(extra_price + " руб");
      }
      // Итого
      total_price = total + extra_price + delivery_price;
      $('#total_price').text(total_price + " руб");
    });
});
