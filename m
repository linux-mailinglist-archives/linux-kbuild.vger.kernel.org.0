Return-Path: <linux-kbuild+bounces-7095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE9AB57A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 16:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4E887A2D3E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 14:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04F31CEAA3;
	Tue, 13 May 2025 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Idosnr1F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775861C84A0;
	Tue, 13 May 2025 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148005; cv=none; b=BOCRR1O8HrzIl2Z69NGQs034Mzx1GXxzO26k+uHcgymTnMjoR9r3DDRnWVebuD/08lKo2a/JgwFmFh6fl5msqqS5DDN3sC5RMYCxfhuBmpWFBkxQOW/N9KXNdP6d9imTfb1PJfDpTNqlwGU74b+jiWVp0OojBhZL+zrBUV3ATmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148005; c=relaxed/simple;
	bh=RhDtWE1dVV9lPXiQK9A9HDu8CZaHny/NUuaK7oa/KgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct88rRKGiEgDlIQ52lzfFyK9goXGjWP0ILr/+32mOlMQ2SZE8CsgNJ3yUAK7dt7at35D76fW0E0JSnBPZ70kHtxPKQc/MUDlQUnnyPghyW2UUrPucI/CcAg64cB5hgJeTQDZ2nYLGubPUeDEVlx4JD5+sHpPG7ySoq9GT6pM5YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Idosnr1F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A18C4CEF4;
	Tue, 13 May 2025 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747148004;
	bh=RhDtWE1dVV9lPXiQK9A9HDu8CZaHny/NUuaK7oa/KgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Idosnr1FBh/PpuspF5gsgf+OXpLUJk7tk7G9iyI7eXjt8+5sI0Jj3i7yS3nrtjZD4
	 OE1qCdYVmdc2Rdz5+/DKeuRDlgxg2RVSar2Mtr9O9qsWC+FqVXcUsofMBImGYpmGrM
	 PJUKx4G5GTAXfFOCFXLIma+rTTxwHc6bpupNg5q9Mwgk2VYUxJQqvNW1j/1HBB6LSF
	 fUUH/0YwbwVnwh9UzDf/qT6wb/uqU9CLHM5HcvWcQH1+VT9013b9kpFko+P51TY4td
	 otQR8NOFk1f+Lz+UOOQJLcUjwsIvc25o4hOp7aPqlOxyuT0MrlOjXVuZ3CfZrn8ZlL
	 phAoY/akZusPQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-550d4b7a076so186702e87.2;
        Tue, 13 May 2025 07:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLl1PFlbQ5gy3Xgab5MAywkS2p73dfGryD5hMSurxAiou0C/gZmufINnpKH7LCJQCP/wAHezBg0b0oL3ag@vger.kernel.org, AJvYcCX0lI5RdycgFr31m53eKQ4PQm5vCz3GbhebkAzXGGyJSE6Z0VPYAkE5wwn9LhiR7a2jy+Ql2IfPXiMC3s3R@vger.kernel.org, AJvYcCXncjo9N9P2j4OsY0kDsFfJUzcWzWE8u7tb8RaoIh/I/supa8mzyvUh4SUrDQ8s5750E7gdwNRAIW2IUT5tXfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6RABQRqiKoXWGaKi+/jqikuMKEh8jSwcbPWp9HbAbxwJLcY1e
	0TWPDKaDEiKsT8lOnCGVsOa21sS8ZUj4ZBKzW0Jnu2q+f8VRipNfcAneOHjIL4djFeNSJMQb0bV
	Gze94QYW+Pw7I+A9jyRB+ekFB7h0=
