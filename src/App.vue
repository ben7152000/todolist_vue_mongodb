<template>
  <div id="app" class="bg-light">
    <header>
      <nav class="navbar navbar-dark bg-primary justify-content-between">
        <router-link class="navbar-brand" to="/">Todo List</router-link>
        <router-link class="btn btn-outline-light" to="/create">Create</router-link>
      </nav>
    </header>
    <div class="container mt-3">
      <router-view/>
    </div>
  </div>
</template>

<style lang="scss">

</style>
