import { render } from '@testing-library/react';

import Typography from './typography';

describe('Typography', () => {
  it('should render successfully', () => {
    const { baseElement } = render(<Typography text="" />);
    expect(baseElement).toBeTruthy();
  });
});
