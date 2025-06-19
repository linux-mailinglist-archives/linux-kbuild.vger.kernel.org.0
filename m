Return-Path: <linux-kbuild+bounces-7571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27EAE064F
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0A5188A672
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D39241CB2;
	Thu, 19 Jun 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcuBAS4/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814A35963;
	Thu, 19 Jun 2025 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337711; cv=none; b=nZ7K31M8AVYDpwSh97irRFqryj6GY9IbW/pTKnmPUyLNiB2p+R8N4ZWhVJewATkGhM4iMgakdEvA92s9qLVR/OSsNH4z60aNswadcCde9rlYkYM15TslKNR9cuietgL9EnMGyYk/cgj0griOvq2yWTCdTxzY2Ak8exq6OVQiz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337711; c=relaxed/simple;
	bh=F68ARQM2DUOYRKZtWd98Kxrd8cYHG04AvGLTqWL26QE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DtdVNYSJj+yHQkmlDjCS2QwzdPMsQhpfFG4QVfmRC4FsJoZfw0IHkK9/NByNBmrpNiYtfCUiEtcnctClML+pjHPVHIY2/twelp91eU6WQfUBCUQp+8wPkW9gVhGPyw0AAnHS72XAFmaZyY8wN+Gm4e89mCVDs8rxSJO0tdEcObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcuBAS4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E57C4CEEA;
	Thu, 19 Jun 2025 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337710;
	bh=F68ARQM2DUOYRKZtWd98Kxrd8cYHG04AvGLTqWL26QE=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=dcuBAS4/IXvI72zAi2C9wKO8TF8l3yfF6vihcv4oJNxIgPDFaE5J59Gi8cZxion0S
	 vZ3gK0AWXc8KuQa29Vj97LIgYj+LWdMctHcK8oq80U7YJtkBen+vH2XGJCR7NnW64O
	 4u91EJeR4rirFLc5w8oM6Beulu2iPq5g9IkbT5i1F1YF7wybZ/58q5CWbnR3oKiogd
	 uOMVeamHSqojoIMNR9vgU4fm4hUMumMI1ek6RICnpFm4UqKtu98jz4jqmU2oU6Amv9
	 6bYKAkDk76s6pHl3NgNOvRcOKJB97LD8UEcwwum38gpNDeQFPLXJKZ7/0BTTnalI6L
	 3VPlNjrdlfiQQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 14:55:03 +0200
Message-Id: <DAQIXKJ9VMS6.2044WT0FQQCVC@kernel.org>
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
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
 <aa9d7lhjQuDhyNw8zShbtfPFK19W5awx7cPJgC-2X4fGv2yUTnn0jqyIHfMN4wyuaYoS3fU6Fqe_wFteVUGtUg==@protonmail.internalid> <DAPYMAB44RUZ.7NIWDUWY1UYF@kernel.org> <87v7or7wiv.fsf@kernel.org>
In-Reply-To: <87v7or7wiv.fsf@kernel.org>

On Thu Jun 19, 2025 at 2:20 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>>> +
>>> +// SAFETY: C kernel handles serializing access to this type. We never =
access it
>>> +// from Rust module.
>>> +unsafe impl Sync for RacyKernelParam {}
>>> +
>>> +/// Types that can be used for module parameters.
>>> +pub trait ModuleParam: Sized + Copy {
>>
>> Why the `Copy` bound?
>
> Because of potential unsoundness due to drop [1]. I should document
> this. It is noted in the change log for the series under the obscure
> entry "Assign through pointer rather than using `core::ptr::replace`."
>
> [1] https://lore.kernel.org/all/878qnbxtyi.fsf@kernel.org

Ah thanks for the pointer, yeah please mention this in a comment
somewhere.

>>> +    ///
>>> +    /// Parameters passed at boot time will be set before [`kmalloc`] =
is
>>> +    /// available (even if the module is loaded at a later time). Howe=
ver, in
>>
>> I think we should make a section out of this like `# No allocations` (or
>> something better). Let's also mention it on the trait itself, since
>> that's where implementers will most likely look.
>
> Since this series only support `Copy` types that are passed by value, I
> think we can remove this comment for now. I will also restrict the
> lifetime of the string to he duration of the call. Putting static here
> would be lying.
>
>>
>>> +    /// this case, the argument buffer will be valid for the entire li=
fetime of
>>> +    /// the kernel. So implementations of this method which need to al=
locate
>>> +    /// should first check that the allocator is available (with
>>> +    /// [`crate::bindings::slab_is_available`]) and when it is not ava=
ilable
>>
>> We probably shouldn't recommend directly using `bindings`.
>>
>>> +    /// provide an alternative implementation which doesn't allocate. =
In cases
>>> +    /// where the allocator is not available it is safe to save refere=
nces to
>>> +    /// `arg` in `Self`, but in other cases a copy should be made.
>>
>> I don't understand this convention, but it also doesn't seem to
>> relevant (so feel free to leave it as is, but it would be nice if you
>> could explain it).
>
> It has become irrelevant as the series evolved. When we supported
> `!Copy` types we would use the reference if we knew it would be valid
> for the lifetime of the kernel, otherwise we would allocate [1].
>
> However, when the reference is passed at module load time, it is still
> guaranteed to be live for the lifetime of the module, and hence it can
> still be considered `'static`. But, if the reference were to find it's
> way across the module boundary, it can cause UAF issues as the reference
> is not truely `'static`, it is actually `'module`. This ties into the
> difficulty we have around safety of unloading modules. Module unload
> should be marked unsafe.

Ah so the argument should rather be an enum that is either
`Static(&'static str)` or `WithAlloc(&'short str)` with the (non-safety)
guarantee that `WithAlloc` is only passed when the allocator is
available.

> At any rate, I will remove the `'static` lifetime from the reference and
> we are all good for now.

Sounds simplest for now.

>>> +    crate::error::from_result(|| {
>>> +        let new_value =3D T::try_from_param_arg(arg)?;
>>> +
>>> +        // SAFETY: By function safety requirements `param` is be valid=
 for reads.
>>> +        let old_value =3D unsafe { (*param).__bindgen_anon_1.arg as *m=
ut T };
>>> +
>>> +        // SAFETY: By function safety requirements, the target of `old=
_value` is valid for writes
>>> +        // and is initialized.
>>> +        unsafe { *old_value =3D new_value };
>>
>> So if we keep the `ModuleParam: Copy` bound from above, then we don't
>> need to drop the type here (as `Copy` implies `!Drop`). So we could also
>> remove the requirement for initialized memory and use `ptr::write` here
>> instead. Thoughts?
>
> Yes, that is the rationale for the `Copy` bound. What would be the
> benefit of using `ptr::write`? They should be equivalent for `Copy`
> types, right.

They should be equivalent, but if we drop the requirement that the value
is initialized to begin with, then removing `Copy` will result in UB
here.

> I was using `ptr::replace`, but Alice suggested the pace expression
> assignment instead, since I was not using the old value.

That makes sense, but if we also remove the initialized requirement,
then I would prefer `ptr::write`.

---
Cheers,
Benno

