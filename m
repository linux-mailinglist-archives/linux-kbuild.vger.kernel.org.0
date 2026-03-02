Return-Path: <linux-kbuild+bounces-11524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHr9BQYWpmnZKAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11524-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 23:58:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4691E6078
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 23:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E82B312496A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 22:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05666282F2E;
	Mon,  2 Mar 2026 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y53Jj7kh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D23909BD;
	Mon,  2 Mar 2026 22:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488875; cv=none; b=aTb6+NsaOLlmgn8aitUXLrzkdA1W4E8IQCK174kA7GOTOqDkzPnOn2uCmE7zUPV+gowSyBf3zxKrzM4PupSaJm/LJ3B7J5SZObdlj/w9fAii0o1v03i+Siv4HjweS89ZSrj3wYZd9x79QJk1+6TUfuOA9JjJY3lqLVqZ2ybg5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488875; c=relaxed/simple;
	bh=/JDgi3ZNYZwS+txMKXzjj5pUE7onU5EBUqp3aLFeKUU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LMSimx0biTLa80MMwuIqAAuIzKV4UWATXmMVOKjJ3kxdk7KTABgmAiRQFa4mBfpVtHKoidkGp7YcxBUOZJi7ioO2zOnknE8sI+6WbK4/Azt7LEQHcF9KhBL395SyYxdci+992lkbfMCRvCOHnrREDWayuK+bVYoq+UPdUjyaR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y53Jj7kh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F37C19425;
	Mon,  2 Mar 2026 22:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772488875;
	bh=/JDgi3ZNYZwS+txMKXzjj5pUE7onU5EBUqp3aLFeKUU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Y53Jj7khS/T2OX+Zt700EBmAi8cB9YGDiCjObn/giY7toNzJKhWqMSJvx23pfhQDm
	 XqK7b+vU51VR/llnqhQMCJ4GJ3KYxze722jU3NNQL+FM8/SQPedQbQfKtwOjtIGN7L
	 uTao7oYFOee+JQ80lWFWAKXIR1Qxuh7fWt+RulfijQ5D5cj6/+tZ6FKNazq3g6thE0
	 vESQlXgKM6g3CkXbPcjE1Ulel0AlxvyVOGladRtDjSZl4w5bZHeHA6HQ7C/utwxXYM
	 e9aPiluhuy0/Ifd8kIHBtSz1a5Lkm+CMCsmevrwUvSQwSL0jELrsBKwHMwQmH074Zb
	 M3IlakDcZPv/Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 23:01:10 +0100
Message-Id: <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
 <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
In-Reply-To: <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
X-Rspamd-Queue-Id: 8C4691E6078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11524-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rust-lang.org:url]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 9:14 PM CET, Gary Guo wrote:
> On Mon Mar 2, 2026 at 6:49 PM GMT, Benno Lossin wrote:
>> On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>>> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>>>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>>>> +/// A helper trait to perform index projection.
>>>>> +///
>>>>> +/// This is similar to `core::slice::SliceIndex`, but operate on raw=
 pointers safely and fallibly.
>>>>> +///
>>>>> +/// # Safety
>>>>> +///
>>>>> +/// `get` must return a pointer in bounds of the provided pointer.
>>>>
>>>> This only makes sense when the provided pointer already points at an
>>>> allocation. But since the functions of this trait aren't `unsafe`, it
>>>> must be sound to pass `ptr::null` to them.
>>>
>>> The "in bounds" here is the conceptual bounds of the pointer. So, for a=
 pointer
>>> with size `x`, the address of the returned pointer lies between `ptr ..=
 ptr +
>>> x`.
>>
>> Okay, I haven't really seen that as a concept. Also, what is the size of
>> an invalid pointer?
>
> It's `size_of::<T>()` for sized types, and `size_of::<T>() * slice.len()`=
 for a
> raw slice pointer.

And for `dyn Trait`?

Do you have a link to somewhere?

> The projection semantics is same regardless whether it's valid or not. Th=
e I/O
> projection work will rely on this, as many I/O impls will act on pointers=
 that
> are not "valid" in Rust sense because they refer to a different address s=
pace.
> But they're still legit pointers with proper meaning.

I like the solution with `KnownSize`. The previous safety requirement
was nebulous IMO.

>>>> I first thought that we might be able to just use `mem::size_of_val_ra=
w`
>>>> [1] to give an upper and lower bound on the address of the returned
>>>> pointer, but that is unsafe and cannot be called with an arbitrary
>>>> pointer. Interestingly, `ptr::metadata` [2] can be called safely & wit=
h
>>>> any pointer; I would expect them to be very similar (except of course
>>>> for extern types).
>>>>
>>>> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
>>>> [2]: https://doc.rust-lang.org/std/ptr/fn.metadata.html
>>>
>>> I have a `KnownSize` trait for this in my I/O projection series that is
>>> implemented for `T: Sized` and `[T]`, and it returns the size when give=
n a raw
>>> pointer.
>>>
>>>>
>>>> A pretty expensive solution would be to add a sealed trait `Indexable`
>>>> that we implement for all things that `T` is allowed to be; and then w=
e
>>>> provide a safe function in that trait to query the maximum offset the
>>>> `get` function is allowed to make.
>>>>
>>>> Alternatively, we could use something like this:
>>>>
>>>>     The implementation of `get` must:
>>>>     - return a pointer obtained by offsetting the input pointer.
>>>>     - ensure that when the input pointer points at a valid value of ty=
pe
>>>>       `T`, the offset must not be greater than [`mem::size_of_val_raw`=
]
>>>>       of the input pointer.
>>>
>>> Given that I'm not introducing `KnownSize` trait in this patch, this is=
 why I
>>> haven't used this kind of wording. Perhaps I can just bring `KnownSize`=
 in early
>>> and use it first for documentation purpose only?
>>
>> That sounds great.
>>
>>>> Or something simpler that says "if the input pointer is valid, then
>>>> `get` must return a valid output pointer"?
>>>
>>> Hmm, wouldn't this give impression that "you can do whatever you want i=
f the
>>> input pointer is not valid"?
>>
>> Yes that's true, but why is that a problem?
>
> A impl that returns an arbitrary pointer when given a null pointer is not=
 valid.
>
> I/O projection will use the ability to project on null pointers, too. An =
example
> is PCI config space code, which will project using null pointer as starti=
ng
> pointer.
>
> The "bounds" projected pointer must still be with in `0..KnownSize::size(=
ptr)`.

I would not have assumed this to be valid with the previous comment.

Cheers,
Benno

