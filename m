Return-Path: <linux-kbuild+bounces-7619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE414AE4706
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 16:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1677A3BA8F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 14:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A0125B69A;
	Mon, 23 Jun 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jck3wg9R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6783725B684;
	Mon, 23 Jun 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689120; cv=none; b=fasyYysbylquGQbjRoM+RmFW8kIWny6JB5lo+X2/oiUtyQ/mYM06CKpyu4WjCsmuxmZzmYsPPfLZU9/dH3k0EOoYbUoYkmnzxv2eDyBY9U2H709C5EHr/pXI/f+LpWdpyr4DhFBp9002faWDFCTwIJ/rKyrNmK8ivH0XP1aBiGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689120; c=relaxed/simple;
	bh=ZCQSFONaYxeZZAAKU4SpBHMquV6hYTWRC8UGHRliBp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OxTOKOlbUVlprETeKFn6cqG2K4o0YmunrvlASmpj2QhQUZL1d784exHsMm5KcOakVsuqkJIZY9cPSVxlKptN/B6kxfsop0NF0SZDf6BXahF7CUgBf33GkXqhAYyeOkU/6UBvAvyI7qpWAmapEZdzvP9hQAWL9M1UI8e2lRThhfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jck3wg9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA72C4CEEA;
	Mon, 23 Jun 2025 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750689119;
	bh=ZCQSFONaYxeZZAAKU4SpBHMquV6hYTWRC8UGHRliBp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jck3wg9RZb7bC/hxuIJDfydr1nNweR7OZJwVDH678MV6CoDluvzhfc59m0hb27d0R
	 z9+2urvvjL1OCQjoBm8RHH34/8FTMHW3LPeLq5XnC2Tn3uDp4aC+7Zup9ShnVNdanG
	 I2ImATQ1Ie3dohqcbHJYfh+HEFFLgOH+W9tpEjuRbcVZntHJCM/iXmVU9POCLs3hsv
	 tOOi8KnY2VxMT0UsTCT6EYYzOFz6JiA4L0DHAtLoWSYfD4abaIZLUm1tgHSNMBG7a6
	 HDZbrnbZpKkVntLXje5BSEEOP58hexCD7FngXqRfVq2o6uidA6yIl9g5/xPaKNomQ6
	 0lN2fvcsM5dyw==
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
In-Reply-To: <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> (Benno Lossin's message
	of "Mon, 23 Jun 2025 13:48:42 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
	<Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid>
	<DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 16:31:45 +0200
Message-ID: <87v7om4jhq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Mon Jun 23, 2025 at 11:44 AM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>
>>> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>>>> +/// A wrapper for kernel parameters.
>>>>>> +///
>>>>>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>>>>>> +/// defined. You should never need to instantiate this type directly.
>>>>>> +///
>>>>>> +/// Note: This type is `pub` because it is used by module crates to access
>>>>>> +/// parameter values.
>>>>>> +#[repr(transparent)]
>>>>>> +pub struct ModuleParamAccess<T> {
>>>>>> +    data: core::cell::UnsafeCell<T>,
>>>>>> +}
>>>>>> +
>>>>>> +// SAFETY: We only create shared references to the contents of this container,
>>>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>>>> +
>>>>>> +impl<T> ModuleParamAccess<T> {
>>>>>> +    #[doc(hidden)]
>>>>>> +    pub const fn new(value: T) -> Self {
>>>>>> +        Self {
>>>>>> +            data: core::cell::UnsafeCell::new(value),
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /// Get a shared reference to the parameter value.
>>>>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>>>>> +    // held lock guard here.
>>>>>> +    pub fn get(&self) -> &T {
>>>>>> +        // SAFETY: As we only support read only parameters with no sysfs
>>>>>> +        // exposure, the kernel will not touch the parameter data after module
>>>>>> +        // initialization.
>>>>>
>>>>> This should be a type invariant. But I'm having difficulty defining one
>>>>> that's actually correct: after parsing the parameter, this is written
>>>>> to, but when is that actually?
>>>>
>>>> For built-in modules it is during kernel initialization. For loadable
>>>> modules, it during module load. No code from the module will execute
>>>> before parameters are set.
>>>
>>> Gotcha and there never ever will be custom code that is executed
>>> before/during parameter setting (so code aside from code in `kernel`)?
>>>
>>>>> Would we eventually execute other Rust
>>>>> code during that time? (for example when we allow custom parameter
>>>>> parsing)
>>>>
>>>> I don't think we will need to synchronize because of custom parameter
>>>> parsing. Parameters are initialized sequentially. It is not a problem if
>>>> the custom parameter parsing code name other parameters, because they
>>>> are all initialized to valid values (as they are statics).
>>>
>>> If you have `&'static i64`, then the value at that reference is never
>>> allowed to change.
>>>
>>>>> This function also must never be `const` because of the following:
>>>>>
>>>>>     module! {
>>>>>         // ...
>>>>>         params: {
>>>>>             my_param: i64 {
>>>>>                 default: 0,
>>>>>                 description: "",
>>>>>             },
>>>>>         },
>>>>>     }
>>>>>
>>>>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>>>>
>>>>> AFAIK, this static will be executed before loading module parameters and
>>>>> thus it makes writing to the parameter UB.
>>>>
>>>> As I understand, the static will be initialized by a constant expression
>>>> evaluated at compile time. I am not sure what happens when this is
>>>> evaluated in const context:
>>>>
>>>>     pub fn get(&self) -> &T {
>>>>         // SAFETY: As we only support read only parameters with no sysfs
>>>>         // exposure, the kernel will not touch the parameter data after module
>>>>         // initialization.
>>>>         unsafe { &*self.data.get() }
>>>>     }
>>>>
>>>> Why would that not be OK? I would assume the compiler builds a dependency graph
>>>> when initializing statics?
>>>
>>> Yes it builds a dependency graph, but that is irrelevant? The problem is
>>> that I can create a `'static` reference to the inner value *before* the
>>> parameter is written-to (as the static is initialized before the
>>> parameters).
>>
>> I see, I did not consider this situation. Thanks for pointing this out.
>>
>> Could we get around this without a lock maybe? If we change
>> `ModuleParamAccess::get` to take a closure instead:
>>
>>     /// Call `func` with a reference to the parameter value stored in `Self`.
>>     pub fn read(&self, func: impl FnOnce(&T)) {
>>         // SAFETY: As we only support read only parameters with no sysfs
>>         // exposure, the kernel will not touch the parameter data after module
>>         // initialization.
>>         let data = unsafe { &*self.data.get() };
>>
>>         func(data)
>>     }
>>
>> I think this would bound the lifetime of the reference passed to the
>> closure to the duration of the call, right?
>
> Yes that is correct. Now you can't assign the reference to a static.
> However, this API is probably very clunky to use, since you always have
> to create a closure etc.
>
> Since you mentioned in the other reply that one could spin up a thread
> and do something simultaneously, I don't think this is enough. You could
> have a loop spin over the new `read` function and read the value and
> then the write happens.

Yes you are right, we have to treat it as if it could be written at any
point in time.

> One way to fix this issue would be to use atomics to read the value and
> to not create a reference to it. So essentially have
>
>     pub fn read(&self) -> T {
>         unsafe { atomic_read_unsafe_cell(&self.data) }
>     }

That could work.

> Another way would be to use a `Once`-like type (does that exist on the C
> side?) so a type that can be initialized once and then never changes.
> While it doesn't have a value set, we return some default value for the
> param and print a warning, when it's set, we just return the value. But
> this probably also requires atomics...

I think atomic bool is not that far away. Either that, or we can lock.

> Is parameter accessing used that often in hot paths? Can't you just copy
> the value into your `Module` struct?

I don't imagine this being read in a hot path. If so, the user could
make a copy.


Best regards,
Andreas Hindborg



