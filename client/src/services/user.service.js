import axios from 'axios';
import authHeader from './auth-header';

const API_URL = 'http://localhost:3000/users/';

class UserService {
  getUserInfo() {
    let user = JSON.parse(localStorage.getItem('user'))
    return axios.get(API_URL + user.id, { headers: authHeader() });
  }
  updateUserInfo() {
    let user = JSON.parse(localStorage.getItem('user'))
    axios.get(API_URL + user.id, { headers: authHeader() }).then(response => {
      localStorage.setItem('user', JSON.stringify(JSON.parse(response.data)))
    }).catch(e => {
      console.log(e)
    })
  }
}

export default new UserService();