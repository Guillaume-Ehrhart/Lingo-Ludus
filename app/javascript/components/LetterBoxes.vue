<template>
  <div>
    <div class="d-flex justify-content-center mb-2">
      <div
        v-for="(letter, index) in guessedWordArray"
        :key="index"
        :class="['letter-box', letterClass(letter)]"
      >
        {{ letter }}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    guessedWord: {
      type: String,
      required: true,
    },
    correctLetters: {
      type: Array,
      required: true,
    },
    presentLetters: {
      type: Array,
      required: true,
    },
  },
  computed: {
    guessedWordArray() {
      return this.guessedWord.split('');
    },
  },
  methods: {
    letterClass(letter) {
      if (this.correctLetters.includes(letter)) {
        return 'bg-primary text-white';
      } else if (this.presentLetters.includes(letter)) {
        return 'bg-warning text-white';
      } else {
        return 'bg-danger text-white';
      }
    },
  },
};
</script>

<style scoped>
.letter-box {
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 2px;
  font-size: 20px;
  border-radius: 5px;
}
</style>
