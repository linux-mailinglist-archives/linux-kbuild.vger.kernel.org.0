Return-Path: <linux-kbuild+bounces-7868-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA7AAF7E16
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 18:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73AC1C21AAA
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 16:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4172580D7;
	Thu,  3 Jul 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cirVBWt2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B3158535;
	Thu,  3 Jul 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560928; cv=none; b=ZTvfJVwi0ES2seA+8yX+pEp6O81gba3eoXuIA7jZCXRwXwuKM5rUA32uoMhC6jhE441R3tjjNr0rK7jgBt+r8UY6fvPC1tV6fg0KDPVD7vK5EkgDuoIU8njccj3lRyvMra3oNU5dRMYcxNRZtpaywzjS7HFV+iK8kf7rTfFXELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560928; c=relaxed/simple;
	bh=ZT9MMzNVBc46W+N2Nstu+3l0+Cbqa9TefNxhDjkrowg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cm00An8vQi1rkuwGDCdbOw5Pe9xUpfmGfXdCIJinON2f7I9dwxS9xiw24TNkTHF9WiRwhpPf9/t0Jy6KLAskoQ/xx9FSnienlfpJBGR4QMzemDcHjTDf12oQfsO6TQGl7oHGa5+LHC+vh2wKYwKf/IyLOCLf2zX2wiavRIY0HvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cirVBWt2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA175C4CEE3;
	Thu,  3 Jul 2025 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560927;
	bh=ZT9MMzNVBc46W+N2Nstu+3l0+Cbqa9TefNxhDjkrowg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cirVBWt2mMQN25eRMphhuim2VblJWGdF+H883c7IMa2m63WLVewdiJP7F1o079pkG
	 tgcl9nVqMHsDBCrTygnD+srAUUXX6Tvx2Tp/G3YnQPjYJUFOLODyUa2rABfh7nx9x1
	 WJoBI0fWPfodhIihD4Bi4YKP+0xU/7oXltJG3cPRMOMi3Loqt0EDsXhzoelZ7m9zzP
	 KYZFuU/DUJ377LWTjdAVsSgDwuEycIEjIBJFmhFR9nDEFCOXh8RKhei7dZiC9B2z87
	 ZACnInQgTkMYdZWWhGNOf87RykyccA1SoSHaHaKMmMT+bZlOX4Wj04M5HKzrhQyu4M
	 1g1vrAYWCRkfQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Wren Turkal" <wt@penguintechs.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Benno
 Lossin" <lossin@kernel.org>,  "Nicolas Schier" <nicolas.schier@linux.dev>,
  "Trevor Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
In-Reply-To: <35e1fef4-b715-4827-a498-bdde9b58b51c@penguintechs.org> (Wren
	Turkal's message of "Thu, 03 Jul 2025 02:36:39 -0700")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org>
	<FRBew2n3RrQrWTcQwXL0RSoeEj9HFX0-pueBrZSpa8EFcB80KpzsnE1INWFbuxK8qm4ROETZCoWzpxelZ_anhQ==@protonmail.internalid>
	<35e1fef4-b715-4827-a498-bdde9b58b51c@penguintechs.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 03 Jul 2025 18:41:57 +0200
Message-ID: <87sejdteei.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Wren Turkal" <wt@penguintechs.org> writes:

> On 7/2/25 6:18 AM, Andreas Hindborg wrote:

[...]

>> +pub struct OnceLock<T> {
>> +    init: Atomic<u32>,
>> +    value: Opaque<T>,
>> +}
>
> This type looks very much like the Once type in rust's stdlib. I am
> wondering if the api could be changed to match that api. I know that
> this type is trying to provide a version subset of std::sync::OnceLock
> that doesn't allow resetting the type like these apis:
>
> * https://doc.rust-lang.org/std/sync/struct.OnceLock.html#method.get_mut
> * https://doc.rust-lang.org/std/sync/struct.OnceLock.html#method.take
>
> However, these methods can only be used on mut. See here for failing
> example:
> https://play.rust-lang.org/?version=nightly&mode=debug&edition=2021&gist=a78e51203c5b9555e3c151e162f0acab
>
> I think it might make more sense to match the api of the stdlib API and
> maybe only implement the methods you need.

I agree, it would be nice to match the names to std. But I do not like
that they have `OnceLock::set`, `OnceLock::try_init` and
`OnceLock::get_or{_try}_init`. Why is it not `OnceLock::init` or
`OnceLock::try_set`?

>
>> +
>> +impl<T> Default for OnceLock<T> {
>> +    fn default() -> Self {
>> +        Self::new()
>> +    }
>> +}
>
> Any reason not to use #[derive(Default)]?

We don't have `Default` for neither `Atomic` or `Opaque`.

[...]

> Might also be worth implementing get_or_{try,}init, which get the value
> while initializing.

I did not have a user for those, so not adding for now. It would be dead
code. They should be fairly straight forward to add though.

>
>> +        // INVARIANT: We obtain exclusive access to the contained allocation and write 1 to
>> +        // `init`.
>> +        if let Ok(0) = self.init.cmpxchg(0, 1, Acquire) {
>> +            // SAFETY: We obtained exclusive access to the contained object.
>> +            unsafe { core::ptr::write(self.value.get(), value) };
>> +            // INVARIANT: We release our exclusive access and transition the object to shared
>> +            // access.
>> +            self.init.store(2, Release);
>> +            true
>> +        } else {
>> +            false
>> +        }
>> +    }
>> +}
>> +
>> +impl<T: Copy> OnceLock<T> {
>> +    /// Get a copy of the contained object.
>> +    ///
>> +    /// Returns [`None`] if the [`OnceLock`] is empty.
>> +    pub fn copy(&self) -> Option<T> {
>
> No equivalent in OnceLock. Similar to something like this:
>
> x.get().copied().unwrap(); // x is a OnceLock
>
> Example:
> https://play.rust-lang.org/?version=nightly&mode=debug&edition=2021&gist=f21068e55f73722544fb5ad341bce1c5
>
> Maybe not specifically needed?

I don't actually have a user for this, so I think I will drop it.


Best regards,
Andreas Hindborg




