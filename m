Return-Path: <linux-kbuild+bounces-6107-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73FA5E905
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A8D3BB3B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 00:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0124F2E337D;
	Thu, 13 Mar 2025 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MauVhiUS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC361522A;
	Thu, 13 Mar 2025 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741826141; cv=none; b=pTM2cvvBTcJrTQRatURYmRV2xeVeFP6A9+2LDxo3VCkYjazPoaM5vHg5nYQ/IjXdJT7cwnqnDIb9wSMz3VhRYIoYYABpuUSLSiXAXeM0knlsO4j4XrzrfHO18HZEeN3ZvTGU8Ud0lx1yaC5YDQqUymQH+g3k97xgdTPSt/G367Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741826141; c=relaxed/simple;
	bh=2TdReVrazPRj6+4KAixBtuBzmKaeVr/ELlbi6TgmhGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+HPBdZCKYBFouk3IFj4uGKXSzwo4rG9Fdd5xXLcNmZvvHZR7lwzFIxXTVuNHgJ/8BvFJPmDLa8Xni3VLIgsIEGIpDsFqJxU8y5qXliQ6suTxE/nB4yjXUxbzzWAq1itYU3ilb7CyixqMdT5J3EZ3boXhv5sYXoSE7plB7WNUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MauVhiUS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D48FC4CEF1;
	Thu, 13 Mar 2025 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741826141;
	bh=2TdReVrazPRj6+4KAixBtuBzmKaeVr/ELlbi6TgmhGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MauVhiUS8AZ6nv5y04oSpifWyojJaCyPZ6hzXEJGIahRn8Cyt1azSUChL8R1N0F1h
	 nK0/eM3OK9pgNIbPD0NIhMtlza+3NAZ2ILo6bMX8aOfdULlBj/BbOyFzHUhcjy3dRl
	 /GJvruNM7xA7zIk9YyHd8YEEbUZRyz1M3ec/ny6ZzNJ1E2qgg5Aw9wZl/FwUhsuemf
	 IVxtEcp717ItRBhhNcGVhm/evy0xVtQc+BiOD2LPHlILP88hH5HI6JSHF2KS8gvZVq
	 cFCm/U86mRmgM1KVI74ygM3b6S+SE+MKUeEjr1FLcfKXfiw4IjydIYHM9Zl5Vr9T4y
	 23iCiUKXaX6Ug==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so4595831fa.1;
        Wed, 12 Mar 2025 17:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKaJupHCZNx3qH24QFBsH9Cnrdz7g+jgCEGH5TA6iYHx/pS1vBSOFGaYmmftpb9/bDna+2WpQFy73b4/o7xW4=@vger.kernel.org, AJvYcCVTHBZCNFqqdenDPYfdfSUlyz4B8DejqeespaSrAP6uh2i6CuKaszAGx6tu7S9XnGFH2Q5TLjpoiOHb4bLF@vger.kernel.org, AJvYcCW9flyRibhss7JU9/ZFsRDktw6RGF/fhXNJO0phNAE5Ze9mkDCw8H539swLmvh1U9F9FK2ByMdLke8B8EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywai2zpwAspecepP26sZorYndX/wITTZ4R7FtNTG16XVc7HKmSw
	Bw7v1TulFhfqVGJWIAyRnIt33g5XNYBz4Sfuq0t8owB67cLbdLgEWhEdUQ3OqVyPvwpjIfoD8gM
	T0WJXMwjcWvv9GElC7PAMES+y7Ms=
X-Google-Smtp-Source: AGHT+IH3yVgqAM4PhWymn5N0iOA0Z62JvlO3SWrINMWlnlz06zHqeeSwC6IB+WzvnVPMJnT2wT9wGfCdqRrz+/Q8Ry4=
X-Received: by 2002:a05:6512:3dab:b0:549:4e88:2e6a with SMTP id
 2adb3069b0e04-54990e2bca7mr8968916e87.6.1741826139882; Wed, 12 Mar 2025
 17:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
 <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
 <c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk>
 <CAK7LNARdPcnsaP-z7tZUQLqAgBXD90XsEWAtTy8aTwDpTqMo9A@mail.gmail.com> <ed6acfb2-f1a0-4713-8401-60b0cfcd2e91@t-8ch.de>
In-Reply-To: <ed6acfb2-f1a0-4713-8401-60b0cfcd2e91@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 09:35:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQHCoUdgMVDxw=EOcqv9_BfKPGooYJBoM_rTL5R2ieJJA@mail.gmail.com>
X-Gm-Features: AQ5f1JrgN3mrJFbpYXi6rE-zmfEvkN2VNf6KRgh4hryep4WDid4MBNyCSBgbd10
Message-ID: <CAK7LNAQHCoUdgMVDxw=EOcqv9_BfKPGooYJBoM_rTL5R2ieJJA@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Ben Hutchings <ben@decadent.org.uk>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 6:05=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> On 2025-03-12 04:07:51+0900, Masahiro Yamada wrote:
> > On Wed, Mar 12, 2025 at 2:36=E2=80=AFAM Ben Hutchings <ben@decadent.org=
.uk> wrote:
> > >
> > > On Tue, 2025-03-11 at 20:03 +0900, Masahiro Yamada wrote:
> > > > On Mon, Feb 17, 2025 at 10:23=E2=80=AFPM Miguel Ojeda
> > > > <miguel.ojeda.sandonis@gmail.com> wrote:
> > > > >
> > > > > On Mon, Feb 10, 2025 at 6:11=E2=80=AFPM Thomas Wei=C3=9Fschuh <li=
nux@weissschuh.net> wrote:
> > > > > >
> > > > > > Remap source path prefixes in all output, including compiler
> > > > > > diagnostics, debug information, macro expansions, etc.
> > > > >
> > > > > Hmm... We don't do all the cases in the C side -- the docs ask to=
 use
> > > > > `KCFLAGS` when one wants to remove them in the debug info:
> > > > >
> > > > >     https://docs.kernel.org/kbuild/reproducible-builds.html#absol=
ute-filenames
> > > > >
> > > > > I am not sure if there is a reason not to cover all cases in C (C=
c'ing Ben).
> > >
> > > I think we should use the prefix-map options by default, for both C a=
nd
> > > Rust code.
> >
> > A patch is appreciated.
> > (top-level Makefile change with updates
> > in Documentation/kbuild/reproducible-builds.rst)
>
> I'm happy to send a patch.
> The new patch will conflict with the rust patch.
> Could you push the current kbuild tree to git.kernel.org so the new
> patch can be based on top of it?

Yes, I pushed.




--
Best Regards
Masahiro Yamada

