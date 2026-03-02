Return-Path: <linux-kbuild+bounces-11511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPNZEq6hpWmuCAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11511-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 15:41:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F21DB0C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 15:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84A4302BDE8
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C613FFABA;
	Mon,  2 Mar 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh1ZvKub"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF6A3FD13D;
	Mon,  2 Mar 2026 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462326; cv=none; b=rfP58Cq2mhNji/iMc02ppfV4n+f8l8/sILteUhU+j5M1jyR4QnXNiWmKJtCIxGZNIyRv7OgwF0bJnrau7gCR0x0xsl9jGgP5s8J3EW3a2Nu1utjFys5I1/DMRND5gWo2JCyrVNOnbr9o95cWx1cYi2uvV6EkFJnqcRJ0sKT6mWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462326; c=relaxed/simple;
	bh=Ma+tbm3Swk5p7vaN3gf3UtcVVSmda6CxEgG2w4jY3QU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=C8jZ1lmLp3We/AvzS1a+KcCtGOKYCnw37q6W4sGF+RmuwDZ/p6gMIDRhclkLf1ItmqpDJueNKAygCysyMtU3roQZZWLXVLRNGZ4iV3hxD6VfhFPcitW9DjAHOwSBSbd8+uH8KQLdkSWS4D9PMVGr39sOqlHuxuXn0qFKVYKBPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh1ZvKub; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E026C19423;
	Mon,  2 Mar 2026 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462326;
	bh=Ma+tbm3Swk5p7vaN3gf3UtcVVSmda6CxEgG2w4jY3QU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Zh1ZvKubJ8FGubvf0ZCy+ZeswHs2f2/9mL/0q4TqRRIr3hfGMN7duSdhvsRTo/qYO
	 qiOy1VSzUlFsD8gx+jodi/Khpu2jaNP7TRMxal0b4ipL47hvDMCMTrlCWD83JBOh5N
	 jmvM6gCXgid8DpcW6281wEcgEqLNYkqxtaq6UsZ2nKcNxmDAPb0+d8UNa1YVe0vvZe
	 Nkwdwdgd2EqU+cbuXg/WWuT8Wknnia92K+Grbd7hralGFqDMdWHJxUzpJmH6GT1pzJ
	 +ewW/HlPfDab+elnghdsru3MPLcJUACTElLdg7apz4g2VgQYMSBbMI/HmHYsOphWzM
	 ZzpVqPotpfsKA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:38:41 +0100
Message-Id: <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
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
In-Reply-To: <20260302130223.134058-2-gary@kernel.org>
X-Rspamd-Queue-Id: B66F21DB0C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11511-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..50866b481bdb 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -20,6 +20,7 @@
>  #![feature(generic_nonzero)]
>  #![feature(inline_const)]
>  #![feature(pointer_is_aligned)]
> +#![feature(slice_ptr_len)]

This is missing a stability comment (stable since 1.79).

>  //
>  // Stable since Rust 1.80.0.
>  #![feature(slice_flatten)]
...
> +/// A helper trait to perform index projection.
> +///
> +/// This is similar to `core::slice::SliceIndex`, but operate on raw poi=
nters safely and fallibly.
> +///
> +/// # Safety
> +///
> +/// `get` must return a pointer in bounds of the provided pointer.

This only makes sense when the provided pointer already points at an
allocation. But since the functions of this trait aren't `unsafe`, it
must be sound to pass `ptr::null` to them.

I first thought that we might be able to just use `mem::size_of_val_raw`
[1] to give an upper and lower bound on the address of the returned
pointer, but that is unsafe and cannot be called with an arbitrary
pointer. Interestingly, `ptr::metadata` [2] can be called safely & with
any pointer; I would expect them to be very similar (except of course
for extern types).

[1]: https://doc.rust-lang.org/std/mem/fn.size_of_val_raw.html
[2]: https://doc.rust-lang.org/std/ptr/fn.metadata.html

A pretty expensive solution would be to add a sealed trait `Indexable`
that we implement for all things that `T` is allowed to be; and then we
provide a safe function in that trait to query the maximum offset the
`get` function is allowed to make.

Alternatively, we could use something like this:

    The implementation of `get` must:
    - return a pointer obtained by offsetting the input pointer.
    - ensure that when the input pointer points at a valid value of type
      `T`, the offset must not be greater than [`mem::size_of_val_raw`]
      of the input pointer.

Or something simpler that says "if the input pointer is valid, then
`get` must return a valid output pointer"?

> +#[diagnostic::on_unimplemented(message =3D "`{Self}` cannot be used to i=
ndex `{T}`")]
> +#[doc(hidden)]
> +pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
> +    type Output: ?Sized;
> +
> +    /// Returns an index-projected pointer, if in bounds.
> +    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;

How about we name this `try_index` instead of the general `get`?

> +
> +    /// Returns an index-projected pointer; fail the build if it cannot =
be proved to be in bounds.
> +    #[inline(always)]
> +    fn index(self, slice: *mut T) -> *mut Self::Output {
> +        Self::get(self, slice).unwrap_or_else(|| build_error!())
> +    }
> +}
...
> +/// A helper trait to perform field projection.
> +///
> +/// This trait has a `DEREF` generic parameter so it can be implemented =
twice for types that
> +/// implement `Deref`. This will cause an ambiguity error and thus block=
 `Deref` types being used
> +/// as base of projection, as they can inject unsoundness.

I think it's important to also say that the ambiguity error only happens
when calling the function without specifying the `DEREF` constant.
Essentially it is a load-bearing part of the macro that it does this.

> +///
> +/// # Safety
> +///
> +/// `proj` should invoke `f` with valid allocation, as documentation des=
cribed.

s/should invoke `f` with/may invoke `f` only with a/

"should" sounds like only a suggestion. If it is a requirement, then the
`build_error!` impl of the `DEREF =3D true` case would be violating it.

> +#[doc(hidden)]
> +pub unsafe trait ProjectField<const DEREF: bool> {
> +    /// Project a pointer to a type to a pointer of a field.
> +    ///
> +    /// `f` is always invoked with valid allocation so it can safely obt=
ain raw pointers to fields
> +    /// using `&raw mut`.
> +    ///
> +    /// This is needed because `base` might not point to a valid allocat=
ion, while `&raw mut`
> +    /// requires pointers to be in bounds of a valid allocation.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `f` must returns a pointer in bounds of the provided pointer.

Typo: "must returns" -> "must return"

Cheers,
Benno

> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut=
 F) -> *mut F;
> +}

