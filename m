Return-Path: <linux-kbuild+bounces-2310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B191F0E8
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 10:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE1F1F22D90
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 08:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA414E2CC;
	Tue,  2 Jul 2024 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dr+92Fuq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA34CE09;
	Tue,  2 Jul 2024 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719908345; cv=none; b=F+BFhV9jYysM7bQPhfG4e0+LHk4y/yLkhtGzmdBr4fi+6NngV8N5UXy8W7S5xekrT//JuC1jvtobbG1rgD1gcrpEE2m/Dlu2R+wEmHvY2m00+pqIf1dalz6NDz5dKusn8hWaq9RPltjm/hbNmATkr4JzNjU0nOLQyjDX8KtFu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719908345; c=relaxed/simple;
	bh=RzpV9qaqwHuuRQM83MwVSglsal7/lXC+YUdHRHr7VCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t66Vxtd7PUawZ3NLgVO237CcHPVJhUm2HjZT+Lw0kfTA7Pd1fCpl3dtNkXpBG+C4Hf58uielh8bWxnUU7HMLwN5yvJhlQta9RmTtYdeUMFJm4ZG/Dr7vPK6Qrie4ijfWawBWX6wHjqIumd0vnjghx4OZPBufATIrn2PgI36JuO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dr+92Fuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36BDC116B1;
	Tue,  2 Jul 2024 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719908345;
	bh=RzpV9qaqwHuuRQM83MwVSglsal7/lXC+YUdHRHr7VCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dr+92FuqyBWgmLDCTMhNKDE4mVBP3sxUMgWdTHf5EAFHFEXg6h2fWzOPSiX7Av672
	 oy4Ru7izPNmn0sf80fElznKEu8AANKnKqxUGCP3VRIUIbRGWqkVD8VKIp/lyqgrIU7
	 inrjpcnRBk6lhXYYrWjl48evnPTT5eYV2hq6oKiorT5AN8x8aqV9ER/NLAsIG1gIR8
	 IkFFtNdSs2/i2QS9dgY6QINBl7T5ERtga0VEUP8lExARHjC27lPfM1KWEr/Sl4Vev9
	 GAA1f4YBAnpH1TKPYw/Mwnusmn+KOCKp9+H9dubH/cA5d2Ogd5t9AUjPEYtioZSona
	 FgtjFNShd7hvQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee4ab4076bso42314621fa.0;
        Tue, 02 Jul 2024 01:19:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYEf1mjHb7GAXb2CBzHxUcBmoDpuh62kpTWV2WyoYGFh2qbdcjSOpOVAdX5F3fQz79zPktEZ/k8COzNuMDAJ6gbQ+wl9lUHj91tmiO
X-Gm-Message-State: AOJu0YxwJx6BYi5L6ptFmUhWfUbQIJ2pHLiGB5lPXnNnJNSTfJulJnYF
	nrJ1D48rVOK+vltY7Xd4H6xxxxRAbFnS9nO3R/kuOina2huXwSDUTbBdu/qvbXZm0Nk6EcVAKEW
	DreUoar4i/wb3mRuWy8zBfyGlI00=
X-Google-Smtp-Source: AGHT+IGZCLZCDiHqujnjOIEhR/fmNiQYGVdcu639B4lScKs5vNFq96qBK+DiO/OkuH+QAaTO+BYj6d5ODyaB+Cf+PRI=
X-Received: by 2002:a05:6512:3d0e:b0:52b:aae0:2d41 with SMTP id
 2adb3069b0e04-52e825d7156mr2718388e87.28.1719908343630; Tue, 02 Jul 2024
 01:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c8833e1-1995-4f49-804a-705ab9e702a5@gmail.com>
In-Reply-To: <2c8833e1-1995-4f49-804a-705ab9e702a5@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 2 Jul 2024 17:18:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASH6mS3X_YhkVV9z5ZVXdew_nGpJxaakaE1moZckETM7A@mail.gmail.com>
Message-ID: <CAK7LNASH6mS3X_YhkVV9z5ZVXdew_nGpJxaakaE1moZckETM7A@mail.gmail.com>
Subject: Re: [PROBLEM linux-next] Segfault while building headers with dpkg-deb
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 3:59=E2=80=AFAM Mirsad Todorovac <mtodorovac69@gmai=
l.com> wrote:
>
> Hi all,
>
> On the vanilla linux-next tree, branch next-20240627, there happens to be=
 a bug while building
> with the randconfig seed KCONFIG_SEED=3D0x90E8E591:
>
>   .
>   .
>   .
>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6=
.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace-events-samp=
le.ko.xz
>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6=
.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace_custom_sche=
d.ko.xz
>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6=
.10.0-rc5-next-20240627-dirty/kernel/samples/ftrace/sample-trace-array.ko.x=
z
>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6=
.10.0-rc5-next-20240627-dirty/kernel/samples/fprobe/fprobe_example.ko.xz
> dpkg-deb: building package 'linux-libc-dev' in '../linux-libc-dev_6.10.0-=
rc5-45_i386.deb'.
>   DEPMOD  debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6=
.10.0-rc5-next-20240627-dirty
> dpkg-deb: building package 'linux-headers-6.10.0-rc5-next-20240627-dirty'=
 in '../linux-headers-6.10.0-rc5-next-20240627-dirty_6.10.0-rc5-45_i386.deb=
'.
> Segmentation fault (core dumped)
> make[6]: *** [scripts/Makefile.modinst:128: depmod] Error 139
> make[5]: *** [Makefile:1842: modules_install] Error 2
> make[4]: *** [Makefile:2058: run-command] Error 2
> make[3]: *** [debian/rules:61: binary-image] Error 2
> make[3]: *** Waiting for unfinished jobs....
> dpkg-deb: building package 'linux-image-6.10.0-rc5-next-20240627-dirty-db=
g' in '../linux-image-6.10.0-rc5-next-20240627-dirty-dbg_6.10.0-rc5-45_i386=
.deb'.
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned=
 exit status 2
> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:1555: bindeb-=
pkg] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
>
> Build log and .config are attached at your convenience.





If you used an old kmod version, this is a known issue.

https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.=
uk/

A quick solution is to upgrade your kmod version.







>
> Hope this helps.
>
> Best regards,
> Mirsad Todorovac



--
Best Regards
Masahiro Yamada

