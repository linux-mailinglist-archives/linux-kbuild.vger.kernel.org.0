Return-Path: <linux-kbuild+bounces-480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 665788262AF
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jan 2024 03:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E71C2122F
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jan 2024 02:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540754411;
	Sun,  7 Jan 2024 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9oNWf0y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE710A09
	for <linux-kbuild@vger.kernel.org>; Sun,  7 Jan 2024 02:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D3CC433D9
	for <linux-kbuild@vger.kernel.org>; Sun,  7 Jan 2024 02:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704594637;
	bh=2Fbqgy+vsdXu/HxjvKi6pvA1+WIhlSD252HGunBDD2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m9oNWf0yG7dzaQqhDt60wSBRaAheJnxCx43Qlmec5VzzNppTOTo68hMQteM4WfFmO
	 h3Y2C2HQ/Gt9BXXw27vZO0B2zdCcc/L4Nruwm74zemjTVE38xfotqcynGhxs40hNGo
	 Ajn0nd/TFCWMjCDES05Zc6vcMsLif4WgmUg7UvGIgGV59Vr2P7PB8SUNdrBLyX7W1j
	 KpJe1P/ZdhATGEke5pvECHYzRZ/D+bzld2USriqkE0KBei01OUuchRYSIyOsrKscFG
	 bIg5OPuejkZUV3uWV7xM/BSVUFnKGsVZ9Xc476lV59rPs+pyFuB0fAd9yFIL829EQO
	 2twWQ/ODPZPvg==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso8943635e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jan 2024 18:30:37 -0800 (PST)
X-Gm-Message-State: AOJu0YxX6yhz8xaG5mJILeW0UX6IOyPmEWL5Zi7jLJLbOn+HQRKP2jEM
	ZYeovvbS+N3SXyoP/6C9+F8iJLFVdqFyTKMjbAw=
X-Google-Smtp-Source: AGHT+IHk4Mmn7hLXjOxTUGcNNtAWn4r5ukz6BnfIbiBazy0ZxQqLbQjhzaTqcIgKGHVi5UVKzouFRsJReeaqymtkIk8=
X-Received: by 2002:a05:600c:c0a:b0:40d:6221:9944 with SMTP id
 fm10-20020a05600c0c0a00b0040d62219944mr814060wmb.88.1704594636104; Sat, 06
 Jan 2024 18:30:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231227070317.1936234-1-kernel@xen0n.name> <fbefe6e45e23a09e5b63eaac0a07a2fbae4a3845.camel@xry111.site>
 <CAAhV-H44EZpOpnWyZm14QdwTLAPcxM1eNhpoDEsFQbf8=s7-iA@mail.gmail.com>
 <2f1877ed39563b42d41f03ad6d6fdd7ce4137bbb.camel@xry111.site>
 <445a73e3-4e0e-0f03-3719-57975fb95189@loongson.cn> <2abbb633-a10e-71cc-a5e1-4d9e39074066@loongson.cn>
In-Reply-To: <2abbb633-a10e-71cc-a5e1-4d9e39074066@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 7 Jan 2024 10:30:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KteJvRVpj3Hz-Ui9VnmijcJq5D1Tb-KJvqTO_+jjp2Q@mail.gmail.com>
Message-ID: <CAAhV-H7KteJvRVpj3Hz-Ui9VnmijcJq5D1Tb-KJvqTO_+jjp2Q@mail.gmail.com>
Subject: Re: [PATCH] modpost: Ignore relaxation and alignment marker relocs on LoongArch
To: Jinyang He <hejinyang@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, 
	WANG Xuerui <kernel@xen0n.name>, linux-kbuild@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Youling Tang <tangyouling@kylinos.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Xuerui,

Could you please update a V2 to just modify the commit message?

Huacai

On Fri, Jan 5, 2024 at 6:11=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> w=
rote:
>
>
> On 2024-01-05 16:09, Tiezhu Yang wrote:
> >
> >
> > On 01/05/2024 12:26 AM, Xi Ruoyao wrote:
> >> On Thu, 2024-01-04 at 16:57 +0800, Huacai Chen wrote:
> >>> On Wed, Dec 27, 2023 at 7:06=E2=80=AFPM Xi Ruoyao <xry111@xry111.site=
> wrote:
> >>>>
> >>>> On Wed, 2023-12-27 at 15:03 +0800, WANG Xuerui wrote:
> >>>>> And even though the kernel is built with relaxation disabled, so
> >>>>> far a small number of R_LARCH_RELAX marker relocs are still
> >>>>> emitted as
> >>>>> part of la.* pseudo instructions in assembly.
> >>>>
> >>>> I'd consider it a toolchain bug...  Is there a reproducer?
> >>> Any updates? Should I apply this patch for loongarch-next?
> >>
> >> Tiezhu told me this should be reproducible with GCC 14 and Binutils-2.=
42
> >> development snapshots and defconfig.  I'm trying...
> >
> > 1. How to reproduce
> >
> > I update the latest upstream toolchains (20240105):
> >
> > [fedora@linux 6.7.test]$ gcc --version
> > gcc (GCC) 14.0.0 20240105 (experimental)
> > [fedora@linux 6.7.test]$ as --version
> > GNU assembler (GNU Binutils) 2.41.50.20240105
> > [fedora@linux 6.7.test]$ ld --version
> > GNU ld (GNU Binutils) 2.41.50.20240105
> >
> > and then test it again, here is the failure info:
> >
> > [fedora@linux 6.7.test]$ git log --oneline | head -1
> > 610a9b8f49fb Linux 6.7-rc8
> > [fedora@linux 6.7.test]$ make loongson3_defconfig
> > [fedora@linux 6.7.test]$ make
> > ...
> >   AR      built-in.a
> >   AR      vmlinux.a
> >   LD      vmlinux.o
> >   OBJCOPY modules.builtin.modinfo
> >   GEN     modules.builtin
> >   GEN     .vmlinux.objs
> >   MODPOST Module.symvers
> > make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 139
> > make[1]: *** [/home/fedora/6.7.test/Makefile:1863: modpost] Error 2
> > make: *** [Makefile:234: __sub-make] Error 2
> >
> > 2. Additional info
> >
> > I can confirm that the slightly older version of toolchains (20231127)
> > have no the above failure, so I guess this is related with toolchains.
> >
> > 3. How to fix
> >
> > (1) One way is to modify the kernel code, with this kernel patch,
> >     there is no building failure with the latest upstream toolchains.
> > (2) The other way is to analysis and fix the binutils code,
> >     it need more work to do.
>
> Hi,
>
> I have an idea about that, but I didn't really get into it. The improved
> R_LARCH_ALIGN (psABI v2.30) requires a symbol index. The symbol is only
> created at the first time to handle alignment directive. This means that
> all other sections may use this symbol. If the section of this symbol is
> discarded, there may be problems.
>
> Thanks,
>
> Jinyang
>
>
> >
> > Thanks,
> > Tiezhu
> >
>

