import { renderData } from "./submission_handling/polling";

const holdsContainer = document.querySelector('.load-requested-holds');

const showHolds = (data) => {
    holdsContainer.innerHTML = data.response;
};

const viewRequestedHolds = () => {
    if (holdsContainer) {
        renderData(`place_holds_results_${holdsContainer.dataset.patronKey}`, showHolds);
    }
};

export default viewRequestedHolds;