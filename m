Return-Path: <linux-kbuild+bounces-6572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D18BCA84C1C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 20:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91E11B8032F
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Apr 2025 18:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5FC1EFFB9;
	Thu, 10 Apr 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AulYPUUG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F161EE7DD;
	Thu, 10 Apr 2025 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744309944; cv=none; b=Ws88Oa3gH6TG6xunHhiVLOmJw57xekdV6ONyDK+rJWo3Mw6Twg/Pc7pOYJQBvOadoY6m6op8PZgCTn9VV4/X5Fd4p3VYLh66OoKI+b97YS+KCzfoarvCSprp3U81QAy7iOLcWRemXsU0Vi7iQLlXQjOSNaPa8u8rjEtOz3tOvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744309944; c=relaxed/simple;
	bh=rhq98F1oAt15i089HgDHKF8FTORTwBNqnGhkaUMvkGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ij3MLisIZ59CQxFUIb3UNkVlyvt+ukcouNXs2JvE2LPo+w0tgx+suixciuMt7eP0Uot/HFCq4Gz73tVFoSQtUT9UNDyOBMVWLqbqjFPw3tWczMPvksAdkaWfttKevY6iW1X0eerQP40dpFe8Lda896BW7zm+lWE0ZvqQ2qV2brw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AulYPUUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB60BC4CEE9;
	Thu, 10 Apr 2025 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744309943;
	bh=rhq98F1oAt15i089HgDHKF8FTORTwBNqnGhkaUMvkGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AulYPUUGsOPhwa+Kt6zt/bF4SQ+MXk286rhsVsmpe2mlfpPgF70lZBTSnsR5ntMwT
	 ZkZ1ToXf/gNg5d0kTQ3LaxQHhZ/OV8AyMKmXZAXIySY6/dt80IAZs/Dq4S7TCaD1RG
	 oibILCU7xUCwRzh85baDrWOsnoswhPJvtEXC2U0GJngapQVeRRPBUuBcfovgE7X6WP
	 xWeGG90XHGWZ76vzkeD0FhF3cQxYlBMQnGKXJx+X4Gs55Pqxu6zXwRTUYNyNRPLgrp
	 AKAEj6NwSrvd65oWn/btbRNM+RkN6o/0/d3P2d3KfgpG9Ra5zNqi63peDg7+DHZKtA
	 fZfxddu2IO8/Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bef9b04adso11403061fa.1;
        Thu, 10 Apr 2025 11:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8zpenzvHWUa5mxLiZLRzMr4+7ZTI9sj0QnFBG/V9J3Vo/xvq102hmIUu76b6w8yvvZCCITHcuml/VLo0N@vger.kernel.org, AJvYcCXN4ZWAu6XVlVYo6xk1PV/5O5R5Hj22ndgx2y+aXuwFQ0bxLoeJFN0ClcMQc0UPd6s6/5OOkhfJHkvnSzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsb+XunjRHuSN4EFjuxhoSM3MEUVaggMsuxwp+1l5VVJ/r3QeU
	7sIb5ophz6ho+FVmK2AveNk0qdxTgDllkyHvJZghIs5mjEiom/JE6wiC301D9MB5lJgCKdwbqnc
	rzNJ8Y5bPr1FF/20tjhayxZSbRXI=
X-Google-Smtp-Source: AGHT+IGGRB7Ex6YVXi0NvNO+40T2HkvRuSGCeSMU/GnQkY0sfugEXhoQVsAzbBNrtu6Y5hVIAnWVcOlNqjOfW1Ob5aU=
X-Received: by 2002:a05:651c:2118:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-30faccb2938mr17777751fa.32.1744309940933; Thu, 10 Apr 2025
 11:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr> <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
 <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com> <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
In-Reply-To: <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 11 Apr 2025 03:31:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATik6YPYZ5H2n9NXcG=WP3ThvCHpN=azAULmvUEMs5R3A@mail.gmail.com>
X-Gm-Features: ATxdqUFhBy0hx4SI9K9tecnkTRNiTM5aHBLCMene6OVtrID6RDX8fCW86LYQ_CA
Message-ID: <CAK7LNATik6YPYZ5H2n9NXcG=WP3ThvCHpN=azAULmvUEMs5R3A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:43=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
>
> On 07/04/2025 10:15, Alexandre Ghiti wrote:
> > Hi Masahiro,
> >
> > On Fri, Apr 4, 2025 at 5:25=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >> On Fri, Apr 4, 2025 at 12:45=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr=
> wrote:
> >>> Hi Ard,
> >>>
> >>> On 03/04/2025 17:11, Ard Biesheuvel wrote:
> >>>> On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com=
> wrote:
> >>>>> riscv uses the .rela.dyn section to relocate the kernel at runtime =
but
> >>>>> that section is stripped from vmlinux. That prevents kexec to
> >>>>> successfully load vmlinux since it does not contain the relocations=
 info
> >>>>> needed.
> >>>>>
> >>>> Maybe explain that .rela.dyn contains runtime relocations, which are
> >>>> only emitted if they are actually needed - as opposed to the static
> >>>> relocations that are not emitted as SHF_ALLOC sections, and are not
> >>>> considered to be part of the runtime image in the first place.
> >>>
> >>> Ok I'll do.
> >>>
> >>>
> >>>> It
> >>>> would be nice if we could use --remove-relocations=3D here, which on=
ly
> >>>> removes static relocations, but unfortunately, llvm-objcopy does not
> >>>> support this.
> >>>>
> >>>> Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn an=
d
> >>>> .relr.dyn, as they all carry runtime relocations.
> >>>
> >>> Ok, I'll add them to the next version.
> >>>
> >>>
> >>>> Finally, I'd be curious to know why RISC-V relies on --emit-relocs i=
n
> >>>> the first place? Is the relocs check really needed? If not, it would
> >>>> be a nice opportunity to get rid of Makefile.postlink entirely.
> >>>
> >>> So I had to check and it happens that this was an issue with the
> >>> toolchain, I should check if that still happens with newer ones.
> >>>
> >>> commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
> >>> Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> >>> Date:   Wed Mar 29 06:53:29 2023 +0200
> >>>
> >>>       riscv: Use --emit-relocs in order to move .rela.dyn in init
> >>
> >>
> >>
> >> So,
> >>
> >> Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move
> >> .rela.dyn in init")
> >>
> >> Is this the correct tag?
> > This is the initial culprit yes, but if we use this tag, the fix won't
> > apply. So I decided to pick Ard's patch so that this fix can be easily
> > backported to 6.14, and I'll come up with a new version for previous
> > releases. Is that ok with you?
>
>
> And I have just looked at 6.15-rc1 and noticed that the relocation
> stripping was moved to Makefile.vmlinux, so this fix won't apply to 6.14
> neither.
>
> I'll then use the initial culprit, which is Fixes: 559d1e45a16d ("riscv:
> Use --emit-relocs in order to move.rela.dyn in init").
>
> Sorry for the noise,

You do not need to worry about whether this commit can be cleanly
back-ported to the stable kernels or not.

If the fix cleanly applies, the process should be easy (and almost automati=
c).

If not, we can modify the patch context and submit to the stable ML.
This needs manual modification, but is still possible.


--=20
Best Regards
Masahiro Yamada

