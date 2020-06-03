import React from 'react';
import PropTypes from 'prop-types';
import { Fab } from '@material-ui/core';
import { Add } from '@material-ui/icons';
import useStyles from './useStyles';

const AddButton = ({ onClick }) => {
  const styles = useStyles();
  return (
    <Fab className={styles.addButton} color="primary" aria-label="add" onClick={onClick}>
      <Add />
    </Fab>
  );
};

AddButton.propTypes = {
  onClick: PropTypes.func,
};

AddButton.defaultProps = {
  onClick: false,
};

export default AddButton;
