<template>
  <form style="display: inline;" @submit.prevent="deleteTodo(todo._id)">
    <div class="input-group">
      <div class="input-group-prepend">
        <div class="input-group-text h-100">
          <input type="checkbox" name="isDone" :checked="todo.isDone" disabled>
        </div>
      </div>
      <input class="form-control" type="text" placeholder="name" name="name" disabled v-model="todo.name">
      <div class="input-group-append">
        <router-link class="btn btn-success" :to="`/edit/${todo._id}`">edit</router-link>
        <button class="btn btn-danger">delete</button>
      </div>
    </div>
  </form>
</template>

<script>
const api = 'https://aqueous-dawn-04820.herokuapp.com/api/todos' || 'http://localhost:8081/api/todos'
export default {
  name: 'Detail',
  mounted () {
    const id = this.$route.params.id
    this.axios.get(`${api}/${id}`)
      .then(todo => {
        this.todo = todo.data.todo
      })
      .catch(err => {
        console.log(err)
      })
  },
  data () {
    return {
      todo: {}
    }
  },
  methods: {
    deleteTodo (id) {
      this.axios.delete(`${api}/${id}`)
        .then(() => {
          this.$router.push('/')
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>
