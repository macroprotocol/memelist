const path = require('path');

module.exports = {
  content: [
    path.join(__dirname, 'index.html'),
    path.join(__dirname, 'dist/index.html'),
    path.join(__dirname, 'src/**/*.{ts,tsx,js,jsx,html}'),
    path.join(__dirname, 'public/**/*.html'),
  ],
  css: [
    path.join(__dirname, 'dist/assets/*.css'),
  ],
  output: path.join(__dirname, 'dist/assets'),
  safelist: {
    standard: [
      /^data-\[.*\]:.*/,
      /^radix-.*/,            // Radix UI runtime classes
      /^wallet-.*/,           // custom wallet classes (do not touch logic)
      /^embla-.*/,            // carousel
      /^sonner.*/,            // toast library
      /^animate-/,            // animations used dynamically
    ],
    deep: [
      /\[data-state\=(open|closed|active|inactive|checked|unchecked)\]/,
      /\[data-side\=(top|right|bottom|left)\]/,
    ],
  },
  defaultExtractor: (content) => {
    const broadMatches = content.match(/[^<>'"`\s]*[^<>'"`\s:]/g) || [];
    const broadMatchesWithSeparators = content.match(/[^<>'"`\s.()]*[^<>'"`\s.():]/g) || [];
    return broadMatches.concat(broadMatchesWithSeparators);
  },
};


