Return-Path: <linux-kbuild+bounces-5058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5B9EADD8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B14164B24
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFFA23DEB5;
	Tue, 10 Dec 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tm+okeDN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DA13B59E;
	Tue, 10 Dec 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825990; cv=none; b=A5BtAEvBShl/LdaTSBHkxN2I/yrANKVqVDVWz5jEpA7LuGnd2XlazWcEUPSWxYYKHGjKcb4GrXltRLSelMEZtVGEDfKolLQ50si5UvWu7rPRSd9x8i5QndjnjkW79HovPIAyIKGq1gTPFUqRi4v9eoxGdGaOWiW/ZDPEozQCLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825990; c=relaxed/simple;
	bh=4zBw2rBdGPUxYyv/E+pmylBx3GTXJPQjSMZlfzVoKbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhikajIEPWYv7QvBY6FE/uwJhGucu2PpV38cVkvLj9ibHdN+/9PAPIGwLbHsg06hoHTpTNYSI4sUi+LIArpfHgP3sB/4aJWukpnSkJjaujVxGJwVeyJXxcdQ4AV0uiHR0D//DzmI0j8jbc9dLdB92KgAyvisykGGPWFSHBiefHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tm+okeDN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F87AC4CED6;
	Tue, 10 Dec 2024 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733825990;
	bh=4zBw2rBdGPUxYyv/E+pmylBx3GTXJPQjSMZlfzVoKbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tm+okeDNUnz4kXYuTINavKc8DJdxX185RQxdmZvFIIION7VtWfrz1zbjdtwA5q5yZ
	 cb3y5cMiYQPKJ/+sKQYYaiuNRZhZ//giG6p6Lf5qHr5mLmrhAbgZNePwo6OTWhNC6/
	 Xscfkna5mK8WLTr+WPtP1YoQkxOghuCqiprAj61J1MwUaKZxihRPw7DNrdWH3Z7fYP
	 BhmbA+hAxlYMjwcNNVNSOh+HDCAZguOShW7NlSIr9MClRjgZXJQ3K41TySjGokNA2Q
	 tR2Ep/8++NqBpQUMtvFfLT2Vt5QTYkzfiTf257+Uuy3IufB4oOCBsUtp7LfvU4NzU5
	 HVA1g3RE/kTvg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1673983e87.1;
        Tue, 10 Dec 2024 02:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhpHei0Kjuvp7nJEJyHJTKDnh1/isJZAbPUZ9zokE/j2QvmxT7k4Jc332sptBNQd8s9LAUew8Zk8oIKIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyomIMCh+Bg2TnWkycVz3MkkFSwm7Q2TBhFDVBmeW5iNTGUfxSa
	cdsxiM0f/AGs9eDjMXFNH6i/I8Fmo30keC6bIxVG8h1jcKJyRQSRj4NUk01ZroLLCK/Uj7vGCj1
	KLXZLcVymTHp83XAjQSndLgLxigo=
X-Google-Smtp-Source: AGHT+IFrfqZ4YCWY8rOW01ZzUgxdEOuDTA/JoLGqSPucyYdZ/cYcuflGrQq9hrHi0H2XGAekXnENvQ7eUdreXmlqF2s=
X-Received: by 2002:a05:6512:239e:b0:540:231e:44db with SMTP id
 2adb3069b0e04-540251e8b76mr825681e87.13.1733825989003; Tue, 10 Dec 2024
 02:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241208144622.605523-1-masahiroy@kernel.org> <20241208173119.GA3365428@ax162>
In-Reply-To: <20241208173119.GA3365428@ax162>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2024 19:19:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_jmeJT1-LOuezyrmeV3csShTmT7ve1vLX=UqRe4y70w@mail.gmail.com>
Message-ID: <CAK7LNAT_jmeJT1-LOuezyrmeV3csShTmT7ve1vLX=UqRe4y70w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: suppress stdout from merge_config for silent builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 2:31=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Sun, Dec 08, 2024 at 11:46:14PM +0900, Masahiro Yamada wrote:
> > merge_config does not respect the Make's -s (--silent) option.
> >
> > Let's sink the stdout from merge_config for silent builds.
> >
> > This commit does not cater to the direct invocation of merge_config.sh
> > (e.g. arch/mips/Makefile).
> >
> > Reported-by: Leon Romanovsky <leon@kernel.org>
> > Closes: https://lore.kernel.org/all/e534ce33b0e1060eb85ece8429810f087b0=
34c88.1733234008.git.leonro@nvidia.com/
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Makefile.defconf | 13 +++++++------
> >  scripts/kconfig/Makefile |  4 +++-
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
> > index 226ea3df3b4b..97bc5161d6bf 100644
> > --- a/scripts/Makefile.defconf
> > +++ b/scripts/Makefile.defconf
> > @@ -1,6 +1,11 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Configuration heplers
> >
> > +cmd_merge_fragments =3D \
> > +     $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> > +     $4 -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$2 \
> > +     $(foreach config,$3,$(srctree)/arch/$(SRCARCH)/configs/$(config).=
config)
> > +
> >  # Creates 'merged defconfigs'
> >  # --------------------------------------------------------------------=
-------
> >  # Usage:
> > @@ -8,9 +13,7 @@
> >  #
> >  # Input config fragments without '.config' suffix
> >  define merge_into_defconfig
> > -     $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> > -             -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) =
\
> > -             $(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/=
$(config).config)
> > +     $(call cmd,merge_fragments,$1,$2)
> >       +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >  endef
> >
> > @@ -22,8 +25,6 @@ endef
> >  #
> >  # Input config fragments without '.config' suffix
> >  define merge_into_defconfig_override
> > -     $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> > -             -Q -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(=
1) \
> > -             $(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/=
$(config).config)
> > +     $(call cmd,merge_fragments,$1,$2,-Q)
> >       +$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >  endef
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index a0a0be38cbdc..fb50bd4f4103 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -105,9 +105,11 @@ configfiles =3D $(wildcard $(srctree)/kernel/confi=
gs/$(1) $(srctree)/arch/$(SRCARC
> >  all-config-fragments =3D $(call configfiles,*.config)
> >  config-fragments =3D $(call configfiles,$@)
> >
> > +cmd_merge_fragments =3D $(srctree)/scripts/kconfig/merge_config.sh -m =
$(KCONFIG_CONFIG) $(config-fragments)
>
> Did you mean to drop $(CONFIG_SHELL) here? I noticed you kept it in the
> other command.

For consistency, I will remove CONFIG_SHELL from both.
Thanks.



--=20
Best Regards
Masahiro Yamada

