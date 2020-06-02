import React from 'react';
import PropTypes from 'prop-types';

import IconButton from '@material-ui/core/IconButton';
import SystemUpdateAltIcon from '@material-ui/icons/SystemUpdateAlt';

import useStyles from './useStyles';

const ColumnHeader = ({ column, onLoadMore }) => {
  const styles = useStyles();

  const {
    id,
    title,
    cards,
    meta: { totalCount, currentPage },
  } = column;

  const count = cards.length;

  const handleLoadMore = () => onLoadMore(id, currentPage + 1);

  const showButton = () => {
    if (count === totalCount) {
      return null;
    }
    return (
      <div className={styles.actions}>
        <IconButton aria-label="Load more" onClick={handleLoadMore}>
          <SystemUpdateAltIcon fontSize="small" />
        </IconButton>
      </div>
    );
  };

  return (
    <div className={styles.root}>
      <div className={styles.title}>
        <b>{title}</b> ({count}/{totalCount || '…'})
      </div>
      {showButton()}
    </div>
  );
};

ColumnHeader.propTypes = {
  column: PropTypes.shape({
    id: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    cards: PropTypes.oneOfType([
      PropTypes.shape(),
      PropTypes.arrayOf(
        PropTypes.shape({
          id: PropTypes.number.isRequired,
          name: PropTypes.string.isRequired,
          state: PropTypes.string.isRequired,
          description: PropTypes.string.isRequired,
        }),
      ),
    ]).isRequired,
    meta: PropTypes.shape({
      totalCount: PropTypes.number,
      currentPage: PropTypes.number,
      totalPages: PropTypes.number,
    }).isRequired,
  }).isRequired,
  onLoadMore: PropTypes.func.isRequired,
};
export default ColumnHeader;
