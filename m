Return-Path: <linux-kbuild+bounces-2407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D7929125
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 07:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6FF828413C
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 05:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1408B17722;
	Sat,  6 Jul 2024 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYd3mdmC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE725847A;
	Sat,  6 Jul 2024 05:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720243532; cv=none; b=CBJaXgmf04/DMfPSH6V5HzURATDNxFXmlU9kZHNS/0GEoWpCS427wF13yc8t5A1O2UAp7LxDBy9iJ/nOJknVLyqLZKPbI24306AKsj8pqYkjMvrXYLThxWgjmda8BQIKPF6tZA1X+69N2fTc+73VZ0gADY6aGFzUN7C/t5jzSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720243532; c=relaxed/simple;
	bh=I6v2Yip5bpaDDpFCUA6KU3LLq5/5qOBlrs7+iWTxMP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmYSKTFNztEsLBQ3MJZiUvBLZR7ILNbG2mGFAm9tiP7MiIkFm9LolyEUXhckIKnhOne/XJFCKPA6OzRKM6cxuN6ep1vRwXMUwUIi/ayQuGBe7IX+3o+W3Gocr0Lvh1obWshSwL+3BiNWtNshgsGIuc/Tg+8XYKLof3qAyKb2ru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYd3mdmC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADCAC32786;
	Sat,  6 Jul 2024 05:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720243531;
	bh=I6v2Yip5bpaDDpFCUA6KU3LLq5/5qOBlrs7+iWTxMP4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CYd3mdmC2KLtek2B2tNDJi62AadxWOiP1mzE064FIcYhrEYwr1frHxdfRA/kfeuPN
	 hum5/C2GOgZJG6bdu5R67lnI/QgD5nVNKSgTR6wSr9+JB2VIJF+/y7YRximWkFU62Q
	 EFOvo9XmcOAMzzqVcfzmuxjBfRZ/B+gOHaPHtSXMc4X0jt246Xej0pxCmIxbwjlWsG
	 LJUKSCNH5mzhELcd0Gm/coeSAYi3I1PBcTJrDwsoa87OJ2Nb4f3UVl6kHCtGM/QaRA
	 KJkTc0/3SZz1v222d0Fh2/ooh9w5ZVhLq23w9XX+bSAkLqTHJD30EJihwvJGhhWhud
	 sy/iq4XXGySvQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea16b429dso1668686e87.1;
        Fri, 05 Jul 2024 22:25:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgTvoqcc9gCwpqEMN91WOP0Cp0aCYyxWwF4vAbHchZqKE79p+Uco+dvH9efqMcXPwJncwKyOBQLOulYMWg0MQbjbXISFzpUzplPem3
X-Gm-Message-State: AOJu0YzQyWnRYLwgvnlq3i8XtGqhd1t8X4NU9Llrwkda+M0s0d8imBsv
	pCxhIeJGooocnWIXD3F49vJbSyO9XmNn60nXZkTa8/Gf5iHn6h8voRQbAOFHy3YGXBilXRPIMT9
	K1a0PgxdEQGmq54rsCb9f5uSBmCM=
X-Google-Smtp-Source: AGHT+IF/ITEsyCGvTvd3e+m69+BOQ1XlFFWCTjPCbkRzTx2nQE/m7iwQfohgicKNwWBnEqQ9PfXx4y7FJ64ntGXsqhU=
X-Received: by 2002:a05:6512:34c2:b0:52c:9820:5e52 with SMTP id
 2adb3069b0e04-52ea0e3a7f7mr1388986e87.27.1720243529995; Fri, 05 Jul 2024
 22:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c8833e1-1995-4f49-804a-705ab9e702a5@gmail.com>
 <CAK7LNASH6mS3X_YhkVV9z5ZVXdew_nGpJxaakaE1moZckETM7A@mail.gmail.com> <70b32083-34fb-42a5-b9bd-6f4fd21f70fd@gmail.com>
