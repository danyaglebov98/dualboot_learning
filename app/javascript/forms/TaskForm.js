import { pick, propOr } from 'ramda';

export default {
  defaultAttributes(attributes) {
    return {
      name: '',
      description: '',
      assignee: '',
      ...attributes,
    };
  },

  attributesToSubmit(task) {
    const pertmittedKeys = ['id', 'name', 'description'];

    return {
      ...pick(pertmittedKeys, task),
      assigneeId: propOr(null, 'id', task.assignee),
    };
  },
};
