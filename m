Return-Path: <linux-kbuild+bounces-11312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bmxGLTpGkGmwYAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11312-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:54:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1BE13B972
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A3D03022695
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 09:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC0381AF;
	Sat, 14 Feb 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cp8Fh3uC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4F73EBF3D;
	Sat, 14 Feb 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771062839; cv=none; b=lOHdkog9JgWLxdngeWvPxK1r7pOIaMlHXO3qJfb+x5X+gEZjNISJk/WRHfwXAmEay2yIVdrxTsMzO7Z2c9Wmby3io5BBR+Ondu4DsKH1kiPPrmUt6EuaSYnvhn/GQUwHGMWYnmgcieDGftyfLp5cwkqPP5v0GsOT+QCl001U+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771062839; c=relaxed/simple;
	bh=TLh6+wk1NgMXYkWfewhFDSAdVPFIq44wbSntJJq8xyU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ngpPbdwx+jHlMt4PlFr7K9FQwXxY0cY9FCXqHVr3RSfAWNNmjP1ik/bPk+ZVCN+jaNJxyEiwYMB4n+0lPoKp5Eb71Z1V1blsK2oQelqzTItTreCAi/e705cxMvIvQn+4LpSuA7QvGvkGHjSPfcQxVWNmhbWp0fbHd2Xx7bFlVx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cp8Fh3uC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88674C16AAE;
	Sat, 14 Feb 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771062839;
	bh=TLh6+wk1NgMXYkWfewhFDSAdVPFIq44wbSntJJq8xyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cp8Fh3uCFdBqYOhyzBtROyVR3rvD/GwKUF5snIb+h5IMXm9ANiu8WxKdg8RNI/UL/
	 S81zAoVc2hKfgeTN6bxRi9v+Sw3ctm/KCdwe3CcZti2/Y9j0mhyUSKhMt/HUFOcSs0
	 pfjkyFzWQZAmpJ9TV0va1+pQpo6zHPmPNxVtPdCuXxDGs8hMVmZyMjpQEc172CeEoM
	 I5E6fhcNEpkB3NR0F1wXw5Dkxxwp0r5BdU9R4lQI1LQHvV8OoGh6KHbqzT6gThUHzJ
	 r8e7E4Fi3U0uoKHulUudeWjeTvOByLARHvlqX4fFQDmNBSjzmVllXK00RjPDTU8UWA
	 ZgjxKjSdlHYwQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 10:53:54 +0100
Message-Id: <DGELDM5523KS.3EY7C7X5PC1V4@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 1/4] rust: add projection infrastructure
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-2-gary@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11312-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 0E1BE13B972
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> Add a generic infrastructure for performing field and index projections o=
n
> raw pointers. This will form the basis of performing I/O projections.
>
> Pointers manipulations are intentionally using the safe wrapping variants
> instead of the unsafe variants, as the latter requires pointers to be
> inside an allocation which is not necessarily true for I/O pointers.
>
> This projection macro protects against rogue `Deref` implementation, whic=
h
> can causes the projected pointer to be outside the bounds of starting
> pointer. This is extremely unlikely and Rust has a lint to catch this, bu=
t
> is unsoundness regardless. The protection works by inducing type inferenc=
e
> ambiguity when `Deref` is implemented.
>
> The projection macro supports both fallible and infallible index
> projections. These are described in detail inside the documentation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Cool work!

I was wondering how you'd make this safe and general, but just having a
primitive pointer projection macro makes a lot of sense. We'll have lots
of projection macros that use this under the hood instead of a single
one. I like this as a stop-gap solution until we have projections in the
language.

I have a few comments, with those addressed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/lib.rs        |   5 +
>  rust/kernel/projection.rs | 269 ++++++++++++++++++++++++++++++++++++++
>  scripts/Makefile.build    |   4 +-
>  3 files changed, 277 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/projection.rs

> +// SAFETY: `proj` invokes `f` with valid allocation.
> +unsafe impl<T> ProjectField<false> for T {
> +    #[inline(always)]
> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut=
 F) -> *mut F {
> +        // Create a valid allocation to start projection, as `base` is n=
ot necessarily so.
> +        let mut place =3D MaybeUninit::uninit();
> +        let place_base =3D place.as_mut_ptr();
> +        let field =3D f(place_base);
> +        // SAFETY: `field` is in bounds from `base` per safety requireme=
nt.
> +        let offset =3D unsafe { field.byte_offset_from(place_base) };
> +        base.wrapping_byte_offset(offset).cast()
> +    }

There are several limitations with this impl. I don't think we can do
anything about them, but it's probably good to list them somewhere:
1. We do not support projecting fields of unsized types, so `MyStruct<dyn T=
rait>`.
   (note that slices are supported with `ProjectIndex`)
2. Since this creates a `MaybeUninit<T>` on the stack, only small `T`
   are supported. I'm not sure how much of this will be optimized away,
   but it might be the case that it is not. Projecting in the same
   function call stack multiple times might result in overrunning the
   stack pretty quickly.
3. The `wrapping_byte_offset` function generates potentially worse
   codegen when `base` points into a real allocation.

> +}
> +
> +// SAFETY: vacuously satisfied.
> +unsafe impl<T: Deref> ProjectField<true> for T {
> +    #[inline(always)]
> +    unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F)=
 -> *mut F {
> +        build_error!("this function is a guard against `Deref` impl and =
is never invoked");
> +    }
> +}
> +
> +/// Create a projection from a raw pointer.
> +///

