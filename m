Return-Path: <linux-kbuild+bounces-7934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 875ADAFCB61
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 15:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14508189C12C
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 13:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAA429ACC6;
	Tue,  8 Jul 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8eV6pOW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C326B08F;
	Tue,  8 Jul 2025 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980020; cv=none; b=g+DtuUE/zCAi9XnQci7yS4U9irU5T1N0/+TrzE1jYHVTDi4bebHXlqz7qtOfwBfkKUpInaV2JRNceoUn4Qzt/MmIuHL0mlCKB+TRrPLgL8Vo+zdECgCHpKMsH1lDp1os7Fa5sEYiHsNo7yEHdlQ2+jG7n0W1THRmpUUeNUnIECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980020; c=relaxed/simple;
	bh=+kO/dnpSF92MEi9qv/Qf3ThC5gVQWquSZ0ZGR98UIOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vDiq5PsKKBRuE3+3KeJstSYXhib1hK+lLT32zlyUzbINrs9mVAzpOtG9dt4Pbdeck6tgZsSjROVJBJqjCy88ylVNmHvkVO0QulmT1lTyux++4tohCdsOC5nPLM3R9XKbxvDYF9Ho3i2kG8PPN0ngf9jT/RnPATeuspj5FIVV1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8eV6pOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D34C4CEF1;
	Tue,  8 Jul 2025 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751980020;
	bh=+kO/dnpSF92MEi9qv/Qf3ThC5gVQWquSZ0ZGR98UIOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g8eV6pOWw3M3BylCmg+NoMONX3t3s4obYesAL20OIOZtFNiur99heJBHWNFbWNgU9
	 e2GcNowmUb14iJ7OO/hX4fCKohpDslsDW/zWzgv82kV1QUKaG/kxSHgXPEqwtrlFA8
	 qquXLKlJFkE+PXvFZthqpHxq+4zGftcDmUJQoJf5bD30tY2kBxntTuH/okSKSiG3SW
	 1ypVNVatE3Kt9eaKBcZJL8WT8NicWppDk+1L5Mm7v5mauzJYxMahh8h8oAYjPvvGX/
	 Wxi0fT+3eQzDJcZi+6fXov7wLrsWVGh2hZHTM2fsBdke04AucWt0powD+Kgd0SHOEd
	 1kaZl5tIimi2A==
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
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org> (Benno Lossin's message
	of "Tue, 08 Jul 2025 11:02:17 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	<MsrRzRcWQU4DLY5mlpwajZZaSx_kPRSJTuMGxtI4igY_8NpNBSAbb9v5BcFv2WKZoRkr8QDlcfjlGlH4NwpB8w==@protonmail.internalid>
	<DB6JVOZLCMBL.3EZQJP50UUB86@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Jul 2025 15:06:48 +0200
Message-ID: <87v7o2omqf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Mon Jul 7, 2025 at 3:29 PM CEST, Andreas Hindborg wrote:
>> Introduce the `SetOnce` type, a container that can only be written once.
>> The container uses an internal atomic to synchronize writes to the inter=
nal
>> value.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> One nit and a safety comment fix below. (feel free to ignore the nit)
> With the safety comment fixed:
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/kernel/sync.rs          |   2 +
>>  rust/kernel/sync/set_once.rs | 125 ++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 127 insertions(+)
>>
>> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
>> index 81e3a806e57e2..13e6bc7fa87ac 100644
>> --- a/rust/kernel/sync.rs
>> +++ b/rust/kernel/sync.rs
>> @@ -18,6 +18,7 @@
>>  mod locked_by;
>>  pub mod poll;
>>  pub mod rcu;
>> +mod set_once;
>
> I would have named this `once`.

So module `once` and struct `SetOnce`? Struct name `Once` would lead
thoughts to `std::sync::Once`, which is a different thing.

>
>>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>>  pub use completion::Completion;
>
>> +    /// Get a reference to the contained object.
>> +    ///
>> +    /// Returns [`None`] if this [`SetOnce`] is empty.
>> +    pub fn as_ref(&self) -> Option<&T> {
>> +        if self.init.load(Acquire) =3D=3D 2 {
>> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
>> +            // contains a valid value.
>
> And the type invariants also ensure that the value of `self.init`
> doesn't change.
>
> So probably
>
>     // SAFETY: By the type invariants of `Self`, `self.init =3D=3D 2` mea=
ns that `self.value`
>     // contains a valid value. They also guarantee that `self.init` doesn=
't change.
>

Sure =F0=9F=91=8D


Best regards,
Andreas Hindborg



