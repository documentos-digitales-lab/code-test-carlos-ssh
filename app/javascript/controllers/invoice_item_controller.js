import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        console.log("Connected");
    }

    // static targets = ["productSelect", "unitPrice", "quantity", "amountResult", "subtotalResult", "taxContent", "totalContent"]

    // updateUnitPrice() {
    //     const selectedProductId = this.productSelectTarget.value || 0;

    //     console.log("selectedProductId:", selectedProductId);

    //     fetch(`/products/${selectedProductId}`, {
    //     method: 'GET',
    //     headers: {
    //         'Accept': 'application/json'
    //     }
    //     })
    //     .then((response) => response.json())
    //     .then(data => {
    //         this.unitPriceTarget.textContent = selectedProductId
    //         this.unitPriceTarget.value = data.unit_price.toFixed(2)
    //         this.quantityChanged()
    //     })
    //     .catch((error) => {
    //         console.error(error)
    //     })
    // }

    // quantityChanged() {
    //     const selectedQuantity = this.quantityTarget.value
    //     const amount = this.unitPriceTarget.value * selectedQuantity
    //     this.amountResultTarget.value = amount.toFixed(2)
    //     this.subtotalsAmount(amount)
    // }

    // subtotalsAmount(amount) {
    //     let formattedAmount

    //     if (amount.value === 0) {
    //     formattedAmount = '$0.00'
    //     } else {
    //     formattedAmount = amount.toFixed(2)
    //     }

    //     this.subtotalResultTarget.textContent = `$ ${formattedAmount}`
    //     this.getTax(formattedAmount)
    // }

    // getTax(formattedAmount) {
    //     const taxConversion = formattedAmount * 0.16
    //     const formatedTax = taxConversion.toFixed(2)
    //     this.taxContentTarget.textContent = `$ ${formatedTax}`
    //     this.grandTotal(formattedAmount, formatedTax)
    // }

    // grandTotal(formattedAmount, formatedTax) {
    //     const fAmount = parseFloat(formattedAmount)
    //     const fTax = parseFloat(formatedTax)

    //     const total = fAmount + fTax
    //     const fTotal = total.toFixed(2)
    //     this.totalContentTarget.textContent = `$ ${fTotal}`
    // }
}
