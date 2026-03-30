function fn() {
  var env = karate.env || 'qa';

  var config = {
    env: env,
    baseUrl: karate.properties[env + '.baseUrl']
      || karate.properties['qa.baseUrl']
      || karate.properties['baseUrl']
      || 'http://localhost:8080',
    demoblazeBaseUrl: karate.properties['demoblaze.baseUrl'] || 'https://api.demoblaze.com',
    demoblazePaths: {
      signup: '/signup',
      login: '/login'
    }
  };

  karate.configure('connectTimeout', 15000);
  karate.configure('readTimeout', 15000);

  return config;
}
