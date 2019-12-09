<script>
  export default {
    name: 'modal',
    methods: {
      close() {
        this.$emit('close');
      },
    },
  };
</script>
<template>
  <transition name="modal-fade">
    <div class="my-modal-backdrop">
      <div class="my-modal"
        role="dialog"
        aria-labelledby="modalTitle"
        aria-describedby="modalDescription"
      >
        <header
          class="my-modal-header"
          id="modalTitle"
        >
          <slot name="header">
            <h2>Заявка успешно отправлена</h2>

            <button
              type="button"
              class="my-btn-close"
              @click="close"
              aria-label="Закрыть"
            >
              x
            </button>
          </slot>
        </header>
        <section
          class="my-modal-body"
          id="modalDescription"
        >
          <slot name="body">
            Мы свяжемся с вами в ближайщее время, если этого не произойдет, позвоните нам!
          </slot>
        </section>
        <footer class="my-modal-footer">
          <slot name="footer">
            <div>Спасибо за обращение!</div>
            <br>
            <button
              type="button"
              class="my-btn-green"
              @click="close"
              aria-label="Закрыть"
            >
              Закрыть!
            </button>
          </slot>
        </footer>
      </div>
    </div>
  </transition>
</template>
<style>
  
</style>
