Return-Path: <linux-kbuild+bounces-7209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDAABFBB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 18:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05DF7500E19
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A368262FF5;
	Wed, 21 May 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HFC49Mrf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535C250BED
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846427; cv=none; b=EbPI+VcI5guJG81CHQQvV9YbFOt+RJR7TykFUJJTXujn/JWyERYqOYKfRhKbI+kxfq2eTEf1b4nqgfIYaTKHT7++Db9/LuY3S0BPdypK1GfMRLaq7wR9x0cyD2n5aUQXhhNSA1We1eGimyje+4tWY8tcO7pfs7Ch4G4FizHfRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846427; c=relaxed/simple;
	bh=qHopfEyt81fEf/y8iQKjmcmiqXO3gugN6MkVzAFAIFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2JV7d6w0EDoxQ300DPUJUBG2bMSwL3cXa78hQDPX59hBpigWxP9BlsOOHR7JIkI86Va29oIVamuUPHHtVneognrcvUfTqQCTCaf4eAmexpjwenP32T2lQogU1QsHnEBWzsnXhDJT9nOwHul/X65SkWeQTfIQVi8tRUi/ZxZw8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HFC49Mrf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so35631a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846423; x=1748451223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt2BJWIq8eUeGltZpFipvyHVPXsIRm7HCk10rPc4uGk=;
        b=HFC49Mrff31yVR0qUjGCthAU5kSCfIb0Fccpe2r41ocl4EnK8Jl8wYFquNegHhMDqV
         INI6PELFlj9l5BzpZ3sKnsrVUa94Y2NInVoED0torQvSHesYnUZZtlB2ucvCinTHdefd
         mKLkNv7FO34PwoGs90odDLBtCIKSxWAe3QkFWtVQnoQEiUev0CAIfr4S+0XVx+Hxeu6w
         Qu+TW4FkUEBdArLBE8oEXPJHKC1VUSY5EW/a2MXreezOhWk65w7wiqhsqZn8WI4xnUSg
         Q7ubnxSY3K8dAbYzMBQY5A/fZwGjhE/G8tuowf5VgckDPeI2ueFLsYVmx9J6itLxAapr
         alFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846423; x=1748451223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gt2BJWIq8eUeGltZpFipvyHVPXsIRm7HCk10rPc4uGk=;
        b=PJiijr/WpUzFFx555+gRRwYPvPFbEIf0gI6Cejk/H16hs2lUcwjbCiAdgdE/tKZNcO
         YOPtcamGfBxmJv53KGDf1MP0qVDZeMt6Fa3kjgcUlZE/X5W1Q7gFyi+HFsDTS59VuDl/
         XhMGkFpmCRKgL1Et6WpcAClNlSfAxag2cKQIaEX6CB/BsyJjXH6TIM86nKFLQ9ADVWcz
         jiPlnBegucYWFneaVU/UyhewOjvbdIenmycudumAV1SfCRWICNgC0xG7K5ZYfdNnYFRi
         vTvIeCmJcM1ncyYMrfKDZ7vgWQUpsPtT9DD8Fc7emtJ7fNPCzBUesMVYErWKp/8E2+NS
         rmow==
X-Forwarded-Encrypted: i=1; AJvYcCWE9IcbI6BPgWfUWyp1fBwotWO/GtkI6gmd9wUAuu+tco7tNOlnYqCuck8PGuh2NOfRl1ZVS0RmrPw1b5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsEXaaFyPxT+3HmvB+GYxDHuMvOLz5HzxlvJRKxvvrtJCjGYF
	7ovxQIjDRQb/Cb1+ubA6josExBj5oiihk2iSdzfMKVu4G1fpmDUnxEQni6tufTc/kFXYFU3spDg
	CEF+YB4FmpGdwaC4xXQmJ7rP0nfpNg4Nrs8AvY1vD
X-Gm-Gg: ASbGnct5uFnu3tGLTY1zolxXmYbFEQNcwdP/mg+JKuwzy9VNdMx1NQEBChubHTzyzaH
	VWdvyhgqXSy3SnGS6pulNFOyTnd4JeF4VGWUHrp+3CdUSszPD6uRavYx2BXuCgQf8z+MjHfJ3EQ
	+T+8TRbgVEYB8soZioRGkUs0Ovp6ja5+IiAT5S3NvUUMnOpEYNLKo2J32cWktlBpVyXchZbVf+Q
	g==
X-Google-Smtp-Source: AGHT+IEk1qK5pfCS9TiWiAJqcWHO+q4BDVFceePf5Pmj4GkZsf/xtSVgoYl2UGzFjXqYDQsYvRGQjsnQ0SmoCtpQU/I=
X-Received: by 2002:aa7:cfc9:0:b0:602:3bf:ce73 with SMTP id
 4fb4d7f45d1cf-60203bfcf5fmr309381a12.1.1747846423421; Wed, 21 May 2025
 09:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507205504.2017028-1-xur@google.com> <a2db22a3-6d66-481d-9432-b38b83e17183@cachyos.org>
 <CAF1bQ=Sh+N1ifCHK-15zeqt1tyzFtr-+nEJmSjEJOgfXgK9ufg@mail.gmail.com>
