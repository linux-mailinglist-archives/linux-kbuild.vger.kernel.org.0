Return-Path: <linux-kbuild+bounces-92-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D67427F2317
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 02:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FAF028225F
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 01:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90F61C04;
	Tue, 21 Nov 2023 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5VuxMPM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFE6FB5
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 01:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5AFC433CD;
	Tue, 21 Nov 2023 01:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700530372;
	bh=MgA2L3AjHphGyfK8GPBa2xn0Jwg5gkiGiIeE3G9xY4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h5VuxMPM/OimVDCsN/AE1dpWTgAsBmt6J9+DZGy7SfBVfd8AU5NSGl2AfXT7DU9nV
	 WHStAPRZONID1muiYi5Qqu/aQ1jDYV/cVYFNIcfm4mr5bthoXGGGmrBGj0FCb7DDVM
	 P2AvsPvC7FxcSrqImicermj31k469tDfNov5cK4zqP+zIJPcRLU1ca4udIDIT7YW3N
	 kWDdlAgZhCsSc9W6H2q8WCCRFIl3v8tOhqfmeSfbi4L4IHU/YURPnUCNmV/u4EOonG
	 t6grZ6eYYrUIR9/+WdGBF1UZlrY4uRbJMPVOWxgcyhPReHlOvZhO3DzMpy5xw9iP80
	 yVrC73JEus2aw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c603e2354fso950766466b.1;
        Mon, 20 Nov 2023 17:32:52 -0800 (PST)
X-Gm-Message-State: AOJu0YzpCKb6dhI+Az6r1WCM17YKszplEMUGqysNCvNMPtdbn/bYbXcz
	97646IvZCPTiFKtIuCXrUa37qxE57jX8XhZg+Lw=
X-Google-Smtp-Source: AGHT+IHQ//yd2NAdWXmNVsZcGtdgZJwZbXFwxtS3hDn2Brzdx0CH9BCAaRj1zmVI8KKvYZZIkFSnbYzsi6am60h0UbU=
X-Received: by 2002:a17:906:2da:b0:9fd:78:8b2f with SMTP id
 26-20020a17090602da00b009fd00788b2fmr1071131ejk.7.1700530370721; Mon, 20 Nov
 2023 17:32:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116130331.241395-1-wangrui@loongson.cn> <20231120230817.GA2116806@dev-arch.thelio-3990X>
In-Reply-To: <20231120230817.GA2116806@dev-arch.thelio-3990X>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Nov 2023 09:32:37 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7tUKiJVR=9YxwnaSk3Ru1k=4Nd-TUgaMDBCq+xGnLkrA@mail.gmail.com>
Message-ID: <CAAhV-H7tUKiJVR=9YxwnaSk3Ru1k=4Nd-TUgaMDBCq+xGnLkrA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Record pc instead of offset in la-abs relocation
To: Nathan Chancellor <nathan@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Jinyang He <hejinyang@loongson.cn>, Xi Ruoyao <xry111@xry111.site>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied to loongarch-fixes, thanks.

Huacai

On Tue, Nov 21, 2023 at 7:08=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rui,
>
> On Thu, Nov 16, 2023 at 09:03:31PM +0800, WANG Rui wrote:
> > To clarify, the previous version functioned flawlessly. However, it's
> > worth noting that the LLVM's LoongArch backend currently lacks support
> > for cross-section label calculations. With this patch, we enable the us=
e
> > of clang to compile relocatable kernels.
> >
> > Signed-off-by: WANG Rui <wangrui@loongson.cn>
>
> Thanks a lot for the patch! This fixes the CONFIG_RELOCATABLE build for
> me as well.
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> Something I noticed while testing is that a kernel linked with ld.lld
> does not boot while one linked with ld.bfd did. I think this might be
> the same issue that Xuerui filed on our issue tracker but I figured I
> would mention it in case not:
> https://github.com/ClangBuiltLinux/linux/issues/1883
>
> Cheers,
> Nathan
>
> > ---
> >  arch/loongarch/include/asm/asmmacro.h | 3 +--
> >  arch/loongarch/include/asm/setup.h    | 2 +-
> >  arch/loongarch/kernel/relocate.c      | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/inc=
lude/asm/asmmacro.h
> > index c9544f358c33..655db7d7a427 100644
> > --- a/arch/loongarch/include/asm/asmmacro.h
> > +++ b/arch/loongarch/include/asm/asmmacro.h
> > @@ -609,8 +609,7 @@
> >       lu32i.d \reg, 0
> >       lu52i.d \reg, \reg, 0
> >       .pushsection ".la_abs", "aw", %progbits
> > -     768:
> > -     .dword  768b-766b
> > +     .dword  766b
> >       .dword  \sym
> >       .popsection
> >  #endif
> > diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/includ=
e/asm/setup.h
> > index a0bc159ce8bd..ee52fb1e9963 100644
> > --- a/arch/loongarch/include/asm/setup.h
> > +++ b/arch/loongarch/include/asm/setup.h
> > @@ -25,7 +25,7 @@ extern void set_merr_handler(unsigned long offset, vo=
id *addr, unsigned long len
> >  #ifdef CONFIG_RELOCATABLE
> >
> >  struct rela_la_abs {
> > -     long offset;
> > +     long pc;
> >       long symvalue;
> >  };
> >
> > diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/r=
elocate.c
> > index 6c3eff9af9fb..288b739ca88d 100644
> > --- a/arch/loongarch/kernel/relocate.c
> > +++ b/arch/loongarch/kernel/relocate.c
> > @@ -52,7 +52,7 @@ static inline void __init relocate_absolute(long rand=
om_offset)
> >       for (p =3D begin; (void *)p < end; p++) {
> >               long v =3D p->symvalue;
> >               uint32_t lu12iw, ori, lu32id, lu52id;
> > -             union loongarch_instruction *insn =3D (void *)p - p->offs=
et;
> > +             union loongarch_instruction *insn =3D (void *)p->pc;
> >
> >               lu12iw =3D (v >> 12) & 0xfffff;
> >               ori    =3D v & 0xfff;
> > --
> > 2.42.1
> >
> >

