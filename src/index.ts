import { registerPlugin } from '@capacitor/core';
import type { OriginalVersionPlugin } from './definitions';

export const OriginalVersion = registerPlugin<OriginalVersionPlugin>(
  'OriginalVersion',
  {
    web: () => import('./web').then(m => new m.OriginalVersionWeb()),
  }
);

export * from './definitions';