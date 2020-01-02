module.exports = {
  "extends": "airbnb-typescript-prettier",
  "plugins": ["jest"],
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
