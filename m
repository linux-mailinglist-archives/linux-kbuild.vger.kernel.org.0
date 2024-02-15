Return-Path: <linux-kbuild+bounces-955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B4856465
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Feb 2024 14:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789381C22C16
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Feb 2024 13:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B628E12BE88;
	Thu, 15 Feb 2024 13:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J41aa8na"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0312E1D5
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Feb 2024 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708003779; cv=none; b=CnjqoMpKl7QjDcwc9gZIy4c0qZ0mNgHOrYdYa/9B8zmHVih9tQsgfyrKYG6CKtTuy048cbBiXK0IPsmr9M2IyUy+WigbT4L/jop0xOvcZ1dZXDpAdstjdxopS4VG83xBWjpyw43JU41teRCqrdnwvgPkC1gcNwP4AcdO33psFv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708003779; c=relaxed/simple;
	bh=7yhAtgFVlwnY94zxhj13tUxNU7L3s0UjcPPrRZ8kNFY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RRtFKq4li4VaANtlww8L7NTBflEjQXXIJ2GEef/aTheyTo0+V4z4tMLKRXqJZ7zA6VT84g8gLLvzGDYHbbMjB2vkkAaAqfP1gKqaPn3LmTYDJEcF+SCR+Re1WydvsBmPWfTCDJJasuDjklKRbFYX6uEvQu2IvxEbIcRgIB0Ojd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J41aa8na; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d1094b5568so11708691fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Feb 2024 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708003775; x=1708608575; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7Dj1McEPxY8I+IDUiyqxFG09QXeovAwg9sNXheoglY=;
        b=J41aa8nai+qf2TcM/J8GjHlhRHiwOKCdieIGf7326JUAVtR+p82/CZGwuIZN//U/+F
         DGp/Py6EcFDoH81j2bLcS870evP9alaPSrpZqFS9NDaQdeP6E2EZrL4GIX03mMs3x+hO
         Kdb6agDG09cFUXvmhOpZ/Cs8AWZIUPG/9G9OR/iLBOqzYcRj8Ga/hu6D931MFaeUwudS
         TtunxT9IGPSOr8wCWfI/1pp9Pm1EcQ7QNVTvuKv1mVPQS822NTeUxi1M1CiZyrSou6AZ
         r0Vaw77jyblyZq+oI7aJBQk4ivE0SwC/QWFJ6zRL0bEqi7+ikjq/JCfv9Vnh5pWXHGsj
         YyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708003775; x=1708608575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7Dj1McEPxY8I+IDUiyqxFG09QXeovAwg9sNXheoglY=;
        b=Z4GsFVL9T/Gyeo9o5BkYnbJ4lKYNYDcIpW9MZAHk2PMi6/KIsUU+UmTJbjEb0SyhPP
         2hYqkiLv/C4gvgpGECbrq6RjuThCQ8CpacSwkCAkpiDiX1zKgVw5RXlfSRBTDRf4p0Cd
         O+3fUCR76Qr6xTC2NMamgDi4f3ZbeNXbpMPgtYTEmLSU9yX2UUhm+OyeuKCMNPmvoONo
         nQv/jJnN3XLkvR4Lc3F5k2fr/+FJuLLQd4VJCaSt7P3y7+4dh5vrOMaNSdTvb48Gqitz
         NPyjCmZTTs9HSXUHLqfjTCjI1uKVkRfJqzP5IegJcPhHoC1b3mookVe5j3tcZbczpldh
         nBXA==
X-Gm-Message-State: AOJu0YzvtlNU0lyWPvySiM2tgz7PblYGEk7ftINriRftQDR0juQXu3Bs
	MWJ6qhgMbE7hgOmBwJ4LN8l4fXgZ+U6ls1EN+lgmBB/hY31p5nTejnLRPaAEWP4=
X-Google-Smtp-Source: AGHT+IFFYRdGsCSB+8z6JNTVaTYJWmoT7UKEoEjvpH+hs5lhh96PzTPm8EEymtQ7sAAfEjjXkRzWiw==
X-Received: by 2002:a2e:9e10:0:b0:2d0:f629:82b9 with SMTP id e16-20020a2e9e10000000b002d0f62982b9mr1699689ljk.34.1708003775014;
        Thu, 15 Feb 2024 05:29:35 -0800 (PST)
Received: from ?IPv6:2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6? ([2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6])
        by smtp.gmail.com with ESMTPSA id j19-20020a056a00175300b006d94291679asm1303940pfc.78.2024.02.15.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 05:29:34 -0800 (PST)
Message-ID: <16d1430240ed96b895db40cca1c6c310f056056c.camel@suse.com>
Subject: Re: Out-of-tree module building fails with O= argument
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Petr Mladek <pmladek@suse.com>,
 mbenes@suse.com
Date: Thu, 15 Feb 2024 10:29:31 -0300
In-Reply-To: <CAK7LNATJ+=Kd5a=wkHZDzHSEACHfYavUa4GdiSKZh5eSwMG6wA@mail.gmail.com>
References: <951fc31ee754ba86acaa9556e1d28c13075c66a2.camel@suse.com>
	 <CAK7LNATJ+=Kd5a=wkHZDzHSEACHfYavUa4GdiSKZh5eSwMG6wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-02-15 at 05:49 +0900, Masahiro Yamada wrote:
