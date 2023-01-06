const acceptLendingPolicy = () => {
  const acceptLendingPolicyForm = document.getElementById('accept-lending-policy-form');

  if (acceptLendingPolicyForm) {
    const checkbox = document.getElementById('accept-lending-policy-checkbox');
    const button = document.getElementById('accept-lending-policy-submit');

    checkbox.addEventListener('change', (event) => {
      button.disabled = !event.currentTarget.checked;
    });
  }
};

export default acceptLendingPolicy;
