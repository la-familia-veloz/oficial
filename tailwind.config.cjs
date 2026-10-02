/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html"],
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        brandMustard: "#E69A28",
        brandTerracotta: "#C84B31",
        brandCharcoal: "#1E1818",
        brandCream: "#FAF7F2",
        brandCardDark: "#282222",
        brandCardLight: "#FFFFFF",
      },
      fontFamily: {
        syne: ["Syne", "sans-serif"],
        jakarta: ["Plus Jakarta Sans", "sans-serif"],
      },
    },
  },
};
