import { WebPlugin } from '@capacitor/core';
import type { OriginalVersionPlugin } from './definitions';

export class OriginalVersionWeb extends WebPlugin implements OriginalVersionPlugin
{
	async getOriginalAppVersion(): Promise<{ version: string }>
	{
		console.log('OriginalVersion.getOriginalAppVersion - web stub');
		return { version: '' };
	}

	async getOriginalPurchaseDate(): Promise<{ date: string }>
	{
		console.log('OriginalVersion.getOriginalPurchaseDate - web stub');
		throw new Error('Original purchase date not available on web platform');
	}
}