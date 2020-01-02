// / <reference types="node" />

declare namespace NodeJS {
  interface ProcessEnv {
    readonly PUBLIC_URL: string;
  }
}
