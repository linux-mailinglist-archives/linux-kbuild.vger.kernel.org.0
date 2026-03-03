Return-Path: <linux-kbuild+bounces-11529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLkMGIqmpmkTSQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11529-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 10:14:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 994221EBB29
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 10:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A48E0303A6F7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F24386455;
	Tue,  3 Mar 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPrvQ9uK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359A3164AA;
	Tue,  3 Mar 2026 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529271; cv=none; b=meihWsbHk8eA9xYvPFW2oEIEeJ8/II1LuuRJxBadCQVPk7l8bkJznyFh9wFXUoBsCvcIaHi3ypNhNHiXXpyti79e6cOwCyFqWcMeDoJxxD9sMu54rflPN4OpZZeUVznLEZwpN3Wx5CCVzyLgMd9qLMTwAYg6MimEdc6xwyPRI3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529271; c=relaxed/simple;
	bh=Z363bKe+2Mgy9mV/lnzOhCsB8JU9lsSkvXHnYD7oKSc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Pol2DCkXKmrWRJ25yebT6KXujoYTBww3pf5qwD/UCViIbC4hPxWHXJXXUIZdnlVT2TxPnCBcm9E6NQBR5H0rrCOxZ71X6o9VCf8qSXm1SmNDDpdE8CnaK4+0vSU85W1OOE+poSJdzXDwByradcZ9hTfN9tYcJzpyu1PlOmrQb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPrvQ9uK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5402C116C6;
	Tue,  3 Mar 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772529270;
	bh=Z363bKe+2Mgy9mV/lnzOhCsB8JU9lsSkvXHnYD7oKSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPrvQ9uKrGoHpwUbGAE/oqYfXIS56R0ybJgab5wP2YOi0jD1mNKt1pStys/OkJqfA
	 YSvX9NkiopMiKXUcR74e0x/Cnb4D0OIvF+Y1lNqR2nR5d1oZVx3y5ee1oxUdeIWC+V
	 sJKpqhMFUHMbyV/K4ByO4hJdUe9ulZdvw83vuXFehgy55KefWJHd7707M0xDpAhEqV
	 /N8l1wGN+lL6kON5gAsB2qSatA8joGIwyfJt2djA9wNLXHTJsGdNUmxJWSSVObDFj5
	 O44Vo4mRo0FTyjIjXO7fvfSzmgjBl8z90IsCnt3NvSBf5gJ3I5YtJ0wHdp4AC3BTj1
	 rwkddMm2uC5BA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 10:14:25 +0100
Message-Id: <DGT16NCR2TD7.27E74897D8XEC@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
 <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
 <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
In-Reply-To: <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
X-Rspamd-Queue-Id: 994221EBB29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11529-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rust-lang.org:url]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:19 PM CET, Gary Guo wrote:
> On Mon Mar 2, 2026 at 10:01 PM GMT, Benno Lossin wrote:
>> On Mon Mar 2, 2026 at 9:14 PM CET, Gary Guo wrote:
>>> On Mon Mar 2, 2026 at 6:49 PM GMT, Benno Lossin wrote:
>>>> On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>>>>> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>>>>>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>>>>>> +/// A helper trait to perform index projection.
>>>>>>> +///
>>>>>>> +/// This is similar to `core::slice::SliceIndex`, but operate on r=
aw pointers safely and fallibly.
>>>>>>> +///
>>>>>>> +/// # Safety
>>>>>>> +///
>>>>>>> +/// `get` must return a pointer in bounds of the provided pointer.
>>>>>>
>>>>>> This only makes sense when the provided pointer already points at an
>>>>>> allocation. But since the functions of this trait aren't `unsafe`, i=
t
>>>>>> must be sound to pass `ptr::null` to them.
>>>>>
>>>>> The "in bounds" here is the conceptual bounds of the pointer. So, for=
 a pointer
>>>>> with size `x`, the address of the returned pointer lies between `ptr =
.. ptr +
>>>>> x`.
>>>>
>>>> Okay, I haven't really seen that as a concept. Also, what is the size =
of
>>>> an invalid pointer?
>>>
>>> It's `size_of::<T>()` for sized types, and `size_of::<T>() * slice.len(=
)` for a
>>> raw slice pointer.
>>
>> And for `dyn Trait`?
>>
>> Do you have a link to somewhere?
>
> For `dyn Trait` it would be the size in the vtable, which is always avail=
able as
> vtable metadata on a raw pointer is required to be valid anyway (this is
> something that lang team has already decided so that trait upcasting coul=
d work
> for raw pointers).

I really would like to see some docs of that, I didn't find anything in
the reference, official docs, or nomicon. The reference does say [1]
that:

    `dyn Trait` metadata must be a pointer to a compiler-generated
    vtable for Trait. (For raw pointers, this requirement remains a
    subject of some debate.)

Do you know where it was decided? I did find this [2] UCG issue that
covers it, but that doesn't seem like the decision, just the discussion.

[1]: https://doc.rust-lang.org/reference/behavior-considered-undefined.html=
#r-undefined.validity.wide
[2]: https://github.com/rust-lang/unsafe-code-guidelines/issues/516

> I am basically just having `size_of_val_raw` in mind when writing this. S=
o the
> current `KnownSize` comment in v4 is something that I am happy about.

Well size_of_val_raw is `unsafe` and only valid to call in certain
conditions. It asks in the case of slices that the length is an
initialized integer and that the entire value must fit into `isize`.
This to me just further indicates that `*mut T` has safety
requirements to obtaining the size of an arbitrary pointer.

In the special cases of `T: Sized` and `T =3D=3D [U]`, we have safe ways of
getting their size.

Cheers,
Benno

