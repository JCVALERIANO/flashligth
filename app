import React, {useEffect, useState} from 'react';
import { StyleSheet, Text, View, Image, TouchableOpacity, Alert} from 'react-native';
import Torch from 'react-native-torch';
import RNShake from 'react-native-shake';


const App: React.FC = () => {

const [toggle, setToggle] = useState(false);

const handleChargeToggle = () => setToggle (oldToggle => !oldToggle);

useEffect(() => {
  Torch.switchState(toggle);
}, [toggle]);

useEffect(() => {
  const subscription = RNShake.addListener(() => {
    setToggle(oldToggle => !oldToggle);
  });

  return () => subscription.remove();
  }, []);

  return (
   
    <View style={toggle ? styles.containerlight:styles.container}>
      <TouchableOpacity onPress = {handleChargeToggle}>

      <Image
       style={toggle? styles.lightinOn :styles.lightinOff}
       source={
        toggle
        ? require('./assets/eco-light.png')
        : require('./assets/eco-light-off.png')
        }>
        </Image>
        <Image
       style={toggle? styles.dio :styles.dio2}
       source={
        toggle
        ? require('./assets/logo-dio.png')
        : require('./assets/logo-dio-white.png')
        }>
        </Image>

        </TouchableOpacity>
          </View>
  );
}

export default App;
