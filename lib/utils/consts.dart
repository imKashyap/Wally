import 'dart:math';

class Constants {
  //App related strings
  static String appName = 'Wally';

  static formatBytes(bytes, decimals) {
    if (bytes == 0) return 0.0;
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  static List<List<String>> categories = [
    ['Abstract', 'https://images.pexels.com/photos/2832382/pexels-photo-2832382.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'],
    ['Animals','https://images.pexels.com/photos/3551498/pexels-photo-3551498.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Art','https://images.pexels.com/photos/3140020/pexels-photo-3140020.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Beach','https://images.pexels.com/photos/1078983/pexels-photo-1078983.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Bikes','https://images.pexels.com/photos/2607554/pexels-photo-2607554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Blur','https://images.pexels.com/photos/1668928/pexels-photo-1668928.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Brands','https://images.pexels.com/photos/988952/pexels-photo-988952.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Buildings','https://images.pexels.com/photos/830891/pexels-photo-830891.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Cars','https://images.pexels.com/photos/2834653/pexels-photo-2834653.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'],
    ['Cartoon','https://images.pexels.com/photos/264905/pexels-photo-264905.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Celebrity','https://images.pexels.com/photos/65702/woman-mariah-carey-singer-entertainer-65702.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['City','https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Coding','https://images.pexels.com/photos/943096/pexels-photo-943096.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Creative','https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Dark','https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Fantasy','https://images.pexels.com/photos/266429/pexels-photo-266429.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Flowers','https://images.pexels.com/photos/1083822/pexels-photo-1083822.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Food','https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'],
    ['Games','https://images.pexels.com/photos/275033/pexels-photo-275033.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Holidays','https://images.pexels.com/photos/1701392/pexels-photo-1701392.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Landscapes','https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Love','https://images.pexels.com/photos/3738057/pexels-photo-3738057.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Macro','https://images.pexels.com/photos/35967/mini-cooper-auto-model-vehicle.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Minimal','https://images.pexels.com/photos/1252814/pexels-photo-1252814.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Miscellaneous','https://images.pexels.com/photos/1712/sunglasses-apple-iphone-desk.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Motivation','https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Movies','https://images.pexels.com/photos/2873486/pexels-photo-2873486.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Music','https://images.pexels.com/photos/96380/pexels-photo-96380.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Nature','https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Neon','https://images.pexels.com/photos/3362702/pexels-photo-3362702.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Pattern','https://images.pexels.com/photos/1493226/pexels-photo-1493226.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'],
    ['Planes','https://images.pexels.com/photos/47044/aircraft-landing-reach-injection-47044.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Science','https://images.pexels.com/photos/373543/pexels-photo-373543.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'],
    ['Seasons','https://images.pexels.com/photos/1389460/pexels-photo-1389460.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'],
    ['Sky','https://images.pexels.com/photos/912110/pexels-photo-912110.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Sports','https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Space','https://images.pexels.com/photos/41162/moon-landing-apollo-11-nasa-buzz-aldrin-41162.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Technology','https://images.pexels.com/photos/41162/moon-landing-apollo-11-nasa-buzz-aldrin-41162.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Texture','https://images.pexels.com/photos/1509534/pexels-photo-1509534.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Vector','https://images.pexels.com/photos/1569002/pexels-photo-1569002.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Water','https://images.pexels.com/photos/564899/pexels-photo-564899.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'],
    ['Wildlife','https://images.pexels.com/photos/326900/pexels-photo-326900.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['Words','https://images.pexels.com/photos/278887/pexels-photo-278887.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
    ['3D','https://images.pexels.com/photos/1724182/pexels-photo-1724182.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'],
  ];
}