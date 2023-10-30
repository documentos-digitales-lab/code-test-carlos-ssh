import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["productSelect", "unitPrice"];

    constructor(...args) {
        super(...args);
    }

    connect() {
    }

}
