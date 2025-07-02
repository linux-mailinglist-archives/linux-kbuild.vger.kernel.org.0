Return-Path: <linux-kbuild+bounces-7827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16539AF0D4B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 09:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3747A1C236A6
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 07:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36EF22A4EE;
	Wed,  2 Jul 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDAJOT7H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCF211F;
	Wed,  2 Jul 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443022; cv=none; b=t3T72Ht9UB0PEUfniZlKb+cA8yM9SN4XbAGWEEFxl9Dvx8UWIfs6AN2GPqdKiQ6g2qVEeHqt7MXtPIiz8IAFe221ekZv1bc3QrRDxWjrp1WmPufSK2GnsPqwwAkiYLJ+G2sDFVkVVqApw2FGYjGgTexmp2kIUBAS5LO0n1NWg3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443022; c=relaxed/simple;
	bh=iPRdlhGWfx9VLtmj4Qr358Ma925NEGSXkWBmva+PDXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=plkB7jo3AHMw9b8GRYXVf0e6H++nt1Wt5nO9rgDI6HxMSJyDrl6KjdLUXbq3g+S5cH4K978mUalvmEL3kcmwmUw7DNPTovnyF6TJzvSRqhbz0IDmg0dbDrJXPE5GeiD5GBPJXVsZPol9lS1R3kiCkw7l7vurvdtp7TBw7N65/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDAJOT7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4BDC4CEED;
	Wed,  2 Jul 2025 07:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751443022;
	bh=iPRdlhGWfx9VLtmj4Qr358Ma925NEGSXkWBmva+PDXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jDAJOT7HLum6yiMRluiGc4tMSFC54IRmLsQrSvdr2uOF6JHJgGCg3CpR9fHpPRDNy
	 j5g2vjUhlis20IrYgZ9S2CfzylqaQ9ayGZ8GA72tEsMogJciaC0a+g9eHB8KXv5YK9
	 y7XQV8ecp2z/J3SjobB3j/rGb3CVKpQF3wexh+SrXIns+8W70gUfT+NcYlhusCGB/b
	 tiNebM/8pvcgVwXhS/sIxMbUYIBziCMDvbrVi8jbpUPkcxvakHCJB9QbzY25s2Kke9
	 AsKGkUI7mW/57u+FwKv0XSEL2Kg1IWZme0S6itxsB8+0y+L+shI39jyHpMg+g6e2RF
	 JGtMVN77NvWhw==
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
In-Reply-To: <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org> (Benno Lossin's message of
	"Tue, 01 Jul 2025 17:43:29 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org>
	<RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid>
	<DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org>
	<87plepzke5.fsf@kernel.org>
	<xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid>
	<DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org>
	<9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid>
	<DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org>
	<H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid>
	<DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org>
	<ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid>
	<DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org>
	<UQ6WtusvCeJPizlUr0kA7_g7RGdSRfQ6L29hClAXDKsNlWbtAgmCu_glKbUSeyy3I_NKvN5BJW9HbeHleAhRmw==@protonmail.internalid>
	<DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 09:56:50 +0200
Message-ID: <87tt3vvxdp.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jul 1, 2025 at 4:14 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Tue Jul 1, 2025 at 10:43 AM CEST, Andreas Hindborg wrote:
>>>> No, I am OK for now with configfs.
>>>>
>>>> But, progress is still great. How about if we add a copy accessor
>>>> instead for now, I think you proposed that a few million emails ago:
>>>>
>>>>     pub fn get(&self) -> T;
>>>>
>>>> or maybe rename:
>>>>
>>>>     pub fn copy(&self) -> T;
>>>>
>>>> Then we are fine safety wise for now, right? It is even sensible for
>>>> these `T: Copy` types.
>>>
>>> That is better than getting a reference, but still someone could read at
>>> the same time that a write is happening (though we need some new
>>> abstractions AFAIK?). But I fear that we forget about this issue,
>>> because it'll be some time until we land parameters that are `!Copy` (if
>>> at all...)
>>
>> No, that could not happen when we are not allowing custom parsing or
>> sysfs access. Regarding forgetting, I already added a `NOTE` on `!Copy`,
>> and I would add one on this issue as well.
>
> Ultimately this is something for Miguel to decide. I would support an
> unsafe accessor (we should also make it `-> T`), since there it "can't
> go wrong", any UB is the fault of the user of the API. It also serves as
> a good reminder, since a `NOTE` comment shouldn't be something
> guaranteeing safety (we do have some of these global invariants, but I
> feel like this one is too tribal and doesn't usually come up, so I feel
> like it's more dangerous).

I see no reason for making it unsafe when it is safe?


    /// Get a copy of the parameter value.
    ///
    /// # Note
    ///
    /// When this method is called in `const` context, the default
    /// parameter value will be returned. During module initialization, the
    /// kernel will populate the parameter with the value supplied at module
    /// load time or kernel boot time.
    // NOTE: When sysfs access to parameters are enabled, we have to pass in a
    // held lock guard here.
    //
    // NOTE: When we begin supporting custom parameter parsing with user
    // supplied code, this method must be synchronized.
    pub const fn copy(&self) -> T {
        // SAFETY: As we only support read only parameters with no sysfs
        // exposure, the kernel will not touch the parameter data after module
        // initialization. The kernel will update the parameters serially, so we
        // will not race with other accesses.
        unsafe { *self.data.get() }
    }

>
> I think we should also move this patchset along, we could also opt for
> no accessor at all :) Then it isn't really useful without the downstream
> accessor function, but that can come after.

I would rather not merge it without an access method. Then it is just
dead code, and we will not notice if we break it.


Best regards,
Andreas Hindborg




