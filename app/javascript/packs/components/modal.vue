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
  /* Modal */
.my-modal-backdrop {
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.3);
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .my-modal {
    background: #FFFFFF;
    box-shadow: 2px 2px 20px 1px;
    overflow-x: auto;
    display: flex;
    flex-direction: column;
  }

  .my-modal-header,
  .my-modal-footer {
    padding: 15px;
    display: flex;
  }

  .my-modal-header {
    border-bottom: 1px solid #eeeeee;
    color: #4AAE9B;
    justify-content: space-between;
  }

  .my-modal-footer {
    border-top: 1px solid #eeeeee;
    justify-content: flex-end;
  }

  .my-modal-body {
    position: relative;
    padding: 20px 10px;
  }

  .my-btn-close {
    border: none;
    font-size: 20px;
    padding: 20px;
    cursor: pointer;
    font-weight: bold;
    color: #4AAE9B;
    background: transparent;
  }

  .my-btn-green {
    color: white;
    background: #4AAE9B;
    border: 1px solid #4AAE9B;
    border-radius: 2px;
  }
</style>
