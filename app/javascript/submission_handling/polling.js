// jquery and bootstrap are only needed for reportError
import 'jquery'
import 'bootstrap'

const defaultIndex = 0;

export const reportError = async function (error) {
    const regex = /id="(?<id>[^"]*)/gm;
    let idResults = regex.exec(error);
    await document.querySelector('.toast-insertion-point').insertAdjacentHTML("beforeend", error);
    $(`#${idResults.groups.id}`).toast('show');
};

export const getJobInfo = async (jobId) => {
    let response = await fetch(`/redis_jobs/${jobId}`);

    return response.json();
};

// This would be one million times more elegant in ruby
const validateResult = (data, otherRule) => {
    if (data) {
        if (data.result !== 'not_found') {
            if (otherRule !== null && typeof otherRule === 'function') {
                return otherRule(data);
            }

            return true;
        }
    }

    return false;
};

const checkError = (data) => data.result === 'failure';
const checkIfCached = () => {
    if (window.performance && window.performance.getEntriesByType("navigation").length) {
        return window.performance.getEntriesByType("navigation")[defaultIndex].type === "back_forward";
    }

    return false;
};

const pollFetch = function(arg, otherRule = null) {
    const maxWaitTime = 300000;
    const pollInterval = 1000;
    const endTime = Number(new Date()) + maxWaitTime;

    let checkCondition = function(resolve, reject) {
        getJobInfo(arg).then((data) => {
            if (validateResult(data, otherRule)) {
                resolve(data);
            } else if (checkError(data)) {
                resolve(data);
            } else if (checkIfCached()) {
                reject(new Error('not found'));
            } else if (Number(new Date()) < endTime) {
                setTimeout(checkCondition, pollInterval, resolve, reject);
            } else {
                reject(new Error(`timed out for ${getJobInfo} `));
            }
        }).
        catch((error) => {
            // This would be a network error
            // @todo: create a logging service
            // eslint-disable-next-line no-console
            console.error(error);
        });
    };

    return new Promise(checkCondition);
};

const deleteData = function (jobId) {
    fetch(`/redis_jobs/${jobId}`, { "method": "delete" });
};

// eslint-disable-next-line max-params
export const renderData = (target, resultCallback, otherRule = null, summaryCallback = null) => {
    pollFetch(target, otherRule).then((result) => {
        if (checkError(result)) {
            reportError(result.display_error);
        }

        resultCallback(result);
        deleteData(target);

        if (summaryCallback && typeof summaryCallback === 'function') {
            summaryCallback();
        }
    }).
    catch((error) => {
        if (error.message === 'not found') {
            location.href = '/not_found';
        } else {
            let genericError = {
                "result": "failure",
                "id": target
            };
            resultCallback(genericError);
            // The max wait time was reached. Web Service is probably down.
            // @todo: create a logging service
            // eslint-disable-next-line no-alert
            alert('There was a network error, please try again later or call your campus library.');
        }
        // eslint-disable-next-line no-console
        console.error(error);
        deleteData(target);
    });
};
