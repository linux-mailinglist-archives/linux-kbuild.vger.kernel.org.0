Return-Path: <linux-kbuild+bounces-1517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 309798A0162
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 22:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A161C239EE
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Apr 2024 20:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF999180A70;
	Wed, 10 Apr 2024 20:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rWg74x87"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0996110
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2024 20:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712781719; cv=none; b=ctWp1twASMuqffmFtYCv/5GZliPp2GkTtXmMHIsOW/7btyX3stje4GfM9dV/x4c46Ci7j0RFbn38uxMiqXHg05Siy7Y0sHXAK/MI+rTBMS7FYcJAdkTQKlCCI1fM8cwZgCE5ZpHUqJTeSWhlNU36Y/D5GyfU6EGZH0ggQB61h84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712781719; c=relaxed/simple;
	bh=mA+1YZDk7o4LXe7913qMSDJznlRZf18m0cbqQcdMsOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMAnhDNtYbZBTUOuOjWbfnG1EaFcO8RC/HXKIuoplFboId/aKF/9w7lNYFIuP4RMr6wU8U1XqLvYfgYOVzPICY0K16KS/oSvSEpOCikXI5y+o7Oa38oa2TmERCWHMGjtsALLDWSJbZwy93u164L6in02xqzcYKvHjSbIFkAb0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rWg74x87; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56fe56d4d9cso1043a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2024 13:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712781716; x=1713386516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjNzRAkY+xtVPRtYKCJI3YbnjJ087W/HtXkIZGO+drI=;
        b=rWg74x87phRZsoeGZohgEsx9EGAXtLeoDHUAClEuki9BfKF5h4S3cxKYrABZGunOrI
         MgYmp0BaRLDWYpkEZ7jI+yGap41SzX6IhdSWakg6KkV9ltuzOkXmPRg/WLhUTQcPFluS
         jvsAegcya+lc0qBU9p+clfblhkGjISzHUTjHtGRWz2uJThm7JbUiG8oWsDNdJhogkqOD
         ayLOAxXxIkE0Hhsj6ALzvOMNdWAfFO6Firh8smYH4fKY0etnVpqFwskvjMQv78Gwg9E7
         Skf59kd5HSPbo+icuZzdinburIZjlSMatcn7lngiOmoYW1gGHHSX6CUOBB/o6j/yrrwR
         yVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712781716; x=1713386516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjNzRAkY+xtVPRtYKCJI3YbnjJ087W/HtXkIZGO+drI=;
        b=gXx36ycXDi2jMn27k4JbCoWzMtPZL29W7489gn0W+fnYhkWkdrghG2QCKdTBBwK2Th
         kHy3qWJmtNAuG5ImFSZT4iu7qwEuLGcGd+PIi0JolsBc870woA31ieqHHtos2Lp71hDx
         c+Lbk7ABvcKD6vXc8xZe+NbcTTaApWz2yvkg51UMwJYxskTIFD5cciOUmzjYiGxP7O78
         GboqN0LprDMZH2s+4nWzoRfW6VINEYvpji8a1bdhJWssPUR/onCGn5pTM7zrsuw9+mZ7
         D8VEz7YvlU5jpHQuOkD/kypeS18kuF+I28OXj0mTaxDfdLZJ7Vl7aH+67mzvrzeZ85hJ
         T43g==
X-Forwarded-Encrypted: i=1; AJvYcCViGYoJfC3965bhW6gTpqWxfRnI4uSt9tAZpbCpb19Egx+1czvOSf4asIaaPJ/eN/d+Fq1MwBYKVYVuoy4tBJvu0qb2WeLxkBDw10Wj
X-Gm-Message-State: AOJu0Yy7y/q3Ec8mxQpNui2Hk+tbtP16wHM/wZVjcsGLRSUxhpoyA3z4
	qfHQB/4OtIcm9ehostvflx8++QWoT7BkCktVb8OlQD+fILtYtw1rAZQu2mm2anN10An8HQmlqWC
	uGQP5X+vKvc/pEIvxJHGG+yrukBI8maYb9STg
X-Google-Smtp-Source: AGHT+IE7WmzrqZ8zsKdwZe4MAPtHGQ9WqSs8JP4hxZydGaCOqbO291AiBOqPa10M+70g7D0jKdqyx2cMjVn7m9WzC9k=
X-Received: by 2002:aa7:c6c6:0:b0:56f:e261:2c03 with SMTP id
 b6-20020aa7c6c6000000b0056fe2612c03mr32511eds.2.1712781715947; Wed, 10 Apr
 2024 13:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410193734.29788-1-elsk@google.com> <20240410194802.62036-1-elsk@google.com>
 <20240410130555876-0700.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20240410130555876-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Yifan Hong <elsk@google.com>
