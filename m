Return-Path: <linux-kbuild+bounces-7591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95CAE1A46
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A902E3B4D61
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 11:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434E228A40D;
	Fri, 20 Jun 2025 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAM63k8e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13937280002;
	Fri, 20 Jun 2025 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420347; cv=none; b=P07SawJ6C0uHC5h7GWzmwTUf778vdWFYUVD4kEVSXUp3S6g38POwj4S+Cp0T3G7SA6BU+M8ho+gFxn2rVFvYY0fjuPItbrS+Pr3EfMnHQnD69WVweYmDXcwOnpKTopMaZZDmZ7WiNxIWiuKUCWN+vqB4FIk3keNSpXh3ZE+EMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420347; c=relaxed/simple;
	bh=+a2uJy8Ukno04bfheCrhKeTa95Ow8PXF5cGshA7yz6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u0u0JiOdD0tXD2JP91vcL6xH8IkoNY9LzeaeHvQymG1OBvzImP+6SRrDIZ3PPX88KtnTikhMX3AlZXu56A73utlEfT4WSb1asE2zv2t+jVsuTU7UvAXZ5xnCC5bJQhq726Dl/YKVSTTAp3iu5sbRuwFGQVL4Pml1l7t85J42WMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAM63k8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A36C4CEE3;
	Fri, 20 Jun 2025 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750420346;
	bh=+a2uJy8Ukno04bfheCrhKeTa95Ow8PXF5cGshA7yz6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sAM63k8eDUDlD1/Tw36rnZmA3QSz6217JgZNBjEMvH8jv04lonKDsvRNaE42EoVtl
	 +oDUfpSKg3r7R4CId960Xvg/0xuRqTw2XaLgFvtfT/CdYNslA6O63NenfHtdIPhuz8
	 uLqKFJJt4rbxwzjTSI2KanQ87uoIbl4wU7NJg9AjDj3/QnOwY13LIkLstKeKVKTWzW
	 8yXvr+xTQ168CfGBRyQjzM/XV1nV21ZqSpltBlel2GznE+/YDLnIKs85uGNJIWEuv/
	 hbZOP04L9A5tFYkS5R2YsfKsZ9u2zpVM7t2ks2yxFjL4zN/ESG0FJKiP51MgIzcofC
	 8KG4HuSebqfUw==
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
In-Reply-To: <87ikkq648o.fsf@kernel.org> (Andreas Hindborg's message of "Fri,
	20 Jun 2025 13:29:11 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 20 Jun 2025 13:52:16 +0200
Message-ID: <87cyay6367.fsf@kernel.org>
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
>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>> +/// A wrapper for kernel parameters.
>>> +///
>>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>>> +/// defined. You should never need to instantiate this type directly.
>>> +///
>>> +/// Note: This type is `pub` because it is used by module crates to access
>>> +/// parameter values.
>>> +#[repr(transparent)]
>>> +pub struct ModuleParamAccess<T> {
>>> +    data: core::cell::UnsafeCell<T>,
>>> +}
>>> +
>>> +// SAFETY: We only create shared references to the contents of this container,
>>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>>> +
>>> +impl<T> ModuleParamAccess<T> {
>>> +    #[doc(hidden)]
>>> +    pub const fn new(value: T) -> Self {
>>> +        Self {
>>> +            data: core::cell::UnsafeCell::new(value),
>>> +        }
>>> +    }
>>> +
>>> +    /// Get a shared reference to the parameter value.
>>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>>> +    // held lock guard here.
>>> +    pub fn get(&self) -> &T {
>>> +        // SAFETY: As we only support read only parameters with no sysfs
>>> +        // exposure, the kernel will not touch the parameter data after module
>>> +        // initialization.
>>
>> This should be a type invariant. But I'm having difficulty defining one
>> that's actually correct: after parsing the parameter, this is written
>> to, but when is that actually?
>
> For built-in modules it is during kernel initialization. For loadable
> modules, it during module load. No code from the module will execute
> before parameters are set.
>
>> Would we eventually execute other Rust
>> code during that time? (for example when we allow custom parameter
>> parsing)
>
> I don't think we will need to synchronize because of custom parameter
> parsing. Parameters are initialized sequentially. It is not a problem if
> the custom parameter parsing code name other parameters, because they
> are all initialized to valid values (as they are statics).
>
>>
>> This function also must never be `const` because of the following:
>>
>>     module! {
>>         // ...
>>         params: {
>>             my_param: i64 {
>>                 default: 0,
>>                 description: "",
>>             },
>>         },
>>     }
>>
>>     static BAD: &'static i64 = module_parameters::my_param.get();
>>
>> AFAIK, this static will be executed before loading module parameters and
>> thus it makes writing to the parameter UB.
>
> As I understand, the static will be initialized by a constant expression
> evaluated at compile time. I am not sure what happens when this is
> evaluated in const context:
>
>     pub fn get(&self) -> &T {
>         // SAFETY: As we only support read only parameters with no sysfs
>         // exposure, the kernel will not touch the parameter data after module
>         // initialization.
>         unsafe { &*self.data.get() }
>     }
>
> Why would that not be OK? I would assume the compiler builds a dependency graph
> when initializing statics?

It seems the compiler builds a dependency graph to check:

https://play.rust-lang.org/?version=nightly&mode=debug&edition=2024&gist=7a4d129a3fd2ae39a0aab9df3878a3d3


Best regards,
Andreas Hindborg




