Return-Path: <linux-kbuild+bounces-237-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6B80221E
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 686D2280F06
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A94138C;
	Sun,  3 Dec 2023 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqlW4Wzz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716AA6FB9
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 09:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46F0C433C9;
	Sun,  3 Dec 2023 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701594227;
	bh=/m4mHtHGOL+crjtJjRxsecSylMbkbNNuLEgBcv9uqug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JqlW4WzzYiQA8IvJvRyJCoQjfBevizDkHFUMPIL9/3WNjpjhZKlu9GgdEXwasOwub
	 T2A34KhkC/iN4CKEYXdCSH92MBvYeONoB2lFvVd27sDIZJXUC30nTuzCrRVAd4ulsr
	 xDuAKAwzL+CEKxRxsnzAjlceMvVOQR97JDax4J61h9p+rHyrbGm9dndqiqwe57ZPhB
	 RPsF17XTsSaZ0FpMC9cPPjlHH2A//ytpPOjpB3xFXfV1txNqnaO5XwjFAdzBMAn0yZ
	 S+sO+hvbyyoWd5kOT112kjTNP+iOGu/cnCJhPW56gWzj4DBCwm3t7DOlHM4+wfQ0YF
	 5Pa5Bx36kH0Ig==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f5da5df68eso1820430fac.2;
        Sun, 03 Dec 2023 01:03:47 -0800 (PST)
X-Gm-Message-State: AOJu0Yz/SFYQzt2IhlaDya3Ffx8/2aXRmOZeS37H1cLKaUKJBF54Chfc
	iQSVcE9G872sOP2SoRDgniKFgOHzJO2LNwXq/zw=
X-Google-Smtp-Source: AGHT+IEK0YYoGdnJuRe2barg1po45t9xG9ZcnazYxO+P3J1BffAVP254RUwPnAMxc9GjG/xjk2K145tZn/vXZ1VjIrA=
X-Received: by 2002:a05:6871:2314:b0:1fb:75b:12fb with SMTP id
 sf20-20020a056871231400b001fb075b12fbmr2808307oab.77.1701594227210; Sun, 03
 Dec 2023 01:03:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125103116.797608-1-masahiroy@kernel.org> <20231125103116.797608-3-masahiroy@kernel.org>
 <20231130003207.GD2513828@dev-arch.thelio-3990X>
In-Reply-To: <20231130003207.GD2513828@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 3 Dec 2023 18:03:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxdJ6b1RYjOin2Ni991LU68rOd=OonRemrardTWMZ=Pg@mail.gmail.com>
Message-ID: <CAK7LNATxdJ6b1RYjOin2Ni991LU68rOd=OonRemrardTWMZ=Pg@mail.gmail.com>
Subject: Re: [PATCH 3/3] modpost: move exit(1) for fatal() to modpost.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 9:32=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sat, Nov 25, 2023 at 07:31:16PM +0900, Masahiro Yamada wrote:
> > fatal() never returns, but compilers are not aware of this fact because
> > exit(1) is called within the modpost_log() definition.
> >
> > Move exit(1) to the fatal() macro so that compilers can identify
> > unreachable code flows.
> >
> > Remove the initializer for 'taddr' in section_rel(), as compilers now
> > recognize this is not an uninitialized bug.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> While I did not see any warnings when testing, it seems like this patch
> should come before patch 2 to avoid any potential problems from dropping
> the unreachable code (since the compiler won't be able to infer that
> fatal() is __noreturn without this change); doesn't really matter though
> so:


My eyes spotted 2/3, but I can swap the patch order
and rephase the patch description because clang can
detect the unreachable code.













> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >
> >  scripts/mod/modpost.c | 4 +---
> >  scripts/mod/modpost.h | 2 +-
> >  2 files changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 013fc5031bc7..696c583a14ec 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -84,8 +84,6 @@ void modpost_log(enum loglevel loglevel, const char *=
fmt, ...)
> >       vfprintf(stderr, fmt, arglist);
> >       va_end(arglist);
> >
> > -     if (loglevel =3D=3D LOG_FATAL)
> > -             exit(1);
> >       if (loglevel =3D=3D LOG_ERROR)
> >               error_occurred =3D true;
> >  }
> > @@ -1415,7 +1413,7 @@ static void section_rel(struct module *mod, struc=
t elf_info *elf,
> >
> >       for (rel =3D start; rel < stop; rel++) {
> >               Elf_Sym *tsym;
> > -             Elf_Addr taddr =3D 0, r_offset;
> > +             Elf_Addr taddr, r_offset;
> >               unsigned int r_type, r_sym;
> >               void *loc;
> >
> > diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> > index 9fe974dc1a52..aaa67b24775e 100644
> > --- a/scripts/mod/modpost.h
> > +++ b/scripts/mod/modpost.h
> > @@ -215,4 +215,4 @@ modpost_log(enum loglevel loglevel, const char *fmt=
, ...);
> >   */
> >  #define warn(fmt, args...)   modpost_log(LOG_WARN, fmt, ##args)
> >  #define error(fmt, args...)  modpost_log(LOG_ERROR, fmt, ##args)
> > -#define fatal(fmt, args...)  modpost_log(LOG_FATAL, fmt, ##args)
> > +#define fatal(fmt, args...)  do { modpost_log(LOG_FATAL, fmt, ##args);=
 exit(1); } while (1)
> > --
> > 2.40.1
> >
>


--=20
Best Regards
Masahiro Yamada

