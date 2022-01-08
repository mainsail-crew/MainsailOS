// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/nightOwl');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'RatOS',
  tagline: 'The easy way to run Klipper on your 3D printer',
  url: 'https://os.ratrig.com',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.png',
  organizationName: 'Rat-OS', // Usually your GitHub org/user name.
  projectName: 'RatOS', // Usually your repo name.

  presets: [
    [
      '@docusaurus/preset-classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl: 'https://github.com/Rat-OS/RatOS/edit/master/site/',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          editUrl:
            'https://github.com/Rat-OS/RatOS/edit/master/site/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],
  plugins: [
    './plugins/image-zoom/index.js'
  ],
  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: 'img/site-banner.png',
      algolia: {
        // If Algolia did not provide you any appId, use 'BH4D9OD16A'
        appId: 'BH4D9OD16A',
  
        // Public API key: it is safe to commit it
        apiKey: 'ad8f23a9185eed2471ddcb819c4f30c5',
  
        indexName: 'ratrig',
  
        // Optional: see doc section below
        contextualSearch: true,
  
        //... other Algolia params
      },
      zoomOptions: {
        background: '#000',
        margin: 60,
      },
      gtag: {
        trackingID: 'G-NQB0MHKGLP',
        anonymizeIP: true,
      },
      colorMode: {
        defaultMode: 'dark',
        disableSwitch: true,
      },
      navbar: {
        title: '',
        logo: {
          alt: 'RatOS',
          src: 'img/logos/Logo-white.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'introduction',
            position: 'left',
            label: 'Documentation',
          },
          {to: '/blog', label: 'Blog', position: 'left'},
          {to: '/changelog', label: 'Changelog', position: 'left'},
          {href: 'https://github.com/sponsors/miklschmidt', label: 'Donate/Sponsor', position: 'left'},
          {
            href: 'https://discord.gg/ratrig',
            label: 'Discord',
            position: 'right',
          },
          {
            href: 'https://github.com/Rat-OS/RatOS',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      // footer: {
      //   style: 'dark',
      //   links: [
      //     {
      //       title: 'Docs',
      //       items: [
      //         {
      //           label: 'Getting Started',
      //           to: '/docs/introduction',
      //         },
      //       ],
      //     },
      //     {
      //       title: 'Community',
      //       items: [
      //         {
      //           label: 'Discord',
      //           href: 'https://discord.gg/ratrig',
      //         },
      //       ],
      //     },
      //     {
      //       title: 'More',
      //       items: [
      //         {
      //           label: 'Blog',
      //           to: '/blog',
      //         },
      //         {
      //           label: 'GitHub',
      //           href: 'https://github.com/Rat-OS/RatOS',
      //         },
      //       ],
      //     },
      //   ],
      //   copyright: `Copyright © ${new Date().getFullYear()} Mikkel Schmidt.`,
      // },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
        additionalLanguages: ['django', 'properties'],
      },
    }),
};

module.exports = config;
