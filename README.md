# @below43/capacitor-original-version

A Capacitor plugin to retrieve the original app version and purchase date from the App Store receipt using StoreKit 2.

[![npm](https://img.shields.io/npm/v/@below43/capacitor-original-version)](https://www.npmjs.com/package/@below43/capacitor-original-version)

> **Note:** This plugin is currently only available for iOS. Android and web platforms are not supported.

## Installation

```bash
npm i @below43/capacitor-original-version
npx cap sync
```

### Advanced Installation

#### From GitHub

```bash
npm install github:below43/capacitor-original-version
npx cap sync
```

#### From Local Path (Development)

```bash
npm install file:./path/to/capacitor-original-version
npx cap sync
```

## Requirements

- iOS 16.0+
- Capacitor 7.0+

## API

### `getOriginalAppVersion()`

Returns the original build number from when the app was first downloaded from the App Store.

**Note:** This returns the build number (CFBundleVersion), not the marketing version string (CFBundleShortVersionString).

```typescript
import OriginalVersion from 'capacitor-original-version';

const { version } = await OriginalVersion.getOriginalAppVersion();
console.log('Original build number:', version);
```

**Returns:** `Promise<{ version: string }>`

### `getOriginalPurchaseDate()`

Returns the original purchase date in ISO 8601 format.

```typescript
import OriginalVersion from 'capacitor-original-version';

const { date } = await OriginalVersion.getOriginalPurchaseDate();
console.log('Original purchase date:', date);
// Example output: "2025-11-22T10:30:00Z"
```

**Returns:** `Promise<{ date: string }>`

## Usage Example

```typescript
import { Component } from '@angular/core';
import OriginalVersion from 'capacitor-original-version';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
})
export class HomePage {
  async checkOriginalVersion() {
    try {
      const { version } = await OriginalVersion.getOriginalAppVersion();
      const { date } = await OriginalVersion.getOriginalPurchaseDate();
      
      console.log(`First installed: build ${version} on ${date}`);
    } catch (error) {
      console.error('Error getting original version:', error);
    }
  }
}
```

## Platform Support

- ✅ iOS (16.0+)
- ❌ Android (not supported - App Store receipt is iOS-only)
- ❌ Web (not supported)

## How It Works

This plugin uses Apple's StoreKit 2 `AppTransaction` API to retrieve cryptographically signed receipt information. The data is verified by Apple and cannot be tampered with.

## Common Use Cases

- Grandfathering users from older app versions
- Tracking user cohorts by install date
- Offering loyalty benefits to long-time users
- Analytics based on original install version

## Error Handling

The plugin will reject with an error if:
- The device is running iOS < 16.0
- The app transaction cannot be verified
- The receipt data is unavailable (e.g., in development builds without App Store receipt)

## License

MIT © 2025 Andrew Drake

## Contributing

Issues and pull requests are welcome at [https://github.com/below43/capacitor-original-version](https://github.com/below43/capacitor-original-version)