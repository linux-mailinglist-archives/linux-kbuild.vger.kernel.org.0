Return-Path: <linux-kbuild+bounces-7050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CADAB0668
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 01:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900C24C1463
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 23:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD7222F17A;
	Thu,  8 May 2025 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X22twWfq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9A22E41D;
	Thu,  8 May 2025 23:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746037; cv=none; b=Ox02LLvexvXkdpd0aiazW8qI+/36FTJe0jIUD0dqAHB3lDZx+sBfqzDVo7v/IA4QaqrUZR1YHLNVwl0PdToRwALrvJ3aeYoOcv2bzBvF4/Vhj0pNTau8lyMOVV8hlo2Qo7/27kxY7gGc2O1zdCk6NKhnqPDxTmxMMoGr2k/lf1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746037; c=relaxed/simple;
	bh=hjPlZNVH1QsTW+M1ibi+er/DnxeysWRGy0qKT0ckYOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hz2th+yhjSiIHVbDlGEPzuYlbhJKIzqU34smcllrw5wKbvYbmP63ZaGU8zpbKIN+3zjfe9jLyKuBKJlu/V4LhNsV6tsQ8JUGNMJDnfVlhn2njNDzp6Bt++Pk6Mi9napHJ3eBuUKcAhAfNh//FXx5HZalotYxGIgBteXzVPidxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X22twWfq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CC9C4AF0B;
	Thu,  8 May 2025 23:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746746036;
	bh=hjPlZNVH1QsTW+M1ibi+er/DnxeysWRGy0qKT0ckYOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X22twWfqpG/sexlXNvqcCxlAW9uJ79XhHp4dG+/sdAiHQso1qB7pv6RIgcn3pOoQp
	 RpAacMWsrPVTImWA47j99b63RKUeobPa/JwWeBGiT1144He1IzOYBdA7SARMGmKrYX
	 65EJZ7d90Cp6E9iiHwEs0z6T/BpU+q99yjhDPHIX6351IRF+mtGYIYJWJE72V5X3sN
	 B0pLO92w7nyRLhjlVobOl5IPwEHUofH4wsG+hGsl92jVFuW9AhckxAmi3AO7unuZ73
	 1Lgy2FbvbzB/tsRSxjQksdOMh7ZrVku6saq5wF7NZ4tUJuGJo4UkndrE8aZ5ZcIH0+
	 4kzXGXA6VLbEw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso1930584e87.1;
        Thu, 08 May 2025 16:13:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3nMTR72MHBo9LEWcSWPn+u1eUuXTtzARiNdj2RoCQ//SexhOiHB2gEReV7cBVuf/2qWVBeXGcnf1Dlbcj1LQ=@vger.kernel.org, AJvYcCUT++TYQxQqw3HfC1RCsFSeqQba4jc2T6npHRhDtkzgSY9XI0CXnMywdtg1h9R+O3TIh+LvsaEGwAcVCQBB@vger.kernel.org, AJvYcCVyYKwT9WXTmrB7V8blFone1iSIIvjTB1g5RJUDDL5+N6GDj6JGQTWr48tCDjrChCQlSMsAIDIg+fAly0vk@vger.kernel.org
X-Gm-Message-State: AOJu0YznBxj5fik5Qht+fI32CEPIQ9QK6aY6aHvuuyZ4ZfE0W8vs4X3y
	MK+ZRTKyLnWE5lgf2iSKMySBPLW3KE+gdxFmfmg2kZmlTviCbKiGNeckk9ytKzxBuYodCbIHjuA
	G3IKF5qeZPCvtgsA6C3RnXAO3epI=
X-Google-Smtp-Source: AGHT+IEu52aNEDzMGo5FyZKwbvtEiRvPDMJolT/k9kW20bfY6GvKL48TekDncNdE3idOerShQ5l7uSs7KgVNI0hwK08=
X-Received: by 2002:a05:6512:4201:b0:54e:81ec:2c83 with SMTP id
 2adb3069b0e04-54fc67c2180mr349351e87.18.1746746035073; Thu, 08 May 2025
 16:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502224512.it.706-kees@kernel.org> <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
 <202505031028.7022F10061@keescook> <CAK7LNAQehmFgB3kJtrkVhUKM1NEXGQrfJ3v3piToh7YV7-3ccw@mail.gmail.com>
 <202505080953.789B3381@keescook>
In-Reply-To: <202505080953.789B3381@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 9 May 2025 08:13:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpGXmWNhoE9wLoP01dn2o7KjhedoqHXm474CoCgwHp2Q@mail.gmail.com>
X-Gm-Features: ATxdqUFSFahQS2gL_GajBAPbhaxcYoPZIWvSTLFfjfLaxGsmrigaOf0HpL69dgs
Message-ID: <CAK7LNAQpGXmWNhoE9wLoP01dn2o7KjhedoqHXm474CoCgwHp2Q@mail.gmail.com>
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

