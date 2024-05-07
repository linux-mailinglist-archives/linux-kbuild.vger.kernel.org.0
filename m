Return-Path: <linux-kbuild+bounces-1804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E09C8BE5D5
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 16:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84211F23417
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 14:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FEC15ECE5;
	Tue,  7 May 2024 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcItmTiQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6614EC64;
	Tue,  7 May 2024 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091943; cv=none; b=LIg7mwgItOvDYJL9wa85n0RzCehoXVx0QDDDBI/lKNKgxK2SrPB6PnTxgW3Zt6xyhUji7Chq3nF4qVnlrhhRXTIdAyawgBbGkOlOSGHXXIyqcVVkOlbPqnyy7B9fY5TmYC2RuWoAGnMPfnLMuEnb/UCNaFVvCuLbF+3KNNf06VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091943; c=relaxed/simple;
	bh=9GyGNvIyzoWY1JFtW2MU5vln/b4bqKmVSdH38ZdCQHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ppirl2TICKR05Y3hyUstb91IpaVHdOY8XzjyaYGd0M+V9yzuMOD2qoJ2nEG79xAlSiJVaCPdDgchiRmTFAUvNXLahyTWZcLOcxbmjAjTbmwfxZ+Q7pZwVG1owaQRcn7VgPCg5MF/+dpjPyNcTNmcrxmH6X8TkT5zTTIQMD8WHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcItmTiQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E014C2BBFC;
	Tue,  7 May 2024 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715091943;
	bh=9GyGNvIyzoWY1JFtW2MU5vln/b4bqKmVSdH38ZdCQHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AcItmTiQrgj+MChF27D/ngGnkr7R7X76s7Q6cFei4cRm9jH+TOAzC0uwUzBDWCfdO
	 0jPdE6pLVPlvcuGqP4IUs1u5pe/L8/CXU0SUOR1mYZUx+UaLdHxcNd1u/LklXA3QKM
	 T0VdAdjlCZJCc/eEAvblsI+FZLdsMzgWYeD+EHyNCnnBg9YykwFYQ32GoSWL7IUVdk
	 nyhoMdW2sns+MuBkDa9hNve47bL/l/uAD8WHTngEVdf2t7fwTW47tGclAynq+EMnsm
	 MqUOBFsAnvWEh0O9xxpOxEu0rH3ApxWsQu+Tg0f7KAvrNseLx8hgi+vPheBYCcdmfy
	 v+PuHHnvnje3Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f1b378ca5so5460726e87.1;
        Tue, 07 May 2024 07:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ6ch5x3q+vzMDkCnTuQqAhbWLu/sottuWXXvHEC6JQyG5oi2kWkxmW7u4qWMLHu3mmPMDlCso7vAaf44Ev9IA45toEueYNZOIH4mZ
X-Gm-Message-State: AOJu0YxX1y3sbdOH/9P8pRxrWP0Qucfv7CaCZfiiaDmDHQdgn1YDhnqX
	Ai9sdcTtNEumdxXECl0KX/UUsSO1HLmjn+5NcprgCekGLVWtZlvH4Kjsnk2judScNLpO4RcsuEs
	pqsv5vLsHjbwCeHkmHqnSmm227/k=
X-Google-Smtp-Source: AGHT+IHr62A6SHriu3mN7ZhEQrl4cpmfIWOHqHhlavO899bp5gQODVycCLefZQqecCSqSlspP0Tm7GigjivoxGqgKQ0=
X-Received: by 2002:ac2:4888:0:b0:51c:fd0a:7e37 with SMTP id
 x8-20020ac24888000000b0051cfd0a7e37mr10617488lfc.20.1715091942029; Tue, 07
 May 2024 07:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427153253.2809911-1-masahiroy@kernel.org>
 <20240427153253.2809911-2-masahiroy@kernel.org> <ZjoNa434si-Hk0Cs@buildd.core.avm.de>
