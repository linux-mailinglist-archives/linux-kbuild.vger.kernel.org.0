Return-Path: <linux-kbuild+bounces-6002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6BEA570E6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 19:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D290A179906
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 18:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7128D2475DD;
	Fri,  7 Mar 2025 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAJksGt9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479142459FB;
	Fri,  7 Mar 2025 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741373698; cv=none; b=Vi3audpSJGvCjUCVlyj0LVSgsvWSm53p3Dup6XKmsVyxLkt00rvDr0wVCziZxp5tpOhQu6w8jV8ZmPFDVjimZX0c+ixDrK9A/oO2pRIqJUNCBaCJgtqtrnKgPHWS70sa9CxHUYXpNXiiDNYtygIbJ8oJBkUiGpT8a+ibcTL9Lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741373698; c=relaxed/simple;
	bh=A1hzyzX2gwYPUPzTsAzIqU0ZPHdzSA6DM3y210R7dIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri67Xhi14Sm2DeleK/CQlYpPODTNk9+u1ysN4dJGwxY3Jg2Hk4uc5PE0ZsXZEgF0liwkwMH9wRxzLxPWHKrGJg+peZDNfSP5EzuWFqXqFpWFHP2sNqKU1SWEAR2YnXaU6hngEE2mYYFTk10MTWQxccrI97akYfkD1o4KV8nksLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAJksGt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233A3C4CED1;
	Fri,  7 Mar 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741373698;
	bh=A1hzyzX2gwYPUPzTsAzIqU0ZPHdzSA6DM3y210R7dIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JAJksGt9HFaMvVKhk05lUfdM/thbcWKDfGg60hHxtaNqpCBVufvjBykA7KJgu8wR/
	 uY8bBE+D+xxTVSTprl/USMEULwpaf/Ux4FtDT2klOPycIeDiVQ5Vbdf2IG1LXU6k6A
	 U1R3HFaDQHqDtXcI4WTGIu48ZSJriiFNJpcu5zmAjEtIOmAHOfYMfEX8v7oFJmksF/
	 q3DaP2Lak9B0q9Gbui7RfDIojAiil4c8LYqYzi5Vz0aW9y1+JhNa5B1nbOtF97xnCr
	 gdIFMr5KAz4QI/4ebdiBBCGiBO6pffvCSiIKWxKtESXPIIzl9bATjeluXg25sPJ9Si
	 aIahk0EXVGQPQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf2513a2dso16661951fa.0;
        Fri, 07 Mar 2025 10:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUU2GHHO94ONd39BSyxUk2nZNnVewhkeY35kFbhJ5yEQrbE2xxLdpHW9TdFgLXOE+vPf+Pxg95jPfj6u/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAE0TOtQ0cASNOREn5VExU00l/mJ/IrtEW3QMHImRXGyqCFX+b
	tBM9RqcWYzENXZx1Yw9TO2eRU+0EcyC34r5FoOadh97I5oXhu5KF6dBQ190BmM+yBz965ZvbwuL
	E8Sv1YKznytIyW+uuJcVtPi3Zj4k=
X-Google-Smtp-Source: AGHT+IGobzWZZjQf8EsgGAX/Rno6nPlMxbZ8WwDAHCshVEV4wF5D7pC3DIDWityzVC2/E4DTVm0cQ8mNqgLiySUNnL8=
X-Received: by 2002:a05:6512:3da3:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-54990e2bbd8mr1509102e87.2.1741373696796; Fri, 07 Mar 2025
 10:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
In-Reply-To: <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Mar 2025 03:54:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9sTgHhTNx_izbjyV6zevV8ooGYcQ_pewlwvwGtKvROwXdXWv-VRUVTAg
Message-ID: <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 1:47=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Mon, 24 Feb 2025 at 14:21, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Kbuild supports an architecture specific Makefile.postlink file that is
> > invoked for the vmlinux target after it has been built. This Makefile
> > takes 'vmlinux' (which has just been built) as the target, and mangles
> > the file and/or constructs other intermediate artifacts from it.
> >
> > This violates the general philosophy of Make, which is based on rules
> > and dependencies, and artifacts that are rebuilt only when any of their
> > dependencies have been updated.
> >
> > Instead, the different incarnations of vmlinux that are consumed by
> > different stages of the build should be emitted as distinct files, wher=
e
> > rules and dependencies are used to define one in terms of the other.


In my understanding, the build rule of vmlinux is atomic
because vmlinux embeds a timestamp and a build version.

Now, you are splitting it into two stages.

vmlinux.unstripped (this includes timestamp and the build version)
  --(cmd_strip_relocs)-->  vmlinux


When cmd_strip_relocs is changed, only vmlinux is updated.
This changes the content of vmlinux, but its timestamp and build version
remain the same.

So, I am not sure if this is the right direction.


You can see more steps for updating vmlinux.
Do you believe the build rule should be further split into
more fine-grained stages?

For example,

vmlinux.pre-sort  (this includes timestamp and the build version)
   --(scripts/sortable)-->
vmlinux.unstripped
   --(cmd_strip_relocs)-->
vmlinux

But, again, even when sorttable is changed,
the timestamp and the build version remain the same.


Yeah, arch/*/Makefile.postlink is a crap
where arch maintainers build a fence
and start whatever they want to do.

If they completely disappear, I would love it.

However, this seems a partial clean-up
within the scope you are interested in.
(more specifically your motivation is because Linus pointed out
a failure in arch/x86/Makefile.postlink deleted vmlinux)






> > This also works around an error observed here [0], where vmlinux is
> > deleted by Make because a subsequent step that consumes it as input
> > throws an error.
> >
> > So refactor the vmlinux shell scripts and build rules so that
> > architectures that rely on --emit-relocs to construct vmlinux with
> > static relocations preserved will get a separate vmlinux.unstripped fil=
e
> > carrying those relocations. This removes the need for an imperative
> > postlink step, given that any rules that depend on the unstripped
> > vmlinux can now simply depend on vmlinux.unstripped, rather than inject
> > a build step into Makefile.postlink
> >
> > S390 should be able to do the same. MIPS and RISC-V perform some
> > post-build checks on vmlinux, which is reasonable in principle for a
> > postlink step, although deleting vmlinux when the check fails is equall=
y
> > unhelpful.
> >
> > [0] https://lore.kernel.org/all/Z5ARucnUgqjwBnrp@gmail.com/T/#m731ed020=
6949fc3f39fcc8a7b82fe348a8fc80c4
> >
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Ingo Molnar <mingo@kernel.org>
> >
> > Ard Biesheuvel (4):
> >   Kbuild/link-vmlinux.sh: Make output file name configurable
> >   Kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
> >   Kbuild: Create intermediate vmlinux build with relocations preserved
> >   x86: Get rid of Makefile.postlink
> >
>
> Ping?




--=20
Best Regards
Masahiro Yamada

