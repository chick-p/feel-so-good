module.exports = {
  "extends": "airbnb-typescript-prettier",
  "plugins": ["react-app", "jest"],
  "env": {
    "jest": true
  },
  "rules": {
    "prettier/prettier": [
      "error", {
        "singleQuote": true,
        "semi": true,
        "arrowParens": "always"
    }],
  }
};
