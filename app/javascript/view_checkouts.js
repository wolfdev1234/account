import { renderData } from "./submission_handling/polling";
import renewCheckout from "./submission_handling/renew_checkout";
import selectAll from "./select_all";

const checkoutsContainer = document.querySelector('.load-checkouts');

const showCheckouts = (data) => {
    checkoutsContainer.innerHTML = data.html;
    renewCheckout();
    selectAll.start();
};

const checkouts = () => {
    if (checkoutsContainer) {
        renderData(`view_checkouts_${checkoutsContainer.dataset.patronKey}`, showCheckouts);
    }
};

export default checkouts;