In-Reply-To: <ZjoNa434si-Hk0Cs@buildd.core.avm.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 23:25:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJTG_HJuC+tp=NPmnWCwjyW9hzLukpSkWFJrkO1xYUhQ@mail.gmail.com>
Message-ID: <CAK7LNAQJTG_HJuC+tp=NPmnWCwjyW9hzLukpSkWFJrkO1xYUhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add 'private' to target-specific variables
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 8:16=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Sun, Apr 28, 2024 at 12:32:53AM +0900, Masahiro Yamada wrote:
> > Currently, Kbuild produces inconsistent results in some cases.
> >
> > You can do an interesting experiment using the --shuffle option, which
> > is supported by GNU Make 4.4 or later.
> >
> > Set CONFIG_KVM_INTEL=3Dy and CONFIG_KVM_AMD=3Dm (or vice versa), and re=
peat
> > incremental builds w/wo --shuffle=3Dreverse.
> >
> >   $ make
> >     [ snip ]
> >     CC      arch/x86/kvm/kvm-asm-offsets.s
> >
> >   $ make --shuffle=3Dreverse
> >     [ snip ]
> >     CC [M]  arch/x86/kvm/kvm-asm-offsets.s
> >
> >   $ make
> >     [ snip ]
> >     CC      arch/x86/kvm/kvm-asm-offsets.s
> >
> > arch/x86/kvm/kvm-asm-offsets.s is rebuilt every time w/wo the [M] marke=
r.
> >
> > arch/x86/kvm/kvm-asm-offsets.s is built as built-in when it is built as
> > a prerequisite of arch/x86/kvm/kvm-intel.o, which is built-in.
> >
> > arch/x86/kvm/kvm-asm-offsets.s is built as modular when it is built as
> > a prerequisite of arch/x86/kvm/kvm-amd.o, which is a module.
> >
> > Another odd example is single target builds.
> >
> > When CONFIG_LKDTM=3Dm, drivers/misc/lkdtm/rodata.o can be built as
> > built-in or modular, depending on how it is built.
> >
> >   $ make drivers/misc/lkdtm/lkdtm.o
> >     [ snip ]
> >     CC [M]  drivers/misc/lkdtm/rodata.o
> >
> >   $ make drivers/misc/lkdtm/rodata.o
> >     [ snip ]
> >     CC      drivers/misc/lkdtm/rodata.o
> >
> > drivers/misc/lkdtm/rodata.o is built as modular when it is built as a
> > prerequisite of another, but built as built-in when it is a final
> > target.
> >
> > The same thing happens to drivers/memory/emif-asm-offsets.s when
> > CONFIG_TI_EMIF_SRAM=3Dm.
> >
> >   $ make drivers/memory/ti-emif-sram.o
> >     [ snip ]
> >     CC [M]  drivers/memory/emif-asm-offsets.s
> >
> >   $ make drivers/memory/emif-asm-offsets.s
> >     [ snip ]
> >     CC      drivers/memory/emif-asm-offsets.s
> >
> > This is because the part-of-module=3Dy flag defined for the modules is
> > inherited by its prerequisites.
> >
> > Target-specific variables are likely intended only for local use.
> > This commit adds 'private' to them.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>
> uh, thanks for fixing this!  (And for the bug documentation, as always!)
>
> I have just one question below.
>
> >
> >  Makefile               | 8 ++++----
> >  scripts/Makefile.build | 6 +++---
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 62557fabfee5..25dcc7ead330 100644
> > --- a/Makefile
> > +++ b/Makefile
> [...]
> > @@ -1500,7 +1500,7 @@ MRPROPER_FILES +=3D include/config include/genera=
ted          \
> >
> >  # clean - Delete most, but leave enough to build external modules
> >  #
> > -clean: rm-files :=3D $(CLEAN_FILES)
> > +clean: private rm-files :=3D $(CLEAN_FILES)
>
> Did you leave 'clean: rm-files :=3D $(KBUILD_EXTMOD)/...' for oot kmods
> the way it is (w/o 'private') by intention?


No. I missed to update this line.

I will fix it up for consistency. Thanks.





>
> Even though I cannot think of a possible problem without the 'private',
> I think it makes sense to change the line as well.
>
> W/ or w/o the 'clean'-update for oot kmods:
>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
>
> Kind regards,
> Nicolas



--=20
Best Regards
Masahiro Yamada

