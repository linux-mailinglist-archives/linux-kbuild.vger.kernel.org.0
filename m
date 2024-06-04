Return-Path: <linux-kbuild+bounces-1988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD88FB650
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 16:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F6B4B25F17
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD95713B78A;
	Tue,  4 Jun 2024 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxPHDisb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F312C528
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Jun 2024 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512813; cv=none; b=Iy25m13lDYyGbBCq9G0zxrM4kcoIPX18RAQma9V4OwJfbrEpm3kRY6Wij0nSDX235emFByJvhSdM6UMNv4OaiM8yAqiD/Bntw+im3uEcR/3C6sToQaZ/YVwGKUBBfHPfyCNBskKltnBwkpCmKbQkttwSJ6hJP3xr6tyyg89OmBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512813; c=relaxed/simple;
	bh=L7H28f3+IN84GdKJSezANEn7gMV42dlcyCr9ddGa0Sw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHHsGE4a1A+a0nmG/olAWPxAWa/AGODtiGifMggHB6j/m3/j18ztPBZMd3R1ZZQ0CqdF9VQ8yezIo8hThz5L/vlo2+Rzfu9CBK0/MovI0D7PveLYCK51z7Qnh2+86vnQYwzS0w/f8RDa9laxH+JPVbJIHrpYrl/W8zuBhuKHZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxPHDisb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35e4be5bd7fso3052724f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2024 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717512810; x=1718117610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7H28f3+IN84GdKJSezANEn7gMV42dlcyCr9ddGa0Sw=;
        b=VxPHDisbIhn3HvjbKqvuO+Xeh214qkrmOeVC3E4YcWozkTyRZAvNoprzShtCNKy3OZ
         kKFNlUEBmlVovH7YBjbhOB3WNpXOVZCphfr8jnLKZ0YKa+M10Nt3azaUg8i/pRA+e6xL
         2ZZK+XSpIh3wIvlf+9XR629+VlJuk0uU1TFihkhZXJqbem/lWf9UERa3QRW+URG34Frq
         W2im0d4kVIRnl9e+JKU+Mr7IGYpoH/0Z8ePhtc/YC6jWK915cHxg1yvsbVbYKg+Ioq0i
         w1e2o2WZHrV0sva0+wS+u1pNN8BDkeJPcIPXPMzs/BnCsDq+Jldg5ZJzCt6+I6fHW/l2
         D3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512810; x=1718117610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7H28f3+IN84GdKJSezANEn7gMV42dlcyCr9ddGa0Sw=;
        b=n4OZ9cBs8Ak/9uUczXRfFOaO9QKnxIqi8lHRQcZLjz4Sa8FBfEK7AsHxZlWyVvwxnz
         Qz7NcF/CsfMsh2mlvYcs6bWMNar0M1Kx5o5MF5ThKVnXSTHEkAV3q3RBmNguVOc3IXrL
         QMQ27QadXNHW688InvyeCcxeOMU/gRC6WSpJ0fIe+6d1/07rkIVQGj7BXtRC2b8KGq3q
         O/Oz2wOxSip6rl5fMTYNVQg0tJwmtV5EJKfEGV76cpLqTc12xQUG80rZo6fsLZQjeSBd
         rWn56wCUZaKWlv5Z+vnObCDOwEvecvthgWTiIdIkSgy2VGT6UUIvcqYzE8q+jzeaFJ87
         H45w==
X-Forwarded-Encrypted: i=1; AJvYcCWYGE2QlsESLYyUZbd/eS+2pfo/NBSoDdH4juyKVO5XymyfH3KaWeo4Yjc8j8ZjlDpSsUTy8DmEsVIiIhERXhC9a4VpMBGjHGJEyBhV
X-Gm-Message-State: AOJu0Yy0nLE0pm7ae/Rz+H9/GO4gdL5DmZi/0Jmn4eCLoW0Smj8sFIxC
	YTsMZNeQeA+V3I+pp7iBZHcP3qIcafB+TDacZYKauM1zVY7DZE+jW8uLeQZrc+vp2GzOfkoz8t2
	QJH2k0bQN3Ro2N6YGkZG1xiVM9Mtm5DJumu3t
