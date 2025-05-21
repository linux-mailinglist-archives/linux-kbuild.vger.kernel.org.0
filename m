Return-Path: <linux-kbuild+bounces-7208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ED2ABFB6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 18:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18344E621B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 16:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A2022C321;
	Wed, 21 May 2025 16:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2/cwRNdw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26322CBEC
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747845670; cv=none; b=imyDRmVTwjkYyDqYTqmHC9po6vmiykSFy0FRuy2e4WC0A1dr27z1qNOg5MN67JDrCB9Sx7b/KDhiArarTcgE9RiZ2sZ5sszro7FH7GGyawi5x0erwuJB1uuC+d/7UgWZs2XWEp2CnUl7Q6afWdIPmQGZ2HmH1MmlWRKu46fFmBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747845670; c=relaxed/simple;
	bh=4IT32OVrKITGqe5rTVivhBsOg16hcGoFrXbNER9Mti0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flFTvsRbc5NW3KXMxs6FE1lS/i9fQJvo+VFcwg/SFNrYejCooh6VJ0aWGciGTo3NFJhwATJPDzInoowFezp3FwLcdHg1TGyVOdBuofBqb5EuNaVk6buoTT8Yz+Tp1zdpXe1Olaapskzkvfmo1w8OEOK9lltQsP6AIAOz23qvbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2/cwRNdw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so39388a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747845667; x=1748450467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28LSrmY4bmUMzW4e3w5CBgUDdWI2jouT2ZOQHs4Iras=;
        b=2/cwRNdwlO6eZN5agosFXAFSGq1evbRN8G5+/boHktYsyzXCRxuR/EjXgipoTDR91w
         p04aHhoLrPwZDjRGbIXcMD2z1woESLn+TJ4y8CzMpszYj3BzisZE1IZNTcwu7NQevffM
         5YDCiQOEQiiVVydk8DmGNFD8DD6j/ydkIZgB2OEIv9Cq9RAhPUhfg9HCkNu6jMxnVg/8
         2G3aMA9cc3ynBiiemgTI8aKw0nXWPWxZTfb++wfBrvw2CpM11ctume6S1ySJYd9FgpVg
         5gpWWGUXBhaYDsQrLDGtliXPu9SBGjXgpbPVwu8RN/dun/ce4ADmTs/0HG6/R4IjHmnr
         BQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747845667; x=1748450467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28LSrmY4bmUMzW4e3w5CBgUDdWI2jouT2ZOQHs4Iras=;
        b=VBImQhWzA+ZjxVCXrzrXtkPW/FXQAcnblX0YL1qZUU2CiDfGtBVJAZk6vbHb319/c/
         haeN1+L3XyScTj0uWdJ47jskM/4EGZklAJozN8AMJ2aGM8w2L6juLZ7xRTDJaa0y6118
         xAzRO8CixTsMsqMz2r72HfFFclSPn4WVgOvMc4uaPLyKRsjZUS+8iohHvjWIy4D1JUNT
         iX9tpkPPrimL7a/cIC1q7/+vzNpbS9yrTyZdCcHub1WJ5YBYMy0Y3HZt3eWTRK3V5+7i
         PSWC7IqXME54P77sq26WSCwLbjNJiL1BZgAU7pVO2825FUwpV5joGAFJ6IIAZh+mMvFX
         ypzg==
X-Forwarded-Encrypted: i=1; AJvYcCWbzMI4agUAVUb3/jmaXAh/wz3A2M5vSIA9F5HB9b2kTje6gYH+prjJSYfIr+QJpNbozvFxDDOl7/pu0rI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2W52dfrX0rvOg3qWeed4IAlED8A0IjR416EygZelIg5hjPc+u
	P/0BTxt9SqisPDpdwhZlb82e+JWaEHivKPn8fqhTn3SACqCIzDYfqGnoUYh0kykN6xlWlnAZGNE
	Y6psMRqrat+CsH36Qv9eRk28Xh/xvvRzXbY3t7AI1
X-Gm-Gg: ASbGncscWWloFChFOwPi1mRT1oz5iDn3WxGixP7iVhR5oPVlMvmJcpqFGMfuFgoQkXO
	zBtoISBMay04t6Fi5btWsjVo8t5pOFQNeNwI7PRSbl6BoxUWjPfRFQX1aYZ9Nqh9F2+9rJqk/Jc
	sFmvo/LgxiOJ5K+C2xUub9VuDGKTiIHBaeKbKBu48EkvGBge4CRTtPynbbG+Jp4zQJe+HMt5hw3
	g==
