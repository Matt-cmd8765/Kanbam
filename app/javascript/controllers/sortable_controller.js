import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    //Sortable.create(this.element, { /* options */ });
    const initKanbanSortable = (ulElements) => {
      ulElements.forEach((ul) => {
        new Sortable(ul, {
            group: 'kanban', // set both lists to same group
            animation: 300,
            onEnd: this.onEnd.bind(this)
        });
      });
    };

    const kanbanUls = document.querySelectorAll(".kanban .kanban-col");
    if (kanbanUls) {
      initKanbanSortable(kanbanUls);
      };
  }

  onEnd(event) {
    console.log(event.item.dataset.sortableId)
    // console.log(event.newIndex)
  }
}
