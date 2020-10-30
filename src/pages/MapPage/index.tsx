import React from 'react';
import { Map, TileLayer, Marker } from 'react-leaflet';

// import { Container } from './styles';

const MapPage: React.FC = () => {
  return (
    <>
      <div style={{ flex: 1, minHeight: 600, minWidth: 800 }}>
        <Map center={[-22.4036192, -47.5963294]} zoom={15}>
          <TileLayer
            attribution='&amp;copy <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />
        </Map>
      </div>
    </>
  );
};

export default MapPage;
