// https://github.com/vuejs/vuepress/blob/master/.eslintrc.js
// edited
module.exports = {
  root: true,
  extends: ['plugin:vue-libs/recommended'],
  rules: {
    'prefer-const': ['off'],
    indent: ['error', 2, { MemberExpression: 'off' }]
  }
}
