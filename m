Return-Path: <linux-kbuild+bounces-7589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCABFAE19FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 13:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 680D43A32A7
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09582882A8;
	Fri, 20 Jun 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcB91OzR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0972853EF;
	Fri, 20 Jun 2025 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418962; cv=none; b=oVd3MNFT5rFfCEdMzie6JbMTe+8Gl4aQjPnFjN5hDlrPkmK7dHHmyUvJPtCpEc/1Q5iS9vLL7dC+giV+HgdCj3RYYxE+bm4Y0Ry+f1aI4RIK4Xg7GQQRqSbw2SWs9J1ChF2BX+UNCSZW0goaPBK9OIniihvohVCS2FRoTfJ4oEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418962; c=relaxed/simple;
	bh=c4Rc2nFa3I49nxqi5SgaiDRGigf/JNf4RcytD5THg7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=exvH4P+5oMb9Eg7qu4dVkPdzyxCsAeCoRd4NNoUlnjS2fim5IZOyt25pmfKRhwcL721GPI6yVei8n4+D+MdYvdtyO0WWGwPJvb7Mm9NABOlTljsAuZuVtmefzCy/15McaXgbMua6eyiE2rQ9NTwMmUmNEJnBJzFK4lvqi6vlWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcB91OzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A16C4CEE3;
	Fri, 20 Jun 2025 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418962;
	bh=c4Rc2nFa3I49nxqi5SgaiDRGigf/JNf4RcytD5THg7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PcB91OzROARD50vmekIMFW8RbjI1rBadXKSlSMxIFpR/AIGvnKl8eoxyesnMbPGve
	 C01F65HbecH8pc0TukmBZ7HdhL1q2kFziyZmB+0spokiEsnzPvNn/D6dvkcp0jOoVk
	 prbXUdoN89pXXEzLOjlMy1/9lDprj/pIxdLCfwYm9EdR9N06QIDMyf9tdUfM9eTQWr
	 D74VbkA2mSdfLKLQfpza0alcj3TvhtrsU6mDGLzFhLmcQ9l6MjVh6VqZmmPC3EFFoM
	 7FjtcnSxMl0gFrmTpxnFyY9wB+sVLjeU+kgif//v9mhUfY/cUApC0OgzAE41vup1Gj
	 5LPGzkLU9dF9w==
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
In-Reply-To: <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> (Benno Lossin's message
	of "Thu, 19 Jun 2025 15:15:00 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid>
	<DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 20 Jun 2025 13:29:11 +0200
Message-ID: <87ikkq648o.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>> +/// A wrapper for kernel parameters.
>> +///
>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>> +/// defined. You should never need to instantiate this type directly.
>> +///
>> +/// Note: This type is `pub` because it is used by module crates to access
>> +/// parameter values.
>> +#[repr(transparent)]
>> +pub struct ModuleParamAccess<T> {
>> +    data: core::cell::UnsafeCell<T>,
>> +}
>> +
>> +// SAFETY: We only create shared references to the contents of this container,
>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>> +
>> +impl<T> ModuleParamAccess<T> {
>> +    #[doc(hidden)]
>> +    pub const fn new(value: T) -> Self {
>> +        Self {
>> +            data: core::cell::UnsafeCell::new(value),
>> +        }
>> +    }
>> +
>> +    /// Get a shared reference to the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>> +    // held lock guard here.
>> +    pub fn get(&self) -> &T {
>> +        // SAFETY: As we only support read only parameters with no sysfs
>> +        // exposure, the kernel will not touch the parameter data after module
>> +        // initialization.
>
> This should be a type invariant. But I'm having difficulty defining one
> that's actually correct: after parsing the parameter, this is written
> to, but when is that actually?

For built-in modules it is during kernel initialization. For loadable
modules, it during module load. No code from the module will execute
before parameters are set.

> Would we eventually execute other Rust
> code during that time? (for example when we allow custom parameter
> parsing)

I don't think we will need to synchronize because of custom parameter
parsing. Parameters are initialized sequentially. It is not a problem if
the custom parameter parsing code name other parameters, because they
are all initialized to valid values (as they are statics).

>
> This function also must never be `const` because of the following:
>
>     module! {
>         // ...
>         params: {
>             my_param: i64 {
>                 default: 0,
>                 description: "",
>             },
>         },
>     }
>
>     static BAD: &'static i64 = module_parameters::my_param.get();
>
> AFAIK, this static will be executed before loading module parameters and
> thus it makes writing to the parameter UB.

As I understand, the static will be initialized by a constant expression
evaluated at compile time. I am not sure what happens when this is
evaluated in const context:

    pub fn get(&self) -> &T {
        // SAFETY: As we only support read only parameters with no sysfs
        // exposure, the kernel will not touch the parameter data after module
        // initialization.
        unsafe { &*self.data.get() }
    }

Why would that not be OK? I would assume the compiler builds a dependency graph
when initializing statics?


Best regards,
Andreas Hindborg




