const calculation = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;	
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  if (!isNaN(inputValue) && inputValue !== "") {
    // 手数料（10%）を計算
    const tax = Math.floor(inputValue * 0.1);
    // 販売利益を計算
    const profit = Math.floor(inputValue - tax);
    // 計算結果を表示
    addTaxDom.innerHTML = `${tax.toLocaleString()}`;
    profitDom.innerHTML = `${profit.toLocaleString()}`;
  } else {
    // 入力が数字でない場合や空の場合はエラーメッセージを表示
    addTaxDom.innerHTML = "有効な金額を入力してください";
    profitDom.innerHTML = "";
  }
});
};
window.addEventListener("turbo:load", calculation);
window.addEventListener("turbo:render", calculation);