In-Reply-To: <CAF1bQ=Sh+N1ifCHK-15zeqt1tyzFtr-+nEJmSjEJOgfXgK9ufg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 21 May 2025 09:53:30 -0700
X-Gm-Features: AX0GCFseOE_jhX8D3KglAvvruKoN_xZx_2C0u0wtd6LAGK11cpGwHfJ0lJ57Nkg
Message-ID: <CAF1bQ=TQSQ75qCyQYegW7kq8WdyB-SNViraOuBvgGgAyUPS54Q@mail.gmail.com>
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

On Wed, May 21, 2025 at 9:40=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> On Mon, May 19, 2025 at 10:22=E2=80=AFPM Eric Naim <dnaim@cachyos.org> wr=
ote:
> >
> > Hi Rong Xu,
> >
> > On 5/8/25 04:55, xur@google.com wrote:
> > > From: Rong Xu <xur@google.com>
> > >
> > > Add distributed ThinLTO build support for the Linux kernel.
> > > This new mode offers several advantages: (1) Increased
> > > flexibility in handling user-specified build options.
> > > (2) Improved user-friendliness for developers. (3) Greater
> > > convenience for integrating with objtool and livepatch.
> > >
> > > Note that "distributed" in this context refers to a term
> > > that differentiates in-process ThinLTO builds by invoking
> > > backend compilation through the linker, not necessarily
> > > building in distributed environments.
> > >
> > > Distributed ThinLTO is enabled via the
> > > `CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
> > >  > make LLVM=3D1 defconfig
> > >  > scripts/config -e LTO_CLANG_THIN_DIST
> > >  > make LLVM=3D1 oldconfig
> > >  > make LLVM=3D1 vmlinux -j <..>
> > >
> > > The implementation changes the top-level Makefile with a
> > > macro for generating `vmlinux.o` for distributed ThinLTO
> > > builds. It uses the existing Kbuild infrastructure to
> > > perform two recursive passes through the subdirectories.
> > > The first pass generates LLVM IR object files, similar to
> > > in-process ThinLTO. Following the thin-link stage, a second
> > > pass compiles these IR files into the final native object
> > > files. The build rules and actions for this two-pass process
> > > are primarily implemented in `scripts/Makefile.build`.
> > >
> > > Currently, this patch focuses on building the main kernel
> > > image (`vmlinux`) only. Support for building kernel modules
> > > using this method is planned for a subsequent patch.
> > >
> > > Tested on the following arch: x86, arm64, loongarch, and
> > > riscv.
> > >
> > > Some implementation details can be found here:
> > > https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel=
/85934
> > >
> > > Signed-off-by: Rong Xu <xur@google.com>
> > > ---
> > > Changelog since v1:
> > > - Updated the description in arch/Kconfig based on feedback
> > >   from Nathan Chancellor
> > > - Revised file suffixes: .final_o -> .o.thinlto.native, and
> > >   .final_a -> .a.thinlto.native
> > > - Updated list of ignored files in .gitignore
> > > ---
> > >  .gitignore                        |  2 ++
> > >  MAINTAINERS                       |  5 +++
> > >  Makefile                          | 40 ++++++++++++++++++++---
> > >  arch/Kconfig                      | 19 +++++++++++
> > >  scripts/Makefile.build            | 52 +++++++++++++++++++++++++++--=
-
> > >  scripts/Makefile.lib              |  7 +++-
> > >  scripts/Makefile.vmlinux_o        | 16 +++++++---
> > >  scripts/Makefile.vmlinux_thinlink | 53 +++++++++++++++++++++++++++++=
++
> > >  scripts/head-object-list.txt      |  1 +
> > >  9 files changed, 180 insertions(+), 15 deletions(-)
> > >  create mode 100644 scripts/Makefile.vmlinux_thinlink
> > >
> >
> > I noticed that both Makefile.autofdo and Makefile.propeller add extra l=
inker flags when building with ThinLTO. Did you miss updating that or is th=
e omission there intentional?
>
> Thanks for catching this! One good aspect of distributed build mode is
> that we no longer need the extra linker flags -- most of them are just
> to pass the options to the BE compilation.
> So this patch does not need these linker options.  But for the
> Propeller build, we still need to pass one of the two profiles to the
> final link, and I'll be sure to incorporate that into the patch.

One clarification: We don't need to change scripts/Makefile.propeller
as the link
ordering profile is already passed to the final link under
CLANG_PROPELLER_PROFILE_PREFIX.

All the --lto-* options are only for in-process thinlto builds.

>
> However, I do need to make a change regarding file suffixes. The
> is_kernel_obj macro in the Makefile.build uses the basename command.
> The issue is that basename extracts everything before the last period
> in a filename. So, for a file named "foo.o.thinlto.native", basename
> returns "foo.o.thinlto", but kbuild expects it to return "foo".
>
> To fix this, I'll adjust the suffixes to ".a_thinlto_native" and
> ".o_thinlto_native". I'll send the patch v3 shortly.
>
> Thanks,
>
> -Rong
> >
> > --
> > Regards,
> >   Eric

