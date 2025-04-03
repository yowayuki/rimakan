'use client';

import { createTheme, ThemeProvider, Header } from 'smarthr-ui';

const theme = createTheme();

export const RimakanHeader: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <Header />
    </ThemeProvider>
  );
};
