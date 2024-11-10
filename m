Return-Path: <linux-kbuild+bounces-4616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A55209C3064
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58F81C208EC
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B1D156F44;
	Sun, 10 Nov 2024 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiD6Kljb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F5156F3B;
	Sun, 10 Nov 2024 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202640; cv=none; b=bBZSY0qPi5PBdVWIwV/Kz3GwfLlDE76N5D6U0KUvROVvHwhHb30tz5pn0TDk0psynHV1CvFjn+8ymWvFM2O1+1rFlM2dOY+rUkXMv4hUn4D0DG3pm08jw/YDxtfVyMpMEZZKdGRqzM0payKMYYYX3QmZ41AXaYPu78WQgMfFfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202640; c=relaxed/simple;
	bh=LnNEpa/HZX7mcyixSAXxOl1pf8RoJrB5+xssS5UsWYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opvAoEeDwIiqx8y6xq4/wAS7F+Y294vSzkEpGnLH38cq+KKcaxFykRwrO4bAg3XHUgIm3Ypb6jQMWQblsxkx9hesvstCWqMUsGUtlPMyYaORduuGBUTh6KFUyV0mkPiZMJtdQpLNlf+2OAayNQ9njUbHxhlU7NfpoGa7icVP3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiD6Kljb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192C0C4CECE;
	Sun, 10 Nov 2024 01:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202640;
	bh=LnNEpa/HZX7mcyixSAXxOl1pf8RoJrB5+xssS5UsWYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SiD6KljbSfGpD/jdFVZF8hyNgZl0Kknrd8QbgBnjrovNyibD1hoXz2eHTX8XK6oAM
	 Yl8r8x+J7HBKSsiobDFa3DUvfPOslMRxn0WHFrLLnBHT3SRv6YXfM7nvzeQq/8IrV9
	 kLXilUE9AfRIvys+Hnht+CBPr5yltx2j/x0kRlk8sAuIBUVVCD9PtGOrA+DWlVPS6U
	 XjKuFjo0SVJhwno89JX95R5TrQAxC5fWNVPJnHHP3Yg6nZ6fZ4Sz+GTOs7GTmqe3wy
	 B5bXWB5i5EE07nBBIUAPRGLFk1ZVG/EKA2TECozP70l/4Gl88O2fsl48Zs2SPAOWmK
	 LDcQnPgnZWVeQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so39346991fa.1;
        Sat, 09 Nov 2024 17:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwlxMhwnGgzoS9W7Pi9WNAZwDilrMi+tJKUxyRj4h4z4env1gWhjPIZ3H0j7hX0qop/obdV358v8g5MxCpHGM=@vger.kernel.org, AJvYcCXIpPWyrPBehrbdWtsSUZXFHFBzhS3lD6Yga/j6YfDGNl13bYQOOU8ouBIndK2OSAUV9FE+Jxht8+OUYiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZl+mB1zGhDibdPlIybeEKstqjduOWutj5VQkdNzUnwprkDDqu
	4mg2DXDmqVWR5sweCeVzZqVLiblq3hao3Lzw2OKZjI7x34+gQLkzp+Ma5btkcCiX1MSd5IRb4su
	+cV+R+hbwJGfHEw0egOycBSg49EU=
X-Google-Smtp-Source: AGHT+IFGcfOP77GehGduhNUJLZd7rfR0VkcHzXTghglCpOx8L+pLMx/+vclH+5ddzS35blU1ZXVC62RlVwA0L8iBWbM=
X-Received: by 2002:a2e:bc8b:0:b0:2fa:faed:e86b with SMTP id
 38308e7fff4ca-2ff20981669mr27884461fa.13.1731202638733; Sat, 09 Nov 2024
 17:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-19-masahiroy@kernel.org>
 <20241003-petite-mamba-of-champagne-d9e0ac@lindesnes>
In-Reply-To: <20241003-petite-mamba-of-champagne-d9e0ac@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 10:36:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYW6FtkbFm4V7hW49FoxoFa7rkCv0Hk4hnBwRxvLtYmA@mail.gmail.com>
Message-ID: <CAK7LNARYW6FtkbFm4V7hW49FoxoFa7rkCv0Hk4hnBwRxvLtYmA@mail.gmail.com>
Subject: Re: [PATCH 18/23] kbuild: remove extmod_prefix, MODORDER,
 MODULES_NSDEPS variables
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 3:47=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> On Tue, Sep 17, 2024 at 11:16:46PM +0900, Masahiro Yamada wrote:
> > With the previous changes, $(extmod_prefix), $(MODORDER), and
> > $(MODULES_NSDEPS) are constant. (empty, modules.order, and
> > modules.nsdeps, respectively).
> >
> > Remove these variables and hard-code their values.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile                  | 22 +++++++++-------------
> >  scripts/Makefile.modfinal |  2 +-
> >  scripts/Makefile.modinst  |  2 +-
> >  scripts/Makefile.modpost  |  6 +++---
> >  scripts/nsdeps            |  2 +-
> >  5 files changed, 15 insertions(+), 19 deletions(-)
>
> Do you want to remove these also?  I can't think of a reason to keep thes=
e
> around:
>
> $ git grep -Hrnwe extmod_prefix -e MODORDER -e MODULES_NSDEP
> Makefile:1912:  $(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m=
:%.ko=3D%.o);) } > modules.order
> scripts/Makefile.modfinal:33:$(extmod_prefix).module-common.o: $(srctree)=
/scripts/module-common.c FORCE
> scripts/Makefile.modfinal:60:%.ko: %.o %.mod.o $(extmod_prefix).module-co=
mmon.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES)=
,$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
> scripts/Makefile.modfinal:66:targets +=3D $(modules:%.o=3D%.ko) $(modules=
:%.o=3D%.mod.o) $(extmod_prefix).module-common.o
> scripts/Makefile.modinst:60:modules :=3D $(patsubst $(extmod_prefix)%.o, =
$(dst)/%.ko$(suffix-y), $(modules))
> scripts/Makefile.modinst:120:$(dst)/%.ko: $(extmod_prefix)%.ko FORCE

Right, I will clean up these.



> W/ or w/o:
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>



--
Best Regards
Masahiro Yamada

