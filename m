Return-Path: <linux-kbuild+bounces-10170-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0275CCDAC0
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7006B3006617
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 21:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC691F30AD;
	Thu, 18 Dec 2025 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzxNr/BX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415D3A1E66
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 21:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093025; cv=none; b=AOs7ByDvLRdv2NLkRLPbvpRNPzGpfVxi554LpCqRiOAyEXcVr+tXiFmkX0r3i3gE1MDNyNJKyrjh/F7I0RUQHHFvDQglOf3iAwltwO70QWcVkkAbdO3tZHM0eINRLTRwXobtAfcluMIc306Vtzq0hr6gvWJxmymQDmqSajKQy70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093025; c=relaxed/simple;
	bh=cqUjv37bQrHWjLeiJzydyeedJGJwjMmSj74naJ3C0pE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ds3oG4iZuEgPyuPBuaB0AaL27vypbNZdfd0kgwm2tqUznWQGAilmhulgRwhKhwJ1MzaM/A2q+LT7di2ZI+k/lPgxC9wPWTLUu2ke6APx1H9MBxK7oOjOjJL3TwTHSxmR6EfdGVi4NONjDOyj2r1Mc+UK/9WiJIWkpWhTXVC2xJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzxNr/BX; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3e12fd71984so825389fac.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 13:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766093023; x=1766697823; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c9tipiql2onxACO3kjd/0S/XiUV13p9feMh/zj3zK8U=;
        b=PzxNr/BXlvuByY4bqojiqwJFR1nHKq1UPXkQ+Hvm7EoK4zZxdKWTw0JR04SZKNxpY9
         R+HKoeCL6Z90aq7CVIKyi/7cpG6eW2XDRxvh+kVetc1WcCLMFTsZxfmYWL1cJD3goTIA
         rTHS67xOmL1l1SpkujDEXdcV6R7H0WH29h/NHOTq4eklcmi1SsOIqQgBE2Hbh7QT5fyz
         gO26yE6HlUL7s7jqgDrPr8m57rwXUfuNOItJCHNaGLkfjvsMjpBnndHZUlgY3K9NQPPQ
         Gfr7RYQ4wJDr9qN+pnT9Jsr+KRDEiIgb4kH8C3LZpLQU8UDqM/D3IXhehIslnA06MZOb
         W77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766093023; x=1766697823;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tipiql2onxACO3kjd/0S/XiUV13p9feMh/zj3zK8U=;
        b=Gd8amTnMppvWwD5CSTxuXpbLGqLDyYISsxxYeiwwEFwsWUSpyC2rmG3oxy8b73pZUa
         80DFEC3JmAK23CbWbXjwt6VgLNptZ4cQQsH8VBlDnaYjZcYK8BmWprC9vgAo/BOAGI6N
         sH76BMfme1jVVo5dkJy7l1w021YAf0QNdLf6dHZWI2yHCojmb0nR67Svbby2oJDCasaC
         e72skqvBgZWL2Ek+Vm1mDZ221X975tEd8/ctcaKRNl1upVdct0rEDxPDx/k/GeGWszLL
         yHJYtK9PKQ4FWyupXbADZY8KbxBfrM0trwxfhYntypSVXK7M/oMwrBhWStnbwSN10hUe
         pe2A==
X-Forwarded-Encrypted: i=1; AJvYcCUhls4VEGX7h55ycYo6UYrUU7mMkRRG5dGEGPfB1kaHydIijPFKxyIqpiDogFVCiIigCmboY2zpgxk65Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBUQOqpyI7sWathsE2fZZcxzR5+TlfgoM+60lbGHc4tMUhYPe
	A3Nbk2PfPNt7z/XECcJ9dK04F5G9LMascCWjzpcC7cqlK14Mdyfo2bsWgzCYgmVYC9k=
X-Gm-Gg: AY/fxX7igzLYa7M+GX1yamJZUcfYoK/9tpP6igBOYFSmsxTnLWYyXhENA+vlu/zp8C0
	MBXJNTKAlZzJBF8+uu0CFlKvaJxTPf2PK8lC8m5GEkmXn78xb4uimFXAoOWJqf6v57JIsOWtbGk
	jM09T/mJ504r11ztoDi39QqvtQjOIijiQIZAsoomig4+JQkeaOlHSlHQcpqfhDcubXNpe4q5v7b
	cmsa48buFU4+DnZhl/OrRJoW5GoVQGat7K/t4poWusKTp6HGCcPDtwDV20uSKN6dWZ/MOGHGSSo
	p8mR5pQY5Z3XOifkLfxzw2IkQchuzpBg5kWiBeY4OEF9HSD/66X+z5juFXkvzAyDK+paYRf/XaY
	BlHuJ6zZwPX6uaMNnnnyajdMaup280Lxvt+Y1wC8+9ixHH0jhj637naiUonxToP/AaXf4g9b7v0
	PYlfizvYFiO3j7QGRUFSjyIDBvK7g21hYtrnR6
X-Google-Smtp-Source: AGHT+IFmxk3YATonxLCiLcbn2iIMS7nFOUUgNJH1YIJWm9l0xXgphXvwi2zor2XCGLSbRXvcDbeAAQ==
X-Received: by 2002:a17:903:1249:b0:2a1:3cd9:a734 with SMTP id d9443c01a7336-2a2f2a4f99emr2804215ad.43.1766085667750;
        Thu, 18 Dec 2025 11:21:07 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:d912:2088:c593:6daa? ([2620:10d:c090:500::7:e642])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9b52asm566865ad.45.2025.12.18.11.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 11:21:07 -0800 (PST)
