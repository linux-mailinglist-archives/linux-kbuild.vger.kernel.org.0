Return-Path: <linux-kbuild+bounces-7614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0BFAE3AE6
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 11:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B8A16DA38
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Jun 2025 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860E231840;
	Mon, 23 Jun 2025 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qU6Hl5z0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A81FBEBD;
	Mon, 23 Jun 2025 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671899; cv=none; b=EYvXaHluaFqiTY4Tt324pWuyhuZ8+ABZoPTVeGj4Zs3nfj+qSHGoufYAwp4CXDNUudnzhF4RC4rC0HxcT8L0uXozLpJ5uPMvaCLvahr4JS2oRMc/ofPFJlYdvOGjH7ZrEOwyAIgMV6wMgQ6pQSuccUtR6KKxRKclpcOQnu8rGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671899; c=relaxed/simple;
	bh=dUHxe+8KpyB6sh0m0/GxIBcVysNPv+g+1nWdIB9lUCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ttHkQyLxj9xjRQYUMSwq/EemkJPAjmC0qgMiN9axJBuMOHhdRIg3KAntTcsG0HeHm0YQwZxDcdgufJiyzzoLV+l527HUUt9vReMTPFeNAB5kOKChZbJkqX0lRnFeIVQ8kCHcnkzqXMCgf4jvQzYVFlLiEMH69d/8DDDUPPjI5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qU6Hl5z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53493C4CEEA;
	Mon, 23 Jun 2025 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750671899;
	bh=dUHxe+8KpyB6sh0m0/GxIBcVysNPv+g+1nWdIB9lUCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qU6Hl5z0f2nZ5iyQsuZZu4u+tlmBpaMknF2PQ6iDTeBJnt5zUIVj5aVNnktTV/CkN
	 jxW++fbwQfl/c7tFh1aBUxGLr4J2OJN5JLToGP2+a7fgWyim/Jg6R1u3rKr05d2waF
	 99kTfcylfTqk1EsHpRAGZw04j/PeFN1pr0/mmwwFHX9qs8lkb2MG4Kdi+gsmRlQC+V
	 wr5EiEsNuCR3FmPl2nDGKu1AtzAf6h0CdnyLZ3tEsRkTgH9MRtDTGtXD4ohoQc60wS
	 12VxYK+TW/g3QbmS9NnvyVDRAjorZ9sGkNbABsci3QTyxY/rD74UzOa3Xxl0Xw6Y9K
	 AKg5hcgYGcNAw==
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
In-Reply-To: <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> (Benno Lossin's message
	of "Fri, 20 Jun 2025 14:28:44 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
	<smOfUo2mEmQu-lykKKMiNOUWq2ze6p_CoEEpgGE0dtAnoJDGEpvQMkP1q-n13MiUxLK1xAiM-4QLsivPrG57sg==@protonmail.internalid>
	<DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 11:44:49 +0200
Message-ID: <877c126bce.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>>> +/// A wrapper for kernel parameters.
>>>> +///
>>>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>>>> +/// defined. You should never need to instantiate this type directly.
>>>> +///
>>>> +/// Note: This type is `pub` because it is used by module crates to access
>>>> +/// parameter values.
>>>> +#[repr(transparent)]
>>>> +pub struct ModuleParamAccess<T> {
>>>> +    data: core::cell::UnsafeCell<T>,
>>>> +}
>>>> +
>>>> +// SAFETY: We only create shared references to the contents of this container,
>>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>>> +
>>>> +impl<T> ModuleParamAccess<T> {
>>>> +    #[doc(hidden)]
>>>> +    pub const fn new(value: T) -> Self {
>>>> +        Self {
>>>> +            data: core::cell::UnsafeCell::new(value),
>>>> +        }
>>>> +    }
>>>> +
>>>> +    /// Get a shared reference to the parameter value.
>>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>>> +    // held lock guard here.
>>>> +    pub fn get(&self) -> &T {
>>>> +        // SAFETY: As we only support read only parameters with no sysfs
>>>> +        // exposure, the kernel will not touch the parameter data after module
>>>> +        // initialization.
>>>
>>> This should be a type invariant. But I'm having difficulty defining one
>>> that's actually correct: after parsing the parameter, this is written
>>> to, but when is that actually?
>>
>> For built-in modules it is during kernel initialization. For loadable
>> modules, it during module load. No code from the module will execute
>> before parameters are set.
>
> Gotcha and there never ever will be custom code that is executed
> before/during parameter setting (so code aside from code in `kernel`)?
>
>>> Would we eventually execute other Rust
>>> code during that time? (for example when we allow custom parameter
>>> parsing)
>>
>> I don't think we will need to synchronize because of custom parameter
>> parsing. Parameters are initialized sequentially. It is not a problem if
>> the custom parameter parsing code name other parameters, because they
>> are all initialized to valid values (as they are statics).
>
> If you have `&'static i64`, then the value at that reference is never
> allowed to change.
>
>>> This function also must never be `const` because of the following:
>>>
>>>     module! {
>>>         // ...
>>>         params: {
>>>             my_param: i64 {
>>>                 default: 0,
>>>                 description: "",
>>>             },
>>>         },
>>>     }
>>>
>>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>>
>>> AFAIK, this static will be executed before loading module parameters and
>>> thus it makes writing to the parameter UB.
>>
>> As I understand, the static will be initialized by a constant expression
>> evaluated at compile time. I am not sure what happens when this is
>> evaluated in const context:
>>
>>     pub fn get(&self) -> &T {
>>         // SAFETY: As we only support read only parameters with no sysfs
>>         // exposure, the kernel will not touch the parameter data after module
>>         // initialization.
>>         unsafe { &*self.data.get() }
>>     }
>>
>> Why would that not be OK? I would assume the compiler builds a dependency graph
>> when initializing statics?
>
> Yes it builds a dependency graph, but that is irrelevant? The problem is
> that I can create a `'static` reference to the inner value *before* the
> parameter is written-to (as the static is initialized before the
> parameters).

I see, I did not consider this situation. Thanks for pointing this out.

Could we get around this without a lock maybe? If we change
`ModuleParamAccess::get` to take a closure instead:

    /// Call `func` with a reference to the parameter value stored in `Self`.
    pub fn read(&self, func: impl FnOnce(&T)) {
        // SAFETY: As we only support read only parameters with no sysfs
        // exposure, the kernel will not touch the parameter data after module
        // initialization.
        let data = unsafe { &*self.data.get() };

        func(data)
    }

I think this would bound the lifetime of the reference passed to the
closure to the duration of the call, right?


Best regards,
Andreas Hindborg