Date: Wed, 10 Apr 2024 13:41:18 -0700
Message-ID: <CAABy=s3nSZcmt0OD+fK0iDXbo85MeYdhxKwNReF54O+ZSQvQ5A@mail.gmail.com>
Subject: Re: [PATCH v2] module: allow UNUSED_KSYMS_WHITELIST to be relative
 against objtree.
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>, 
	Ulises Mendez Martinez <umendez@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 1:27=E2=80=AFPM Elliot Berman <quic_eberman@quicinc=
.com> wrote:
>
> On Wed, Apr 10, 2024 at 07:48:02PM +0000, Yifan Hong wrote:
> > If UNUSED_KSYMS_WHITELIST is a file generated
> > before Kbuild runs, and the source tree is in
> > a read-only filesystem, the developer must put
> > the file somewhere and specify an absolute
> > path to UNUSED_KSYMS_WHITELIST. This worked,
> > but if IKCONFIG=3Dy, an absolute path is embedded
> > into .config and eventually into vmlinux, causing
> > the build to be less reproducible when building
> > on a different machine.
> >
> > This patch makes the handling of
> > UNUSED_KSYMS_WHITELIST to be similar to
> > MODULE_SIG_KEY.
> >
> > First, check if UNUSED_KSYMS_WHITELIST is an
> > absolute path, just as before this patch. If so,
> > use the path as is.
> >
> > If it is a relative path, use wildcard to check
> > the existence of the file below objtree first.
> > If it does not exist, fall back to the original
> > behavior of adding $(srctree)/ before the value.
> >
> > After this patch, the developer can put the generated
> > file in objtree, then use a relative path against
> > objtree in .config, eradicating any absolute paths
> > that may be evaluated differently on different machines.
> >
> > Signed-off-by: Yifan Hong <elsk@google.com>
>
> I wonder if we should have a macro to do it so we can have a common
> macro for the other time this is done for sig-key in
> scripts/Makefile.modinst?
>
> maybe-srctree =3D $(if $(wildcard $1),,$(srctree)/)$1
>
> I'd let Masahiro/others decide if it's worth it. Otherwise,
>
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

Thanks for your review!

Also maybe relevant: I notice that SYSTEM_TRUSTED_KEYS is
yet another path in .config, but it is used as-is in
certs/Makefile, without adding the $(srctree) prefix. If we had this
macro, I think it should be applied to all of
UNUSED_KSYMS_WHITELIST, MODULE_SIG_KEY,
SYSTEM_TRUSTED_KEYS, and potentially other paths.

But these configs are beyond my knowledge and beyond the scope
of this patch, so I decide not to touch them at this moment.

>
> > ---
> > V1 -> V2: properly handle absolute paths by treating
> >   them as-is.
> >
> >  kernel/module/Kconfig    | 2 +-
> >  scripts/Makefile.modpost | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> > index f3e0329337f6..cb8377a18927 100644
> > --- a/kernel/module/Kconfig
> > +++ b/kernel/module/Kconfig
> > @@ -392,7 +392,7 @@ config UNUSED_KSYMS_WHITELIST
> >         exported at all times, even in absence of in-tree users. The va=
lue to
> >         set here is the path to a text file containing the list of symb=
ols,
> >         one per line. The path can be absolute, or relative to the kern=
el
> > -       source tree.
> > +       source or obj tree.
> >
> >  config MODULES_TREE_LOOKUP
> >       def_bool y
> > diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > index 739402f45509..36952638bbc6 100644
> > --- a/scripts/Makefile.modpost
> > +++ b/scripts/Makefile.modpost
> > @@ -94,7 +94,7 @@ targets +=3D .vmlinux.objs
> >
> >  ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  ksym-wl :=3D $(CONFIG_UNUSED_KSYMS_WHITELIST)
> > -ksym-wl :=3D $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
> > +ksym-wl :=3D $(if $(filter-out /%, $(ksym-wl)),$(if $(wildcard $(ksym-=
wl)),,$(srctree)/))$(ksym-wl)
> >  modpost-args +=3D -t $(addprefix -u , $(ksym-wl))
> >  modpost-deps +=3D $(ksym-wl)
> >  endif
> > --
> > 2.44.0.478.gd926399ef9-goog
> >
> >

