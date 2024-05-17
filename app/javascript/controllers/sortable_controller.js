import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { put } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      animation: 300
    });
  }

  onEnd(event) {
    // console.log("sortableID", event.item.dataset.sortableId)
    // console.log("NewIndex", event.newIndex)
    put(`/kanban_column/${event.item.dataset.sortableId}/sort`, {
      body: JSON.stringify({row_order_position: event.newIndex})
    })
  }
}
