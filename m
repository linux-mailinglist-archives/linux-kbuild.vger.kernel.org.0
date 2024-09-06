Return-Path: <linux-kbuild+bounces-3450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E0996F96F
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 18:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7735828354E
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9941D4161;
	Fri,  6 Sep 2024 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCIIdh7M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEDD1D4145;
	Fri,  6 Sep 2024 16:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725640708; cv=none; b=h5Te7y35m4i+yYA1XPOGgKyWqhk/P7d4asWa8Zu6zb3fLk06QPVQ5HV3QKi5OpH309NYGieCtdnPwDBjiS03ZvlC7+GXlkNvg0+Dj/j5+PrSECEIa+nfJBq+uB4eyjBXVJeMa8x4sTr6qjf0fUzT8ulAXSHgcAWR9KW+Vf/imeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725640708; c=relaxed/simple;
	bh=bvsWP8QC/2FZO+T3JPXm/ONQRKmq8PJC1ELStc9NY4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDoaPSHL/ESkPpwRSd/lb8XhhDq6V9z0N1M0UEQav2FINow98HE9UxGhKyZJakiMp8I9ZOMm9UqnODezwjGAYKMGOfKE7ikVDKpdbxCrFj1RoDVQxdXbjBGxxEpqELiIvdFMv6pOwvEAE+3GF/wwi2Ril01fn1fy6GatMztriLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCIIdh7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAD3C4AF09;
	Fri,  6 Sep 2024 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725640708;
	bh=bvsWP8QC/2FZO+T3JPXm/ONQRKmq8PJC1ELStc9NY4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HCIIdh7Ma1BEcvP2K/3J5YMG9UzNL2TnfVrtivcwz3eGOFVMlA8M7FNPIGB18I54b
	 SQ5huGQl0RfbPYKlXe/DTIDyG5TgU5C3wnJ7VPpRTPym0mhvu87V2uC9JZix8mE+yJ
	 zWVpbCcU6iKgUrXSsfT7+pMk1wCmTrPAZrqI2Ux9vIyOuXPeGhgVczDFDRwq102ikL
	 K0Bmdo9Q0FJIyV4sFwzWx/G0rD/IAJv8Z9z1q0VupsAHAQAPi9ofYuPT+krlIPrD6J
	 JNqukKhQ33MWx64hxBFCfsLl8nEbmUkH0E2/q0nu1k36DiohQvQh8Kk0cX2Z+CKdli
	 IhhJVCnc3UBiw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365b6bd901so730222e87.2;
        Fri, 06 Sep 2024 09:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAqvvM1lEX/xDYdz5q9ByG10UrTJ/ElfMv6VUUz654ykGCVYOTHrHroxFXVSM2GzDlHBqqJlw7gw==@vger.kernel.org, AJvYcCWpLY/gCjiT4ZE8hALzFpvX+tgmlD52An6EwdDpeY99i0Dd/pj3Dtex7FRRyZxMGED+q4knd7nnwi6nzI0=@vger.kernel.org, AJvYcCXUy97XxGv0BZ2GgvzM1Pm9hwhV+rLTcjKTna8A7vGn5+0bYcWq69Zb5K7brpCMoe70wmtqGrh7RLvXEtS1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+dg3/ymp1P30nwyQ7RfIKWPt3G1vPaYkFtYy6EbhkjmkuH95V
	cmG0wHGyTtCDQgaPu0WHac9Aya1EyQlM4IpgaDtKCT56PuQnDRyYi9nnhzBwX3HpyezWgouS41h
	FoHoLr6UKqmu4Xkab2kc/Vm8YSlw=
X-Google-Smtp-Source: AGHT+IFkxq/M3vN+/bT3TWHiK7+zQR98ApNs19FcjlfYZ8ntgKUkLGmgGHPEQWPLfformvQV+hdejlFH7HUIafAl4G4=
X-Received: by 2002:a05:6512:2348:b0:52e:7542:f469 with SMTP id
 2adb3069b0e04-536585730a7mr2198159e87.0.1725640707029; Fri, 06 Sep 2024
 09:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809122007.1220219-3-masahiroy@kernel.org>
 <3447459d08dd7ebb58972129cddf1c44@paul-moore.com> <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
 <CAHC9VhSz+kwYOnkfWPHOmoKCRfOjm3_L5xMLeSGVNxq5g=ikww@mail.gmail.com>
 <CAK7LNARj7mx9ZkucABBKujEmwggqZvn+8PZ1e-_ofaa43pfz0Q@mail.gmail.com> <CAHC9VhRhUPTwg2-wsLzGGpbhG_4sH9K5o6Z5D_aLiiO98LgaJQ@mail.gmail.com>
