import fetch from "cross-fetch";

const Util = class Util {
  static nodeApiFetch( path ) {
    return fetch( `${$( "meta[name='config:inaturalist_api_url']" ).attr( "content" )}/${path}`, { method: "GET" } ).
      then( response => {
        if ( response.status >= 200 && response.status < 300 ) {
          return response;
        } else {
          const error = new Error( response.statusText );
          error.response = response;
          throw error;
        } } ).
      then( response => response.text( ) ).
      then( text => {
        if ( text ) { return JSON.parse( text ); }
        return text;
      } );
  }

  static numberWithCommas( num ) {
    if ( !num && num !== 0 ) { return ""; }
    return I18n.toNumber( num, { precision: 0 } );
  }
};

export default Util;
