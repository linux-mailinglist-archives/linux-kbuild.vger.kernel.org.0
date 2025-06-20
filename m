Return-Path: <linux-kbuild+bounces-7592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58779AE1AEE
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 14:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9073C7A47A0
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F238C28A1C5;
	Fri, 20 Jun 2025 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJeZeYdD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0790220696;
	Fri, 20 Jun 2025 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422531; cv=none; b=oddl1Wy0X2yZEAPNFt4LQbayEA0pgodjHJsaaCwohrSB0S3ACTrlmZZpo7hmeOSOiNyvndB8xM0qXOplHovMLANqykJW0YvZXgO7pNA0Dhk4+bPTC3DJiN7N+8badjyg1WnVKziR3L3x7ZNsjQVOFcPrTfv5kMnnFZp7Et9aFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422531; c=relaxed/simple;
	bh=7nPhNMyXqRY92E+lzth6jsH7dnJ4KYzBBljDG+AN4gw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iGdkrx5DVJy5wDRx+40pHVF6w1HTV8+/4oDciQaCfB6KfUPdUJyRyoiOxmJhFRjMOL2sS3NWrJ3vCQFFXkOkbF9+g3xMoCaLqoYoTmXFwCJgvxo/IzBIv0RcjWgKd4E6sXireUiau9zgZmqaBrxBEAxMJzezY4To/o872a6PWHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJeZeYdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906ECC4CEF3;
	Fri, 20 Jun 2025 12:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750422531;
	bh=7nPhNMyXqRY92E+lzth6jsH7dnJ4KYzBBljDG+AN4gw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=tJeZeYdDuh/fSbZt/FDky6SBNqceJ/TGmMe4ucAVxvtfSeMueGEbD+tZwHfDfNYyK
	 /iORBPFTbs1RWlVp0ZUrvrs4hOo3yICq8i/AYVPq6AI2jJkZA98IYVYCxi9J3xLvZJ
	 FonAz0myhZ/31NIyNWcyi8MCg1C7EWc9hQyEynw000ZF0aQXMYQKSl+hv27BBwdBpi
	 Fkbe9uZX+qoZtbOAWrXVHpOUelDnBtpBMvXQnzj805vNukEKb8mVHmWaz9s4EOJi6Q
	 sQnLcohjfrY9606K1bdBTOqm4GJYbtVWSsufHzT2dwJw/zlQ4sEm3P04x8+Kuym8da
	 vxmJ3TWy5d0lQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 14:28:44 +0200
Message-Id: <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org>
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
 <COU2bqJOzCHRf6g4rwFpu2NY3wLY0G0AmNjRaU9aGEqu1HaPZ5X4KzfDT_CEB3Okh5BV50sJS10sKhmtHut8ew==@protonmail.internalid> <DAQJCUE1C2JE.204A8IS7LBIVZ@kernel.org> <87ikkq648o.fsf@kernel.org>
In-Reply-To: <87ikkq648o.fsf@kernel.org>

On Fri Jun 20, 2025 at 1:29 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>> +/// A wrapper for kernel parameters.
>>> +///
>>> +/// This type is instantiated by the [`module!`] macro when module par=
ameters are
>>> +/// defined. You should never need to instantiate this type directly.
>>> +///
>>> +/// Note: This type is `pub` because it is used by module crates to ac=
cess
>>> +/// parameter values.
>>> +#[repr(transparent)]
>>> +pub struct ModuleParamAccess<T> {
>>> +    data: core::cell::UnsafeCell<T>,
>>> +}
>>> +
>>> +// SAFETY: We only create shared references to the contents of this co=
ntainer,
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
>>> +    // Note: When sysfs access to parameters are enabled, we have to p=
ass in a
>>> +    // held lock guard here.
>>> +    pub fn get(&self) -> &T {
>>> +        // SAFETY: As we only support read only parameters with no sys=
fs
>>> +        // exposure, the kernel will not touch the parameter data afte=
r module
>>> +        // initialization.
>>
>> This should be a type invariant. But I'm having difficulty defining one
>> that's actually correct: after parsing the parameter, this is written
>> to, but when is that actually?
>
> For built-in modules it is during kernel initialization. For loadable
> modules, it during module load. No code from the module will execute
> before parameters are set.

Gotcha and there never ever will be custom code that is executed
before/during parameter setting (so code aside from code in `kernel`)?

>> Would we eventually execute other Rust
>> code during that time? (for example when we allow custom parameter
>> parsing)
>
> I don't think we will need to synchronize because of custom parameter
> parsing. Parameters are initialized sequentially. It is not a problem if
> the custom parameter parsing code name other parameters, because they
> are all initialized to valid values (as they are statics).

If you have `&'static i64`, then the value at that reference is never
allowed to change.

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
>>     static BAD: &'static i64 =3D module_parameters::my_param.get();
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
>         // exposure, the kernel will not touch the parameter data after m=
odule
>         // initialization.
>         unsafe { &*self.data.get() }
>     }
>
> Why would that not be OK? I would assume the compiler builds a dependency=
 graph
> when initializing statics?

Yes it builds a dependency graph, but that is irrelevant? The problem is
that I can create a `'static` reference to the inner value *before* the
parameter is written-to (as the static is initialized before the
parameters).

---
Cheers,
Benno

