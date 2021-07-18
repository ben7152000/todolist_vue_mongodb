<template>
  <form style="display: inline;" @submit.prevent="updateTodo(todo._id)">
    <div class="input-group">
      <div class="input-group-prepend">
        <div class="input-group-text h-100">
          <input type="checkbox" name="isDone" :checked="todo.isDone" v-model="todo.isDone">
        </div>
      </div>
      <input class="form-control" type="text" placeholder="name" name="name" v-model="todo.name">
      <div class="input-group-append">
        <button class="btn btn-success">Save</button>
      </div>
    </div>
  </form>
</template>

<script>
export default {
  name: 'Edit',
  mounted () {
    const id = this.$route.params.id
    this.axios.get(`http://localhost:8081/api/todos/${id}`)
      .then(todo => {
        this.todo = todo.data.todo
      })
  },
  data () {
    return {
      todo: {}
    }
  },
  methods: {
    updateTodo (id) {
      console.log(this.todo.isDone)
      this.axios.put(`http://localhost:8081/api/todos/${id}`, {
        name: this.todo.name,
        isDone: this.todo.isDone === true ? 'on' : false
      })
        .then(() => {
          this.$router.push(`/detail/${id}`)
        })
        .catch(err => {
          console.log(err)
        })
    }
  }
}
</script>
