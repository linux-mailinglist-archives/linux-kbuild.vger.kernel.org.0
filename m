Return-Path: <linux-kbuild+bounces-11315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BEOQHFqLkGnBbAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11315-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 15:48:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C62D013C397
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 15:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4376C302002C
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 14:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E04221F06;
	Sat, 14 Feb 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jvzi7PAk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E71085C4A;
	Sat, 14 Feb 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771080535; cv=none; b=fl+qREDyTTu3uYfujI1Ejgen3kgpRI8TpNWlciuqF7bGqhWjJy8w3uFwH6djT2htFrLIEoy47dZy7DTxVgfyZOteuOXYn8byRkZWLGNrTwplhxVWd44pWi2iHUGdQ6543N9iPY5Z+U7S0N2nxYMLjMgngaW2OIoHje2kyz+GdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771080535; c=relaxed/simple;
	bh=lkmeqJrOTvnnrAXt0eSgqWhiExwRsjj40C0GWn6zxvU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=cmKdBLGyPW2/YaqY3SxyhIH8780V/8YhvYnOVWBHCJitRk79OYgPGwK7I7gCchke8GNwcUc0khzNZWA/i1KRLjatP6zt2dxSkKclhFkHUXBym7tdb9NvsCOA58q4UlExhjqBL5w+t0YNBx6WhU0agYdvvgBgPtFxf0osCit7rtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jvzi7PAk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED5C16AAE;
	Sat, 14 Feb 2026 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771080535;
	bh=lkmeqJrOTvnnrAXt0eSgqWhiExwRsjj40C0GWn6zxvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jvzi7PAkgyTkDf5XyFFnwG3Kp+IbA9aPDMz0mHwTp3jkuswmcgU50Fj6//e/CsVSH
	 6s0h2h0/t2pgwz2bB+lue/WtispDIAAW/UP22W1pygoKVEJ0+wzaPwoicG6nmU/mk9
	 UMteWudp4IjyJC2SPlCkjsQN39y2gGy2QlnUOs8tZC8+TrPAj0Lt5ZPpIJ/I9wbBHY
	 2HYRrA/fwQ/70cK8ILLiZ3VwJ9BvYH9tj6V7xTTRs2Lv45ckz4PF3qnvaGkO7rUlIX
	 Ksut3AoadvmyBMyuzjvlh4k/+sydImzJhSSPWB4y4NJ2KCwxZVWiML0q6D+irCnIAZ
	 HYvDJ79/7VLAA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:48:48 +0100
Message-Id: <DGERNEDAO27Y.1MB18NY64EVHP@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: add projection infrastructure
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
 <DGELDM5523KS.3EY7C7X5PC1V4@kernel.org>
 <60bb58cecdef3ec4cda77cfad5c620ed@garyguo.net>
In-Reply-To: <60bb58cecdef3ec4cda77cfad5c620ed@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11315-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C62D013C397
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 11:36 AM CET, Gary Guo wrote:
> On 2026-02-14 09:53, Benno Lossin wrote:
>> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>>> +// SAFETY: `proj` invokes `f` with valid allocation.
>>> +unsafe impl<T> ProjectField<false> for T {
>>> +    #[inline(always)]
>>> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *m=
ut F) -> *mut F {
>>> +        // Create a valid allocation to start projection, as `base` is=
 not necessarily so.
>>> +        let mut place =3D MaybeUninit::uninit();
>>> +        let place_base =3D place.as_mut_ptr();
>>> +        let field =3D f(place_base);
>>> +        // SAFETY: `field` is in bounds from `base` per safety require=
ment.
>>> +        let offset =3D unsafe { field.byte_offset_from(place_base) };
>>> +        base.wrapping_byte_offset(offset).cast()
>>> +    }
>>=20
>> There are several limitations with this impl. I don't think we can do
>> anything about them, but it's probably good to list them somewhere:
>> 1. We do not support projecting fields of unsized types, so `MyStruct<dy=
n Trait>`.
>>    (note that slices are supported with `ProjectIndex`)
>> 2. Since this creates a `MaybeUninit<T>` on the stack, only small `T`
>>    are supported. I'm not sure how much of this will be optimized away,
>>    but it might be the case that it is not. Projecting in the same
>>    function call stack multiple times might result in overrunning the
>>    stack pretty quickly.
>
> I've verified codegen and haven't managed to get this to actually generat=
e `T` on the stack.
> LLVM always figures out that the offset is the only thing that matters an=
d optimize away
> everything. `memoffset` crate also creates a temporary `MaybeUninit`, and=
 given that it was
> very widely used before `offset_of!` is stable, I think we should be able=
 to rely on this being
> okay even for large types.

Oh that's neat.

> Note that I've taken care to mark everything `#[inline(always)]` when pos=
sible, even
> closures passed to `proj`.

Yeah I saw that.

People might still encounter this issue in some fringe situation. I'm
not too worried, since klint can warn about the stack frame being too
large.

Speaking of klint, could it be possible to have a
`#[klint::optimized_away]` attribute that we can put on the `let place`,
klint would then error (or warn) when it's not optimized away (the name
isn't great :)

>
>> 3. The `wrapping_byte_offset` function generates potentially worse
>>    codegen when `base` points into a real allocation.
>
> I'm highly skeptical that we'll lose any optimization, but this is indeed
> a possibility in theory.

I remember some Rust codegen expert wanting to use `offset` instead of
`wrapping_offset` in the projection operator of `NonNull` and raw
pointers (the original RFC I think).

>>> +    ($ptr:expr, $($proj:tt)*) =3D> {{
>>> +        let ptr =3D $ptr.cast_mut();
>>=20
>> This allows `$ptr` to be a random type with a `cast_mut` function. How
>> about:
>>=20
>>     let ptr: *const _ =3D $ptr;
>>     let ptr: *mut _ =3D ::core::ptr::cast_mut(ptr);
>
> I think `<*const _>::cast_mut($ptr)` probably would also do.

That also works.

Cheers,
Benno