In-Reply-To: <70b32083-34fb-42a5-b9bd-6f4fd21f70fd@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 6 Jul 2024 14:24:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsMAw_+wwtmC1JoG+wkJscZyJ3oqqFYbuCL9ynVordRQ@mail.gmail.com>
Message-ID: <CAK7LNAQsMAw_+wwtmC1JoG+wkJscZyJ3oqqFYbuCL9ynVordRQ@mail.gmail.com>
Subject: Re: [PROBLEM linux-next] Segfault while building headers with dpkg-deb
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 5:57=E2=80=AFAM Mirsad Todorovac <mtodorovac69@gmail=
.com> wrote:
>
> On 7/2/24 10:18, Masahiro Yamada wrote:
> > On Sat, Jun 29, 2024 at 3:59=E2=80=AFAM Mirsad Todorovac <mtodorovac69@=
gmail.com> wrote:
> >>
> >> Hi all,
> >>
> >> On the vanilla linux-next tree, branch next-20240627, there happens to=
 be a bug while building
> >> with the randconfig seed KCONFIG_SEED=3D0x90E8E591:
> >>
> >>   .
> >>   .
> >>   .
> >>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/module=
s/6.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace-events-s=
ample.ko.xz
> >>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/module=
s/6.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace_custom_s=
ched.ko.xz
> >>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/module=
s/6.10.0-rc5-next-20240627-dirty/kernel/samples/ftrace/sample-trace-array.k=
o.xz
> >>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/module=
s/6.10.0-rc5-next-20240627-dirty/kernel/samples/fprobe/fprobe_example.ko.xz
> >> dpkg-deb: building package 'linux-libc-dev' in '../linux-libc-dev_6.10=
.0-rc5-45_i386.deb'.
> >>   DEPMOD  debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/module=
s/6.10.0-rc5-next-20240627-dirty
> >> dpkg-deb: building package 'linux-headers-6.10.0-rc5-next-20240627-dir=
ty' in '../linux-headers-6.10.0-rc5-next-20240627-dirty_6.10.0-rc5-45_i386.=
deb'.
> >> Segmentation fault (core dumped)
> >> make[6]: *** [scripts/Makefile.modinst:128: depmod] Error 139
> >> make[5]: *** [Makefile:1842: modules_install] Error 2
> >> make[4]: *** [Makefile:2058: run-command] Error 2
> >> make[3]: *** [debian/rules:61: binary-image] Error 2
> >> make[3]: *** Waiting for unfinished jobs....
> >> dpkg-deb: building package 'linux-image-6.10.0-rc5-next-20240627-dirty=
-dbg' in '../linux-image-6.10.0-rc5-next-20240627-dirty-dbg_6.10.0-rc5-45_i=
386.deb'.
> >> dpkg-buildpackage: error: make -f debian/rules binary subprocess retur=
ned exit status 2
> >> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> >> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:1555: bind=
eb-pkg] Error 2
> >> make: *** [Makefile:240: __sub-make] Error 2
> >>
> >> Build log and .config are attached at your convenience.
> >
> >
> >
> >
> >
> > If you used an old kmod version, this is a known issue.
> >
> > https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.=
org.uk/
> >
> > A quick solution is to upgrade your kmod version.
>
> I see. Sorry then for the noise and duplicated work.
>
> It might be inevitable that I will do something dumb more often than not =
when testing
> randconfig errors from such a vast number of lines of code ... :-/
>
> My kmod is as follows:
>
> ii  kmod           29-1ubuntu1  amd64        tools for managing Linux ker=
nel modules
>
> I thought of upgrading to 24.04 LTS, but when upgrading kmod I've lost th=
e capacity to boot
> the older kernels in bisect process?
>
> Probably, it would be for the best if I had several versions of Ubuntu in=
 multiple boot
> options? However, I have not yet done that ...
>


You do not need to install distributions on your bare metal.


I need varous test environments,
such as Debian, Ubuntu, Fedora, OpenSUSE, Arch, ...


For compile testing, I use Docker.
When I need to replace the kernel, I use Vagrant.


If you want to compile-test deb-pkg with randconfig,
Docker is enough.




--
Best Regards
Masahiro Yamada

