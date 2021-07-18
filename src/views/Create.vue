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
const createApi = 'https://aqueous-dawn-04820.herokuapp.com/api/todos' || 'http://localhost:8081/api/todos'
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
        await this.axios.post(createApi, { name: this.name })
        this.name = ''
        this.$router.push('/')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
