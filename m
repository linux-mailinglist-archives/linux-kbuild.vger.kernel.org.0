Return-Path: <linux-kbuild+bounces-13205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPZPKEv6CWpPvwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13205-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 19:26:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E70562844
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 19:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85DEB3003E9C
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 17:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78423BB661;
	Sun, 17 May 2026 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xd9cbfHu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7134E774
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038775; cv=pass; b=d+aMUpoSQdp4eyAIMuTnxB6nMKLtZ80GsllDL5LkeylW1sC0gsM23LM9hr2A+AWvxwgfFOTKOX2DxzdznzIi9grJnhWyfHRoLXlL9owhqCikZzWip6bJUcimkxwmuJ65UT3NrOnbLZe7GANR5jgbqWCyhAko1d1Ayt4RfMJb/D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038775; c=relaxed/simple;
	bh=fevntX9CyqrTCsY4NEO2OSu5x1FqBa+lpbqQmNWn16s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3bdvVxmqymy46tFsA4u3n3UJRRhIMJTUYnZSZ5UUYQV+9wy89HVNXHT5wN2fBZaFk+W4pvN3AsDjdMOABcSVT0viSX+cTVST1IabfL9tobB2auQ6MiksW4Lzj1vQNRWpXmmw5pd2H2kFgjqmJ9wqpZng0nvHqu7noJfkyOGBLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xd9cbfHu; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e4004a4a6fso1809845a34.1
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 10:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779038773; cv=none;
        d=google.com; s=arc-20240605;
        b=gETdk0u1TmHaVibPw7mHbO4LeVkCOY4rzNWSh0eOaYm9c2QJUppmTIzLOshWAsWS4q
         W6HdYqLswbxI8aAHMZjqXDI255yeRF8p4bsHMS6mimRKRYiNUqf5fKIruDX6JpVWnKES
         z+WVLG9cEBHhfwbcLKrARmLFFs/iNjLtZo0e4Ha3cubEaDygbZKVyvTlLviegkAUKjrB
         mVXiZJsJTBQCLVSDAjF3ap1d/WjcXLMf0bMCDJkWwhqcsPUnMuWCPULw+3YOtsd3ACqi
         +7ejoBol5muqxXjyPsbI7u7F8Agr/HqpRaB+qKcsG2l3aAkBEqDjwgVUlgcXYEN7vVyy
         aODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BIdTEeOWgp+Q3hh7dzqTUpBwWBpZXjPgkFM7QuEGVo0=;
        fh=97KlEtGb5lZNxyLrB7VEq0grFKkwoaOtkMjOtp2ZyXI=;
        b=XMnPCSLxOA1q8O53z2yjf0uujm6ojNdJ8N5nT6ZersEZmNn+Azh52P5SQbheepidgx
         dcHeRZcC+cz/e/EWy9fIEZJI2mq2tCsUAn9GcjoiNi33zFKLPuRJvA1w9ZDyqd0It8cM
         AEV8WkxkTaJe1+sfi9lOHVAvLVUQe1FWlIT8pbVJy5Fdqi5vQuYY5kLDAdAgR1vtjeFE
         YWAVFJeshl9/L4kpb2TMNzStR0OdAOy6COdleI50ot+GNM2tgW5k4Tgbp2gtxcSZxoWX
         r1Wac0PyF9F3FGS3JIu6fOGwyJxe+DgWu6EzxgsekLHzmQKb4LaYrjNYxQ3p/0RAJEDA
         CyyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779038773; x=1779643573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIdTEeOWgp+Q3hh7dzqTUpBwWBpZXjPgkFM7QuEGVo0=;
        b=Xd9cbfHuFJcn6O2FJdYNIWCwAZxCyYLKv7DT7gfD4Yp7Dy3sSdnJJoYZpCufCrMeYC
         jaS34nDexIB7oVu9xY1L+JJfPc9ceUKJTlBHjpNky2VVJdxJ+qBEZBYKeqCmwckxoXxg
         exYTZl9Fqiqn7btUSNBKEjNK4PjPqyXZw4lWikB+JsjbSA7muuF2RDAT58SNfK4pqExV
         Vbp18uwYdXYn03NePIVkPGNcgpfhHAvmaCnuyoU+m+ZB390h4LVou1iNUrL/DYm694Gk
         Rt/EgJtHzN7WwjLDPLT1e3flwbuDwB6W6QbtSeWtuMRhHcNcdQZwIfZqTkoocPxmWjaK
         Nq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038773; x=1779643573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIdTEeOWgp+Q3hh7dzqTUpBwWBpZXjPgkFM7QuEGVo0=;
        b=gxfJSUWrPsGkhYAXbI1+60KBjXDqKSDRRAqJ/aPlZaDpp4woCkrLbCQn+XIQK2vces
         QHMFa8ZP3vCJ6Kqhdj4xYv1WnHlBPhRQAxkMyzOBg56emVIVaXBPfZ3YpbjP9n/x0JcT
         iYabSk+XeWZLkk127ErCvxxlW/8ilOZQAVKZiRJ1lbVBoBAiZxA5aCxv09YZiXEOd0ch
         ZvFG5X/r/v6Ql+fCia0iCeYuiFp/nDZEBuv6/igM6CNAENghOe8FQB20m5H6Lwbk1opa
         CzWkomZSFr03MsQhU3gvX4OBcybJktzp+GhHhjAKKOBz6rElIDdU5/GeCw3lMHxFVa7N
         9bEA==
