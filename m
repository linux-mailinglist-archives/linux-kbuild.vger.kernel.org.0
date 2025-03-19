Return-Path: <linux-kbuild+bounces-6240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8729A68CA6
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 13:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58047882EC6
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 12:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB725254AFB;
	Wed, 19 Mar 2025 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LE9K8PSo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F9372
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Mar 2025 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386893; cv=none; b=O+28moM4kYU3AIbcUdIPswe1N8aQC89QNG4uyICJt4/mDz71OBzUlfb8HHVtOdkB8HbKSeDtj2J4VVqZCfVy1fr1PKOoZ72yX7Zyf8Y68NsYjpU/mq42kl4OwZbclh2Vupyw213R4O0kCAS2CDanu/Xh8MddCaszlJ2HVhk/PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386893; c=relaxed/simple;
	bh=jQ2XTKuB6AVO07blsmCwb/jirYqaGHLm3w5XZc2R/Mc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fq75/TP+f9CkYpyIizOjNDzqxY4AMlq5mj4EjONfrupUc5EL+oBduIGlwzxtGLAmqtOQt0uXsFm/7nCi7C5Tlt4zBxTxtxQ3V3y6iPJYz9s5rx2YuifQxkB1WlliGexjWxRekMHGRLmbjt9DbcfMmflgO6T5wJmMFRzQZ/f9QPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LE9K8PSo; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39135d31ca4so410303f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Mar 2025 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742386889; x=1742991689; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHWBkflhHhA0k6UljFMCWCGqLZ5e7Nxh2HAh+CEJok4=;
        b=LE9K8PSoOkSuPSj6WweIyZZyk6ErQrtM423LlE5TW4vcWzWdzlFTKGTofmf2jVIqng
         8K51F3dUZ7Xh2ZUBG4c2Pa32WhNPZ0FBMotO7w4bRIksOXqZrAoWdMCaWYdQIIEKNhmN
         QrMS9vrSocXMLHrSFrbpaqoU+PsEziuKqc2BVUTOflZ9jeC49GCEeUsO1hmSUy9JLCgx
         vwZtQFAg4nASWYAvT+a6iY4ab7jT1ZwlnBj36LlQ+3E8k7JnC2tsDzE25mkkBdKAgU0o
         2Hi7MIV9VsRmskLWasjI0cHpQEhQJnehxB2Rcs4uOw8SF42nMZTABBnDpofIaKlZ6m4B
         047g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386889; x=1742991689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHWBkflhHhA0k6UljFMCWCGqLZ5e7Nxh2HAh+CEJok4=;
        b=YWCi4G1vYZhf30UOXMfd9tG04XyzAubf/YF4JF0KcZQRD2lqX90EsKmT0IvDi+PTpo
         3kruSr7FIThuvRBBKFuk5jmzdJXHyrrBd7zmesIL/Uogius1R/GXqSNWY21369YHiu/L
         5T1jShCxzj8dyLvE64343S/t9NWvKQeewbttqEbAAvGlZAkNoNbhZdveXxBPb4HeLBkq
         rMML3+XU7+ha05XYoMTsVLS2KFgg8ns+Kilwpnl4egJqWgditukqTGQC0FNJwghzCdPt
         Ri78ei+vXeFhlYrGBH6cmCviPGbU8pOUwsEN82N7eYmsm4QZsMpVlJHSwB+z2BIsJIl9
         jfug==
X-Forwarded-Encrypted: i=1; AJvYcCVSfgeNjgD389GnAobQn4Rx6B1/fhGM1ZQrEii31PQm5Q5g5cIbBUJsKRhufeAwvP1ypeJHpA9Dff6wwzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHkLbCLquM1fPBEXAY42N0flZ0aMYf+NURXwBIfUb7FIfkHkBk
	AbV6JZ92GUjNMml0qCvs8pz56UfofH4qfYAY4t2Smy72+ecldiJWwBgU4ss/vz1Mx8KxLzC/z5h
	mSWIuXDOnNfLK9w==
