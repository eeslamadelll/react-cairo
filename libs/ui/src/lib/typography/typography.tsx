import styled from 'styled-components';

export interface TypographyProps {
  text: string;
}

const StyledTypography = styled.div`
  color: pink;
`;

export function Typography({ text }: TypographyProps) {
  return (
    <StyledTypography>
      <h1>{text} From shared lib...</h1>
    </StyledTypography>
  );
}

export default Typography;