X-Google-Smtp-Source: AGHT+IEQSnz2RwyqgvP8XMisVzsZTIriZuG2rpgT9J6iBVUQ7VVWWNAT028oEgLF0bKIGdrVsVZaKBrc8htYPxH1CeQ=
X-Received: by 2002:a50:8749:0:b0:601:8e4f:2eb3 with SMTP id
 4fb4d7f45d1cf-6019bebb767mr407192a12.0.1747845666702; Wed, 21 May 2025
 09:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507205504.2017028-1-xur@google.com> <a2db22a3-6d66-481d-9432-b38b83e17183@cachyos.org>
In-Reply-To: <a2db22a3-6d66-481d-9432-b38b83e17183@cachyos.org>
From: Rong Xu <xur@google.com>
Date: Wed, 21 May 2025 09:40:53 -0700
X-Gm-Features: AX0GCFuSCRCyKyLGGFjAnkBxRWb0nZ4cr5-Pq8OFHgzoxBDDb79Rb1Uuvd_gMZI
Message-ID: <CAF1bQ=Sh+N1ifCHK-15zeqt1tyzFtr-+nEJmSjEJOgfXgK9ufg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: distributed build support for Clang ThinLTO
To: Eric Naim <dnaim@cachyos.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 10:22=E2=80=AFPM Eric Naim <dnaim@cachyos.org> wrot=
e:
>
> Hi Rong Xu,
>
> On 5/8/25 04:55, xur@google.com wrote:
> > From: Rong Xu <xur@google.com>
> >
> > Add distributed ThinLTO build support for the Linux kernel.
> > This new mode offers several advantages: (1) Increased
> > flexibility in handling user-specified build options.
> > (2) Improved user-friendliness for developers. (3) Greater
> > convenience for integrating with objtool and livepatch.
> >
> > Note that "distributed" in this context refers to a term
> > that differentiates in-process ThinLTO builds by invoking
> > backend compilation through the linker, not necessarily
> > building in distributed environments.
> >
> > Distributed ThinLTO is enabled via the
> > `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
> >  > make LLVM=3D1 defconfig
> >  > scripts/config -e LTO_CLANG_THIN_DIST
> >  > make LLVM=3D1 oldconfig
> >  > make LLVM=3D1 vmlinux -j <..>
> >
> > The implementation changes the top-level Makefile with a
> > macro for generating `vmlinux.o` for distributed ThinLTO
> > builds. It uses the existing Kbuild infrastructure to
> > perform two recursive passes through the subdirectories.
> > The first pass generates LLVM IR object files, similar to
> > in-process ThinLTO. Following the thin-link stage, a second
> > pass compiles these IR files into the final native object
> > files. The build rules and actions for this two-pass process
> > are primarily implemented in `scripts/Makefile.build`.
> >
> > Currently, this patch focuses on building the main kernel
> > image (`vmlinux`) only. Support for building kernel modules
> > using this method is planned for a subsequent patch.
> >
> > Tested on the following arch: x86, arm64, loongarch, and
> > riscv.
> >
> > Some implementation details can be found here:
> > https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/8=
5934
> >
> > Signed-off-by: Rong Xu <xur@google.com>
> > ---
> > Changelog since v1:
> > - Updated the description in arch/Kconfig based on feedback
> >   from Nathan Chancellor
> > - Revised file suffixes: .final_o -> .o.thinlto.native, and
> >   .final_a -> .a.thinlto.native
> > - Updated list of ignored files in .gitignore
> > ---
> >  .gitignore                        |  2 ++
> >  MAINTAINERS                       |  5 +++
> >  Makefile                          | 40 ++++++++++++++++++++---
> >  arch/Kconfig                      | 19 +++++++++++
> >  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
> >  scripts/Makefile.lib              |  7 +++-
> >  scripts/Makefile.vmlinux_o        | 16 +++++++---
> >  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
> >  scripts/head-object-list.txt      |  1 +
> >  9 files changed, 180 insertions(+), 15 deletions(-)
> >  create mode 100644 scripts/Makefile.vmlinux_thinlink
> >
>
> I noticed that both Makefile.autofdo and Makefile.propeller add extra lin=
ker flags when building with ThinLTO. Did you miss updating that or is the =
omission there intentional?

Thanks for catching this! One good aspect of distributed build mode is
that we no longer need the extra linker flags -- most of them are just
to pass the options to the BE compilation.
So this patch does not need these linker options.  But for the
Propeller build, we still need to pass one of the two profiles to the
final link, and I'll be sure to incorporate that into the patch.

However, I do need to make a change regarding file suffixes. The
is_kernel_obj macro in the Makefile.build uses the basename command.
The issue is that basename extracts everything before the last period
in a filename. So, for a file named "foo.o.thinlto.native", basename
returns "foo.o.thinlto", but kbuild expects it to return "foo".

To fix this, I'll adjust the suffixes to ".a_thinlto_native" and
".o_thinlto_native". I'll send the patch v3 shortly.

Thanks,

-Rong
>
> --
> Regards,
>   Eric

