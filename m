Return-Path: <linux-kbuild+bounces-7523-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1885ADBD79
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jun 2025 01:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D8E174BA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Jun 2025 23:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAA35947;
	Mon, 16 Jun 2025 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HEZttDEt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E69122DA0B
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750115748; cv=none; b=H6JJFCH9z/xE990hFKYDcC/pDIeb+hXnkk7CJgEDyLfuPW3QXaYJloithlUcBvYELhCLRZtLcZ0XDWtR6S8EF9JdaGAi9nwdwTM/psLnO8x1smXeJmrUWtQSIeyzje9O8fLUxmsfG6ldbtiFcUas0vJdAVgl/gslEe6gFUZzEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750115748; c=relaxed/simple;
	bh=EZhupaGE4Npzd5H3TnSspv3tkwaF5M9ODi5h/sBeXb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdsoyUa2EiBvzjssevCmg07dfIe2kPy2OOWmUaJen3bWICO4M902KHzerlM2LghbDMaIVLypQc1nrCUBUC00DYd9yQJiX0CuJQIAI3oR9EaH8rRx6+E1VJ69z+qLdXMO7T5RBx0tKS4uPwCxsUpRaIDR2k5HW6/zZvHPS9Lq8Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HEZttDEt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2357c61cda7so30005ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Jun 2025 16:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750115746; x=1750720546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zsc01ucP5EJdhohWjs+5+CCL8q5JWPn7vP7by9D7M0=;
        b=HEZttDEtqZLc3niUYJkOqSjRKd1aLk8nC5vWIlGH3WKEKcL5kpgPwimC5AeK3re5m5
         X8mDZD58psB7rxXMTu1FfZSQx3xLEIrdCEoi6fDyDH7E3HWbWkIlPtD1D/1uy05ptowb
         BMKa8VdVd6K2gk5zbfedOhfGEtvr7GiL+AHa70ThuO6vjcIf06XR4LMzWtTyWgy3dDnt
         4M2d+fi3DVdraIVKmR86wWllxq2/juAzwHbNFVrk5aBF6qsmMGMbQrP6L9r3XjzelPKt
         3zsSQeMKsBRJwo839Y4IfK22ABE3lgYoARaLYghDGUWtZsrRxvnhzm2LiYBFFAIMbpaY
         8KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750115746; x=1750720546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zsc01ucP5EJdhohWjs+5+CCL8q5JWPn7vP7by9D7M0=;
        b=g/4dvwAShYC6mAI+2l2Y1H/Hlz7Bf9gEX+o57DCOmgeuXzu9MNoE+JqKa81OAeXGCx
         XKc+N3jiaTVKtpIZ7FJx60UHvs3wXhybnQOAEGs/WKtjFDZwJGqNcB1pt+Mru096JNpP
         4awOqo9IGFlwuB08JY4soOAQCh+VZnYZPqFQEJi/5wakcY+b2v45ZPpWRgLwuvQhaGA0
         dGrgTvtPcqBn9VFWhBE/oszYFtbdPB56AUGjZqe/xuMalGFUDN2//O9dIFEEycisT++v
         M6qTEJBv0oFempStVEQBCTbdQyN8MQ1ZFzDEco+mOY+tW6ei7lbfiuyeQQ6K5L1HaUgu
         D39A==
X-Gm-Message-State: AOJu0Yxj7QFSSmz8Om4QgQ/7B8pqZnzlFBfTyKAO+5d0kNtyhVsr4ACP
	m4GmQ9KEoAQcG0sXW5pokol72P3DmTdYsU38PdQ3mqDSfZztuiJUCR6vLAIIIfNuJRYJzocJfjq
	lavaz77XIvmMgzQqZAH4oHJ2xLRpGSRUznc5gNX/r09afiv1zuyZwQD7Zgzk=
X-Gm-Gg: ASbGnctlbkUcWtflzvi97ZPOlvOLfIslkkFebTfKSAxAI5GsXMToRCnjVxBS4kMSEPJ
	AygZnCWWW5aZHlpY3HaleuYpybuiqieP/T0DiN3LU3prBlIr+nEDTeK1mMy4SHrYXv9C28G8ewe
	2/i/ZfhYpurZUDBLD2VrY+cSbtGPO6dqQIsOqpBkiUH/k=
X-Google-Smtp-Source: AGHT+IHGoOmLs306x2XZkeREMWAk6U07o1UJO60ydP0eGx7mGm4AJMO2gKvDHWWKPot6iihtXFE5kO4ZXLZQJ7/CJII=
X-Received: by 2002:a17:902:d2c6:b0:234:a469:62ef with SMTP id
 d9443c01a7336-2366eda3363mr5542775ad.3.1750115745183; Mon, 16 Jun 2025
 16:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAF7b7mo6g46zJMPPBfiUrNosBC+t3TKwWCBCUkh55f+6MiYQBA@mail.gmail.com>
 <CAK7LNAQEq1fMWaFLUt3fbwu5gnG_+Ry=1_mxXCuBk_d1=ykcPQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQEq1fMWaFLUt3fbwu5gnG_+Ry=1_mxXCuBk_d1=ykcPQ@mail.gmail.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Mon, 16 Jun 2025 16:15:09 -0700
