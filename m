Return-Path: <linux-kbuild+bounces-7620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822A5AE485D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 17:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80283BFB94
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 15:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF54262FFD;
	Mon, 23 Jun 2025 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPiZznkt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC51224893;
	Mon, 23 Jun 2025 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692037; cv=none; b=Wlb1ZLoNvbKM27gKa3sFfsyffr1aeaKOgF293I9pWsy82h6vbOvimbmF7bnGukh5Zb+aE0rGvbzxPlcjuc2ZT6X9t8FpZAOgxHZmIqEFdIKmXiRy1odPBPS3ccDvNtt2XzHBXSrHc9sAGzwi47pkjga2J5mRtObxl5AjLeC17hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692037; c=relaxed/simple;
	bh=l/r2JSeJIeXp8jrXHsS7NT/yqMuq7CTcetDYya9sGRQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oa4wHYV/qJSPl+gFVkcjJpqRsUsoq4IQmXr2gqJUrqSugetQjDSMKgg4WS8n7VDZizpE2/zPFox7bdXdAmzFPhLwv+ykp9Fgra025WHOpX1ASaoNv5nMxaD2F4oj1W9poZlXB38wgS4AwLiQIQ19ynFHa09aE96E5aj4K2k8fiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPiZznkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9755C4CEEA;
	Mon, 23 Jun 2025 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750692036;
	bh=l/r2JSeJIeXp8jrXHsS7NT/yqMuq7CTcetDYya9sGRQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=WPiZznktOIB3C0ojfKdDu11CQh4Fsr4rgzcfoUUyhfO32O4cc7o+7CBbPD7eEXF65
	 1RSAp0OLw6nQCIArfBkDaIemb7RixZMxpz97hQGevG3P4i3ppEGSTd4Fo8GLGdFbiG
	 4xCEbnJLVzvHsfaKq/LD5XYLGjgP6yEgDVr5RxmUjA3LvxkuGJ9hiipm2lFc5es25o
	 rxTsICNctxqoWUx8zpVAaQ5ujkcHluYMx3nm2jCpk+tzsKIjHSGwYLKpXiOrcx6TAC
	 1dZOyVsMCjo+7G+YyeCWQ9TGpDVvv0493LGb77TLnFbZZWzoby0jXSBaq9qLgS1JJg
	 WGYNo0aqjTOiA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 17:20:30 +0200
Message-Id: <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org>
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
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org> <smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid> <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org> <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
In-Reply-To: <87v7om4jhq.fsf@kernel.org>

On Mon Jun 23, 2025 at 4:31 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>
>> On Mon Jun 23, 2025 at 11:44 AM CEST, Andreas Hindborg wrote:
>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>
>>>> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>>>>> "Benno Lossin" <lossin@kernel.org> writes:
>>>>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>>>>> +/// A wrapper for kernel parameters.
>>>>>>> +///
>>>>>>> +/// This type is instantiated by the [`module!`] macro when module=
 parameters are
