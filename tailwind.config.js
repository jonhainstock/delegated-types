module.exports = {
  mode: 'jit',
  plugins: [
    require('@tailwindcss/forms'),
  ],
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ]
}
