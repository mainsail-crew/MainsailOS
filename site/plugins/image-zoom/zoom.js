import siteConfig from '@generated/docusaurus.config';
import mediumZoom from 'medium-zoom'

const { themeConfig } = siteConfig;

export default (function () {

  if ( typeof window === 'undefined' ) {
    return null;
  }

  const selector = (themeConfig&&themeConfig.zoomSelector) || '.markdown img';
  const options = (themeConfig&&themeConfig.zoomOptions) || undefined;

  setTimeout(() => {
    mediumZoom(selector);
  }, 1000);


  return {
    onRouteUpdate({ location }) {

      if( location && location.hash && location.hash.length ) {
        return;
      }

      setTimeout(() => {
        mediumZoom(selector, options);
      }, 1000);

    },
  };
})();