X-Gm-Message-State: AOJu0YzIFLeF/CR4LouslgLqTVdsKP7R5lM04DJAvsI9r7aIfttHhKoa
	sllWlawgzOicX8OsNncIJe6aWDYjJ3peJlBhRi/prbrhPsAS/op6MnbMenqKkANuDQ+0XuYv9Bu
	WnDvC1iNm2l3g/8r2a6MsujhSdJLiMH7SRxJg
X-Gm-Gg: Acq92OFOoTvccknaBrpwsMbwtJSDAT+Y6/qCy1mLldUZl3r8zS6YuGlRchGn8cve0M0
	9CZO62FazP7QPRnzKiZMYySMaF/AH2usukHaLxct4bTi7PybpIQYemE4ZtHiS2Gq2Je6uPT3/ta
	OB4ZVcoGGHjFP3AA65Ek6U0er3uhzDP2d2++pzJZCV8UQFbsv9CC96CSzglCbuL63oz+CWpOrJv
	esnjImFuOXw+p8OxZ0m5l98giMLv1BY2LUwM49HodqlWJi9n2+26LwyeYpYWN/SS1v9fit5UhTt
	fmyVMCGl
X-Received: by 2002:a05:6830:82aa:b0:7d7:e844:7f4e with SMTP id
 46e09a7af769-7e4f2bd75c5mr8513160a34.22.1779038773122; Sun, 17 May 2026
 10:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu> <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
 <20250731-attractive-lionfish-of-love-a01cd7@lindesnes> <CAGRSmLs6O+yvxQusQVRWCRiavZu_5qhTTLNqLkFHV6SEjKx_6g@mail.gmail.com>
 <aJRvL2UwDBVJ967k@fjasle.eu>
In-Reply-To: <aJRvL2UwDBVJ967k@fjasle.eu>
From: "David F." <df7729@gmail.com>
Date: Sun, 17 May 2026 10:26:01 -0700
X-Gm-Features: AVHnY4LVQohAVK57m-AJbj9jPrw7pFJKPQ8Qz86rTdcL64E-pWZdL3z9SifcgT4
Message-ID: <CAGRSmLvdAQ=nyh8TpeHVk4W2hPF3zr-UbapXUXhQDoa9aUfOyA@mail.gmail.com>
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 00E70562844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13205-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[df7729@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux.dev:email]
X-Rspamd-Action: no action

Hello,

I've worked with AI to tell me what's happening and it says: "So the
exact issue is: kernel 6.18=E2=80=99s Debian packaging uses
x86_64-linux-gnu-gcc as HOSTCC for the headers package, which is wrong
for your 32-bit build host.".  It actually started with 6.15.x kernel
but it's still there.

In this case I updated the build to try and force the 32bit for host
items (recall before it would build okay but the host items were
ELF64, if I manually went back and ran the build from command line,
not building package, it built as ELF32 as it should):

extraversion=3D"EXTRAVERSION=3D-amd64"

make ARCH=3Dx86_64 \
        CROSS_COMPILE=3Dx86_64-linux-gnu- \
        HOSTCC=3D"gcc -m32" \
        HOSTCXX=3D"g++ -m32" \
        HOSTCFLAGS=3D"-m32" \
        HOSTLDFLAGS=3D"-m32" \
        V=3D1 \
        -j1 \
        ${extraversion} \
        bindeb-pkg 2>&1 | tee build.log

This resulted with:

# DEPMOD  debian/linux-image-6.18.29-amd64/lib/modules/6.18.29-amd64
  ./scripts/depmod.sh 6.18.29-amd64
