Return-Path: <linux-kbuild+bounces-5018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E156B9E6394
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 02:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8DA6163640
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 01:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C26D13C677;
	Fri,  6 Dec 2024 01:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gYFejM7l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBA1758B
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Dec 2024 01:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733449760; cv=none; b=r7wpjfRM8V9BfinFufLvLwy1HyOWyn4cwgfjrcjLKS2lgh+r9/8MBeO8EDk+JYjbIPhlbs9cif66Tius8fXN7mwOfv2ov8EnHWWUQZ3egZ/8SnhRQcEo89eKm4tpPNmkwHALJiSJJ1KZ+ukHpzxW/Yxk4iyAryc3DoH6NKmqLyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733449760; c=relaxed/simple;
	bh=LMmlWKNmVBwdw/whPUOfRU56EnAaGuw/30vVRzfcLnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGMY33ybZnVWP/8YLmPuBW0BwaeomZQ4NFlbUfy9q+9kbaofeK6oB8J+rX2FqX7IWi5yGDQeBsuWcJwDRGzRevIUTvu8VbRwOsdWUS8fwSdyw5ZEwkx8/xdFny5Gu3PaIPFwhdi2702d5+cBB0u+8pJvu8D3hOk38OpM+x2ux1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gYFejM7l; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so691374a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Dec 2024 17:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733449756; x=1734054556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/v1bu1qzcHSaRbclvMhL2gHRSj6sckPpuptjguLzmU=;
        b=gYFejM7liyM2SqJq+cgAKPRopd+rXD0WPBlcIa47nuFvnXomjpA5B5FVPI8lShjXWj
         pVqJswMdRGm4YljFwxq6v2AtbuRE6NjHoPZ3Jpg4Jx7bNvFpPDaYuJJ+EFEMFPWFfxp5
         vNM3I0MGN6gnLY72V4dlSaB8JXtluw6/3xqKkVi6UYWBT2K/0pGJUo8YBShfsqSZqpzS
         35lpDTptkLN7fybTEC7hLhVNSTVEeMCoWdOpe389L9Tg+bh1scSByoYCpeABrocHudfN
         4fkCfZEVRReebBynFPS0iIlBRXgUyUlKo38Tfdbaz36zAgmKhr9mUPIm64jgnjuruFLQ
         0HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449756; x=1734054556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/v1bu1qzcHSaRbclvMhL2gHRSj6sckPpuptjguLzmU=;
        b=aU8lqugPp74qYV/WukApH0K7xA1ni98gdQoxO9N0o9CQE9Eq1vkkGXQ4RpodWxlgNI
         7DIUFlQv9swkGEjq5C+8aHjp90BERa8AsX4Mdt4ygZ2KRr8D3jaA5e5rahoRe7fDzqFq
         surtksys6M//ts3R9AuEtMli/bnr91b3fifGOqnzRJepHuylco1PAh0toFUY+8p5EY3T
         1xwzx4oSlDzdGF/5lZD9dB8xB+dDVDngy9TMHXQ/1qPd2xAkU00Zn+BWP7KZzWlrf1Le
         Q6M9Fi2M2s8Oikk/3yIhv4Iwtm5kSdlR5X23XqqIdRVnZzCLHEOUGn9CgYazBZhajncC
         GpmA==
X-Forwarded-Encrypted: i=1; AJvYcCU1DQPrNqh44rXR5ThyEJYVWrvbEecUOIoR7UKl1TfevPFFNtQ9fOFx/zUDt3HAPUV16nzIylIsa9SKhs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2czqaQSzZINmM6Z0igwUE77rG6igFNZoBHQnrCR1ymO+vjsGI
	wAHtOf+fOJs8PMzCxcaOxmHWVwOrPmVov2mF860yV1aI7prI4KcVgSCu0sJH/6JiZEKJdZt4qMe
	HPtum3kG7azw8Hf2D+dSbTIcpGwEeKMg/cAsL
X-Gm-Gg: ASbGncv7Okqn6OcXrFxshhxrFicVMN34sTvT9b+iHRxpg/047xfbWPMRcY7DfZ8ppYH
	eEIuSKUsMb0w77f4ESMY2hRgtnldPxsW5t9He0pq6kafetlqZu0DmvXW8xBVv/mpm
X-Google-Smtp-Source: AGHT+IHWoFKow2oW9dCX31mwU7asjyqdFAGshEQB6zNAgVBklECaZ8FGAbU3zPEKbfahKyrrE3z9TE1WY+b0pveDS+8=
X-Received: by 2002:a05:6402:320d:b0:5d1:2677:b047 with SMTP id
 4fb4d7f45d1cf-5d3be720dd8mr1350471a12.28.1733449755904; Thu, 05 Dec 2024
 17:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CAABy=s1u75ywAECbkCmGfyt+Yp5khnF0UVcezA-_BEDWUVrHkw@mail.gmail.com>
 <CAK7LNAQJUdubjkvV0T0XRU8=336rV88b7+t6BP4xR9v_g38eKQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQJUdubjkvV0T0XRU8=336rV88b7+t6BP4xR9v_g38eKQ@mail.gmail.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Thu, 5 Dec 2024 17:48:38 -0800
