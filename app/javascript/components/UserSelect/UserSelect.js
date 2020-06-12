import React, { useState } from 'react';
import PropTypes from 'prop-types';

import AsyncSelect from 'react-select/async';
import FormControl from '@material-ui/core/FormControl';
import FormHelperText from '@material-ui/core/FormHelperText';

import InputLabel from '@material-ui/core/InputLabel';

import UsersRepository from 'repositories/UsersRepository';

import useStyles from './useStyles';
import UserPresenter from 'presenters/UserPresenter';

const UserSelect = ({ error, label, isClearable, isRequired, onChange, value, helperText }) => {
  const [isFocused, setFocus] = useState(false);
  const styles = useStyles();
  const handleLoadOptions = (inputValue) =>
    UsersRepository.index({ q: { firstNameOrLastNameCont: inputValue } }).then(({ data }) => data.items);

  return (
    <>
      <FormControl margin="dense" focused={isFocused} error={error} required={isRequired}>
        <InputLabel shrink>{label}</InputLabel>
        <div className={styles.select}>
          <AsyncSelect
            cacheOptions
            loadOptions={handleLoadOptions}
            defaultOptions
            getOptionLabel={(user) => UserPresenter.fullName(user)}
            getOptionValue={(user) => UserPresenter.id(user)}
            isClearable={isClearable}
            defaultValue={value}
            onChange={onChange}
            onFocus={() => setFocus(true)}
            onBlur={() => setFocus(false)}
            menuPortalTarget={document.body}
            styles={{ menuPortal: (base) => ({ ...base, zIndex: 9999 }) }}
          />
        </div>
        {helperText && <FormHelperText>{helperText}</FormHelperText>}
      </FormControl>
    </>
  );
};

UserSelect.propTypes = {
  error: PropTypes.bool.isRequired,
  label: PropTypes.string.isRequired,
  isClearable: PropTypes.bool.isRequired,
  isRequired: PropTypes.bool.isRequired,
  onChange: PropTypes.func.isRequired,
  value: PropTypes.oneOfType([PropTypes.string.isRequired, UserPresenter.shape().isRequired]),
  helperText: PropTypes.string,
};
UserSelect.defaultProps = {
  value: null,
  helperText: ' ',
};

export default UserSelect;