Message-ID: <8be2cafa00b759220e73a6ce837ac9a3ff52da1f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 5/8] kbuild: Sync kconfig when
 PAHOLE_VERSION changes
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alan Maguire	
 <alan.maguire@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Andrea
 Righi	 <arighi@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko	 <andrii@kernel.org>, Bill Wendling <morbo@google.com>,
 Changwoo Min	 <changwoo@igalia.com>, Daniel Borkmann
 <daniel@iogearbox.net>, David Vernet	 <void@manifault.com>, Donglin Peng
 <dolinux.peng@gmail.com>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Justin Stitt	 <justinstitt@google.com>, KP Singh
 <kpsingh@kernel.org>, Martin KaFai Lau	 <martin.lau@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nsc@kernel.org>, Shuah
 Khan	 <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev	
 <sdf@fomichev.me>, Tejun Heo <tj@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kbuild@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Thu, 18 Dec 2025 11:21:04 -0800
In-Reply-To: <20251218003314.260269-6-ihor.solodrai@linux.dev>
References: <20251218003314.260269-1-ihor.solodrai@linux.dev>
	 <20251218003314.260269-6-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-12-17 at 16:33 -0800, Ihor Solodrai wrote:
> This patch implements kconfig re-sync when the pahole version changes
> between builds, similar to how it happens for compiler version change
> via CC_VERSION_TEXT.
>=20
> Define PAHOLE_VERSION in the top-level Makefile and export it for
> config builds. Set CONFIG_PAHOLE_VERSION default to the exported
> variable.
>=20
> Kconfig records the PAHOLE_VERSION value in
> include/config/auto.conf.cmd [1].
>=20
> The Makefile includes auto.conf.cmd, so if PAHOLE_VERSION changes
> between builds, make detects a dependency change and triggers
> syncconfig to update the kconfig [2].
>=20
> For external module builds, add a warning message in the prepare
> target, similar to the existing compiler version mismatch warning.
>=20
> Note that if pahole is not installed or available, PAHOLE_VERSION is
> set to 0 by pahole-version.sh, so the (un)installation of pahole is
> treated as a version change.
>=20
> See previous discussions for context [3].
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/scripts/kconfig/preprocess.c?h=3Dv6.18#n91
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Makefile?h=3Dv6.18#n815
> [3] https://lore.kernel.org/bpf/8f946abf-dd88-4fac-8bb4-84fcd8d81cf0@orac=
le.com/
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

When building BPF selftest modules the pahole version change was
detected, but it seems that BTF rebuild was not triggered:

  $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
  make[1]: Entering directory '/home/ezingerman/bpf-next'
  make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/self=
tests/bpf/test_kmods'
    CC [M]  bpf_testmod.o
    CC [M]  bpf_test_no_cfi.o
    CC [M]  bpf_test_modorder_x.o
    CC [M]  bpf_test_modorder_y.o
    CC [M]  bpf_test_rqspinlock.o
    MODPOST Module.symvers
    CC [M]  bpf_testmod.mod.o
    CC [M]  .module-common.o
    CC [M]  bpf_test_no_cfi.mod.o
    CC [M]  bpf_test_modorder_x.mod.o
    CC [M]  bpf_test_modorder_y.mod.o
    CC [M]  bpf_test_rqspinlock.mod.o
    LD [M]  bpf_test_modorder_x.ko
    LD [M]  bpf_testmod.ko
    LD [M]  bpf_test_modorder_y.ko
    LD [M]  bpf_test_no_cfi.ko
    BTF [M] bpf_test_modorder_x.ko
    LD [M]  bpf_test_rqspinlock.ko
    BTF     bpf_test_modorder_x.ko
    BTF [M] bpf_test_no_cfi.ko
    BTF [M] bpf_test_modorder_y.ko
    BTF [M] bpf_testmod.ko
    BTF     bpf_test_no_cfi.ko
    BTF     bpf_test_modorder_y.ko
    BTF [M] bpf_test_rqspinlock.ko
    BTF     bpf_testmod.ko
    BTF     bpf_test_rqspinlock.ko
    BTFIDS  bpf_test_modorder_x.ko
    BTFIDS  bpf_test_modorder_y.ko
    BTFIDS  bpf_test_no_cfi.ko
    BTFIDS  bpf_testmod.ko
    OBJCOPY bpf_test_modorder_x.ko.BTF
    BTFIDS  bpf_test_rqspinlock.ko
    OBJCOPY bpf_test_no_cfi.ko.BTF
    OBJCOPY bpf_test_modorder_y.ko.BTF
    OBJCOPY bpf_testmod.ko.BTF
    OBJCOPY bpf_test_rqspinlock.ko.BTF
  make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/selft=
ests/bpf/test_kmods'
  make[1]: Leaving directory '/home/ezingerman/bpf-next'
  [~/bpf-next]
  $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
  make[1]: Entering directory '/home/ezingerman/bpf-next'
  make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/self=
tests/bpf/test_kmods'
  make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/selft=
ests/bpf/test_kmods'
  make[1]: Leaving directory '/home/ezingerman/bpf-next'

... update pahole from version 131 to 132 ...

  [~/bpf-next]
  $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
  make[1]: Entering directory '/home/ezingerman/bpf-next'
  make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/self=
tests/bpf/test_kmods'
  warning: pahole version differs from the one used to build the kernel
    The kernel was built with: 131
    You are using:             132
  make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/selft=
ests/bpf/test_kmods'
  make[1]: Leaving directory '/home/ezingerman/bpf-next'

Is this an expected behavior?

