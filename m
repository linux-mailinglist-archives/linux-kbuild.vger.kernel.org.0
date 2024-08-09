Return-Path: <linux-kbuild+bounces-2922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4DC94D186
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 15:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1A06B21095
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 13:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CCF1946BA;
	Fri,  9 Aug 2024 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b="0+6/pPYo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A6194AD5
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Aug 2024 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723211271; cv=none; b=ttF59Dcjc6/vKcTqKF3afW2Dxru41UQGgPWJT9AR/A12nZ8GWlPsCCcX0r7nNcb1+9kiuZn6BZuBHtEfojNlb107NpQfsX0SaXHwqvcI7Ka2LuJvTM5gp5Ow3nGZhk07rmtjYHVFjzoQuNKanyXYztbVvZbJhddEKe08FQlkRAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723211271; c=relaxed/simple;
	bh=zPBG76iZDhJQn2tTBVBYoO0U+jj9wyZQIHm8xtA5Vzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vGKyM9vr4WyigBiCdbSin7Jz3M2odkhamBxv9bXTTLd4b3BZdTqRVJz8IA+AR+nB8qNHf9zrZzUMoGnka4uNeviW0InBBirRkHy9Bl/9H2tfwB0O7Rz+saZMJS+zVXlCGCcHH9KcqyeZaWALOJT/tIsm5jcmeSaOFlpdv9Bjfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com; spf=pass smtp.mailfrom=kruces.com; dkim=pass (2048-bit key) header.d=kruces-com.20230601.gappssmtp.com header.i=@kruces-com.20230601.gappssmtp.com header.b=0+6/pPYo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kruces.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kruces.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ef95ec938so2198048e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Aug 2024 06:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kruces-com.20230601.gappssmtp.com; s=20230601; t=1723211268; x=1723816068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpHG5jPmqSzzMq80QApgQU2Gxos+KWN9CPGhvKscsRg=;
        b=0+6/pPYoLpooif29kQAyz+oau0vSF0FD6FuEv4n5zKjdTptdSOQGTFqWAxY/LahgRY
         udDGDe7hoe9keBagGn0MqzeBsnztneJSteehJ8fgq5bK8HyIyPNjFBPz2QqE8vxieId6
         P9aBcg+4suQvrqVxGJMYnzixgGg1BymUiyKAWPzWKDii3e43VuCQrrNooCRfudHX9+aS
         8kjECBABiPxImVH8i6McHf4BwKUtTVpLSLUl9oCNkk4RwrWGzJB+izzUHclYvgIsZL3d
         Cfxwow9r2/xCNWfTEcNi9nxWGXcV8LspfstiXCemYY6EPcYFw3eGTh3cgO8QiHJGa1Jf
         b3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211268; x=1723816068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpHG5jPmqSzzMq80QApgQU2Gxos+KWN9CPGhvKscsRg=;
        b=E0GBTo2CZ0B4xFlXdul70ta5UjlRM1W43szaA7kQnLlFuCzYKumqnssCQY2xLiBeWx
         nQztbv8oJ4rtRBTWJ7GFhBJNjr5Q+6Bxc1G8MTNXheXdUchdVbBih2uv9L6lOpKpovkV
         RWj/OFH38Jo6MskmQ9DVo+1pY9ETNW4PNNBZEIhv4kvvQk49cO8bzgMnsU1fp4hT+RIt
         5bAjZCdQoNxW4jQjxbbdU4uE7HqdkBDUBFmLtxTPZBjvGPiHqE2RXFiuNGyMoc0gCmQm
         Y3BE/hOrHMzqm5NiqSBAnVidyI0WnYtNKcqidJXfD4syyupdh4lBNM8qbSeYGCuVRxBy
         u/KA==
X-Forwarded-Encrypted: i=1; AJvYcCXZdHZdJW34Bi6kK/eGUheQoE5rp7Co5U2L0q47XntoCiXS4/62v4CommkIvTfcsCSX6eXfEWCwOX1zgDJJzPQilJvrWlxrr8+mJsK8
X-Gm-Message-State: AOJu0YzLKv0AibESB/wi8l7tgWPXaiAjH4g15tpntnrOhbwDa4E7KpaL
	Ef2vl2WPCVgD19qJ1hFR39kW6Sp3PsLo+/fnvbYfhbKerK5bw3Nap8GlafvnQaylK4ZHsFovgwp
	f8Kib7m4rNhTpMqdwVIjnNM5aKbeGa0nRoXm98Q==