I'd add a paragraph that explains that the pointer does not need to be
valid in any way. It should also explain that the returned pointer is
only valid when the original pointer was valid.

> +/// Supported projections include field projections and index projection=
s.
> +/// It is not allowed to project into types that implement custom `Deref=
` or `Index`.
> +///
> +/// The macro has basic syntax of `kernel::project_pointer!(ptr, project=
ion)`, where `ptr` is an
> +/// expression that evaluates to a raw pointer which serves as the base =
of projection. `projection`
> +/// can be a projection expression of form `.field` (normally identifer,=
 or numeral in case of
> +/// tuple structs) or of form `[index]`.
> +///
> +/// If mutable pointer is needed, the macro input can be prefixed with `=
mut` keyword, i.e.
> +/// `kernel::project_pointer!(mut ptr, projection)`. By default, a const=
 pointer is created.
> +///
> +/// `project_pointer!` macro can perform both fallible indexing and buil=
d-time checked indexing.
> +/// `[index]` form performs build-time bounds checking; if compiler fail=
s to prove `[index]` is in
> +/// bounds, compilation will fail. `[index]?` can be used to perform run=
time bounds checking;
> +/// `OutOfBound` error is raised via `?` if the index is out of bounds.
> +///
> +/// # Examples
> +///
> +/// Field projections are performed with `.field_name`:
> +/// ```
> +/// struct MyStruct { field: u32, }
> +/// let ptr: *const MyStruct =3D core::ptr::dangling();

I would only include one example that uses `dangling` and for the rest
just define a function that projects a raw pointer.

> +/// let field_ptr: *const u32 =3D kernel::project_pointer!(ptr, .field);
> +///
> +/// struct MyTupleStruct(u32, u32);
> +/// let ptr: *const MyTupleStruct =3D core::ptr::dangling();
> +/// let field_ptr: *const u32 =3D kernel::project_pointer!(ptr, .1);
> +/// ```
> +///
> +/// Index projections are performed with `[index]`:
> +/// ```
> +/// let ptr: *const [u8; 32] =3D core::ptr::dangling();
> +/// let field_ptr: *const u8 =3D kernel::project_pointer!(ptr, [1]);
> +/// // This will fail the build.
> +/// // kernel::project_pointer!(ptr, [128]);
> +/// // This will raise an `OutOfBound` error (which is convertable to `E=
RANGE`).
> +/// // kernel::project_pointer!(ptr, [128]?);
> +/// ```
> +///
> +/// If you need to match on the error instead of propagate, put the invo=
cation inside a closure:
> +/// ```
> +/// let ptr: *const [u8; 32] =3D core::ptr::dangling();
> +/// let field_ptr: Result<*const u8> =3D (|| -> Result<_> {
> +///     Ok(kernel::project_pointer!(ptr, [128]?))
> +/// })();
> +/// assert!(field_ptr.is_err());
> +/// ```
> +///
> +/// For mutable pointers, put `mut` as the first token in macro invocati=
on.
> +/// ```
> +/// let ptr: *mut [(u8, u16); 32] =3D core::ptr::dangling_mut();
> +/// let field_ptr: *mut u16 =3D kernel::project_pointer!(mut ptr, [1].1)=
;
> +/// ```
> +#[macro_export]
> +macro_rules! project_pointer {
> +    (@gen $ptr:ident, ) =3D> {};
> +    // Field projection. `$field` needs to be `tt` to support tuple inde=
x like `.0`.
> +    (@gen $ptr:ident, .$field:tt $($rest:tt)*) =3D> {
> +        // SAFETY: the provided closure always return in bounds pointer.
> +        let $ptr =3D unsafe {
> +            $crate::projection::ProjectField::proj($ptr, #[inline(always=
)] |ptr| {
> +                // SAFETY: `$field` is in bounds, and no implicit `Deref=
` is possible (if the
> +                // type implements `Deref`, Rust cannot infer the generi=
c parameter `DEREF`).
> +                &raw mut (*ptr).$field
> +            })
> +        };
> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
> +    };
> +    // Fallible index projection.
> +    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) =3D> {
> +        let $ptr =3D $crate::projection::ProjectIndex::get($index, $ptr)
> +            .ok_or($crate::projection::OutOfBound)?;
> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
> +    };
> +    // Build-time checked index projection.
> +    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) =3D> {
> +        let $ptr =3D $crate::projection::ProjectIndex::index($index, $pt=
r);
> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
> +    };
> +    (mut $ptr:expr, $($proj:tt)*) =3D> {{
> +        let ptr =3D $ptr;

I'd add a type ascription `let ptr: *mut _ =3D $ptr;`

> +        $crate::project_pointer!(@gen ptr, $($proj)*);
> +        ptr
> +    }};
> +    ($ptr:expr, $($proj:tt)*) =3D> {{
> +        let ptr =3D $ptr.cast_mut();

This allows `$ptr` to be a random type with a `cast_mut` function. How
about:

    let ptr: *const _ =3D $ptr;
    let ptr: *mut _ =3D ::core::ptr::cast_mut(ptr);

Cheers,
Benno

> +        // We currently always project using mutable pointer, as it is n=
ot decided whether `&raw
> +        // const` allows the resulting pointer to be mutated (see docume=
ntation of `addr_of!`).
> +        $crate::project_pointer!(@gen ptr, $($proj)*);
> +        ptr.cast_const()
> +    }};
> +}