X-Google-Smtp-Source: AGHT+IHK50oaHFtMBbMleHyqUaAbKlFx84gNC0cIJBrr7mvss1OwFx5aKOvcnFFtEC9IKk6w4XcLUT3LfIl4bLObABQ=
X-Received: by 2002:a05:6512:2619:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-54fc67b7bb6mr4265580e87.13.1747148003495; Tue, 13 May 2025
 07:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502224512.it.706-kees@kernel.org> <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
 <202505031028.7022F10061@keescook> <CAK7LNAQehmFgB3kJtrkVhUKM1NEXGQrfJ3v3piToh7YV7-3ccw@mail.gmail.com>
 <202505080953.789B3381@keescook> <CAK7LNAQpGXmWNhoE9wLoP01dn2o7KjhedoqHXm474CoCgwHp2Q@mail.gmail.com>
 <202505081651.EAF0C6B@keescook>
In-Reply-To: <202505081651.EAF0C6B@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 May 2025 23:52:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQa_ZX=ULUgu+_YNe=A+4kgaZakzdM2Y6QPSWWfnEA2JQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWQSZF1ok9-cTyrGeb3aw8P4Ea1DCgPaNu4qIZQbEPezGGKicgvHdcmqc
Message-ID: <CAK7LNAQa_ZX=ULUgu+_YNe=A+4kgaZakzdM2Y6QPSWWfnEA2JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Detect changed compiler dependencies for full rebuild
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:59=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, May 09, 2025 at 08:13:18AM +0900, Masahiro Yamada wrote:
> > On Fri, May 9, 2025 at 1:56=E2=80=AFAM Kees Cook <kees@kernel.org> wrot=
e:
> > >
> > > On Fri, May 09, 2025 at 01:44:09AM +0900, Masahiro Yamada wrote:
> > > > On Sun, May 4, 2025 at 2:37=E2=80=AFAM Kees Cook <kees@kernel.org> =
wrote:
> > > > >
> > > > > On Sat, May 03, 2025 at 06:39:28PM +0900, Masahiro Yamada wrote:
> > > > > > On Sat, May 3, 2025 at 7:54=E2=80=AFAM Kees Cook <kees@kernel.o=
rg> wrote:
> > > > > > >
> > > > > > >  v2:
> > > > > > >   - switch from -include to -I with a -D gated include compil=
er-version.h
> > > > > > >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kee=
s@kernel.org/
> > > > > >
> > > > > >
> > > > > > What do you think of my patch as a prerequisite?
> > > > > > https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-m=
asahiroy@kernel.org/T/#u
> > > > > > Perhaps, can you implement this series more simply?
> > > > > >
> > > > > > My idea is to touch a single include/generated/global-rebuild.h
> > > > > > rather than multiple files such as gcc-plugins-deps.h, integer-=
wrap.h, etc.
> > > > > >
> > > > > > When the file is touched, the entire kernel source tree will be=
 rebuilt.
> > > > > > This may rebuild more than needed (e.g. vdso) but I do not thin=
k
> > > > > > it is a big deal.
> > > > >
> > > > > This is roughly where I started when trying to implement this, bu=
t I
> > > > > didn't like the ergonomics of needing to scatter "touch" calls al=
l over,
> > > > > which was especially difficult for targets that shared a build ru=
le but
> > > > > may not all need to trigger a global rebuild. But what ultimately=
 pushed
> > > > > me away from it was when I needed to notice if a non-built source=
 file
> > > > > changed (the Clang .scl file), and I saw that I need to be depend=
ency
> > > > > driven rather than target driven. (Though perhaps there is a way =
to
> > > > > address this with your global-rebuild.h?)
> > > > >
> > > > > As far as doing a full rebuild, if it had been available last wee=
k, I
> > > > > probably would have used it, but now given the work that Nicolas,=
 you,
> > > > > and I have put into this, we have a viable way (I think) to make =
this
> > > > > more specific. It does end up being a waste of time/resources to =
rebuild
> > > > > stuff that doesn't need to be (efi-stub, vdso, boot code, etc), a=
nd that
> > > > > does add up when I'm iterating on something that keeps triggering=
 a full
> > > > > rebuild. We already have to do the argument filtering for targets=
 that
