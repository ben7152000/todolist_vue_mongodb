<template>
  <form @submit.prevent="createTodo">
    <div class="input-group mb-3">
      <input type="text" placeholder="name" name="name" class="form-control" v-model="name">
      <div class="input-group-append">
        <button class="btn btn-success">Create</button>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  name: 'Create',
  data () {
    return {
      name: ''
    }
  },
  methods: {
    async createTodo () {
      try {
        await this.axios.post('http://localhost:8081/api/todos', { name: this.name })
        this.name = ''
        this.$router.push('/')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
