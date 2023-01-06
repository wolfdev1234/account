import { allChecked, clearBadges, findForm, responseFromRails, scrollToTop, submitterValue, toggleSpin } from './shared'
import { renderData } from './polling'

let pickupByDateInput = () => document.querySelector('#pickup_by_date');

// Checking for value here is basically a sanity check for edge cases where a stale value
// is already present in Redis. In this edge case what will happen is that the Redis value
// will eventually get updated to the "correct" new value.
let validatePickupByDateChange = function (data) {
    if (data && data.response && data.response.new_value) {
        return data.response.new_value === pickupByDateInput().value
    }

    return false;
};

const updatePickupByDate = function (data) {
    if (data.result === 'failure') {
        toggleSpin('hold', data.id, 'pickup-by');
    } else {
        document.querySelector(`#hold_list__${data.id}`).checked = false;
        document.querySelector(`#hold${data.id} .bibitem`).
            innerHTML += data.response.badge;
        document.querySelector(`#hold${data.id} .pickup-by`).
            innerHTML = `<span>${data.response.new_value_formatted}</span>`;
    }
};

// This is the public function
let changePickupByDate = function () {
    // Guard statement
    if (!findForm('pending-holds')) {
        return;
    }

    findForm('pending-holds').addEventListener("submit", function (event) {
        if (submitterValue(event) === "Update Selected Holds" && pickupByDateInput().value !== '') {
            allChecked(findForm('pending-holds')).forEach((checkbox) => {
                toggleSpin('hold', checkbox.value, 'pickup-by');
            });
        }
        scrollToTop();
    });

    findForm('pending-holds').addEventListener("ajax:before", function () {
        clearBadges();
    });

    findForm('pending-holds').addEventListener("ajax:success", function (event) {
        if (responseFromRails(event) === 'Update scheduled' && pickupByDateInput().value !== '') {
            allChecked(findForm('pending-holds')).forEach((checkbox) => {
                renderData(`pickup_by_date_${checkbox.value}`, updatePickupByDate, validatePickupByDateChange);
            });

            document.getElementById('pending_all').checked = false;
        }
    });

    findForm('pending-holds').addEventListener("ajax:error", function () {
        $('#expiryModal').modal({ "keyboard": false });
    });
};

export default changePickupByDate;