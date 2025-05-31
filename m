Return-Path: <linux-kbuild+bounces-7310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D068AC99B0
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 08:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BDE618989DB
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 May 2025 06:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66137156F28;
	Sat, 31 May 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejRYP1l4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2332111;
	Sat, 31 May 2025 06:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674119; cv=none; b=sHIK6cwwnxeyWslgTb553RzEzMZHUxHx9bKUR1oNEZFWFylAjpETlDWAD4OiSG6vRQbQhIzYSqajvvXleMIKfyBpO9Y2vlZNDveVtUpgGDiPjaN90SN9KEtPs3QGS7eTjP0YnJa89+xI4cfVlTZO54v8YMG/xwlHzPB4NsWzfLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674119; c=relaxed/simple;
	bh=B3GbeJ1XJrb185C/zHJTLjOvmuDOX4UvvOLiqb9V+MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6mu2VAPwg/PO8YUqy8XfG5wLGwG+VunAAMYTNUq7114+7qR8lNZCVEsxbpf4aCATd1QYU4V9Co3J7KwfbWJdpTgeP6kRpCaGI8hMrLv5owlad7E7GhcNjNG6l91GetgKfvgCJJO7FQLXDubzZAG57RtQiCM71ctZOPWQqEhqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejRYP1l4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADD8C4CEF5;
	Sat, 31 May 2025 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748674118;
	bh=B3GbeJ1XJrb185C/zHJTLjOvmuDOX4UvvOLiqb9V+MQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ejRYP1l4KjT091+TB47yDw7J5/2LYXOzuBOxSjRx+d/nLWrIBnSdwm2TqlB+R03Ap
	 T7pd0LHPMmJjvdd7njpz+T9VsF/W2pETUluteMjCFH9vOZUUd4tLXug6ElQ/KzCKXt
	 aGTMgAacnmqL15TttwPq8NGxdAAes6fY5R/VPIzNZtyiq/GfYIGDj6z9rJF2+ZSGHv
	 fhIKG+LyM4OG9DHwrTfrGyCKBss/vrpfS1qu+dSxshn5wGTXeHBXWFkbE+oHdSSKPJ
	 rNXCoYqRZ5Xpb3gnPyxOLEEde5afIi1pV1wk2aWSM2vzkVLAp8P1zPp8XYVhThkt88
	 3WHuWX2Xr4zUw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e816aeca6so3676282e87.2;
        Fri, 30 May 2025 23:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4fbA24ah1VSsGQbaBXLSyUWdjBCkuLfcYE3xWhaWnOoXj4to9zTv3Q4RgtmrvN5PEYiOYeM0zNerOD9bd@vger.kernel.org, AJvYcCXZU1lWpHlHV1XEkq/WJHzRHFl4YTt5AIhXoOv89NKPmaxiFfc/9k6hdHZW5SlYz457iPjnHG2XuavAPhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHBqmT2NQ6aluvld+ngYBcQH9en/TOTE6gyXlhSSMWtcC3hM/
	97NWHmJfRGJ1XME5KF0jrn/Hgg15ry4CjoA+9ufVNtCwexY3rRxWtdCeH+Pwy3uonZ+dPbB7AVo
	33Sk/suJrZ5uKP+9BL5bz+KA3I1tgSWw=
X-Google-Smtp-Source: AGHT+IF6yitFVg7GKxP/v4EKNZcDDTDd3ajAPLZuHsZowDvCSn6hV5B23MZ5yJXYTwrz8XA0ys6Bu5NnYURoaa7aWt0=
X-Received: by 2002:a05:6512:22c9:b0:553:2bf2:e30a with SMTP id
 2adb3069b0e04-5533b8f4120mr1438868e87.21.1748674117297; Fri, 30 May 2025
 23:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521213534.3159514-1-xur@google.com> <CAK7LNAS4Ys-ekzjrRdfwKh5tEU=FKe1tE2-orj6LTs7EknZCZg@mail.gmail.com>
 <CAF1bQ=QSBOdvqqBPPv70z1hLX4echmfzBDCu5o4LtKrZEaAJUw@mail.gmail.com>
In-Reply-To: <CAF1bQ=QSBOdvqqBPPv70z1hLX4echmfzBDCu5o4LtKrZEaAJUw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 31 May 2025 15:48:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAThpMaDDfBD6jQzPZ==X-EngwoirFy9AAML9se-36L3ig@mail.gmail.com>
X-Gm-Features: AX0GCFvuHS6FuAkNmaMskDcnmnMTkwQh5nnPvYwqzs7y4ypqeNVaYWLWbyguYKA
Message-ID: <CAK7LNAThpMaDDfBD6jQzPZ==X-EngwoirFy9AAML9se-36L3ig@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
To: Rong Xu <xur@google.com>
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

On Wed, May 28, 2025 at 6:05=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> On Mon, May 26, 2025 at 6:12=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Thu, May 22, 2025 at 6:35=E2=80=AFAM <xur@google.com> wrote:
> > >
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
> > >
> > > Changelog since v2:
> > > - Changed file suffixes: .o.thinlto.native -> .o_thinlto_native,
> > >   and .a.thinlto.native -> .a_thinlto_native so that basename
> > >   works as intended.
> > > - Tested the patch with AutoFDO and Propeller.
> > > ---
> > >  .gitignore                        |  3 ++
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
> > >  9 files changed, 181 insertions(+), 15 deletions(-)
> > >  create mode 100644 scripts/Makefile.vmlinux_thinlink
> >
> > I re-implemented the Makefiles to avoid
> > the second recursion and hacky ifdefs.
> > Attached.
> >
> > The topic branch is available in
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t
> > thinlto-dist-refactor
> >
> > I only compile and boot tested on x86 QEMU.
> This implementation does look cleaner. But with one issue: it has a
> unified cflags for
> all the BE compilations. This means per-file flags, such as
> CFLAGS_fork.o =3D -fabc,
> are lost during the BE compilation for fork.thinlto_native.o.
>
> This exact issue was what I aimed to prevent with the two-recursion appro=
ach.
> If we must avoid two recursions, perhaps we could leverage the saved per-=
file
> pre-link commands (i.e., .*.o.cmd)?

How important is this?

I do not know which compiler flags are consumed in the
distributed thin lto stage.

Are only compiler flags starting "-f" relevant?

In your implementation, you filter-out many compiler flags.


--
Best Regards
Masahiro Yamada

