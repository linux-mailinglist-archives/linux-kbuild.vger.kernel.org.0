Return-Path: <linux-kbuild+bounces-11517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F90BrrbpWkvHgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11517-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 19:49:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A072E1DE78A
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 19:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CD09F3014FE5
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 18:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C420319847;
	Mon,  2 Mar 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBVX2MV3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA70288D0;
	Mon,  2 Mar 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477366; cv=none; b=YFn7BsJb12YgGldWZHTO02rS+tcuKSAslT9xtJ2JYgP7NHyD5lqn17Ov0Nx7WAYlB4HQRmDPRAYIL4PmTpVbwhz2ZJEVOlPZkb4Ywx2wBfJDkyYP7FeAEHqOMUYssbmH8tpP5ulLrCXpOIYoHR+VKV+TUAon3Fdq02zMuxqbmlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477366; c=relaxed/simple;
	bh=qBM6Fw3XeUMXMlJ/g+MQuY3TcsiQ7Dhorjdqc+1IbwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IUsiY9NvMALvrhyhXRU+pDVFv8v/1j5PZo3ADCptep7efjD/Hhvkny+1IQO/TpJbbZsgOMsqkirsKlNyor3mT+5kWt2UajM1iZEuits73lx2AeRCKIuMQmELgy6jo/2lw6eY6cYQ3+sHmRmxM4hjDKJo1zdTKxEzybJ6MIYpnKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBVX2MV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45A3C19423;
	Mon,  2 Mar 2026 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772477366;
	bh=qBM6Fw3XeUMXMlJ/g+MQuY3TcsiQ7Dhorjdqc+1IbwQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=CBVX2MV3/UiMiLiXR0YzslYfuhMcVZV29vknjnCJcvT5FzknwyvabBfFCXMVM19lY
	 XecEfXLQmRBc3v004ftBiSopW/Wo8q4Z3ha3w99aH9tDwICrFFRhaLWXQjiYzSGfpF
	 yA7bfqJw8XgzQ1bStTL1uwjV/Ridd8DZ7ft3iKUnqAnxHcR8HyndEoDJofi3IfyNV9
	 gEOqx9tLe5Q0Z6wkwsxyPEmXlm4DFO7KPEO+titLvBhTy0XhP11fb1UO4CkXacV0VG
	 XvEYvdMokzlvs4fncWKO6dK0qywqj1QcjqhpjxJcvY6o08X6fXu7SrwT93J/2HRc5T
	 NA7nebPT7+wyA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 19:49:22 +0100
Message-Id: <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
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
In-Reply-To: <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
X-Rspamd-Queue-Id: A072E1DE78A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11517-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 3:49 PM CET, Gary Guo wrote:
> On Mon Mar 2, 2026 at 2:38 PM GMT, Benno Lossin wrote:
>> On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
>>> +/// A helper trait to perform index projection.
>>> +///
>>> +/// This is similar to `core::slice::SliceIndex`, but operate on raw p=
ointers safely and fallibly.
>>> +///
>>> +/// # Safety
>>> +///
>>> +/// `get` must return a pointer in bounds of the provided pointer.
>>
>> This only makes sense when the provided pointer already points at an
>> allocation. But since the functions of this trait aren't `unsafe`, it
>> must be sound to pass `ptr::null` to them.
>
> The "in bounds" here is the conceptual bounds of the pointer. So, for a p=
ointer
> with size `x`, the address of the returned pointer lies between `ptr .. p=
tr +
> x`.

Okay, I haven't really seen that as a concept. Also, what is the size of
an invalid pointer?

>> I first thought that we might be able to just use `mem::size_of_val_raw`
>> [1] to give an upper and lower bound on the address of the returned
>> pointer, but that is unsafe and cannot be called with an arbitrary
>> pointer. Interestingly, `ptr::metadata` [2] can be called safely & with
>> any pointer; I would expect them to be very similar (except of course
>> for extern types).
>>
>> [1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
>> [2]: https://doc.rust-lang.org/std/ptr/fn.metadata.html
>
> I have a `KnownSize` trait for this in my I/O projection series that is
> implemented for `T: Sized` and `[T]`, and it returns the size when given =
a raw
> pointer.
>
>>
>> A pretty expensive solution would be to add a sealed trait `Indexable`
>> that we implement for all things that `T` is allowed to be; and then we
>> provide a safe function in that trait to query the maximum offset the
>> `get` function is allowed to make.
>>
>> Alternatively, we could use something like this:
>>
>>     The implementation of `get` must:
>>     - return a pointer obtained by offsetting the input pointer.
>>     - ensure that when the input pointer points at a valid value of type
>>       `T`, the offset must not be greater than [`mem::size_of_val_raw`]
>>       of the input pointer.
>
> Given that I'm not introducing `KnownSize` trait in this patch, this is w=
hy I
> haven't used this kind of wording. Perhaps I can just bring `KnownSize` i=
n early
> and use it first for documentation purpose only?

That sounds great.

>> Or something simpler that says "if the input pointer is valid, then
>> `get` must return a valid output pointer"?
>
> Hmm, wouldn't this give impression that "you can do whatever you want if =
the
> input pointer is not valid"?

Yes that's true, but why is that a problem?

>>> +#[diagnostic::on_unimplemented(message =3D "`{Self}` cannot be used to=
 index `{T}`")]
>>> +#[doc(hidden)]
>>> +pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
>>> +    type Output: ?Sized;
>>> +
>>> +    /// Returns an index-projected pointer, if in bounds.
>>> +    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
>>
>> How about we name this `try_index` instead of the general `get`?
>
> I'm following the name on `SliceIndex`:
> https://doc.rust-lang.org/stable/std/slice/trait.SliceIndex.html.

Hmm, the methods in that trait are marked as unstable under
`slice_index_methods`, which doesn't have a tracking issue, so are
perma-unstable? I'll suggest the rename upstream as well.

Cheers,
Benno