> On Wed, Feb 14, 2024 at 11:02=E2=80=AFPM Marcos Paulo de Souza
> <mpdesouza@suse.com> wrote:
> >=20
> > Hello Masahiro and Kbuild ML,
> >=20
> > Recently we added out-of-tree module building on kselftests for the
> > livepatch selftests. Everything worked as expected, but kernel test
> > robot complained about it[1].
> >=20
> > So far, all our tests were being done targeting different options
> > for
> > kselftests, but we didn't test using the O=3D option. The interesting
> > part of it is that this can be easily reproducible with any out-of-
> > tree
> > module building even on current upstream, like the code below:
> >=20
> > $ uname -r
> > 6.8.0-rc4+
> > $ make
> > make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
> > modules
> > make[1]: Entering directory '/home/mpdesouza/git/linux'
> > =C2=A0 CC [M]=C2=A0 /home/mpdesouza/test-oot/patch_1.o
> > =C2=A0 MODPOST /home/mpdesouza/test-oot/Module.symvers
> > =C2=A0 CC [M]=C2=A0 /home/mpdesouza/test-oot/patch_1.mod.o
> > =C2=A0 LD [M]=C2=A0 /home/mpdesouza/test-oot/patch_1.ko
> > =C2=A0 BTF [M] /home/mpdesouza/test-oot/patch_1.ko
> > make[1]: Leaving directory '/home/mpdesouza/git/linux'
> >=20
> > But it fails when using O=3D argument:
> > $ make O=3D/tmp/kout
> > make -C /lib/modules/6.8.0-rc4+/build M=3D/home/mpdesouza/test-oot
> > modules
> > make[1]: Entering directory '/home/mpdesouza/git/linux'
> > make[2]: Entering directory '/tmp/kout'
> > /home/mpdesouza/git/linux/Makefile:733: include/config/auto.conf:
> > No
> > such file or directory
> > make[2]: *** [/home/mpdesouza/git/linux/Makefile:240: __sub-make]
> > Error
> > 2
> > make[2]: Leaving directory '/tmp/kout'
> > make[1]: *** [Makefile:240: __sub-make] Error 2
> > make[1]: Leaving directory '/home/mpdesouza/git/linux'
> > make: *** [Makefile:6: all] Error 2
> >=20
> > As I already described on [2], the O=3D argument (or KBUILD_OUTPUT)
> > makes
> > the kernel to jump into the directory specified on the variabled,
> > but
> > running the Makefile on /lib/modules/6.8.0-rc4+/build. The problem
> > is
> > thattoplevel Makefile on /lib/modules/.../build includes files
> > using
> > relative paths. In this case, the makefile tries to find
> > include/config/auto.conf on /tmp/kout, which obviously doesn't
> > exists.
> >=20
> > Do you think this can be a bug on Kbuild? Should we ignore O=3D when
> > building out-of-tree modules?
>=20
>=20
> No.
>=20
> O=3D is not meant for the output directory for external modules.
>=20
> O=3D is supposed to point to the object tree of the kernel
> (when the kernel was built in the separate output directory)
>=20
>=20

Thanks Masahiro. AFAICS, the only way to override/unset a command-line
variable from the sub-make calls is to override it on make invocation,
like:

  make -C $(BUILD_PATH) O=3D"" M=3D$(PWD) modules

So it would need a fix like this for it to work. Am I right?

BTW, I just noticedthe same problem on  the bpf module on kselftests,
which is also an out-of-tree module but it's KDIR is the built kernel:

make W=3D1 O=3D/tmp/kselftest -C tools/testing/selftests/bpf
make: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
  EXT-COPY [test_maps]=20
  MOD      bpf_testmod.ko
/home/mpdesouza/git/linux/Makefile:733: include/config/auto.conf: No
such file or directory
make[2]: *** [Makefile:240: __sub-make] Error 2
make[1]: *** [Makefile:16: all] Error 2
make: *** [Makefile:233: /tmp/kselftest//bpf_testmod.ko] Error 2
make: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests/bpf'

(This was reproduced on upstream/master branch).

The reproducer from the kernel built robot is the following:


reproduce:
        #
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?id=3Dc4bbe83d27c2446a033cc0381c3fb6be5e8c41c7
        git remote add linux-next
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7
        make W=3D1 O=3D/tmp/kselftest headers
        make W=3D1 O=3D/tmp/kselftest -C tools/testing/selftests
        make W=3D1 O=3D/tmp/kselftest -C tools/testing/selftests/bpf

(retrieved from https://download.01.org/0day-
ci/archive/20240130/202401300736.GkSZoSrA-lkp@intel.com/reproduce
)

Masahiro thanks=20

Shuah, the problem is already there even without out livepatch changes.
Should the test robot be fixed instead?

>=20
> > Also, as noted[3] by Petr Mladek (CCed here as well), kernel-devel
> > doesn't include auto.conf, so maybe kernel-devel should be patched
> > as
> > well?
> >=20
> > Thanks in advance,
> > =C2=A0 Marcos
> >=20
> > [1]:
> > https://lore.kernel.org/oe-kbuild-all/202401300736.GkSZoSrA-lkp@intel.c=
om/
> > [2]:
> > https://lore.kernel.org/oe-kbuild-all/fd027fa958a0bc65285a0c6c42e5921e7=
d28b0ad.camel@suse.com/
> > [3]: https://lore.kernel.org/oe-kbuild-all/ZbpnBqHUl3pE_3Te@alley/
>=20
>=20
>=20


