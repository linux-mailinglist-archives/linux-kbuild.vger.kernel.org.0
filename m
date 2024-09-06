Return-Path: <linux-kbuild+bounces-3448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586F96F903
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 18:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11873280F91
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26801D31B4;
	Fri,  6 Sep 2024 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE6rhNI8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72996156880;
	Fri,  6 Sep 2024 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725638811; cv=none; b=bxvyq9Yt2EvSRkzhRCFOFKgyrnJCDba7mc7AlAZypLYLmVpYzKdS1IpTqvNYpKdHFxTrYvyN3U/dkvf8TRMXnImQIGOBbiALllCfsf1R0IXxjZYPhqqS4Ouw34uncmbTorxXG8KYn8LR7+Uetplt1c0oD1CrHNo7BkkU9aKbfwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725638811; c=relaxed/simple;
	bh=i/OkE91URyTzY90ECCfSngBaJoQ8kM7EZjVwKU/nibM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ix+9AqfV1/Zoy/QjcZ4ZFtg80xfx6ORRDcuknGHrPs7Apc9jx3hs6/hBvSGl/5o9TMTbOhs8hPdVjWQC732HWeiv67G6BDftiMV5s5lo252/N6NJ0as99Bxm15Yps4sGulaAh3fQ30nw1E+I1nErdl9rpVvy/UeD3eOpyiUhMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE6rhNI8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F0AC4CEC4;
	Fri,  6 Sep 2024 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725638810;
	bh=i/OkE91URyTzY90ECCfSngBaJoQ8kM7EZjVwKU/nibM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OE6rhNI8cJ2OXKEni6bcRwpT6jSCCLxqIy8xHnpKkfhoth0UUNGVfEAH7mZJNv8bX
	 mPuRtc40C90SZk0+bIQ3ckpMrvmU8G96N6b5r2O74i3/Ag/3pjpo2/kxbv2pZl7m8Y
	 N0lsnYpoGi3wlPNkCTNszDVOSG4dLTtKHFfcxKVuQ8LuIBsLhXNWsq/kC/0Bo8wPGB
	 ilYCJCJ7et6HnjM1GRM3m/bLs+C00ACZR9ajyTCXb7OaFHHign/wY2ikwv67bWbGUy
	 zpi1zPk1Ut0y4oztiOYaguN1CeA7B4p2al7zD7sgSvYDVP7GKQ6X93BkNj7KJuf4/c
	 qmYwcqlW69ziA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f2868783so24508641fa.2;
        Fri, 06 Sep 2024 09:06:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhUSzzCAVDlelFe37FKZOirgsOwEPmTB0EsooCUs28pVB31UlKxJS0/TvvzqgAQh8KhvMfFiNiq/zTEIU=@vger.kernel.org, AJvYcCWIQQN5sPpsoEiQDsXwMdDXW1ZpCEhM95VzYBQq9TGviAZncyfnmWG29iPr2ETDazxNtXmO/JwW1A==@vger.kernel.org, AJvYcCWoN2w8uCMTps4y8OciW+36Q6Xu9r8Ik69sytsJrVuVgcFdN97RYd+VHgAOR9aODQNvJ962FlFVW4BSiiRf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwm75dVu/u+G9EVzSM4eoNmC2TzuHnsbFXSTTtMTtBHYfZ+Xz
	gkvPPHhppSHlHxvALb9BhPbzPlwTPDom9OekzyCklioTUdq5v0xecb6hlXFkExwBWbeCzP4J6yp
	oSFJSA32jZUPahfZGP2K55MsN8Oo=
X-Google-Smtp-Source: AGHT+IEDx2MBYfSAMZc9/iSOJYGNK9wJwMGiIy4jTSeZNrkUYrYuCYOsVH8obdUVZIByAwCUoQoZ1LhcYSGwXCX1fyg=
X-Received: by 2002:a2e:b8c7:0:b0:2f5:c13:bd11 with SMTP id
 38308e7fff4ca-2f751ee3bfcmr26016901fa.17.1725638809571; Fri, 06 Sep 2024
 09:06:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809122007.1220219-3-masahiroy@kernel.org>
 <3447459d08dd7ebb58972129cddf1c44@paul-moore.com> <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
 <CAHC9VhSz+kwYOnkfWPHOmoKCRfOjm3_L5xMLeSGVNxq5g=ikww@mail.gmail.com>
In-Reply-To: <CAHC9VhSz+kwYOnkfWPHOmoKCRfOjm3_L5xMLeSGVNxq5g=ikww@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 Sep 2024 01:06:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARj7mx9ZkucABBKujEmwggqZvn+8PZ1e-_ofaa43pfz0Q@mail.gmail.com>
Message-ID: <CAK7LNARj7mx9ZkucABBKujEmwggqZvn+8PZ1e-_ofaa43pfz0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
To: Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 12:37=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Fri, Sep 6, 2024 at 11:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> > On Tue, Aug 27, 2024 at 6:22=E2=80=AFAM Paul Moore <paul@paul-moore.com=
> wrote:
> > > On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > This tool is only used in security/selinux/Makefile.
> > > >
> > > > There is no reason to keep it under scripts/.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > >  scripts/remove-stale-files                                 | 3 +++
> > > >  scripts/selinux/Makefile                                   | 2 +-
> > > >  scripts/selinux/genheaders/.gitignore                      | 2 --
> > > >  scripts/selinux/genheaders/Makefile                        | 3 ---
> > > >  security/selinux/.gitignore                                | 1 +
> > > >  security/selinux/Makefile                                  | 7 +++=
++--
> > > >  .../selinux/genheaders =3D> security/selinux}/genheaders.c   | 0
> > > >  7 files changed, 10 insertions(+), 8 deletions(-)
> > > >  delete mode 100644 scripts/selinux/genheaders/.gitignore
> > > >  delete mode 100644 scripts/selinux/genheaders/Makefile
> > > >  rename {scripts/selinux/genheaders =3D> security/selinux}/genheade=
rs.c (100%)
> > >
> > > As long as there is no harm in keeping genheaders under scripts/selin=
ux,
> > > and based on your cover letter it would appear that there is no probl=
em
> > > with the current location, I would prefer to keep it where it current=
ly
> > > lives.
> >
> > 'make clean' is meant to clean up the tree, but keep
> > build artifacts necessary for building external modules.
> >
> > See the help message:
> >
> >   clean           - Remove most generated files but keep the config and
> >                     enough build support to build external modules
> >
> > 'make clean' does not clean up under scripts/
> > because tools located scripts/ are used in tree-wide
> > and often used for external modules as well.
> >
> > So, scripts/selinux/genheaders/genheaders is left over.
> >
> > genheaders is locally used in security/selinux/.
> >
> > 'make clean' will properly clean up security/selinux/genheaders.
>
> Your last sentence is confusing and doesn't align with the rest of
> your email, please clarify.


I do not understand what was unclear.



'make clean' cannot clean the current path,
scripts/selinux/genheaders/genheaders.

'make clean' can clean the proposed path,
security/selinux/genheaders.



genheaders is only used during the kernel build.
When you run 'make clean', there is no reason to keep it
for external modules.
Thus, it should move to the directory path that
'make clean' can handle.


Clearer?






>
> Regardless, this sort of explanation is what one needs to put in the
> commit description, a simple "There is no reason to keep it under
> scripts/" isn't sufficient.  Patches like this need to provide a well
> defined reason to justify the code churn.
>
> --
> paul-moore.com



--=20
Best Regards
Masahiro Yamada

