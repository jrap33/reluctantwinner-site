/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        primary: '#2C3E50',
        'off-white': '#FAFAFA',
        'dark-gray': '#333333',
        'light-gray': '#666666',
        'border-gray': '#E5E5E5'
      },
      fontFamily: {
        'playfair': ['Playfair Display', 'serif'],
        'source': ['Source Sans Pro', 'sans-serif']
      },
      typography: {
        DEFAULT: {
          css: {
            color: '#333333',
            fontSize: '18px',
            lineHeight: '1.7',
            fontFamily: 'Source Sans Pro, sans-serif',
            h1: {
              fontFamily: 'Playfair Display, serif',
              color: '#333333',
              fontWeight: '700'
            },
            h2: {
              fontFamily: 'Playfair Display, serif',
              color: '#333333',
              fontWeight: '600'
            },
            h3: {
              fontFamily: 'Playfair Display, serif',
              color: '#333333',
              fontWeight: '600'
            },
            a: {
              color: '#2C3E50',
              '&:hover': {
                color: '#1A252F'
              }
            }
          }
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}