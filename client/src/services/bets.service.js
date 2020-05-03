import axios from 'axios';
import authHeader from './auth-header';

const API_URL = 'http://localhost:3000/temperature_bets/';

class BetsService {
    getAllBets() {
        return axios.get(API_URL, { headers: authHeader() })
    }

    submitBets(bets) {
        let formattedBets = [];
        bets.forEach(bet => {
            formattedBets.push({ id: bet.id, betAmount: bet.betAmount, type: bet.type });
        });
        const options = {
            method: 'POST',
            headers: authHeader(),
            data: {
                formattedBets: formattedBets
            },
            url: API_URL + 'submit'
        }
        return axios(options);
    }
}

export default new BetsService();