import { registerPlugin } from '@capacitor/core';

export interface OriginalVersionResult {
  version: string | null;
}

export interface OriginalVersionPlugin {
  getOriginalVersion(): Promise<OriginalVersionResult>;
}

export const OriginalVersion = registerPlugin<OriginalVersionPlugin>(
  'OriginalVersion'
);
