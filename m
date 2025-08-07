Return-Path: <linux-kbuild+bounces-8308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F2AB1D14A
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 05:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DB617CBF3
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 03:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1B013C3F6;
	Thu,  7 Aug 2025 03:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6CZdX0U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67F3208
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 03:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754538398; cv=none; b=QMS8gtX7hxo0hFhOfB8DiAtDafyLBv1f49iVfxXJJg+NE0GcUVhtnQRNq6WngWX0HxdEZYw1A/o9GI0OIrvSejXKfEczKnxHUyTQV/DB2sdKRVwZb6Kb6TEZa1kZhW8lbF/esvNU29q8K94IWND3V1gQb/exR6cQScPrklb0x1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754538398; c=relaxed/simple;
	bh=PkcU1PSlBg5yKOomwVEHi+LhkfjgzuSSjS6IXKlS/fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKGu/cnlQmQbJ3cPpNpQAQdwFZLsgqxCDH8H578KbiY+ZGIyMU4nGCbYFJ59Qj/TsqLwUSfkZY4Lrb8sYc/wDmb8sPKRYZAjDcOKTBmwXc7pahC/Xdtcevzc/ZG1cTi95BlODDAx8dRjmv4HLPWVbbJBwqBtfhSbSTBQYipm2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6CZdX0U; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-619a915c65fso340270eaf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Aug 2025 20:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754538395; x=1755143195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEqrvMuPorgiVCI0seUUXaQGJYH1ElncmxWORjjdPCo=;
        b=X6CZdX0U9r8rYYm+mHKpXV0hx7Uyv5bUevJMat5Q0WGMb8FQqvf3vfSi6GhaGC9p8G
         tZljzm65q2bCeC6AxeinT6JYByjfgTCKGu4qAaOVthDRsscOkC+dqIEAwJzjAuesWume
         QH4XMVZB7uY9PJGTF8S5y2ebl1+QVFTPo2jbGBSqOd0NY6pnupIoO2R52o5SC2h74wKF
         LZME4332O5pcD5+9jnSR0pQzbD1jvhQKh2uTlGqs9jzVgt3T73NCp3zqWxDcBSzfRsAK
         8xYmXWW4I9UqNqhtoqepr7IimB/h1te6vzmbkl/QoT4ngEBBVTmX+uusEt+8PXmMVEfs
         CDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754538395; x=1755143195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEqrvMuPorgiVCI0seUUXaQGJYH1ElncmxWORjjdPCo=;
        b=Kn5VPXfBBnp0k7RQ1u3NJE5eZSaRU8o6Sc699gk+4bI/H7k6uxWBt5J34csoOdRX4r
         fbmpus5a0tMqs8j00TZpltgUyre8k8EpPKWME/Firr4XWSx2QHCGUn3NpqwD4Gf4fhDM
         Vwx16Wp7T3f0zlwYj4B+CKmdFKYQMNnN+ffbXCZCA/X7P9GeB/bOkS6FOXwuuXC7M/ny
         VtuhnFkeS2r99B2bpLn6+EYCjz4WaiUqKA8ra8DcpEafNGHVVWmQJlQo/kMy/EcSD5Xc
         J2jrD4uKvQQnTNDfvvJhQfIZPQWof+jwoXGTxv7yZWsVh+Ajuv2x2APFOC4sqPqeCKTz
         bBrw==
X-Gm-Message-State: AOJu0Yw6SehrWn20al568S7pjksIddP4BjxO7RlwS8YTsogddnrpYBzE
	HQD28TDd4wzbdF7mOcaSDm0OctLwysOryWIQjfjVWTsiWSH1TZVS0/I/G9W1xxiAEgNfUGEyAEw
	C+mBLhF4xlmakDV9KDDSsazXIJDuyYtFG3qZx
X-Gm-Gg: ASbGncs8YA/GdhVgn3WRFs/fPk8PXkugWgPypGbweaoOEZhsnJkPdZLNrTnikRZHHNw
	PZNne3Ouvpfw/OGUtnp1eKavpMC75h0ndCgCVugXLA4eUVD+BEWV6grB0+v2f839LTY6NwULJ3P
	vs68WUo9ujbJFOU7zxBb7lfFMzDxEVlm4O2s3KnHIC8sdL5124uIqo0EBNfHxKfotR81MjFqzPe
	lt1LgI=
X-Google-Smtp-Source: AGHT+IGEWAGQs71TUf3nW0tUpNffvLd0ouU7rpZf8YJ/DRPJBeMmveXvgD/fNN+xHT2mVWWzX8ziGNOedydcZu1/Qa8=
X-Received: by 2002:a05:6820:2d08:b0:615:7c7f:4aa6 with SMTP id
 006d021491bc7-61b60d17668mr3436178eaf.3.1754538395341; Wed, 06 Aug 2025
 20:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu> <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
 <20250731-attractive-lionfish-of-love-a01cd7@lindesnes>
In-Reply-To: <20250731-attractive-lionfish-of-love-a01cd7@lindesnes>
From: "David F." <df7729@gmail.com>
Date: Wed, 6 Aug 2025 20:46:24 -0700
X-Gm-Features: Ac12FXyW8xeU2a-fySyMXzeM4ndxunD8663ZWiMlx6wO0jcnZfovPtHDkRL98yY
Message-ID: <CAGRSmLs6O+yvxQusQVRWCRiavZu_5qhTTLNqLkFHV6SEjKx_6g@mail.gmail.com>
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay, had to work on some other stuff..

The output is below, it build it as ELF32 as it should.   I do note
that your build command was like:
x86_64_defconfig CROSS_COMPILE=3Dx86_64-linux-gnu- bindeb-pkg

