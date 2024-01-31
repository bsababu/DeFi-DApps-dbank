import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface _SERVICE {
  'checkBalance' : ActorMethod<[], number>,
  'compoundInterest' : ActorMethod<[], undefined>,
  'topUp' : ActorMethod<[number], undefined>,
  'withDraw' : ActorMethod<[number], undefined>,
}
export declare const idlFactory: IDL.InterfaceFactory;
