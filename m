Return-Path: <linux-kbuild+bounces-4602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D97039C303C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22160281FF6
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245B5219FC;
	Sun, 10 Nov 2024 01:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjfD7tT5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A62914;
	Sun, 10 Nov 2024 01:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202608; cv=none; b=aoIIFKXUvx5jdk0RyQtQYkjmTbaNbMcVTH0ZX+wxY/Cn43x1M5gQrdJVGVfQtful1PayDewRxVM5bF1VlJcluCIuX7Ee2/t24+ZG2pQTtrpBLYD80fpPVSEkGxg3VnxLpiRpAFnki3GyYGZjzk5PXMlLROUxAJoSBSukeBjmsUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202608; c=relaxed/simple;
	bh=E3SoG8k/aV1i85tzOsAGTSFTx7UX87P+OkkgxMcscmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/ThZPjC7w0bsVBMCq7yYhXbVlD9bqbn1bXhZJPoMoq0+87dgonOSIQgBva83h2daDFHTDaD8OjdyKftqS/6r2CI2xBke5lx8Nvh402DA8yO1FhqjnaL0NUtkD1LGEc+PUtsk/xKWPeZV46qfXQdKe57nJC2SpRhe5SZBq5fsbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjfD7tT5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A9EC4AF0B;
	Sun, 10 Nov 2024 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202607;
	bh=E3SoG8k/aV1i85tzOsAGTSFTx7UX87P+OkkgxMcscmY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PjfD7tT5H4nrPo7Zv7gyTmqf7L4ZKnHecPouvsNCD1sF7j/vVlEUxy/6/LeEdwqXX
	 vNyAxsOitUkSDGMuYfjB5y4r1YtvVX9d0EDuFJpJ92deaF/iq3d0YZiz0+jwfufjQB
	 qsFmrzcCxo9XRjrnutJTd9YB5thCddd52fLb861YsDpMbDXdO93125byez+n6r4Jyb
	 NwtPFNQ2MDuijBnmwcs5CVJr7ol6vqLtRO+xMy4r5QtTHB7tI7wySrPqslmlQIyeD9
	 24CSAbYMMlBbCZJMqB2JSlLNah/3C9FLjQ8YC6PXeV/ClFWBzu/wgO+51MzqzSg5WM
	 +hsbZJsSsHdXg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539ee1acb86so3941946e87.0;
        Sat, 09 Nov 2024 17:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpxhFcB432pP50MRCoLfUiVABeu5Ho+Q4HY2ISZsJn/3ZYp6P6N0OYIRQ2/SqgJH9RCpiNH4+tfI+16PI=@vger.kernel.org, AJvYcCWW1aNonlH5GZ2lNxfGd4tsuv5ffz8X8IsWx66MYbo+EPzucNYcVX28YsZqMc7EqiCzHfnxmeT0iAbZh6KVr9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrt49TC1i6RiSm/0pErOfCjkD8Y9btRwex7AG7SR3FtDG9DuBi
	uXVR7a2QXkhD9+04VvMe2V65T2IBg5jMpi6hT9x0vi6Kb32KXvO/9bg3+UHtdbnk26rmnHAGAgI
	FM98Z1mqb2MnlyhK+osrJkTZEiPM=
X-Google-Smtp-Source: AGHT+IHJZnaOjQ6LluQjKywtfMJhzNZE5VsThKb5nWROn77YWDMoMcmvgmQ+tFzkKY38JxdtzJFqABCv4/6tzZr14W0=
X-Received: by 2002:a2e:a541:0:b0:2f7:64b9:ff90 with SMTP id
 38308e7fff4ca-2ff20144c4amr34386481fa.9.1731202606189; Sat, 09 Nov 2024
 17:36:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-20-masahiroy@kernel.org>
 <20241003-mustard-marmot-of-storm-af36a2@lindesnes>
In-Reply-To: <20241003-mustard-marmot-of-storm-af36a2@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Nov 2024 10:36:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5Ay2iTyNwJ957S77ipdP1uLR3vehK+SEh17f3v0B_nw@mail.gmail.com>
Message-ID: <CAK7LNAQ5Ay2iTyNwJ957S77ipdP1uLR3vehK+SEh17f3v0B_nw@mail.gmail.com>
Subject: Re: [PATCH 19/23] kbuild: support building external modules in a
 separate build directory
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 4:47=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> w=
rote:

> > @@ -109,6 +109,9 @@ executed to make module versioning work.
> >               directory where the external module (kbuild file) is
> >               located.
> >
> > +     MO=3D$BUILD_DIR
> > +             Speficies a separate output directory for the external mo=
dule.
>
> s/Speficies/Specifies/

Thanks, I will fix.

>
> > +
> >  2.3 Targets
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/Makefile b/Makefile
> > index 9fbf7ef6e394..b654baa0763a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -134,6 +134,10 @@ ifeq ("$(origin M)", "command line")
> >    KBUILD_EXTMOD :=3D $(M)
> >  endif
> >
> > +ifeq ("$(origin MO)", "command line")
> > +  KBUILD_EXTMOD_OUTPUT :=3D $(MO)
> > +endif
> > +
> >  $(if $(word 2, $(KBUILD_EXTMOD)), \
> >       $(error building multiple external modules is not supported))
>
> Should we also check against multiple output directories?


I do not think so.

When a directory path contains a space,
it should be treated as-is, in general.

However, GNU Make is not good at handling spaces in files paths.

So, this will fail eventually (with a little more obscure way).

$ make O=3Dbuild  M=3Dfs/btrfs MO=3D'/tmp/AA BB/btffs'
Makefile:214: *** failed to create output directory "/tmp/AA BB/btffs".  St=
op.






> > -export building_out_of_srctree srctree VPATH
> > +ifeq ($(realpath $(_vpath)),$(CURDIR))
>
> Just a style consistency question: 'ifeq (,)' with a space after ',' (as =
a few
> lines above) or without as used here?

Maybe, we should keep consistency.

But, this line will be removed in v2.






--
Best Regards
Masahiro Yamada

