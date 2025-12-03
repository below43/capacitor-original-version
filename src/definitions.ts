export interface OriginalVersionPlugin
{
	getOriginalAppVersion(): Promise<{ version: string }>;
	getOriginalPurchaseDate(): Promise<{ date: string }>;
}