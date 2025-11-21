import { registerPlugin } from '@capacitor/core';

export interface OriginalVersionPlugin {
  getOriginalAppVersion(): Promise<{ version: string }>;
  getOriginalPurchaseDate(): Promise<{ date: string }>;
}

export const OriginalVersion = registerPlugin<OriginalVersionPlugin>(
  'OriginalVersion'
);