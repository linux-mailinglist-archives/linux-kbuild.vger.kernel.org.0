Return-Path: <linux-kbuild+bounces-7727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB7AEB0B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 09:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67AD3A67D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 07:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7882264D1;
	Fri, 27 Jun 2025 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA9YIfVe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7902264A8;
	Fri, 27 Jun 2025 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011105; cv=none; b=BWsj9Ksz5cht+Y+cmlGHumKJNQqzeuGkO8KT0DJfEQAIB0ykutp17Kv2ZW8aMkuGxIC5NHKuvDNoqreAf4MaSHg9PwRWmfZMtbJEJoQsWjQiL3gnE0mbC7nTFljlQuVaZzLzyOkLuQmJoeB7KAVkTFFgbUEEO2XVbsXIcN3PPJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011105; c=relaxed/simple;
	bh=UpsiR6zd6bu4MlnICqiapGGFAB8luTnRxLbAdopgwY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GBHtJa2KN6MKSYCOdVHcnaUK0TNf9ypeUKDoAymREnHj3Tuwa/u6ab/ML1THG//FpwHTeC1K59dz2r8S/MjkKgGCXk2JNUww6Ov22bVJaFr6HkJRU40z8btHb43KDUEApisWdgyM+9X1dHcBYGXJMCcaq8uFsRgSjuDyBnC7FzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA9YIfVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C5DC4CEEB;
	Fri, 27 Jun 2025 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751011105;
	bh=UpsiR6zd6bu4MlnICqiapGGFAB8luTnRxLbAdopgwY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lA9YIfVesFUSJyxyUiHtmeadCw8GjAKjj/xwnxI1NGVoFt1a8SFY12ox1c/AWUYqU
	 MUcHmXdVnNEhlnBMp6EoBQvwo6rOZ8/ISh/vBlSAR0qSC4gIauiifVV3wwL61o0c3l
	 tYWG8+uhLEg8zOzoMl/hzmnqn8DtTOIzgKYNQkzUigCr4Om+AzOkMTG7nl7y/DONee
	 1i+v2H6NqrKTUTa+5WwYRrJwcOXksjnOde5Vh5/y2mIjrIA/DXU5veRpatvEp/u0LA
	 OVEDw5ztPXHDwYuM8JGhnVRHLIgzDPpLI90oX2XBAleoJysH+axBb7yxdDMZyIzgi5
	 kPHCR73v6sogQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <878qlh4aj1.fsf@kernel.org> (Andreas Hindborg's message of "Tue,
	24 Jun 2025 13:57:38 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
	<Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid>
	<DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
	<RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid>
	<DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 27 Jun 2025 09:57:54 +0200
Message-ID: <87plepzke5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Mon Jun 23, 2025 at 4:31 PM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>
>>>> On Mon Jun 23, 2025 at 11:44 AM CEST, Andreas Hindborg wrote:
>>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>>
>>>>>> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>>>>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>>>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>>>>>>> +/// A wrapper for kernel parameters.
>>>>>>>>> +///
>>>>>>>>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>>>>>>>>> +/// defined. You should never need to instantiate this type directly.
>>>>>>>>> +///
>>>>>>>>> +/// Note: This type is `pub` because it is used by module crates to access
>>>>>>>>> +/// parameter values.
>>>>>>>>> +#[repr(transparent)]
>>>>>>>>> +pub struct ModuleParamAccess<T> {
>>>>>>>>> +    data: core::cell::UnsafeCell<T>,
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +// SAFETY: We only create shared references to the contents of this container,
>>>>>>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>>>>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>>>>>>> +
>>>>>>>>> +impl<T> ModuleParamAccess<T> {
>>>>>>>>> +    #[doc(hidden)]
>>>>>>>>> +    pub const fn new(value: T) -> Self {
>>>>>>>>> +        Self {
>>>>>>>>> +            data: core::cell::UnsafeCell::new(value),
>>>>>>>>> +        }
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    /// Get a shared reference to the parameter value.
>>>>>>>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>>>>>>>> +    // held lock guard here.
>>>>>>>>> +    pub fn get(&self) -> &T {
>>>>>>>>> +        // SAFETY: As we only support read only parameters with no sysfs
>>>>>>>>> +        // exposure, the kernel will not touch the parameter data after module
>>>>>>>>> +        // initialization.
>>>>>>>>
>>>>>>>> This should be a type invariant. But I'm having difficulty defining one
>>>>>>>> that's actually correct: after parsing the parameter, this is written
>>>>>>>> to, but when is that actually?
>>>>>>>
>>>>>>> For built-in modules it is during kernel initialization. For loadable
>>>>>>> modules, it during module load. No code from the module will execute
>>>>>>> before parameters are set.
>>>>>>
>>>>>> Gotcha and there never ever will be custom code that is executed
>>>>>> before/during parameter setting (so code aside from code in `kernel`)?
>>>>>>
>>>>>>>> Would we eventually execute other Rust
>>>>>>>> code during that time? (for example when we allow custom parameter
>>>>>>>> parsing)
>>>>>>>
>>>>>>> I don't think we will need to synchronize because of custom parameter
>>>>>>> parsing. Parameters are initialized sequentially. It is not a problem if
>>>>>>> the custom parameter parsing code name other parameters, because they
>>>>>>> are all initialized to valid values (as they are statics).
>>>>>>
>>>>>> If you have `&'static i64`, then the value at that reference is never
>>>>>> allowed to change.
>>>>>>
>>>>>>>> This function also must never be `const` because of the following:
>>>>>>>>
>>>>>>>>     module! {
>>>>>>>>         // ...
>>>>>>>>         params: {
>>>>>>>>             my_param: i64 {
>>>>>>>>                 default: 0,
>>>>>>>>                 description: "",
>>>>>>>>             },
>>>>>>>>         },
>>>>>>>>     }
>>>>>>>>
>>>>>>>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>>>>>>>
>>>>>>>> AFAIK, this static will be executed before loading module parameters and
>>>>>>>> thus it makes writing to the parameter UB.
>>>>>>>
>>>>>>> As I understand, the static will be initialized by a constant expression
>>>>>>> evaluated at compile time. I am not sure what happens when this is
>>>>>>> evaluated in const context:
>>>>>>>
>>>>>>>     pub fn get(&self) -> &T {
>>>>>>>         // SAFETY: As we only support read only parameters with no sysfs
>>>>>>>         // exposure, the kernel will not touch the parameter data after module
>>>>>>>         // initialization.
>>>>>>>         unsafe { &*self.data.get() }
>>>>>>>     }
>>>>>>>
>>>>>>> Why would that not be OK? I would assume the compiler builds a dependency graph
>>>>>>> when initializing statics?
>>>>>>
>>>>>> Yes it builds a dependency graph, but that is irrelevant? The problem is
>>>>>> that I can create a `'static` reference to the inner value *before* the
>>>>>> parameter is written-to (as the static is initialized before the
>>>>>> parameters).
>>>>>
>>>>> I see, I did not consider this situation. Thanks for pointing this out.
>>>>>
>>>>> Could we get around this without a lock maybe? If we change
>>>>> `ModuleParamAccess::get` to take a closure instead:
>>>>>
>>>>>     /// Call `func` with a reference to the parameter value stored in `Self`.
>>>>>     pub fn read(&self, func: impl FnOnce(&T)) {
>>>>>         // SAFETY: As we only support read only parameters with no sysfs
>>>>>         // exposure, the kernel will not touch the parameter data after module
>>>>>         // initialization.
>>>>>         let data = unsafe { &*self.data.get() };
>>>>>
>>>>>         func(data)
>>>>>     }
>>>>>
>>>>> I think this would bound the lifetime of the reference passed to the
>>>>> closure to the duration of the call, right?
>>>>
>>>> Yes that is correct. Now you can't assign the reference to a static.
>>>> However, this API is probably very clunky to use, since you always have
>>>> to create a closure etc.
>>>>
>>>> Since you mentioned in the other reply that one could spin up a thread
>>>> and do something simultaneously, I don't think this is enough. You could
>>>> have a loop spin over the new `read` function and read the value and
>>>> then the write happens.
>>>
>>> Yes you are right, we have to treat it as if it could be written at any
>>> point in time.
>>>
>>>> One way to fix this issue would be to use atomics to read the value and
>>>> to not create a reference to it. So essentially have
>>>>
>>>>     pub fn read(&self) -> T {
>>>>         unsafe { atomic_read_unsafe_cell(&self.data) }
>>>>     }
>>>
>>> That could work.
>>>
>>>> Another way would be to use a `Once`-like type (does that exist on the C
>>>> side?) so a type that can be initialized once and then never changes.
>>>> While it doesn't have a value set, we return some default value for the
>>>> param and print a warning, when it's set, we just return the value. But
>>>> this probably also requires atomics...
>>>
>>> I think atomic bool is not that far away. Either that, or we can lock.
>>>
>>>> Is parameter accessing used that often in hot paths? Can't you just copy
>>>> the value into your `Module` struct?
>>>
>>> I don't imagine this being read in a hot path. If so, the user could
>>> make a copy.
>>
>> That's good to know, then let's try to go for something simple.
>>
>> I don't think that we can just use a `Mutex<T>`, because we don't have a
>> way to create it at const time... I guess we could have
>>
>>     impl<T> Mutex<T>
>>         /// # Safety
>>         ///
>>         /// The returned value needs to be pinned and then `init` needs
>>         /// to be called before any other methods are called on this.
>>         pub unsafe const fn const_new() -> Self;
>>
>>         pub unsafe fn init(&self);
>>     }
>>
>> But that seems like a bad idea, because where would we call the `init`
>> function? That also needs to be synchronized...
>
> Ah, that is unfortunate. The init function will not run before this, so
> we would need a `Once` or an atomic anyway to initialize the lock.
>
> I am not sure if we are allowed to sleep during this, I would have to
> check. But then we could use a spin lock.
>
> We will need the locking anyway, when we want to enable sysfs write
> access to the parameters.
>
>>
>> Maybe we can just like you said use an atomic bool?
>
> Sigh, I will have to check how far that series has come.
>

I think I am going to build some kind of `Once` feature on top of
Boqun's atomic series [1], so that we can initialize a lock in these
statics. We can't use `global_lock!`, because that depends on module
init to initialize the lock before first use.

As far as I can tell, atomics may not land in v6.17, so this series
will probably not be ready for merge until v6.18 at the earliest.

Thanks for the input, Benno!


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/20250618164934.19817-1-boqun.feng@gmail.com


