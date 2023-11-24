Return-Path: <linux-kbuild+bounces-154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF17F6FFA
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 10:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84FF0B20E66
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Nov 2023 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A513A156E4;
	Fri, 24 Nov 2023 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccn9F/DG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E5D5676
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 09:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEED8C433C9
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700818472;
	bh=NbY4fpD1XQXiRbnX/KNzTkk87hGMmg3PUTFXt6O5jkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ccn9F/DGrgipQa1XuWpbefaMW5uetivMXv+3REaSlDCKkvvhgCCL6zdUo9A3P9xBa
	 FeBZ7DeB1TrRUk0Eb0U0SCtipw/hr36jGUJdoMCEEBeEMyg+x7du7qUXmceL4DbgMQ
	 7pxRnEIPjjfoSEvc+gDqufpnS0a1VPnbgpbAzPXrHLYALkT0QZRVqRhHwlg8UlWz1M
	 cjOsRBsfSa+387dcB7gBS3OQwAlkrVy5AeDdjaZZVkRez359Ry/WVp8ftoyAIblJBo
	 Rg+rYZcI6AQ9nZkV0LlVEcccXysVrwuSqry3t6sR8ZshZoIqwUSi24HPZoaoI83L0O
	 cmtUxVR9HbgFg==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce2c5b2154so976763a34.3
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Nov 2023 01:34:31 -0800 (PST)
X-Gm-Message-State: AOJu0YxrnNUkvtxDRkPOXwwRp4czxRKEsmNNesINftrcmOjK4yFcjGZa
	iBZ2AyPijHJ/REc8+4he6Nwyh9E+DC1ZzWW4xMk=
X-Google-Smtp-Source: AGHT+IEnuzJjpxOXAK/L5JXSFBb28EcY2SNxJKXCL8Bx3bGD1i22JulFPDubzWfU+vUk5jI9vGDD2NlV3Z0t7OmTpPY=
X-Received: by 2002:a05:6870:910a:b0:1ef:f127:34fa with SMTP id
 o10-20020a056870910a00b001eff12734famr2261456oae.57.1700818471309; Fri, 24
 Nov 2023 01:34:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121115855.111358-1-pvorel@suse.cz> <20231121133740.GA126856@pevik>
In-Reply-To: <20231121133740.GA126856@pevik>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 24 Nov 2023 18:33:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARo3FKQM1esdzk60TRPn1joVZ2SRVCcuUJ+r9DEPzLtfw@mail.gmail.com>
Message-ID: <CAK7LNARo3FKQM1esdzk60TRPn1joVZ2SRVCcuUJ+r9DEPzLtfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: builddeb: Remove unused $dirs
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 10:37=E2=80=AFPM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi,
>
> I could have added some description, e.g. "shell variable $dirs is not us=
ed any
> more since 1fc9095846cc, therefore remove it".
>
> Please let me know if I should resent it as v2.
>
> Kind regards,
> Petr
>
> > Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in scripts/Makefil=
e.package")
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>



I filled the commit log and fixed the commit subject
"kbuild: builddeb:" to "kbuild: buildtar:".





Author: Petr Vorel <pvorel@suse.cz>
Date:   Tue Nov 21 12:58:54 2023 +0100

    kbuild: buildtar: Remove unused $dirs

    The shell variable $dirs is not used any more since 1fc9095846cc
    ("kbuild: tar-pkg: use tar rules in scripts/Makefile.package"),
    therefore remove it".

    Fixes: 1fc9095846cc ("kbuild: tar-pkg: use tar rules in
scripts/Makefile.package")
    Signed-off-by: Petr Vorel <pvorel@suse.cz>
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



Thanks.




> > ---
> >  scripts/package/buildtar | 2 --
> >  1 file changed, 2 deletions(-)
>
> > diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> > index 65b4ea502962..8ac075dd0e9c 100755
> > --- a/scripts/package/buildtar
> > +++ b/scripts/package/buildtar
> > @@ -23,7 +23,6 @@ tmpdir=3D$1
>
> >  rm -rf -- "${tmpdir}"
> >  mkdir -p -- "${tmpdir}/boot"
> > -dirs=3Dboot
>
>
>
> > @@ -42,7 +41,6 @@ fi
>
> >  if grep -q '^CONFIG_MODULES=3Dy' include/config/auto.conf; then
> >       make ARCH=3D"${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH=3D"=
${tmpdir}" modules_install
> > -     dirs=3D"$dirs lib"
> >  fi



--=20
Best Regards
Masahiro Yamada

