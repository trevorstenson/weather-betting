import axios from 'axios';

const API_URL = 'http://localhost:3000/';

class AuthService {
  login(user) {
    return axios
    .post(API_URL + 'auth/login', user)
    .then(response => {
      localStorage.setItem('user', JSON.stringify(response.data));
      return response.data;
    });
  }

  logout() {
    localStorage.removeItem('user');
  }

  register(user) {
    return axios.post(API_URL + 'users', {
        email: user.email,
        username: user.username,
        password: user.password,
        name: user.name
    });
  }
}

export default new AuthService();