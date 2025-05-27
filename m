Return-Path: <linux-kbuild+bounces-7302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5883AC5BFE
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 23:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9AC74A45F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 21:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C532139C9;
	Tue, 27 May 2025 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vXxaAob0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181F2135B9
	for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379928; cv=none; b=OMB6vXV4yeQz8NHqztJ8S+JP0zZGHfGYqd8IyNuR1rjHfk4vuiQBbQcIjCYBWHuN3/P3HZbH5OG3qPxByHHTgzkcngodFwEe7rMswwmYc4aN5cM+jBYm+/S+SVgqnOTQjDum3QLx8HKCeMpzNQGhiSEVT7crREsABvl2p5SumvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379928; c=relaxed/simple;
	bh=bz+yRo2oGbcYSM3SQKPoZPrFgXJE5pB0qPTQ1/jIu4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFegL43NOQZYOGa+1wu1ZHvop0Ud2oQ+HTAN4r1Coxs/3oWKLl4E/TFeRog76ZXbMOnsrxvtmgCJat9PiYM9/iTMnJsabq3bPJpvL1CuCQvMJ1on3asixQu61BS9UXQUeddaG4RrKebNX4wkNt1vbEv4iAGTlekQifJCtEH78Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vXxaAob0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso3424a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 14:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748379925; x=1748984725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKtvW3dZYOqtpkcAOmcODBWBULhW16t8c1u7HWAgqLc=;
        b=vXxaAob0moHscPe2+Ii15Gz0k7ubJgrXpDc/scXx4B75Hqkh4mCuW7UVh4ayn2h7i4
         11HZx9QJSsn3rDq2BLnn5XXFnLjW5166zWyVz3do2Te7edMdsg34RYb7vkODeZHycIto
         DOYivBk4AGpIe5LFGijK0XRAG2G4bzko1JWwWb9nHKTaXxpX0Pe6vEI2kaNg8B5zySgj
         ekTUgdAjpm7L2NyMEEv8+7uPiTBbhr5GKerd7b/fUHQBa+LnTTlmhi1A+ASXkOIJTzaa
         r8QY8yhsVf5XnxNFvXjitU8LTj85qHcCZBCKTMZwMBb4OR3VX5AiZjrVTIY1PI6iGB9o
         S3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379925; x=1748984725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKtvW3dZYOqtpkcAOmcODBWBULhW16t8c1u7HWAgqLc=;
        b=Ow+8ZpD0whCX0en4TOULneSX8rUDj9PsUKNd12kHa4doe8lQErUdEFLt7cd5bG3rVg
         nL1ugbmuPtafEPluDKZv+1HQrcHEvDi48nXTE6qQjX9SYy4cjh6njsdaFD8i3CSHLkUt
         AcJhyHBY7Or9kIs87cSk2m2gTjimM3L2zPGzIVvcWRAopIphu7PBcz7oHU/tJ6Sx69fs
         Z02SaHrMm1+GZgvx5tfjWBe3kvyRd9hsT40EDdK9yXxpF4P013VGOAGLqrF0Cnj1zuKK
         pkNVL2nFbhpOL5F+pQ/6PGxElw64QOivA4J+lATu4/jGqeKrroQv7f+fmLm6Ywa9YMoW
         o7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU7pjvpOb2Q90tMnC53aJOnolbRjbcdhgZayg7gvXXywRdlq6t/1hH8KvLGzb0dFM62xFo7JEaG0NCLgRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YziCc9pPXe7PA4gmLopoeXVvUD0kP4qYDeDYYJwnVe/RD3/7Qtd
	BY/bXIwj4Y17qEneuTosQcqL7UXhnuzYkG6p+QSvJnx5uvYWKmYcqU6XepQnZEIYzp4buvg526p
	KxtUFOme32UgoXUbxZcYl3aeU3Mqrz5sSDH+Y9Z6o
X-Gm-Gg: ASbGnct8V5b1guOt4ytnJCEdwWdEiSm7wkqKcauz9wEpUiBn8bNmNB/ZxE3ntuf2NAh
	07bKmrW5LHytMvl7G/AK95DI71L3XUtAJzYqVNHEnEZXlItRgXYorqYEaPTgqVQwBWjPrdTwvIB
	lsgEFPR9AphIB2VHLY0iT1XSH9pZ0GDgYqEB4UB4rrBy8TGcP87fTVKf7TBB490mPNQVJ8y4nq3
	csEBDk6YnyN
X-Google-Smtp-Source: AGHT+IFF1vl5A5Fcq1slU6dJ5UaS32+sup4jgzdgF+dhO5+2Dxb7O+Fh9c5qPFDtQxrwQVjIZ37LY6nT5l8eYgtVN1k=
X-Received: by 2002:a05:6402:1656:b0:5fc:e6a6:6a34 with SMTP id
 4fb4d7f45d1cf-6051592fcf5mr24677a12.6.1748379924399; Tue, 27 May 2025
 14:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com> <CAK7LNAS4Ys-ekzjrRdfwKh5tEU=FKe1tE2-orj6LTs7EknZCZg@mail.gmail.com>
In-Reply-To: <CAK7LNAS4Ys-ekzjrRdfwKh5tEU=FKe1tE2-orj6LTs7EknZCZg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 27 May 2025 14:05:12 -0700
X-Gm-Features: AX0GCFteXY5Ez1dVPy7R7VdFZUcsPzfpgROhNb1gEyg3aZh1_cPdf0dwqSuiy74
Message-ID: <CAF1bQ=QSBOdvqqBPPv70z1hLX4echmfzBDCu5o4LtKrZEaAJUw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Eric Naim <dnaim@cachyos.org>, 
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

On Mon, May 26, 2025 at 6:12=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:
> >
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
> >
> > Changelog since v2:
> > - Changed file suffixes: .o.thinlto.native -> .o_thinlto_native,
> >   and .a.thinlto.native -> .a_thinlto_native so that basename
> >   works as intended.
> > - Tested the patch with AutoFDO and Propeller.
> > ---
> >  .gitignore                        |  3 ++
> >  MAINTAINERS                       |  5 +++
> >  Makefile                          | 40 ++++++++++++++++++++---
> >  arch/Kconfig                      | 19 +++++++++++
> >  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++---
> >  scripts/Makefile.lib              |  7 +++-
> >  scripts/Makefile.vmlinux_o        | 16 +++++++---
> >  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++++
> >  scripts/head-object-list.txt      |  1 +
> >  9 files changed, 181 insertions(+), 15 deletions(-)
> >  create mode 100644 scripts/Makefile.vmlinux_thinlink
>
> I re-implemented the Makefiles to avoid
> the second recursion and hacky ifdefs.
> Attached.
>
> The topic branch is available in
>
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> thinlto-dist-refactor
>
> I only compile and boot tested on x86 QEMU.
This implementation does look cleaner. But with one issue: it has a
unified cflags for
all the BE compilations. This means per-file flags, such as
CFLAGS_fork.o =3D -fabc,
are lost during the BE compilation for fork.thinlto_native.o.

This exact issue was what I aimed to prevent with the two-recursion approac=
h.
If we must avoid two recursions, perhaps we could leverage the saved per-fi=
le
pre-link commands (i.e., .*.o.cmd)?

Regards,

-Rong

>
>
> --
> Best Regards
> Masahiro Yamada