X-Google-Smtp-Source: AGHT+IHRvyhFxRd+8gsq4yU0wWg6PpO4Ch68Ej98GVi8jrDPqmad9RYqQx3J3nljLKafMtNu25HNa4FplBYJma626Jg=
X-Received: by 2002:a05:6512:158d:b0:52e:9b68:d2da with SMTP id
 2adb3069b0e04-530ee96c1b3mr1277926e87.9.1723211267644; Fri, 09 Aug 2024
 06:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-11-4cd1ded85694@samsung.com> <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
In-Reply-To: <CAK7LNARafZ=zFMeoDdiMh=ZRU_XiJ08Naf=oAdYpOiUN02HizQ@mail.gmail.com>
From: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Date: Fri, 9 Aug 2024 15:47:21 +0200
Message-ID: <CABj0suDkth5OY2SEaasyMWvFMnQyjqg=YPiyp38BpP0RdC_hNg@mail.gmail.com>
Subject: Re: [PATCH 11/12] tty/vt: conmakehash requires linux/limits.h
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:15=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Wed, Aug 7, 2024 at 8:10=E2=80=AFAM Daniel Gomez via B4 Relay
> <devnull+da.gomez.samsung.com@kernel.org> wrote:
> >
> > From: Daniel Gomez <da.gomez@samsung.com>
> >
> > macOS hosts do not provide the linux/limits.h header required for
> > conmakehash. To address this, ensure that usr/include is included in
> > the conmakehash HOSTCFLAGS. This will provide the necessary header for
> > successful compilation on macOS.
> >
> > Fixes error:
> > HOSTCC  drivers/tty/vt/conmakehash - due to target missing
> >   clang -Wp,-MMD,drivers/tty/vt/.conmakehash.d -Wall
> > -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
> > -std=3Dgnu11   -I ./scripts/include     -o drivers/tty/vt/conmakehash
> > drivers/tty/vt/conmakehash.c
> > drivers/tty/vt/conmakehash.c:15:10: fatal error: 'linux/
> >    limits.h' file not found 15 | #include <linux/limits.h>    |
> >    ^~~~~~~~~~~~~~~~
>
>
> The error is reported at line 15 of drivers/tty/vt/conmakehash.c
>
>
> The line 15 is #include <stdlib.h>:
>
> https://github.com/torvalds/linux/blob/v6.11-rc1/drivers/tty/vt/conmakeha=
sh.c#L15

The patches were sent using the latest linux-next at the moment of
sending, so next-20240806.
B4 adds the baseline [1] used at the bottom.

[1] base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179

So line 15 is linux/limits.h header in this case:
https://github.com/torvalds/linux/blob/1e391b34f6aa043c7afa40a2103163a0ef06=
d179/drivers/tty/vt/conmakehash.c#L15
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/tty/vt/conmakehash.c?h=3D1e391b34f6aa043c7afa40a2103163a0ef06d179#n15

This patch adds the header:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/tty/vt/conmakehash.c?h=3Dnext-20240809&id=3D6e20753da6bc651e02378a0=
cdb78f16c42098c88

>
>
> So, host programs cannot include <stdlib.h> on your build machine.
>
>
>
> drivers/tty/vt/conmakehash.c has only 5 include directives:
>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sysexits.h>
> #include <string.h>
> #include <ctype.h>
>
>
> You cannot build this, your build machine cannot build anything.
>
>
>
>
>
>
>
>
>
> > 1 error generated.
> > make[5]: *** [scripts/Makefile.host:116: drivers/tty/vt/conmakehash]
> > Error 1
> > make[4]: *** [scripts/Makefile.build:485: drivers/tty/vt] Error 2
> > make[3]: *** [scripts/Makefile.build:485: drivers/tty] Error 2
> > make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
> > make[1]: *** [/Volumes/src/kernel/linux-next/Makefile:1925: .] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> >  drivers/tty/vt/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
> > index 2c8ce8b592ed..d266895357e5 100644
> > --- a/drivers/tty/vt/Makefile
> > +++ b/drivers/tty/vt/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_CONSOLE_TRANSLATIONS)    +=3D consolemap=
.o consolemap_deftbl.o
> >  clean-files :=3D consolemap_deftbl.c defkeymap.c
> >
> >  hostprogs +=3D conmakehash
> > +HOSTCFLAGS_conmakehash.o =3D -I$(srctree)/usr/include
> >
> >  quiet_cmd_conmk =3D CONMK   $@
> >        cmd_conmk =3D $(obj)/conmakehash $< > $@
> >
> > --
> > Git-146)
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

