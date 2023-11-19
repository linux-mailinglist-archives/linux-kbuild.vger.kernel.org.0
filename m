Return-Path: <linux-kbuild+bounces-69-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F937F0515
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 11:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3D01C2083B
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 10:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E87E1C3F;
	Sun, 19 Nov 2023 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di5e4jE3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7C6FAB
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 10:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720D7C433C8;
	Sun, 19 Nov 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700388162;
	bh=+g+Ckvo3geMgzNSk2JZmLdMj7hMkxJ292tZLHksu7hU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=di5e4jE3S3cum/CclvGiIisRlNa7GYcVkh6RZrFVMs95wuQDswIucHlPWH3aCjFoO
	 DexpEvkJy1kRsOc9HwEtCL5nIsxqrWE4qQxSwkzN8vtnss1O3SJs47swLpdREIta2j
	 fzh8JvCj1nKxTxrdU797r1487p3XszHE1Isjy36cfABDMNReYeCtabP4FZlRFtdOgG
	 KcPEKIBn6BlInuDwM8D9yEFH98Z5NtJz8F6Mf8bPdmWE47fUi6G1tC2xcyqkxWD0Ig
	 fakMa76IOuVTfOGZ4kf8exBmKQq4vDdjZLHmOEHWJ3P3Hx30GXbXGs9Sk73OPcbHVH
	 UalBuqPOBC6iQ==
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6cd0963c61cso1859102a34.0;
        Sun, 19 Nov 2023 02:02:42 -0800 (PST)
X-Gm-Message-State: AOJu0YyOeba68IFwOg7K1y+G+sR8JkzFY3jyoFStibfTeSOY54/j2czf
	ldlr+qXzRsja0xDipAUgOhjS0SxjSNkfeMqwo4Y=
X-Google-Smtp-Source: AGHT+IFfkyF283gdTQSSFTs7e0LEhVhVaXBt4P15kae1A2LSGv67Rf5RptUnBd6cnwoib8ovwTENLNO5+7QAyZjbbeo=
X-Received: by 2002:a05:6871:d20d:b0:1f5:ef0c:33ab with SMTP id
 pk13-20020a056871d20d00b001f5ef0c33abmr1177013oac.17.1700388161827; Sun, 19
 Nov 2023 02:02:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118075912.1303509-1-masahiroy@kernel.org>
 <20231118075912.1303509-5-masahiroy@kernel.org> <3e879452-bda7-46d9-93fa-0cf01e484798@infradead.org>
In-Reply-To: <3e879452-bda7-46d9-93fa-0cf01e484798@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Nov 2023 19:02:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ+zTVNjYQ=BFm1s7R9i6W=mz1Sy3wamvaHwNxPzuWOfw@mail.gmail.com>
Message-ID: <CAK7LNAQ+zTVNjYQ=BFm1s7R9i6W=mz1Sy3wamvaHwNxPzuWOfw@mail.gmail.com>
Subject: Re: [PATCH 5/6] kconfig: require an exact match for "is not set" to
 disable CONFIG option
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 1:30=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 11/17/23 23:59, Masahiro Yamada wrote:
> > Currently, any string starting "is not set" disables a CONFIG option.
> >
> > For example, "# CONFIG_FOO is not settled down" is accepted as valid
> > input, functioning the same as "# CONFIG_FOO is not set". It is a
> > long-standing oddity.
> >
> > Check the line against the exact pattern "is not set".
> >
>
> Just to confirm (I hope), using:
> CONFIG_FOO=3Dn
>
> will also still work to disable that config option?



Yes.  =3Dn is still supported.


The code diff is
strncmp() -> strcmp().






> Thanks.
>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/confdata.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> > index 795ac6c9378f..958be12cd621 100644
> > --- a/scripts/kconfig/confdata.c
> > +++ b/scripts/kconfig/confdata.c
> > @@ -454,7 +454,7 @@ int conf_read_simple(const char *name, int def)
> >                       if (!p)
> >                               continue;
> >                       *p++ =3D 0;
> > -                     if (strncmp(p, "is not set", 10))
> > +                     if (strcmp(p, "is not set"))
> >                               continue;
> >
> >                       val =3D "n";
>
> --
> ~Randy



--=20
Best Regards
Masahiro Yamada