>>>>>>> +/// defined. You should never need to instantiate this type direct=
ly.
>>>>>>> +///
>>>>>>> +/// Note: This type is `pub` because it is used by module crates t=
o access
>>>>>>> +/// parameter values.
>>>>>>> +#[repr(transparent)]
>>>>>>> +pub struct ModuleParamAccess<T> {
>>>>>>> +    data: core::cell::UnsafeCell<T>,
>>>>>>> +}
>>>>>>> +
>>>>>>> +// SAFETY: We only create shared references to the contents of thi=
s container,
>>>>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>>>>> +
>>>>>>> +impl<T> ModuleParamAccess<T> {
>>>>>>> +    #[doc(hidden)]
>>>>>>> +    pub const fn new(value: T) -> Self {
>>>>>>> +        Self {
>>>>>>> +            data: core::cell::UnsafeCell::new(value),
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /// Get a shared reference to the parameter value.
>>>>>>> +    // Note: When sysfs access to parameters are enabled, we have =
to pass in a
>>>>>>> +    // held lock guard here.
>>>>>>> +    pub fn get(&self) -> &T {
>>>>>>> +        // SAFETY: As we only support read only parameters with no=
 sysfs
>>>>>>> +        // exposure, the kernel will not touch the parameter data =
after module
>>>>>>> +        // initialization.
>>>>>>
>>>>>> This should be a type invariant. But I'm having difficulty defining =
one
>>>>>> that's actually correct: after parsing the parameter, this is writte=
n
>>>>>> to, but when is that actually?
>>>>>
>>>>> For built-in modules it is during kernel initialization. For loadable
>>>>> modules, it during module load. No code from the module will execute
>>>>> before parameters are set.
>>>>
>>>> Gotcha and there never ever will be custom code that is executed
>>>> before/during parameter setting (so code aside from code in `kernel`)?
>>>>
>>>>>> Would we eventually execute other Rust
>>>>>> code during that time? (for example when we allow custom parameter
>>>>>> parsing)
>>>>>
>>>>> I don't think we will need to synchronize because of custom parameter
>>>>> parsing. Parameters are initialized sequentially. It is not a problem=
 if
>>>>> the custom parameter parsing code name other parameters, because they
>>>>> are all initialized to valid values (as they are statics).
>>>>
>>>> If you have `&'static i64`, then the value at that reference is never
>>>> allowed to change.
>>>>
>>>>>> This function also must never be `const` because of the following:
>>>>>>
>>>>>>     module! {
>>>>>>         // ...
>>>>>>         params: {
>>>>>>             my_param: i64 {
>>>>>>                 default: 0,
>>>>>>                 description: "",
>>>>>>             },
>>>>>>         },
>>>>>>     }
>>>>>>
>>>>>>     static BAD: &'static i64 =3D module_parameters::my_param.get();
>>>>>>
>>>>>> AFAIK, this static will be executed before loading module parameters=
 and
>>>>>> thus it makes writing to the parameter UB.
>>>>>
>>>>> As I understand, the static will be initialized by a constant express=
ion
>>>>> evaluated at compile time. I am not sure what happens when this is
>>>>> evaluated in const context:
>>>>>
>>>>>     pub fn get(&self) -> &T {
>>>>>         // SAFETY: As we only support read only parameters with no sy=
sfs
>>>>>         // exposure, the kernel will not touch the parameter data aft=
er module
>>>>>         // initialization.
>>>>>         unsafe { &*self.data.get() }
>>>>>     }
>>>>>
>>>>> Why would that not be OK? I would assume the compiler builds a depend=
ency graph
>>>>> when initializing statics?
>>>>
>>>> Yes it builds a dependency graph, but that is irrelevant? The problem =
is
>>>> that I can create a `'static` reference to the inner value *before* th=
e
>>>> parameter is written-to (as the static is initialized before the
>>>> parameters).
>>>
>>> I see, I did not consider this situation. Thanks for pointing this out.
>>>
>>> Could we get around this without a lock maybe? If we change
>>> `ModuleParamAccess::get` to take a closure instead:
>>>
>>>     /// Call `func` with a reference to the parameter value stored in `=
Self`.
>>>     pub fn read(&self, func: impl FnOnce(&T)) {
>>>         // SAFETY: As we only support read only parameters with no sysf=
s
>>>         // exposure, the kernel will not touch the parameter data after=
 module
>>>         // initialization.
>>>         let data =3D unsafe { &*self.data.get() };
>>>
>>>         func(data)
>>>     }
>>>
>>> I think this would bound the lifetime of the reference passed to the
>>> closure to the duration of the call, right?
>>
>> Yes that is correct. Now you can't assign the reference to a static.
>> However, this API is probably very clunky to use, since you always have
>> to create a closure etc.
>>
>> Since you mentioned in the other reply that one could spin up a thread
>> and do something simultaneously, I don't think this is enough. You could
>> have a loop spin over the new `read` function and read the value and
>> then the write happens.
>
> Yes you are right, we have to treat it as if it could be written at any
> point in time.
>
>> One way to fix this issue would be to use atomics to read the value and
>> to not create a reference to it. So essentially have
>>
>>     pub fn read(&self) -> T {
>>         unsafe { atomic_read_unsafe_cell(&self.data) }
>>     }
>
> That could work.
>
>> Another way would be to use a `Once`-like type (does that exist on the C
>> side?) so a type that can be initialized once and then never changes.
>> While it doesn't have a value set, we return some default value for the
>> param and print a warning, when it's set, we just return the value. But
>> this probably also requires atomics...
>
> I think atomic bool is not that far away. Either that, or we can lock.
>
>> Is parameter accessing used that often in hot paths? Can't you just copy
>> the value into your `Module` struct?
>
> I don't imagine this being read in a hot path. If so, the user could
> make a copy.

That's good to know, then let's try to go for something simple.

I don't think that we can just use a `Mutex<T>`, because we don't have a
way to create it at const time... I guess we could have

    impl<T> Mutex<T>
        /// # Safety
        ///
        /// The returned value needs to be pinned and then `init` needs
        /// to be called before any other methods are called on this.
        pub unsafe const fn const_new() -> Self;

        pub unsafe fn init(&self);
    }

But that seems like a bad idea, because where would we call the `init`
function? That also needs to be synchronized...

Maybe we can just like you said use an atomic bool?

---
Cheers,
Benno

