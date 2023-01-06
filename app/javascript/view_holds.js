import cancelHold from "./submission_handling/cancel_hold";
import changePickupByDate from "./submission_handling/change_pickup_by_date"
import changePickupLibrary from "./submission_handling/change_pickup_library";
import { renderData } from "./submission_handling/polling";
import selectAll from "./select_all";

const holdsContainer = document.querySelector('.load-holds');

const showHolds = (data) => {
    holdsContainer.innerHTML = data.html;
    changePickupLibrary();
    changePickupByDate();
    cancelHold();
    selectAll.start();
};

const holds = () => {
    if (holdsContainer) {
        renderData(`view_holds_${holdsContainer.dataset.patronKey}`, showHolds);
    }
};

export default holds;