I don't have that, is it something new that is required, I just have:

extraversion=3D"EXTRAVERSION=3D-amd64"
make -j$(nproc) ${extraversion} bindeb-pkg

Here's that output that worked:


# make V=3D1 scripts/basic/fixdep
make --no-print-directory -C /usr/src/mydisk/kernel/linux-6.15.6-64 \
-f /usr/src/mydisk/kernel/linux-6.15.6-64/Makefile scripts/basic/fixdep
: "  SYNC    include/config/auto.conf.cmd"
make -f ./Makefile syncconfig
make -f ./scripts/Makefile.build obj=3Dscripts/basic
# HOSTCC  scripts/basic/fixdep
  gcc -Wp,-MMD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include
-o scripts/basic/fixdep scripts/basic/fixdep.c
make -f ./scripts/Makefile.build obj=3Dscripts/kconfig syncconfig
# HOSTCC  scripts/kconfig/conf.o
  gcc -Wp,-MMD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include   -c
-o scripts/kconfig/conf.o scripts/kconfig/conf.c
# HOSTCC  scripts/kconfig/confdata.o
  gcc -Wp,-MMD,scripts/kconfig/.confdata.o.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=3Dgnu11 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I
./scripts/include   -c -o scripts/kconfig/confdata.o
scripts/kconfig/confdata.c
# HOSTCC  scripts/kconfig/expr.o
  gcc -Wp,-MMD,scripts/kconfig/.expr.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include   -c
-o scripts/kconfig/expr.o scripts/kconfig/expr.c
# LEX     scripts/kconfig/lexer.lex.c
  flex -oscripts/kconfig/lexer.lex.c -L scripts/kconfig/lexer.l
# YACC    scripts/kconfig/parser.tab.[ch]
  bison -o scripts/kconfig/parser.tab.c
--defines=3Dscripts/kconfig/parser.tab.h -t -l scripts/kconfig/parser.y
# HOSTCC  scripts/kconfig/lexer.lex.o
  gcc -Wp,-MMD,scripts/kconfig/.lexer.lex.o.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=3Dgnu11 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I
./scripts/include  -I ./scripts/kconfig -c -o
scripts/kconfig/lexer.lex.o scripts/kconfig/lexer.lex.c
# HOSTCC  scripts/kconfig/menu.o
  gcc -Wp,-MMD,scripts/kconfig/.menu.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include   -c
-o scripts/kconfig/menu.o scripts/kconfig/menu.c
# HOSTCC  scripts/kconfig/parser.tab.o
  gcc -Wp,-MMD,scripts/kconfig/.parser.tab.o.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=3Dgnu11 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I
./scripts/include  -I ./scripts/kconfig -c -o
scripts/kconfig/parser.tab.o scripts/kconfig/parser.tab.c
# HOSTCC  scripts/kconfig/preprocess.o
  gcc -Wp,-MMD,scripts/kconfig/.preprocess.o.d -Wall
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer
-std=3Dgnu11 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I
./scripts/include   -c -o scripts/kconfig/preprocess.o
scripts/kconfig/preprocess.c
# HOSTCC  scripts/kconfig/symbol.o
  gcc -Wp,-MMD,scripts/kconfig/.symbol.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include   -c
-o scripts/kconfig/symbol.o scripts/kconfig/symbol.c
# HOSTCC  scripts/kconfig/util.o
  gcc -Wp,-MMD,scripts/kconfig/.util.o.d -Wall -Wmissing-prototypes
-Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include   -c
-o scripts/kconfig/util.o scripts/kconfig/util.c
# HOSTLD  scripts/kconfig/conf
  gcc   -o scripts/kconfig/conf scripts/kconfig/conf.o
scripts/kconfig/confdata.o scripts/kconfig/expr.o
scripts/kconfig/lexer.lex.o scripts/kconfig/menu.o
scripts/kconfig/parser.tab.o scripts/kconfig/preprocess.o
scripts/kconfig/symbol.o scripts/kconfig/util.o
scripts/kconfig/conf  --syncconfig Kconfig
make[1]: Nothing to be done for 'scripts/basic/fixdep'.

On Thu, Jul 31, 2025 at 10:44=E2=80=AFAM Nicolas Schier
<nicolas.schier@linux.dev> wrote:
>
> > > > I build the amd64 kernel on a debian based linux 686 version.
> > > > Building the 6.6.x kernel, everything was fine (fixdep/modpost were
> > > > ELF32), however I jumped to 6.12.x / 6.15.x versions and now the
> > > > system is building them as ELF64 which means I can't build my custo=
m
> > > > kernel module.
> > > >
> > > > To make the kernel(s) I use: make bindeb-pkg
>
> On Thu, Jul 31, 2025 at 08:38:59AM -0700, David F. wrote:
> > Linux devuan-chimaera 5.10.0-31-686 #1 SMP Debian 5.10.221-1
> > (2024-07-14) i686 GNU/Linux
> >
> > It's the one I've been using for a while (Debian Jessy before that), I
> > can't do any more upgrades using the built-in upgrade tool because
> > whatever happens causes corruption in virtualbox shared folders
> > (Windows host).
> >
> > The build is actually:
> >
> > extraversion=3D"EXTRAVERSION=3D-amd64"
> > make -j$(nproc) ${extraversion} bindeb-pkg
>
> You have already evaluated to setup a new VM instance with a more
> up-to-date amd64 system, do you?
>
> Does simple cross-compiling w/o bindeb-pkg work for you?  What is the
> output of
>
>     make clean
>     make V=3D1 scripts/basic/fixdep
>
> ?
>
> Kind regards,
> Nicolas