Message-ID: <CAABy=s3ONLwVugBSc=DhC8MdGa9YaAM6ZL5yrWRciLDLLtKmrw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 5:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Dec 6, 2024 at 8:40=E2=80=AFAM Hong, Yifan <elsk@google.com> wrot=
e:
> >
> > On Tue, Nov 12, 2024 at 10:45=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org=
> wrote:
> > >
> > > From: HONG Yifan <elsk@google.com>
> > >
> > > These are flags to be passed when linking proc macros for the Rust
> > > toolchain. If unset, it defaults to $(KBUILD_HOSTLDFLAGS).
> > >
> > > This is needed because the list of flags to link hostprogs is not
> > > necessarily the same as the list of flags used to link libmacros.so.
> > > When we build proc macros, we need the latter, not the former (e.g. w=
hen
> > > using a Rust compiler binary linked to a different C library than hos=
t
> > > programs).
> > >
> > > To distinguish between the two, introduce this new variable to stand
> > > out from KBUILD_HOSTLDFLAGS used to link other host progs.
> > >
> > > Signed-off-by: HONG Yifan <elsk@google.com>
> > > Link: https://lore.kernel.org/r/20241017210430.2401398-2-elsk@google.=
com
> > > [ v3:
> > >
> > >   - `export`ed the variable. Otherwise it would not be visible in
> > >     `rust/Makefile`.
> > >
> > >   - Removed "additional" from the documentation and commit message,
> > >     since this actually replaces the other flags, unlike other cases.
> > >
> > >   - Added example of use case to documentation and commit message.
> > >     Thanks Alice for the details on what Google needs!
> > >
> > >   - Instead of `HOSTLDFLAGS`, used `KBUILD_HOSTLDFLAGS` as the fallba=
ck
> > >     to preserve the previous behavior as much as possible, as discuss=
ed
> > >     with Alice/Yifan. Thus moved the variable down too (currently we
> > >     do not modify `KBUILD_HOSTLDFLAGS` elsewhere) and avoided
> > >     mentioning `HOSTLDFLAGS` directly in the documentation.
> > >
> > >   - Fixed documentation header formatting.
> > >
> > >   - Reworded slightly.
> > >
> > >          - Miguel ]
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > ---
> > > Masahiro: if Kbuild wants to pick this up, that is great. Otherwise, =
I am happy
> > > picking this up early next cycle, if you give an `Acked-by` since thi=
s is
> > > changing the interface for Kbuild users given we are introducing a ne=
w
> > > environment variable. Thanks!
> > >
> > > Note that the `or` means if the string is empty, we will use the defa=
ult rather
> > > than nothing. I didn't change that from Yifan's version, but maybe we=
 want to do
> > > otherwise. Users can still provide e.g. an empty space to avoid any f=
lag.
> >
> > I am not sure if I understand the implications here.
> > https://www.gnu.org/software/make/manual/html_node/Conditional-Function=
s.html
> > says:
> >
> > The or function provides a =E2=80=9Cshort-circuiting=E2=80=9D OR operat=
ion. Each
> > argument is expanded, in order. If an argument expands to a non-empty
> > string the processing stops and the result of the expansion is that
> > string. If, after all arguments are expanded, all of them are false
> > (empty), then the result of the expansion is the empty string.
> >
> > I am assuming that this means:
> > - If PROCMACROLDFLAGS is not empty, KBUILD_PROCMACROLDFLAGS evaluates
> > to PROCMACROLDFLAGS
> > - Otherwise if KBUILD_HOSTLDFLAGS is not empty,
> > KBUILD_PROCMACROLDFLAGS evaluates to KBUILD_HOSTLDFLAGS
> > - Otherwise KBUILD_PROCMACROLDFLAGS is set to empty.
>
> I think your understanding is correct.
>
> $(or A,B) works like $(if A,A,B)
>
> Commit 5c8166419acf shorten the code.
>
>
>
> > What do you mean by "use the default"?
>
>
> "use the default" means,
> "use $(KBUILD_HOSTLDFLAGS)"

Thank you for confirming. I think this is my original intention. If
PROCMACROLDFLAGS (a new API) is not set, the code should have the same
behavior as before this patch, i.e. cmd_rustc_procmacro uses
-Clink-args KBUILD_HOSTLDFLAGS. This minimizes surprises for existing
users.


>
>
> --
> Best Regards
> Masahiro Yamada