> > > > > don't want randstruct, etc, so why not capitalize on that and mak=
e the
> > > > > rebuild avoid those files too?
> > > >
> > > >
> > > > efi-stub, vdso are very small.
> > > >
> > > > Unless this turns out to be painful, I prefer
> > > > a simpler implementation.
> > > >
> > > > You will see how .scl file is handled.
> > > >
> > > > See the below code:
> > > >
> > > >
> > > > diff --git a/Kbuild b/Kbuild
> > > > index f327ca86990c..85747239314c 100644
> > > > --- a/Kbuild
> > > > +++ b/Kbuild
> > > > @@ -67,10 +67,20 @@ targets +=3D $(atomic-checks)
> > > >  $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
> > > >         $(call if_changed,check_sha1)
> > > >
> > > > +rebuild-$(CONFIG_GCC_PLUGINS)          +=3D $(addprefix
> > > > scripts/gcc-plugins/, $(GCC_PLUGIN))
> > > > +rebuild-$(CONFIG_RANDSTRUCT)           +=3D include/generated/rand=
struct_hash.h
> > >
> > > These are in $(objtree)
> >
> > Yes.
> >
> > > > +rebuild-$(CONFIG_UBSAN_INTEGER_WRAP)   +=3D scripts/integer-wrap-i=
gnore.scl
> > >
> > > This is in $(srctree)
> >
> > Yes.
> >
> > > > +
> > > > +quiet_cmd_touch =3D TOUCH   $@
> > > > +      cmd_touch =3D touch $@
> > > > +
> > > > +include/generated/global-rebuild.h: $(rebuild-y)
> > > > +       $(call cmd,touch)
> > >
> > > Is this rule going to find the right versions of the dependencies?
> >
> > I think so, but please test it.
>
> The patch was white-space damaged and wrapped, but I rebuilt it manually
> and it mostly works. There still seems to be some ordering issues, as
> some stuff gets rebuilt on a record build:
>
> # Clean the tree and pick an "everything" build
> $ make O=3Dgcc-test clean allmodconfig -s
>
> # Make a target normally
> $ make O=3Dgcc-test kernel/seccomp.o -s
>
> # Touch a gcc plugin that was in .config
> $ touch scripts/gcc-plugins/stackleak_plugin.c
>
> # Build and a full rebuild is triggered (good)
> $ make O=3Dgcc-test kernel/seccomp.o
> make[1]: Entering directory '/srv/code/gcc-test'
>   GEN     Makefile
>   DESCEND objtool
>   HOSTCXX scripts/gcc-plugins/stackleak_plugin.so
>   INSTALL libsubcmd_headers
>   TOUCH   include/generated/global-rebuild.h
>   CC      kernel/bounds.s
>   CC      arch/x86/kernel/asm-offsets.s
>   CALL    ../scripts/checksyscalls.sh
>   CC      kernel/seccomp.o
> make[1]: Leaving directory '/srv/code/gcc-test'
>
> # Build again, but more stuff gets built
> $ make O=3Dgcc-test kernel/seccomp.o
> make[1]: Entering directory '/srv/code/gcc-test'
>   GEN     Makefile
>   DESCEND objtool
>   CC      scripts/mod/empty.o
>   CC      scripts/mod/devicetable-offsets.s
>   INSTALL libsubcmd_headers
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTCC  scripts/mod/symsearch.o
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTLD  scripts/mod/modpost
>   CALL    ../scripts/checksyscalls.sh
> make[1]: Leaving directory '/srv/code/gcc-test'
>
> # Third time finally everything is stable
> $ hmake O=3Dgcc-test kernel/seccomp.o
> make[1]: Entering directory '/srv/code/gcc-test'
>   GEN     Makefile
>   DESCEND objtool
>   CALL    ../scripts/checksyscalls.sh
>   INSTALL libsubcmd_headers
> make[1]: Leaving directory '/srv/code/gcc-test'
>
>
> Note that scripts/mod/* gets rebuilt on the second rebuild.

Hmm.
OK, my code did not work.

I accept your patch set (although I am not a big fan
of the added complexity...)

Could you move the normalize_path macro
to scripts/Kbuild?


--=20
Best Regards
Masahiro Yamada