In-Reply-To: <CAHC9VhRhUPTwg2-wsLzGGpbhG_4sH9K5o6Z5D_aLiiO98LgaJQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 01:37:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2M5XsXJ39RS2yQKRiEwZpA8oYQ8u4LipoL1YMHane8w@mail.gmail.com>
Message-ID: <CAK7LNAS2M5XsXJ39RS2yQKRiEwZpA8oYQ8u4LipoL1YMHane8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 1:23=E2=80=AFAM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Sep 6, 2024 at 12:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> > On Sat, Sep 7, 2024 at 12:37=E2=80=AFAM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Fri, Sep 6, 2024 at 11:19=E2=80=AFAM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > > On Tue, Aug 27, 2024 at 6:22=E2=80=AFAM Paul Moore <paul@paul-moore=
.com> wrote:
> > > > > On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > > >
> > > > > > This tool is only used in security/selinux/Makefile.
> > > > > >
> > > > > > There is no reason to keep it under scripts/.
> > > > > >
> > > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > > ---
> > > > > >  scripts/remove-stale-files                                 | 3=
 +++
> > > > > >  scripts/selinux/Makefile                                   | 2=
 +-
> > > > > >  scripts/selinux/genheaders/.gitignore                      | 2=
 --
> > > > > >  scripts/selinux/genheaders/Makefile                        | 3=
 ---
> > > > > >  security/selinux/.gitignore                                | 1=
 +
> > > > > >  security/selinux/Makefile                                  | 7=
 +++++--
> > > > > >  .../selinux/genheaders =3D> security/selinux}/genheaders.c   |=
 0
> > > > > >  7 files changed, 10 insertions(+), 8 deletions(-)
> > > > > >  delete mode 100644 scripts/selinux/genheaders/.gitignore
> > > > > >  delete mode 100644 scripts/selinux/genheaders/Makefile
> > > > > >  rename {scripts/selinux/genheaders =3D> security/selinux}/genh=
eaders.c (100%)
> > > > >
> > > > > As long as there is no harm in keeping genheaders under scripts/s=
elinux,
> > > > > and based on your cover letter it would appear that there is no p=
roblem
> > > > > with the current location, I would prefer to keep it where it cur=
rently
> > > > > lives.
> > > >
> > > > 'make clean' is meant to clean up the tree, but keep
> > > > build artifacts necessary for building external modules.
> > > >
> > > > See the help message:
> > > >
> > > >   clean           - Remove most generated files but keep the config=
 and
> > > >                     enough build support to build external modules
> > > >
> > > > 'make clean' does not clean up under scripts/
> > > > because tools located scripts/ are used in tree-wide
> > > > and often used for external modules as well.
> > > >
> > > > So, scripts/selinux/genheaders/genheaders is left over.
> > > >
> > > > genheaders is locally used in security/selinux/.
> > > >
> > > > 'make clean' will properly clean up security/selinux/genheaders.
> > >
> > > Your last sentence is confusing and doesn't align with the rest of
> > > your email, please clarify.
> >
> > I do not understand what was unclear.
>
> Near the start of your email you stated: "'make clean' does not clean
> up under scripts/".  However you ended your email with "'make clean'
> will properly clean up security/selinux/genheaders" which seems
> contradictory to your initial statement; I was guessing that you were
> implying that moving the genheaders script will allow `make clean` to
> work properly, but you explicitly included the old/existing location
> of security/selinux/genheaders directory in your comment which didn't
> support that guess.


OK, now I understand.


I meant this:


  With this patch applied, 'make clean' will properly clean up
  security/selinux/genheaders.



> Your latest reply makes it a bit more clear.



So, are you ok with the following commit description,
which I proposed in another thread?



--------------->8--------------------
selinux: move genheaders to security/selinux/

This tool is only used in security/selinux/Makefile.

Move it to security/selinux/ so that 'make clean' can clean it up.

Please note 'make clean' does not visit scripts/ because tools under
scripts/ are often used for external module builds. Obviously, genheaders
is not the case here.
--------------->8--------------------














--
Best Regards
Masahiro Yamada

