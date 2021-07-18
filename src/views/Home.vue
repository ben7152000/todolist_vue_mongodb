<template>
  <ul class="list-group">
    <li class="list-group-item" v-for="todo in todos" :key="todo._id">
      <div class="row">
        <div class="col-auto mr-auto">
          <input class="me-3 h-100" style="vertical-align: middle;" type="checkbox" name="isDone" :checked="todo.isDone" disabled>
          <h4 style="display: inline; vertical-align: middle;">{{ todo.name }}</h4>
        </div>
        <div class="col-auto">
          <router-link class="btn btn-primary me-2" :to="`/detail/${todo._id}`">detail</router-link>
          <router-link class="btn btn-success me-2" :to="`/edit/${todo._id}`">edit</router-link>
          <form style="display: inline;" @submit.prevent="deleteTodo(todo._id)">
            <button class="btn btn-danger">delete</button>
          </form>
        </div>
      </div>
    </li>
  </ul>
</template>

<script>
const api = 'https://aqueous-dawn-04820.herokuapp.com/api' || 'http://localhost:8081/api'
const deleteApi = 'https://aqueous-dawn-04820.herokuapp.com/api/todos' || 'http://localhost:8081/api/todos'
export default {
  name: 'Home',
  data () {
    return {
      todos: []
    }
  },
  mounted () {
    this.axios.get(api)
      .then(data => {
        this.todos = data.data.todos
      })
      .catch(err => {
        console.log(err)
      })
  },
  methods: {
    deleteTodo (id) {
      this.axios.delete(`${deleteApi}/${id}`)
        .then(() => {
          this.$router.go('/')
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>