X-Google-Smtp-Source: AGHT+IGjUd/O+erjuD5BXOa5wRMainYOBynzUEHQOeJBcSeY0RjUPbJ2jh8iCG1+BdArwJY1AdHvh/jPCke4/i4=
X-Received: from wmsp17.prod.google.com ([2002:a05:600c:1d91:b0:43c:ef1f:48d3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1868:b0:390:e9e0:5cc6 with SMTP id ffacd0b85a97d-3996ba46ce6mr6001691f8f.1.1742386889079;
 Wed, 19 Mar 2025 05:21:29 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:21:26 +0000
In-Reply-To: <D8JTC30W0NF6.17SR73Y9I99ZT@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317-ptr-as-ptr-v5-0-5b5f21fa230a@gmail.com>
 <20250317-ptr-as-ptr-v5-6-5b5f21fa230a@gmail.com> <Z9lnIJCcVSza6UVo@google.com>
 <D8JTC30W0NF6.17SR73Y9I99ZT@proton.me>
Message-ID: <Z9q2xpwsNMDzZ2Gp@google.com>
Subject: Re: [PATCH v5 6/6] rust: use strict provenance APIs
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 19, 2025 at 12:23:44AM +0000, Benno Lossin wrote:
> On Tue Mar 18, 2025 at 1:29 PM CET, Alice Ryhl wrote:
> > On Mon, Mar 17, 2025 at 10:23:56AM -0400, Tamir Duberstein wrote:
> >> Throughout the tree, use the strict provenance APIs stabilized in Rust
> >> 1.84.0[1]. Retain backwards-compatibility by introducing forwarding
> >> functions at the `kernel` crate root along with polyfills for rustc <
> >> 1.84.0.
> >> 
> >> Use `#[allow(clippy::incompatible_msrv)]` to avoid warnings on rustc <
> >> 1.84.0 as our MSRV is 1.78.0.
> >> 
> >> In the `kernel` crate, enable the strict provenance lints on rustc >=
> >> 1.84.0; do this in `lib.rs` rather than `Makefile` to avoid introducing
> >> compiler flags that are dependent on the rustc version in use.
> >> 
> >> Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-provenance-apis [1]
> >> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> >> Link: https://lore.kernel.org/all/D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me/
> >> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >
> > I'm not convinced that the pros of this change outweigh the cons. I
> > think this is going to be too confusing for the C developers who look at
> > this code.
> 
> 1) I think we should eliminate all possible `as` conversions. They are
>    non-descriptive (since they can do may *very* different things) and
>    ptr2int conversions are part of that.
> 2) At some point we will have to move to the provenance API, since
>    that's what Rust chose to do. I don't think that doing it at a later
>    point is doing anyone a favor.

We don't *have* to do anything. Sure, most `as` conversions can be
removed now that we have fixed the integer type mappings, but I'm still
not convinced by this case.

Like, sure, use it for that one case in `kernel::str` where it uses
integers for pointers for some reason. But most other cases, provenance
isn't useful.

> 3) I don't understand the argument that this is confusing to C devs.
>    They are just normal functions that are well-documented (and if
>    that's not the case, we can just improve them upstream). And
>    functions are much easier to learn about than `as` casts (those are
>    IMO much more difficult to figure out than then strict provenance
>    functions).

I really don't think that's true, no matter how good the docs are. If
you see `addr as *mut c_void` as a C dev, you are going to immediately
understand what that means. If you see with_exposed_provenance(addr),
you're not going to understand what that means from the name - you have
to interrupt your reading and look up the function with the weird name.

And those docs probably spend a long time talking about stuff that
doesn't matter for your pointer, since it's probably a userspace pointer
or similar.

> Thus I think we should keep this patch (with Boqun's improvement).
> 
> >> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> >> index 719b0a48ff55..96393bcf6bd7 100644
> >> --- a/rust/kernel/uaccess.rs
> >> +++ b/rust/kernel/uaccess.rs
> >> @@ -226,7 +226,9 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
> >>          }
> >>          // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
> >>          // that many bytes to it.
> >> -        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr as *const c_void, len) };
> >> +        let res = unsafe {
> >> +            bindings::copy_from_user(out_ptr, crate::with_exposed_provenance(self.ptr), len)
> >> +        };
> >>          if res != 0 {
> >>              return Err(EFAULT);
> >>          }
> >> @@ -264,7 +266,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
> >>          let res = unsafe {
> >>              bindings::_copy_from_user(
> >>                  out.as_mut_ptr().cast::<c_void>(),
> >> -                self.ptr as *const c_void,
> >> +                crate::with_exposed_provenance(self.ptr),
> >>                  len,
> >>              )
> >>          };
> >
> > That's especially true for cases like this. These are userspace pointers
> > that are never dereferenced. It's not useful to care about provenance
> > here.
> 
> I agree for this case, but I think we shouldn't be using raw pointers
> for this to begin with. I'd think that a newtype wrapping `usize` is a
> much better fit. It can then also back the `IoRaw` type. AFAIU user
> space pointers don't have provenance, right? (if they do, then we should
> use this API :)

We're doing that to the fullest extent possible already. We only convert
them to pointers when calling C FFI functions that take user pointers as
a raw pointer.

Alice

