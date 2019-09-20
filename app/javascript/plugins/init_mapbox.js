import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');


const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '24px';
    element.style.height = '24px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

// const fitMapToMarkers = (map, markers) => {
//   console.log(markers)
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };

const fitMapToLocation = (map, geoLoc) => {
  navigator.geolocation.getCurrentPosition((data) => {
        const lat = data.coords.latitude;
        const long = data.coords.longitude;
        console.log(lat, long);
        map.flyTo({center: [long, lat], zoom: 14});
      })
}

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
    const geoLoc = document.getElementById('geoloc-target');

    fitMapToLocation(map, geoLoc);

    geoLoc.addEventListener('click', () => {
      fitMapToLocation(map, geoLoc);
    });
  }
};



export { initMapbox };