X-Gm-Features: AX0GCFsBygYZpAlVF4rQDPwYdQdeJZYHtMjyYEkhb9mvyjypFbAxT1iLnsiYAco
Message-ID: <CAF7b7mrcxrEMRb8K3K1Cn6+kLvr+n6-ipxQHeAU+1Nft01sUbg@mail.gmail.com>
Subject: Re: Generating .cmd files without actually building the kernel?
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:17=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Sat, Jun 7, 2025 at 1:06=E2=80=AFAM Anish Moorthy <amoorthy@google.com=
> wrote:
> >
> > Does anyone know/have ideas on how to do this? I'd like to be able to
> > generate compile_commands.json and browse the kernel code without
> > having to build the whole thing.
>
>
> What a coincidence, I was also thinking about this.
>
> Unlike ninja-build, Makefiles in Kbuild are not structured flat.
>
> So, supporting dry-run mode needs several amendments everywhere,
> (and it is not easily maintainable)
> If interested, RFC exists. [1]
>
> Of course, the complete dry-run is not desired here,
> since we need to generate .*.cmd files at least.
>
>
> I just proto-typed this and attached a patch.
> The implementation is hacky, and I am not sure
> if this should land in the main line.
>
> Please let me know whether the attached patch works for you.
>

Thanks a bunch! First off, sorry for the late response: happened to be
out last week.

The patch appears to work, although it does appear to miss a
relatively small portion of the tree (arch/lib and arch/x86/lib for my
config)

```
$ git checkout v6.15 && make clean && make mrproper
$ make defconfig          # Obv can vary, lmk if you actually want to
repro with my config
$ make compile_commands.json && cp compile_commands.json /tmp/orig

# Apply patch
$ make clean && make mrproper && make defconfig
$ make V=3D3 compile_commands.json

$ git diff /tmp/orig compile_commands.json
https://pastebin.com/tvE9wSVG
```

I will say that I often want to browse the kernel on machines which
have little to no hope of compiling it (my laptop, a raspberry pi) and
would find something like this very useful- even if it's shunted off
to some new dryrun_compile_commands_clean_tree target. But this patch
does look a bit burdensome to maintain, and obviously it's your call
to make. Do let me know if I can somehow help this functionality along
though.

Thanks again!

>
> [1]: https://lore.kernel.org/linux-kbuild/20240819160309.2218114-1-vegard=
.nossum@oracle.com/
>
>
>
>
> >
> > It seems to me that the basic change/hack should be something like
> > [1]. But of course, it's not that simply just applying that patch and
> > then running "make defconfig; make" runs into an error pretty quickly
> >
> > > $ make defconfig
> > > $ make
> > > ...
> > > ./scripts/basic/fixdep scripts/mod/.empty.o.d scripts/mod/empty.o '${=
GCC_COMMAND_HERE}' > scripts/mod/.empty.o.cmd; rm -f scripts/mod/.empty.o.d
> > >fixdep: error opening file: scripts/mod/.empty.o.d: No such file or di=
rectory
> >   HOSTCC  scripts/mod/mk_elfconfig
> >   MKELF   scripts/mod/elfconfig.h
> > > /bin/sh: line 1: scripts/mod/empty.o: No such file or directory
> > > make[2]: *** [scripts/mod/Makefile:25: scripts/mod/elfconfig.h] Error=
 1
> > > make[1]: *** [/usr/local/google/home/amoorthy/linux/Makefile:1271: pr=
epare0] Error 2
> > > make: *** [Makefile:251: __sub-make] Error 2
> >
> > I take it the gcc command itself is generating the .d files, which I
> > guess makes sense given the existence of gcc's -MF flag (though grep's
> > not good enough for me to figure out where we're setting thins). I
> > tried
> >
> > > $ make CFLAGS=3D"-E"
> >
> > too under the theory that this would generate the .o.d files, but this
> > just dies elsewhere
> >
> > >  exec-cmd.c:2:10: fatal error: linux/compiler.h: No such file or dire=
ctory
> >     2 | #include <linux/compiler.h>
> >       |          ^~~~~~~~~~~~~~~~~~
> > > compilation terminated.
> >
> > Anyways, I've spent a fair chunk of time trying to understand the
> > system at this point, but I'm really still just fumbling around:
> > figured I'd try asking for help.
> >
> >
> >
> > [1]
> > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > index 8c311b997e24..a17cdfa7ab72 100644
> > --- a/scripts/Kbuild.include
> > +++ b/scripts/Kbuild.include
> > @@ -208,6 +208,10 @@ cmd_and_fixdep =3D
> >                            \
> >         $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
> > $(dot-target).cmd;\
> >         rm -f $(depfile)
> >
> > +savecmd_and_fixdep =3D
> >            \
> > +       $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' >
> > $(dot-target).cmd;\
> > +       rm -f $(depfile)
> > +
> >  # Usage: $(call if_changed_rule,foo)
> >  # Will check if $(cmd_foo) or any of the prerequisites changed,
> >  # and if so will execute $(rule_foo).
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 4d543054f723..9fcb41f96d89 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -318,7 +318,7 @@ quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $@
> >                 $(cmd_objtool)
> >
> >  define rule_cc_o_c
> > -       $(call cmd_and_fixdep,cc_o_c)
> > +       $(call savecmd_and_fixdep,cc_o_c)
> >         $(call cmd,checksrc)
> >         $(call cmd,checkdoc)
> >         $(call cmd,gen_objtooldep)
> >
>
>
> --
> Best Regards
> Masahiro Yamada

