Return-Path: <linux-kbuild+bounces-3453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1706496F9F5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 19:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52AC6B239F2
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F451D27B6;
	Fri,  6 Sep 2024 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZQk1P8D7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509421D3653
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725644047; cv=none; b=FLdWEZWNrdDSTHmMpunxxdtOzpFqDjxujCM/CHxJoFRyqFhRDiwQQqrCIeyPgN2LQqPknthy7v9pk7MYHv/s4DXG45Hxj+AZ7/LPQknJ5db6LdFx1BhoPKTDd+d1t3pY7TkmM5K18f9kjfkO5zmObi0Unz50Qaz+9N2cfeYLy4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725644047; c=relaxed/simple;
	bh=OAMVH4ZWU1MWzw+HOPc6VdDksyXB+pQtfdpUr1JXkGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTsHM3DktMPHjgrDZ3XJlC0OW9f9RS1Eqb27/cB9okuzX4QxRLUahzU3Qp58CrohqI5BFNNVbxNFZz9L/oBFKEyciEWc1saN6As2aF6UGAcbZv8LQx9QOgivyc0D9BXWuY0jQ/dFxIvbu9Pjvc0QUNPnWrBv9oMmh/AxadsEqsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZQk1P8D7; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d5a4615a56so21615867b3.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725644044; x=1726248844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCpk4T4clfJIWsoHtcikfAqCr3cHM1ptXe5OQ2eEMkg=;
        b=ZQk1P8D787E+Nrig2/hI0qnZpz15Il0Dp5umsjxBktvDBQe0R9NLr8pe3LIK1Gol33
         XlwJnLNf/nZTC8ayeEq2+X/N/gQCFtZKRhBlnUB9+jXSam+aor41voGAmVHGJS16woUB
         eCdtp+d2CbPk92QXd8h9JZm8veEqePAP8iY/UIBNN77sJotUVeE/Hr8S3I31PWdQBWSg
         grNGaf+D15G4i6mIREIKgzO0nrG1Xah9Z9n3Nwm9P4w26z5vXiDgZmw6qB5YnXMoluMV
         FTtye/mfasJODhrNqNzvJLN6dOXokO2K3hS46uHnLBtCPwQ39Nmh11g7B+USbB3Sb48v
         RQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644044; x=1726248844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCpk4T4clfJIWsoHtcikfAqCr3cHM1ptXe5OQ2eEMkg=;
        b=To4APb07PidwHh0RW/ueGo4NGLAihewbb3OzMbzFiEoV8ZSCILU2o9psVf7ZMWBYn/
         OBk6qyxqO2WDIqFvFFtbxA7KrEVW8hK1pRSSWINDNoMWuyjWA/K8bBP3qhfLw9RMpNkP
         IBw0cPs9ItN4WclKONId11XfS9TFlLcSpv/ZqFGLb4WM3mATand62eb8tLNcgh7wRdcs
         ICoDBPEHl+mPVNC2LBOxmIGB6dfHsFdyVF6FnInCMM1ZCvyQUIWQ2a+LL83w29ELMEUw
         DsAiO8G5DR7I7lV2ar1+3K5PzPfh/syEVkpNN48UeId/F+dEMiBNnSMwXwPmEbMtUnmu
         saKg==
X-Forwarded-Encrypted: i=1; AJvYcCWRIZAmqMzwcZNWvLsL3wHg0Zi3E2r6FJUnCcj/cJUyT5Wac+5Kg9aTIfnsextroh3Tie/GtUM6LHf6xUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzEoYIB/inpy3ZibJ/XgY0Y3SaiYVNLjDxDOixFiBCn79r0isu
	w07VMME/lmBOAIQbGHFXPVjcY3xFleD1XAczpM3uvijGcS07OYpW1T/u8SToNzlNe7VYO5kj1Ov
	BBjjZuXeHgNuJLA7+1He9wJ71EPjARcnwSIQn
X-Google-Smtp-Source: AGHT+IGUz5s8d9N52gYrACCt8rlLghoTmWpsx+29sQve9zGJT/OI4BV/Ik75aP1YaH+GYO91nX0GwRbDA61C6lSkcaY=
X-Received: by 2002:a05:690c:60c2:b0:664:badf:5a8c with SMTP id
 00721157ae682-6db44d68cf9mr43944687b3.3.1725644044170; Fri, 06 Sep 2024
 10:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809122007.1220219-3-masahiroy@kernel.org>
 <3447459d08dd7ebb58972129cddf1c44@paul-moore.com> <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
 <CAHC9VhSz+kwYOnkfWPHOmoKCRfOjm3_L5xMLeSGVNxq5g=ikww@mail.gmail.com>
 <CAK7LNARj7mx9ZkucABBKujEmwggqZvn+8PZ1e-_ofaa43pfz0Q@mail.gmail.com>
 <CAHC9VhRhUPTwg2-wsLzGGpbhG_4sH9K5o6Z5D_aLiiO98LgaJQ@mail.gmail.com> <CAK7LNAS2M5XsXJ39RS2yQKRiEwZpA8oYQ8u4LipoL1YMHane8w@mail.gmail.com>
