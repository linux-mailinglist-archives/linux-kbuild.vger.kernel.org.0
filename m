Return-Path: <linux-kbuild+bounces-3978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C624F9957CB
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 21:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D9CEB240B3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 19:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED76215013;
	Tue,  8 Oct 2024 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e/eiE22c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBEC213EDD
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 19:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728416542; cv=none; b=ag0L8yKF+/PCHFf3fVySAXhN/XgWPTJEUrNIiKLXMw2mf6V6TJowZOND388oEaUygupgOKMUbW8jSsfwH1qJdLmaWFVWjIRvypng+jPvoNKMzbgTaqAIti1wJJ6CeZGoEfxp3DDHfUPUgttN0ghaMCX9GOaRuFkYz8rOmYXM8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728416542; c=relaxed/simple;
	bh=lFhTMzC9ORLMqoRTjpZ6veDLc7aVhr/WeQGwgTd9GPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJjP8HXTkWJjWSh7+I5/AJo7E1szkvISRgEIlZ/mRhxV/5Vr9LWRUcXW+g/JAYx7j9EPssKDhTHN0B3zwK9wioNKH71AXiMgh0vCPj4HiPO/WmgEhkI/Q5rOoVwOeNNzIAcfce2G/SVAXxb4U2u1yeT4gG/tMwxe46jioZNG+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e/eiE22c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d30e6bde6so812827f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728416538; x=1729021338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztVVxm7jB9ef2OrCWlXv+wilSMfWclaP+y3yiehlVbA=;
        b=e/eiE22cIJdkIQ8iLFVYr88Aan09oXzRwqd/W3cUdl65Zb51ARrRbYZFn1zyOfpP53
         TnWo1sdtHGdTwf87kQPl5uB24f0LLyErO8Hg/gPc6wxpmqszbuVzRo8ynC96dw8Dqo21
         e5nkKaTjWb6BScyh7WrrRabpnfNUPRlLx7NdjRl5UPybGBX1b3rj3aXEkglVsvE/4OHR
         CANW75vi1fMLGupJDv3Z451hrUXP0tY4XFV42pbQW5anc573VQyjb4dx9h/YC5BP1RAs
         yd9Yt23G+CwY0/20I4WJXLRis4ah5uDEcmWrvpUJNj0Z4dSvjdXoyAaORwxNgriHjEmj
         W7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728416538; x=1729021338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztVVxm7jB9ef2OrCWlXv+wilSMfWclaP+y3yiehlVbA=;
        b=sv4iMGjUpoO/3qfE2u+PsyqdEWg0t+OH5rB6pXxfkUnp6wACXxPC8E4kPOKnpvxtJn
         KfvoXMOwaA1r5buC+c/4mnp0yT/jfr9ZyErNpPkqI6Lh9Zg0ot4cri54RdV4vrQAiyid
         sTGvNBGihwbjJJ/2RpGsW4/qm7hO41MrNoK4vsHD68gZq5xMLcEz0pnAEMjZavtIRidb
         FI43T1uAbNCwDV/EJMy8OEuA6ykBhJMP8CS5Ar4IMWMi0Xin+AukIqmJGCMfkjbfGJZs
         NRYPJd9799V7WKNZoMU8xTtV4tKCEgDBEmjAz5Tc7Khnh1EPtOM38w2y1vxaDZXYiRf3
         tyMg==
X-Forwarded-Encrypted: i=1; AJvYcCXWeq2f6x3yFc268fhT4ypg/BXuD0nnRfw/UPhLHenthTPq9OQlhqIvyJ/uwbjn0If/FUFjf7Jr7dZAHho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1EsNxIrtmL1OMno6+Ug3B/0tfNHjbf3LVW+UnzXdeXI8qySy8
	fl/pBqtrQkbDx+seVVAR9/bsbAeYeoGwuvm7rNWIvnVapm3tS3adgRTdBxmCN94xq8+ICoVh4U9
	DEj6qf79ODTePgQmieBJTziXUqDrdm/jj/gJk
X-Google-Smtp-Source: AGHT+IFKhUFF3WNNTqlJrPLbMTLLVQI7WWrZ92xfITFsK6a9htkf5fdYkPlN2t3yWnT5FJDTTlAF2/N3Ch6veoWI5bQ=
X-Received: by 2002:a5d:6112:0:b0:374:b9a7:5ed6 with SMTP id
 ffacd0b85a97d-37d3a9d7dd4mr6614f8f.22.1728416537596; Tue, 08 Oct 2024
 12:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com> <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Oct 2024 21:42:05 +0200
Message-ID: <CAH5fLgiZ5awKAm-CHc8qgsQUYtNMWdSEeKC2wuDFh2NUhVmsAA@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 9:00=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Oct 9, 2024 at 2:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > index 057305eae85c..08d5b7177ea8 100644
> > --- a/scripts/Makefile.compiler
> > +++ b/scripts/Makefile.compiler
> > @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD=
_EXTMOD))/).tmp_$$$$
> >  # automatically cleaned up.
> >  try-run =3D $(shell set -e;              \
> >         TMP=3D$(TMPOUT)/tmp;              \
> > +       export RUSTC_BOOTSTRAP=3D1;       \
>
>
> try-run is not Rust-specific.
>
> Is there any reason why you did not add it
> to __rustc-option?
>
>
> __rustc-option =3D $(call try-run,\
>        RUSTC_BOOTSTRAP=3D1 $(1) $(2) $(3) --crate-type=3Drlib
> $(srctree)/rust/probe.rs --out-dir=3D$$TMP,$(3),$(4))

I had an explanation for this in the commit message, but it looks like
it got lost when I rewrote it for v2. Anyway, the reason is that I'd
have to modify both __rustc-option and rustc-option-yn to do that, and
putting it here seemed more future-proof against making the same
mistake in any rustc-* commands added in the future.

But I realize that it's not clear-cut. I'm happy to move it if you prefer,
or perhaps add a try-run-rust. Let me know what you think.

> I guess it is still suspicious because the top-level Makefile
> exports RUCTC_BOOTSTRAP.

Moving the declaration of RUSTC_BOOTSTRAP to the top of the Makefile
seems to fix it. I guess moving it is probably a better solution than
adding it in scripts/Makefile.compiler.

Not that I really understand why that is. The existing invocations are
in scripts/Makefile.kasan which is invoked after RUSTC_BOOTSTRAP is
declared.


Alice

