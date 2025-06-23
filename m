Return-Path: <linux-kbuild+bounces-7616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFFAE3E82
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 13:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E943A72E8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 11:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697902253FE;
	Mon, 23 Jun 2025 11:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siSqMjAe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15E7261A;
	Mon, 23 Jun 2025 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679329; cv=none; b=K0eD3+GPfBV/wnux0/oDYkSUw/EMZM6yGWuIzHPsPfhZ2aUe2vck3TUdjC7q/v/2TU5NzJerbyomqgS+8hUT4X1sYegkFdgkNkWVHwCxU3hRkmO5+tgqYXuuTfU2oS5CB7bBKezkXo/NlP+twv33hVUNv7PA82Tb5yhNmzEWLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679329; c=relaxed/simple;
	bh=vsy/g6lZSUKQIrHZFH36IkR7zi66LrBDrZxAD0OWH60=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qB2hIpIHfIyTYymT+NuAn6TVD1XfbecLUet4a9K+lIfss+N4sR074kEIkV+VZMDmQxgz2C4HaGZ9v1DTxYH/IxirGNzpl51y7k0Q4yGHSsZkTujrid3SDxJ9R2ISJRD9Je3X3r9O2jaB3am+8rilmLg3u0RsIncUZxTh0HMjYj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siSqMjAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB1CC4CEEA;
	Mon, 23 Jun 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750679328;
	bh=vsy/g6lZSUKQIrHZFH36IkR7zi66LrBDrZxAD0OWH60=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=siSqMjAej7SOmVq1Y/9SdrWI7S4Y/6M0zWTQq4wPOGv7YH1JXlAy3th4xnJ+Ja0zm
	 Bqp2gI0zMWOsing/LVKBgewS4dU47l/7ZgbpsoiU2dO8cuROBTVONevaMORoQXJ3uN
	 LD1ovgVVOPWKalzUjf6dsyMgD5an4A9MzQOazR5P8x9HCgBcS4iDIMm/xLON/alGxP
	 6zVy7OlhUzTCCCQGoSE75VDr+pcHNZsXAErzQzyriPt+Q2gU3A2OLZRr+U6AtCfIum
	 RYcQl9tMctgyzqdeORhPNkM1AwVDRztN3u+IP8hcJl5g6rV/fTKnlYZCST1vKJ5ryM
	 +oyhjns4ppMkw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 13:48:42 +0200
Message-Id: <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org> <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid> <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
In-Reply-To: <877c126bce.fsf@kernel.org>

On Mon Jun 23, 2025 at 11:44 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>>> +/// A wrapper for kernel parameters.
>>>>> +///
>>>>> +/// This type is instantiated by the [`module!`] macro when module p=
arameters are
>>>>> +/// defined. You should never need to instantiate this type directly=
.
>>>>> +///
>>>>> +/// Note: This type is `pub` because it is used by module crates to =
access
>>>>> +/// parameter values.
>>>>> +#[repr(transparent)]
>>>>> +pub struct ModuleParamAccess<T> {
>>>>> +    data: core::cell::UnsafeCell<T>,
>>>>> +}
>>>>> +
>>>>> +// SAFETY: We only create shared references to the contents of this =
container,
>>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>>> +
>>>>> +impl<T> ModuleParamAccess<T> {
>>>>> +    #[doc(hidden)]
>>>>> +    pub const fn new(value: T) -> Self {
>>>>> +        Self {
>>>>> +            data: core::cell::UnsafeCell::new(value),
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    /// Get a shared reference to the parameter value.
>>>>> +    // Note: When sysfs access to parameters are enabled, we have to=
 pass in a
>>>>> +    // held lock guard here.
>>>>> +    pub fn get(&self) -> &T {
>>>>> +        // SAFETY: As we only support read only parameters with no s=
ysfs
>>>>> +        // exposure, the kernel will not touch the parameter data af=
ter module
>>>>> +        // initialization.
>>>>
>>>> This should be a type invariant. But I'm having difficulty defining on=
e
>>>> that's actually correct: after parsing the parameter, this is written
>>>> to, but when is that actually?
>>>
>>> For built-in modules it is during kernel initialization. For loadable
>>> modules, it during module load. No code from the module will execute
>>> before parameters are set.
>>
>> Gotcha and there never ever will be custom code that is executed
>> before/during parameter setting (so code aside from code in `kernel`)?
>>
>>>> Would we eventually execute other Rust
>>>> code during that time? (for example when we allow custom parameter
>>>> parsing)
>>>
>>> I don't think we will need to synchronize because of custom parameter
>>> parsing. Parameters are initialized sequentially. It is not a problem i=
f
>>> the custom parameter parsing code name other parameters, because they
>>> are all initialized to valid values (as they are statics).
>>
>> If you have `&'static i64`, then the value at that reference is never
>> allowed to change.
>>
>>>> This function also must never be `const` because of the following:
>>>>
>>>>     module! {
>>>>         // ...
>>>>         params: {
>>>>             my_param: i64 {
>>>>                 default: 0,
>>>>                 description: "",
>>>>             },
>>>>         },
>>>>     }
>>>>
>>>>     static BAD: &'static i64 =3D module_parameters::my_param.get();
>>>>
>>>> AFAIK, this static will be executed before loading module parameters a=
nd
>>>> thus it makes writing to the parameter UB.
>>>
>>> As I understand, the static will be initialized by a constant expressio=
n
>>> evaluated at compile time. I am not sure what happens when this is
>>> evaluated in const context:
>>>
>>>     pub fn get(&self) -> &T {
>>>         // SAFETY: As we only support read only parameters with no sysf=
s
>>>         // exposure, the kernel will not touch the parameter data after=
 module
>>>         // initialization.
>>>         unsafe { &*self.data.get() }
>>>     }
>>>
>>> Why would that not be OK? I would assume the compiler builds a dependen=
cy graph
>>> when initializing statics?
>>
>> Yes it builds a dependency graph, but that is irrelevant? The problem is
>> that I can create a `'static` reference to the inner value *before* the
>> parameter is written-to (as the static is initialized before the
>> parameters).
>
> I see, I did not consider this situation. Thanks for pointing this out.
>
> Could we get around this without a lock maybe? If we change
> `ModuleParamAccess::get` to take a closure instead:
>
>     /// Call `func` with a reference to the parameter value stored in `Se=
lf`.
>     pub fn read(&self, func: impl FnOnce(&T)) {
>         // SAFETY: As we only support read only parameters with no sysfs
>         // exposure, the kernel will not touch the parameter data after m=
odule
>         // initialization.
>         let data =3D unsafe { &*self.data.get() };
>
>         func(data)
>     }
>
> I think this would bound the lifetime of the reference passed to the
> closure to the duration of the call, right?

Yes that is correct. Now you can't assign the reference to a static.
However, this API is probably very clunky to use, since you always have
to create a closure etc.

Since you mentioned in the other reply that one could spin up a thread
and do something simultaneously, I don't think this is enough. You could
have a loop spin over the new `read` function and read the value and
then the write happens.

One way to fix this issue would be to use atomics to read the value and
to not create a reference to it. So essentially have

    pub fn read(&self) -> T {
        unsafe { atomic_read_unsafe_cell(&self.data) }
    }

Another way would be to use a `Once`-like type (does that exist on the C
side?) so a type that can be initialized once and then never changes.
While it doesn't have a value set, we return some default value for the
param and print a warning, when it's set, we just return the value. But
this probably also requires atomics...

Is parameter accessing used that often in hot paths? Can't you just copy
the value into your `Module` struct?

---
Cheers,
Benno