In-Reply-To: <CAK7LNAS2M5XsXJ39RS2yQKRiEwZpA8oYQ8u4LipoL1YMHane8w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 13:33:52 -0400
Message-ID: <CAHC9VhRET4qq9L-VuC28t=Y2YAx=ZBDSqaWCN8v1ApEu0FvQTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 12:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Sep 7, 2024 at 1:23=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > On Fri, Sep 6, 2024 at 12:06=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > > On Sat, Sep 7, 2024 at 12:37=E2=80=AFAM Paul Moore <paul@paul-moore.c=
om> wrote:
> > > > On Fri, Sep 6, 2024 at 11:19=E2=80=AFAM Masahiro Yamada <masahiroy@=
kernel.org> wrote:
> > > > > On Tue, Aug 27, 2024 at 6:22=E2=80=AFAM Paul Moore <paul@paul-moo=
re.com> wrote:
> > > > > > On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > > > >
> > > > > > > This tool is only used in security/selinux/Makefile.
> > > > > > >
> > > > > > > There is no reason to keep it under scripts/.
> > > > > > >
> > > > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > > > ---
> > > > > > >  scripts/remove-stale-files                                 |=
 3 +++
> > > > > > >  scripts/selinux/Makefile                                   |=
 2 +-
> > > > > > >  scripts/selinux/genheaders/.gitignore                      |=
 2 --
> > > > > > >  scripts/selinux/genheaders/Makefile                        |=
 3 ---
> > > > > > >  security/selinux/.gitignore                                |=
 1 +
> > > > > > >  security/selinux/Makefile                                  |=
 7 +++++--
> > > > > > >  .../selinux/genheaders =3D> security/selinux}/genheaders.c  =
 | 0
> > > > > > >  7 files changed, 10 insertions(+), 8 deletions(-)
> > > > > > >  delete mode 100644 scripts/selinux/genheaders/.gitignore
> > > > > > >  delete mode 100644 scripts/selinux/genheaders/Makefile
> > > > > > >  rename {scripts/selinux/genheaders =3D> security/selinux}/ge=
nheaders.c (100%)
> > > > > >
> > > > > > As long as there is no harm in keeping genheaders under scripts=
/selinux,
> > > > > > and based on your cover letter it would appear that there is no=
 problem
> > > > > > with the current location, I would prefer to keep it where it c=
urrently
> > > > > > lives.
> > > > >
> > > > > 'make clean' is meant to clean up the tree, but keep
> > > > > build artifacts necessary for building external modules.
> > > > >
> > > > > See the help message:
> > > > >
> > > > >   clean           - Remove most generated files but keep the conf=
ig and
> > > > >                     enough build support to build external module=
s
> > > > >
> > > > > 'make clean' does not clean up under scripts/
> > > > > because tools located scripts/ are used in tree-wide
> > > > > and often used for external modules as well.
> > > > >
> > > > > So, scripts/selinux/genheaders/genheaders is left over.
> > > > >
> > > > > genheaders is locally used in security/selinux/.
> > > > >
> > > > > 'make clean' will properly clean up security/selinux/genheaders.
> > > >
> > > > Your last sentence is confusing and doesn't align with the rest of
> > > > your email, please clarify.
> > >
> > > I do not understand what was unclear.
> >
> > Near the start of your email you stated: "'make clean' does not clean
> > up under scripts/".  However you ended your email with "'make clean'
> > will properly clean up security/selinux/genheaders" which seems
> > contradictory to your initial statement; I was guessing that you were
> > implying that moving the genheaders script will allow `make clean` to
> > work properly, but you explicitly included the old/existing location
> > of security/selinux/genheaders directory in your comment which didn't
> > support that guess.
>
>
> OK, now I understand.
>
>
> I meant this:
>
>
>   With this patch applied, 'make clean' will properly clean up
>   security/selinux/genheaders.
>
>
>
> > Your latest reply makes it a bit more clear.
>
>
>
> So, are you ok with the following commit description,
> which I proposed in another thread?
>
>
>
> --------------->8--------------------
> selinux: move genheaders to security/selinux/
>
> This tool is only used in security/selinux/Makefile.
>
> Move it to security/selinux/ so that 'make clean' can clean it up.
>
> Please note 'make clean' does not visit scripts/ because tools under
> scripts/ are often used for external module builds. Obviously, genheaders
> is not the case here.
> --------------->8--------------------

Yes, thank you.


--=20
paul-moore.com

