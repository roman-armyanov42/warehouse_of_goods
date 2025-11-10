export class ProgrammingLanguage {
  // сорри что поменял тему, но читательский билет
  // это трешак. я надеюсь, на мое изучение классов
  // в JS это особо не помешает
  #name = "";
  #isObjectOriented = false;
  #isLowLevel = false;
  #isLearned = false;

  get name() {}
  set name(val) {}

  get isObjectOriented() {}
  set isObjectOriented(val) {}

  get isLowLevel() {}
  set isLowLevel(val) {}

  get isLearned() {}
  set isLearned(val) {}

  constructor(name, isObjectOriented, isLowLevel, isLearned) {
    this.name = name;
    this.isObjectOriented = isObjectOriented;
    this.isLowLevel = isLowLevel;
    this.isLearned = isLearned;
  }
  show() {
    console.log(
      `Имя:${this.name}, Объектно-Ориентированный ли?: ${
        this.isObjectOriented ? "Да" : "Нет"
      }, Какой по взаимодействию с железом?${
        this.isLowLevel ? "Низкоуровневый" : "Высокоуровневый"
      }, Выучен ли?${this.isLearned ? "Да" : "Нет"}`
    );
  }
  copy() {
    return this;
  }
  #checkAsLearned() {
    this.isLearned = true;
  }
  static clone(original) {
    const copy = new this(
      original.name,
      original.isLearned,
      original.isLowLevel,
      original.isObjectOriented
    );
    return copy;
  }
}