On Fri, May 9, 2025 at 1:56=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, May 09, 2025 at 01:44:09AM +0900, Masahiro Yamada wrote:
> > On Sun, May 4, 2025 at 2:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrot=
e:
> > >
> > > On Sat, May 03, 2025 at 06:39:28PM +0900, Masahiro Yamada wrote:
> > > > On Sat, May 3, 2025 at 7:54=E2=80=AFAM Kees Cook <kees@kernel.org> =
wrote:
> > > > >
> > > > >  v2:
> > > > >   - switch from -include to -I with a -D gated include compiler-v=
ersion.h
> > > > >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@ke=
rnel.org/
> > > >
> > > >
> > > > What do you think of my patch as a prerequisite?
> > > > https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-masah=
iroy@kernel.org/T/#u
> > > > Perhaps, can you implement this series more simply?
> > > >
> > > > My idea is to touch a single include/generated/global-rebuild.h
> > > > rather than multiple files such as gcc-plugins-deps.h, integer-wrap=
.h, etc.
> > > >
> > > > When the file is touched, the entire kernel source tree will be reb=
uilt.
> > > > This may rebuild more than needed (e.g. vdso) but I do not think
> > > > it is a big deal.
> > >
> > > This is roughly where I started when trying to implement this, but I
> > > didn't like the ergonomics of needing to scatter "touch" calls all ov=
er,
> > > which was especially difficult for targets that shared a build rule b=
ut
> > > may not all need to trigger a global rebuild. But what ultimately pus=
hed
> > > me away from it was when I needed to notice if a non-built source fil=
e
> > > changed (the Clang .scl file), and I saw that I need to be dependency
> > > driven rather than target driven. (Though perhaps there is a way to
> > > address this with your global-rebuild.h?)
> > >
> > > As far as doing a full rebuild, if it had been available last week, I
> > > probably would have used it, but now given the work that Nicolas, you=
,
> > > and I have put into this, we have a viable way (I think) to make this
> > > more specific. It does end up being a waste of time/resources to rebu=
ild
> > > stuff that doesn't need to be (efi-stub, vdso, boot code, etc), and t=
hat
> > > does add up when I'm iterating on something that keeps triggering a f=
ull
> > > rebuild. We already have to do the argument filtering for targets tha=
t
> > > don't want randstruct, etc, so why not capitalize on that and make th=
e
> > > rebuild avoid those files too?
> >
> >
> > efi-stub, vdso are very small.
> >
> > Unless this turns out to be painful, I prefer
> > a simpler implementation.
> >
> > You will see how .scl file is handled.
> >
> > See the below code:
> >
> >
> > diff --git a/Kbuild b/Kbuild
> > index f327ca86990c..85747239314c 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -67,10 +67,20 @@ targets +=3D $(atomic-checks)
> >  $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
> >         $(call if_changed,check_sha1)
> >
> > +rebuild-$(CONFIG_GCC_PLUGINS)          +=3D $(addprefix
> > scripts/gcc-plugins/, $(GCC_PLUGIN))
> > +rebuild-$(CONFIG_RANDSTRUCT)           +=3D include/generated/randstru=
ct_hash.h
>
> These are in $(objtree)

Yes.

> > +rebuild-$(CONFIG_UBSAN_INTEGER_WRAP)   +=3D scripts/integer-wrap-ignor=
e.scl
>
> This is in $(srctree)

Yes.

> > +
> > +quiet_cmd_touch =3D TOUCH   $@
> > +      cmd_touch =3D touch $@
> > +
> > +include/generated/global-rebuild.h: $(rebuild-y)
> > +       $(call cmd,touch)
>
> Is this rule going to find the right versions of the dependencies?

I think so, but please test it.


> > --- a/Makefile
> > +++ b/Makefile
> > @@ -558,7 +558,8 @@ USERINCLUDE    :=3D \
> >                 -I$(srctree)/include/uapi \
> >                 -I$(objtree)/include/generated/uapi \
> >                  -include $(srctree)/include/linux/compiler-version.h \
> > -                -include $(srctree)/include/linux/kconfig.h
> > +                -include $(srctree)/include/linux/kconfig.h \
> > +                -include $(objtree)/include/generated/global-rebuild.h
>
> Instead of adding a new file, why not just touch compiler-version.h?

Because the compiler-version.h is in $(srctree), which might be
in the read-only file system.


> But whatever the case, sure, I can live with this. :)
>
> -Kees
>
> --
> Kees Cook



--=20
Best Regards
Masahiro Yamada