X-Google-Smtp-Source: AGHT+IEOWlKPI8YyC6/+P3wiowV9l4424Q+QWgWOvqOevjiRpFaEqUQMgrTlM58GWEO3enYhsbSotHsRcNE4cPwniNQ=
X-Received: by 2002:adf:f742:0:b0:357:3e5a:6c90 with SMTP id
 ffacd0b85a97d-35e0f36d84amr9128831f8f.57.1717512809973; Tue, 04 Jun 2024
 07:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409103120.GA22557@willie-the-truck> <20240430110925.1064685-1-aliceryhl@google.com>
 <20240604142941.GD20384@willie-the-truck>
In-Reply-To: <20240604142941.GD20384@willie-the-truck>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Jun 2024 16:53:16 +0200
Message-ID: <CAH5fLgimyYmS33EPEQb6R5Lrmkzv+0GNRE7NQwhfEaJFqb4OYQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add flags for shadow call stack sanitizer
To: Will Deacon <will@kernel.org>
Cc: Jamie.Cunliffe@arm.com, a.hindborg@samsung.com, alex.gaynor@gmail.com, 
	ardb@kernel.org, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, broonie@kernel.org, catalin.marinas@arm.com, 
	gary@garyguo.net, keescook@chromium.org, kernel@valentinobst.de, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com, masahiroy@kernel.org, 
	maz@kernel.org, miguel.ojeda.sandonis@gmail.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 4:29=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Apr 30, 2024 at 11:09:25AM +0000, Alice Ryhl wrote:
> > Will Deacon <will@kernel.org> wrote:
> > > On Tue, Mar 05, 2024 at 01:14:19PM +0100, Miguel Ojeda wrote:
> > >> Otherwise partially reverting to the `target.json` approach sounds g=
ood too.
> > >>
> > >> I added the `-Zuse-sync-unwind=3Dn` to the list at
> > >> https://github.com/Rust-for-Linux/linux/issues/2. Given the default =
is
> > >> what we want, I have put it in the "Good to have" section.
> > >
> > > I think we have time to do this properly, like we did for the clang
> > > enablement a few years ago. In hindsight, avoiding hacks for the earl=
y
> > > toolchains back then was a really good idea because it meant we could
> > > rely on a solid baseline set of compiler features from the start.
> > >
> > > So, please can we fix this in rustc and just have SCS dependent on th=
at?
> >
> > Just to keep you in the loop, I've posted a PR to make rustc recognize
> > the reserve-x18 target feature, so that the -Ctarget-feature=3D+reserve=
-x18
> > flag stops emitting a warning.
> >
> > This should be sufficient for adding support for CONFIG_DYNAMIC_SCS.
> >
> > You can find it here:
> > https://github.com/rust-lang/rust/pull/124323
> >
> > As for non-dynamic SCS, I plan to tackle that after the PR is merged.
> > See the "Future possibilities" section in the linked PR for more info o=
n
> > that.
>
> Thanks for persevering with this, Alice. I read the pull request above,
> but it looks like you went with:
>
> https://github.com/rust-lang/rust/pull/124655
>
> instead, which was merged (hurrah!). Do we need anything else?

Yeah, it took a while, but I've managed to get a -Zfixed-x18 flag in.
It will be available starting with Rust 1.80, which will be released
on the 25th of July.

A few things:

1. The -Zsanitizer=3Dshadow-call-stack flag still doesn't work because
the compiler thinks that the target doesn't support it. I'll fix this
eventually, but at least CONFIG_DYNAMIC_SCS works now.

2. I haven't convinced the Rust maintainers that -Zfixed-x18 is the
way to go long term (flags starting with -Z are unstable and may
change). Some of the maintainers want to instead add a x18-available
target feature (that is, the inverse of the current reserve-x18 target
feature), that you can disable with -Ctarget-feature=3D-x18-available.

And a few questions for you:

By the time support for 1.80 goes in, we are probably supporting more
than one Rust compiler. For pre-1.80 compilers, should we fall back to
-Ctarget-feature=3D+reserve-x18 (which emits a warning, but works), or
fail compilation?

Similarly, we should probably submit a fix to the stable branches so
that SCS+Rust doesn't silently break in a hard-to-debug way. Do you
prefer a backport with -Ctarget-feature=3D+reserve-x18 or one that fails
compilation?

Alice

