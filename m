Return-Path: <linux-kbuild+bounces-5732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A53A3367F
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 05:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F24573A1C75
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 04:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B121157E88;
	Thu, 13 Feb 2025 04:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Cy4+7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8C537E5
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739419270; cv=none; b=ZvQdtKKtxGfXmNEGbLZSb3TqHEt/eYgHZBwNDUNVtijAl3FR71i0hiQlUunOxZTERkmsR+3sHtiZc5KD6IUvFyz4dLslZ6WrfeKtq7lmsRaG8pKF8YDag2LzDQqcrOTnA9gjYHTk/ZCI5LElPayltBCiiKgCIE8gNDNYuimAlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739419270; c=relaxed/simple;
	bh=EmbCCv2nbPEywfVFwYmIOPbS1BET3pFCkiCPVFYASsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxtZblM1XVEAHV1mRkFdFfWztooesLQmeuTva8p10fAHh2FJ4plEYJUajNt+w3syoe3IVmCwMaSSd2cj9hOWA0loHeJlK3G/aqshjDz2yjLYAz/4u9waRp0vMYjISeel411iS6xKqxrvSx7fS3wbeuI9Ea5MO7jvDLP7VQ+R+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0Cy4+7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAFBC4CEE6
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739419269;
	bh=EmbCCv2nbPEywfVFwYmIOPbS1BET3pFCkiCPVFYASsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I0Cy4+7vkl122bh3ncjis0PTU6EUhFgx/AgDk+xbbSwn7uP8ZXj/wjVS/bQ1iDFlX
	 vtwTArvY8jx/Kgpsk+k1h0fKG2kZK8ipXiTt/8t529Qzcb4fl1jSL6CU+8TpYUJfhs
	 brMWHbGTUGlEjMw/uSWa60ZpF0bO3/hGB3m4sFkgI0l3qnlPQA00O0gQ1Re0kkGP7A
	 IoWuz5suuR7dlW/0HG77PmPoZ9NhfYO8P+QuFHwwQjbhh9ZD26P047usGu0jkYI2m5
	 QigoAwR1Fm8avMoaHRnqtlcEYCPAmw0qXQSQzngFCLJyc685hxSHS68y+L6lbXkyKJ
	 rAlSHQaR9s7rQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54508b026d1so291919e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2025 20:01:09 -0800 (PST)
X-Gm-Message-State: AOJu0Yy7YinQpXdKvUwkwmrTP0Tl3B7medbBgzKo79sakyi/7DbzNm33
	1v0u7w/t2VqPwygT9n0y6+AJZInMhyyzaJyDA2Hb9wyt04x9191RihOfUD5L6nmZTaNcPlVcQTK
	V4c4diKk7CokItGui6gKqyfJ3Z7k=
X-Google-Smtp-Source: AGHT+IE9KKeJO6+TRQVSu2CQG9sSpsBj/E6TwYZvFjOhCgqixG7EssOW2uPRwRqI4yCSaTJc2pJraVRFSbB38gjgusM=
X-Received: by 2002:a05:6512:1281:b0:545:ab8:2be4 with SMTP id
 2adb3069b0e04-54518122a8bmr1428983e87.27.1739419268062; Wed, 12 Feb 2025
 20:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e7a76bba-38f9-4c40-9d4d-94f27cf22bab@oss.qualcomm.com>
In-Reply-To: <e7a76bba-38f9-4c40-9d4d-94f27cf22bab@oss.qualcomm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Feb 2025 13:00:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARb3xO3ptBWOMpwKcyf3=zkfhMey5H2KnB1dOmUwM79dA@mail.gmail.com>
X-Gm-Features: AWEUYZm3ygdWHqHpti2f2q81IFfSUk-e8XuVIa9DzBpXMHrF9MWtpyehffLeu88
Message-ID: <CAK7LNARb3xO3ptBWOMpwKcyf3=zkfhMey5H2KnB1dOmUwM79dA@mail.gmail.com>
Subject: Re: make bindeb-pkg failing with v6.14-rc1
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 9:37=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> I'm having a build issue when I move from 6.13 to 6.14-rc1
>
> I'm cross-compiling on a corporate VM targeting a laptop.
>
> I use a local GNUmakefile with the contents:
> export ARCH=3Dx86
> export CROSS_COMPILE=3D/local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x8=
6_64-linux/bin/x86_64-linux-
> include Makefile
>
> I then:
>
> make C=3D1 W=3D1 oldconfig && make C=3D1 W=3D1 -j`nproc` bindeb-pkg DEBUG=
_INFO=3Dn
>
> With 6.13 this is working fine
> With 6.14-rc1 I get:
>
>   DEPMOD  debian/linux-image-6.14.0-rc1/lib/modules/6.14.0-rc1
> dpkg-deb: building package 'linux-image-6.14.0-rc1' in '../linux-image-6.=
14.0-rc1_6.14.0-rc1-240_amd64.deb'.
> dpkg-deb: building package 'linux-image-6.14.0-rc1-dbg' in '../linux-imag=
e-6.14.0-rc1-dbg_6.14.0-rc1-240_amd64.deb'.
>   HOSTCC  debian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc=
1/scripts/basic/fixdep
> /local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/g=
cc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crt1.o:=
 No such file or directory
> /local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/g=
cc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crti.o:=
 No such file or directory
> /local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/g=
cc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find -lc: No=
 such file or directory
> /local/mnt/workspace/jjohnson/gcc-14.2.0-nolibc/x86_64-linux/bin/../lib/g=
cc/x86_64-linux/14.2.0/../../../../x86_64-linux/bin/ld: cannot find crtn.o:=
 No such file or directory
> collect2: error: ld returned 1 exit status
> make[7]: *** [scripts/Makefile.host:114: debian/linux-headers-6.14.0-rc1/=
usr/src/linux-headers-6.14.0-rc1/scripts/basic/fixdep] Error 1
> make[6]: *** [scripts/Makefile.build:465: debian/linux-headers-6.14.0-rc1=
/usr/src/linux-headers-6.14.0-rc1/scripts/basic] Error 2
> make[5]: *** [Makefile:2123: run-command] Error 2
> make[4]: *** [Makefile:2123: run-command] Error 2
> make[3]: *** [debian/rules:61: binary-headers] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned=
 exit status 2
> make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
> make[1]: *** [/local/mnt/workspace/jjohnson/kernel/laptop-debug/Makefile:=
1627: bindeb-pkg] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
>
> Is that "HOSTCC .../fixdep" using the CROSS_COMPILE toolchain instead of =
the host toolchain?
>
> Any idea what is happening here?


This is a bug of 5f73e7d0386d970a7d0e9de5a58d53114de85033

I will send a fix later.



--=20
Best Regards
Masahiro Yamada

