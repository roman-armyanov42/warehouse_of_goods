import { ProgrammingLanguage } from "./ProgrammingLanguage.js";

export class CLikeLanguage extends ProgrammingLanguage {
  #isOutdated;
  get isOutdated() {}
  set isOutdated(val) {}
  #checkAsLearned() {
    console.log(
      "Ничего не произошло. Метод 'Пометить выученным' недоступен в этом классе"
    );
  }
  show() {
    console.log(
      `Имя:${this.name}, Объектно-Ориентированный ли?: ${
        this.isObjectOriented ? "Да" : "Нет"
      }, Какой по взаимодействию с железом?${
        this.isLowLevel ? "Низкоуровневый" : "Высокоуровневый"
      }, Устарел ли?${this.isOutdated ? "Да" : "Нет"}`
    );
  }
  static clone(original) {
    const copy = new this(
      original.name,
      original.isOutdated,
      original.isLowLevel,
      original.isObjectOriented
    );
    return copy;
  }
}