dh_installdocs -plinux-image-6.18.29-amd64
dh_installchangelogs -plinux-image-6.18.29-amd64
dh_compress -plinux-image-6.18.29-amd64
dh_fixperms -plinux-image-6.18.29-amd64
dh_gencontrol -plinux-image-6.18.29-amd64 -- -fdebian/image.files
dh_md5sums -plinux-image-6.18.29-amd64
dh_builddeb -plinux-image-6.18.29-amd64 --
dpkg-deb: building package 'linux-image-6.18.29-amd64' in
'../linux-image-6.18.29-amd64_6.18.29-amd64-4_amd64.deb'.
truncate -s0 debian/image-dbg.files
truncate -s0 debian/headers.files
dh_testdir -plinux-headers-6.18.29-amd64
dh_testroot -plinux-headers-6.18.29-amd64
dh_prep -plinux-headers-6.18.29-amd64
make ARCH=3Dx86_64 KERNELRELEASE=3D6.18.29-amd64 KBUILD_BUILD_VERSION=3D4
CROSS_COMPILE=3Dx86_64-linux-gnu- run-command
KBUILD_RUN_COMMAND=3D'+$(srctree)/scripts/package/builddeb
linux-headers-6.18.29-amd64'
./scripts/package/builddeb linux-headers-6.18.29-amd64
make HOSTCC=3D"x86_64-linux-gnu-gcc" VPATH=3D srcroot=3D. -f
./scripts/Makefile.build
obj=3Ddebian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd6=
4/scripts
make -f ./scripts/Makefile.build
obj=3Ddebian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd6=
4/scripts/basic
\
need-builtin=3D \
need-modorder=3D \

# HOSTCC  debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-=
amd64/scripts/basic/fixdep
  x86_64-linux-gnu-gcc
-Wp,-MMD,debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-a=
md64/scripts/basic/.fixdep.d
-Wall -Wmissing-prototypes -Wstrict-prototypes -O2
-fomit-frame-pointer -std=3Dgnu11 -D_LARGEFILE_SOURCE
-D_FILE_OFFSET_BITS=3D64 -m32 -I ./scripts/include    -m32 -o
debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/scri=
pts/basic/fixdep
debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/scri=
pts/basic/fixdep.c
/usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/ld:
skipping incompatible /usr/lib/gcc-cross/x86_64-linux-gnu/10/libgcc.a
when searching for -lgcc
/usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/ld:
cannot find -lgcc
/usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/ld:
skipping incompatible /usr/lib/gcc-cross/x86_64-linux-gnu/10/libgcc.a
when searching for -lgcc
/usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/ld:
cannot find -lgcc
collect2: error: ld returned 1 exit status
make[7]: *** [scripts/Makefile.host:114:
debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/scri=
pts/basic/fixdep]
Error 1
make[6]: *** [scripts/Makefile.build:544:
debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/scri=
pts/basic]
Error 2
make[5]: *** [Makefile:2151: run-command] Error 2
make[4]: *** [Makefile:2151: run-command] Error 2
make[3]: *** [debian/rules:67: binary-headers] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess
returned exit status 2


AI told me to:

Practical fix

Patch scripts/package/builddeb so it uses native gcc for generated
header tools instead of $(CROSS_COMPILE)gcc.

Find the line like:

make HOSTCC=3D"${CROSS_COMPILE}gcc" VPATH=3D srcroot=3D. \

Change it to:

make HOSTCC=3D"${HOSTCC:-gcc}" VPATH=3D srcroot=3D. \

On Thu, Aug 7, 2025 at 2:17=E2=80=AFAM Nicolas Schier <nicolas.schier@linux=
.dev> wrote:
>
> (please reply below relevant quotations, cp. "Use trimmed interleaved rep=
lies
> in email discussions" at Documentation/process/submitting-patches.rst)
>
> On Wed, Aug 06, 2025 at 08:46:24PM -0700 David F. wrote:
> > Sorry for the delay, had to work on some other stuff..
> >
> > The output is below, it build it as ELF32 as it should.   I do note
> > that your build command was like:
> > x86_64_defconfig CROSS_COMPILE=3Dx86_64-linux-gnu- bindeb-pkg
> >
> > I don't have that, is it something new that is required, I just have:
> >
> > extraversion=3D"EXTRAVERSION=3D-amd64"
> > make -j$(nproc) ${extraversion} bindeb-pkg
> >
> > Here's that output that worked:
> >
> >
> > # make V=3D1 scripts/basic/fixdep
> > make --no-print-directory -C /usr/src/mydisk/kernel/linux-6.15.6-64 \
> > -f /usr/src/mydisk/kernel/linux-6.15.6-64/Makefile scripts/basic/fixdep
> > : "  SYNC    include/config/auto.conf.cmd"
> > make -f ./Makefile syncconfig
> > make -f ./scripts/Makefile.build obj=3Dscripts/basic
> > # HOSTCC  scripts/basic/fixdep
> >   gcc -Wp,-MMD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes
> > -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
> > -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include
> > -o scripts/basic/fixdep scripts/basic/fixdep.c
>
> I am afraid, I lost track of what your actual problem is.
>
> It looks like fixdep is built the way it should, so the next step would b=
e
> running bindeb-pkg with V=3D1 and finding its gcc call for building fixde=
p and to
> verify both calls.  They should be (at least almost) the same.
>
> Kind regards,
> Nicolas

