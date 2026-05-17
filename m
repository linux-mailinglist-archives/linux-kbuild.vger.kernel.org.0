Return-Path: <linux-kbuild+bounces-13206-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE2iMJAJCmrqwAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13206-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 20:31:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2704F563253
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 20:31:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 914B83005782
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 18:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164083C76AD;
	Sun, 17 May 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns/jBqtR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E46332ABCA
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 18:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042701; cv=pass; b=t3uEy20Hp3qnxn0KaMZAha9QE1WAiLXNXbzJcW3ZPwYWbIw+yiQJ9DZvKrbqFxsTii2u052C5MOwDFvO+lYhiVZOjFjhKcnFSbuPF9knlgRCTTF4BohjFENooNk3Sn6HlS5DMr9N6ljJrH7YWxFn2n9PjQygCfny67xlXZQptME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042701; c=relaxed/simple;
	bh=tXNmzfLWhj5WCgN8/SpjBSX9TOy3eBKSiJ6Bs1mSDsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2sY5s4FLJC5OdfKF06VaeLRk5u/yTd5vT59xvR++sRamt2MbDYOwiyDL7/OGrav1GT14hIA55XAPtRWmNQjz86fLqe+2uV/Ktaeo3A10HsIpwW5EXMs6XHzMdJW2gSr9crOHuDsLCw4oAmZfrXsm2wcQ4d9890AyDUfT2uOzrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns/jBqtR; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dbccf6a23dso1423993a34.2
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 11:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779042699; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoJGgD3I/3yCHC1FsiKRGVO2vxsY0SVnbdCNYj0HLcF4Iub9sT6TGgeffQOEczBFQG
         1Ke8BuKe5WfdDjZL3PWVggUSVm/X0R6TeROI0aL21fEG//l/he+OBNpYs5zgJqeDtjgW
         19yYlAsKRnh+VOuq46oWnY76fjKYeFKnJ7gS8YvmK5B71kgWC8TFb0Xw3/BUNVhpZ5uT
         wvPa2M7NpEnXyyhuVBxYQS/7Yvu3BK9swLK3BBl9fmtcR9ov2F5ASVZnO8/r4svQc7Sz
         6slYeW9uWSPElfqCvZnhuzr6ITk5btXANCbfwkcESd+8V2IB6TYpEc72Goe8416pmyD4
         K8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCsUriNihkPBc/h2NHFhO6d1vtHtZyN+a8DU8yrxqds=;
        fh=97KlEtGb5lZNxyLrB7VEq0grFKkwoaOtkMjOtp2ZyXI=;
        b=Ha5xCVih9dW7XzNxFORsqQt4NRqBoW+oEJcV90fPtL1bKwszUktgDVe14wNXPVdvSW
         WnHxQ7bCnclsHVxFqnhtgp6HMm1QYoKStYZC+nAS/72PRG8ahFWkVWjyFhRkF6w6hyit
         4JlK2p95N+ThP1/TBz1da8jRp4M+f7l0f2Ngq/vSFARwCC7zm9+Gaj4Wd5xvjUOYpKOI
         hLzbpztvM8VpO0wJ4aSw2uA2HM8lNcPMzohSjkhjH50y3ClN7zJQJ1FG4XyWcDBl3KAY
         4UR2FK9FDOOr2AVOmptLUfHhtB0lHEZHZJcNsAbD36JRkPn1+Had523twqvncuJ3vlR9
         um5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779042699; x=1779647499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCsUriNihkPBc/h2NHFhO6d1vtHtZyN+a8DU8yrxqds=;
        b=ns/jBqtRycAZq6UgASS46OA+ymjC9Qx4iYUC2aXLpaPD/It1Qq8vZuh9bKj+abaGtz
         Q+bHT179SSTEVHbP/DAROUFhgHGlZCKEfTRGYvXGdHXm+Lbhuy93UhCxUO2HuO0m3McT
         SQTaxCdKd8D/ZtGbmnOmX1y1uVCqlwmoFIPSwqkgd6IN/NahVO7LGwKrpgR5232iPP97
         G3i9Ql2K5Onthzlo1q4rQD+fS4jr3Pfxc2hT5jxSWhljubdt3GewbSTlnq8hmU0D09IT
         oSkRJMzsuvFEnt2McR4mHJ8N7tEdYf+WLt0Pp81M6RTH69/E0h7XY63vQcCzDdj1RFlm
         PV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779042699; x=1779647499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mCsUriNihkPBc/h2NHFhO6d1vtHtZyN+a8DU8yrxqds=;
        b=Rs8yaKK1FsvbEnsQp0hLpf1hK/lr47D2q8TePFLlGILtDYv+s8I7j7iQtSIpwysfe3
         BDO+Z5RddJlXsSC4KMqDzNZ5cY8L6Nl8JjqCdde8zcq9Q9MHwu4c0qZU1oBGWhaEDrak
         B8+Xmk/KhTPTt75bajOr+5WNmwC/IZFDOQxkDbct3FQDrRmcaM8Mks+3qp2PwCDYcTZF
         rQugLpa7TymnsnRX7GuCA2qookS3a8aAtCPtofp42eF1ifvcuYlWJ4dtFOeMWxjSUyCr
         3PjEQnLxewDStH7bofWxn+fiwO/CiN9S63cw+Jsg2xf2ZOEkE02jHgf/p1EFudyd24VO
         NtYw==
X-Gm-Message-State: AOJu0YyitToIY63ZE8cdRIIurHJpYe+UfyZ0WIGqe55KAFB7eiJ1259A
	IlX0OUyGW0TkrqYBS/sgvDNUYXBQV90zNv4YV8dvDd2Ex0FEMVf3N7uFEHbl260Xrkn8RfTwDYd
	OeB9VCAkxvuNitpiYJe+Ur25gedtSHLS/+nbU
X-Gm-Gg: Acq92OFkmHpkiShUQqkEWWo3B/XJQhPAoV4QudNeAcfpIgqUK598cjaEeo8iLS0LWLY
	1FvKQYlUkMc9hJf5Z8WfjByWpNt/JjAYq3LckUg6oAAkWs6x9iH9HaTIU299O2ZNhRXMUvDaPys
	JqZnoXNyuoB5MQnG54weJchlGqZdxDQHKXsgp+mrHg8Sd8XUXCljvaO6ZDkFcy+taJpISYoc33v
	i8OeL2p2FVaUpF634TZyI8YHpkHMhgyZdX1kl4SSChe2YAcAEe+ZCW3a6TcjP8gmChl+jmurTAd
	psBTyezF
X-Received: by 2002:a05:6830:380e:b0:7d7:ef0a:1ce9 with SMTP id
 46e09a7af769-7e4f2b44dccmr8561589a34.14.1779042699018; Sun, 17 May 2026
 11:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu> <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
 <20250731-attractive-lionfish-of-love-a01cd7@lindesnes> <CAGRSmLs6O+yvxQusQVRWCRiavZu_5qhTTLNqLkFHV6SEjKx_6g@mail.gmail.com>
 <aJRvL2UwDBVJ967k@fjasle.eu> <CAGRSmLvdAQ=nyh8TpeHVk4W2hPF3zr-UbapXUXhQDoa9aUfOyA@mail.gmail.com>
In-Reply-To: <CAGRSmLvdAQ=nyh8TpeHVk4W2hPF3zr-UbapXUXhQDoa9aUfOyA@mail.gmail.com>
From: "David F." <df7729@gmail.com>
Date: Sun, 17 May 2026 11:31:27 -0700
X-Gm-Features: AVHnY4LNTIq_pTfumHrZaqikFOq_T64tVRdx1xPqIXdS0XdqXK0HggvnE1GMjpA
Message-ID: <CAGRSmLsWJK89xj9XYsp-X8wjxgejqOacngqRZ4F6x5MJTC8A9g@mail.gmail.com>
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2704F563253
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13206-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

It turns out AI tells me the debian package environment HOST is the
target, not the host, this patch fixes it (and I can go back to using
my normal: make -j$(nproc) ${extraversion} bindeb-pkg):

--- linux-6.18.29-64/scripts/package/builddeb.org    2026-05-17
10:48:29.756054183 -0700
+++ linux-6.18.29-64/scripts/package/builddeb    2026-05-17
10:49:56.827568012 -0700
@@ -139,7 +139,7 @@
     pdir=3Ddebian/$1
     version=3D${1#linux-headers-}

-    CC=3D"${DEB_HOST_GNU_TYPE}-gcc"
"${srctree}/scripts/package/install-extmod-build"
"${pdir}/usr/src/linux-headers-${version}"
+    CC=3D"${HOSTCC:-gcc}"
"${srctree}/scripts/package/install-extmod-build"
"${pdir}/usr/src/linux-headers-${version}"

     mkdir -p $pdir/lib/modules/$version/
     ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build

On Sun, May 17, 2026 at 10:26=E2=80=AFAM David F. <df7729@gmail.com> wrote:
>
> Hello,
>
> I've worked with AI to tell me what's happening and it says: "So the
> exact issue is: kernel 6.18=E2=80=99s Debian packaging uses
> x86_64-linux-gnu-gcc as HOSTCC for the headers package, which is wrong
> for your 32-bit build host.".  It actually started with 6.15.x kernel
> but it's still there.
>
> In this case I updated the build to try and force the 32bit for host
> items (recall before it would build okay but the host items were
> ELF64, if I manually went back and ran the build from command line,
> not building package, it built as ELF32 as it should):
>
> extraversion=3D"EXTRAVERSION=3D-amd64"
>
> make ARCH=3Dx86_64 \
>         CROSS_COMPILE=3Dx86_64-linux-gnu- \
>         HOSTCC=3D"gcc -m32" \
>         HOSTCXX=3D"g++ -m32" \
>         HOSTCFLAGS=3D"-m32" \
>         HOSTLDFLAGS=3D"-m32" \
>         V=3D1 \
>         -j1 \
>         ${extraversion} \
>         bindeb-pkg 2>&1 | tee build.log
>
> This resulted with:
>
> # DEPMOD  debian/linux-image-6.18.29-amd64/lib/modules/6.18.29-amd64
>   ./scripts/depmod.sh 6.18.29-amd64
> dh_installdocs -plinux-image-6.18.29-amd64
> dh_installchangelogs -plinux-image-6.18.29-amd64
> dh_compress -plinux-image-6.18.29-amd64
> dh_fixperms -plinux-image-6.18.29-amd64
> dh_gencontrol -plinux-image-6.18.29-amd64 -- -fdebian/image.files
> dh_md5sums -plinux-image-6.18.29-amd64
> dh_builddeb -plinux-image-6.18.29-amd64 --
> dpkg-deb: building package 'linux-image-6.18.29-amd64' in
> '../linux-image-6.18.29-amd64_6.18.29-amd64-4_amd64.deb'.
> truncate -s0 debian/image-dbg.files
> truncate -s0 debian/headers.files
> dh_testdir -plinux-headers-6.18.29-amd64
> dh_testroot -plinux-headers-6.18.29-amd64
> dh_prep -plinux-headers-6.18.29-amd64
> make ARCH=3Dx86_64 KERNELRELEASE=3D6.18.29-amd64 KBUILD_BUILD_VERSION=3D4
> CROSS_COMPILE=3Dx86_64-linux-gnu- run-command
> KBUILD_RUN_COMMAND=3D'+$(srctree)/scripts/package/builddeb
> linux-headers-6.18.29-amd64'
> ./scripts/package/builddeb linux-headers-6.18.29-amd64
> make HOSTCC=3D"x86_64-linux-gnu-gcc" VPATH=3D srcroot=3D. -f
> ./scripts/Makefile.build
> obj=3Ddebian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-am=
d64/scripts
> make -f ./scripts/Makefile.build
> obj=3Ddebian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-am=
d64/scripts/basic
> \
> need-builtin=3D \
> need-modorder=3D \
>
> # HOSTCC  debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.2=
9-amd64/scripts/basic/fixdep
>   x86_64-linux-gnu-gcc
> -Wp,-MMD,debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29=
-amd64/scripts/basic/.fixdep.d
> -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
> -fomit-frame-pointer -std=3Dgnu11 -D_LARGEFILE_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -m32 -I ./scripts/include    -m32 -o
> debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/sc=
ripts/basic/fixdep
> debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/sc=
ripts/basic/fixdep.c
> /usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/l=
d:
> skipping incompatible /usr/lib/gcc-cross/x86_64-linux-gnu/10/libgcc.a
> when searching for -lgcc
> /usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/l=
d:
> cannot find -lgcc
> /usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/l=
d:
> skipping incompatible /usr/lib/gcc-cross/x86_64-linux-gnu/10/libgcc.a
> when searching for -lgcc
> /usr/lib/gcc-cross/x86_64-linux-gnu/10/../../../../x86_64-linux-gnu/bin/l=
d:
> cannot find -lgcc
> collect2: error: ld returned 1 exit status
> make[7]: *** [scripts/Makefile.host:114:
> debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/sc=
ripts/basic/fixdep]
> Error 1
> make[6]: *** [scripts/Makefile.build:544:
> debian/linux-headers-6.18.29-amd64/usr/src/linux-headers-6.18.29-amd64/sc=
ripts/basic]
> Error 2
> make[5]: *** [Makefile:2151: run-command] Error 2
> make[4]: *** [Makefile:2151: run-command] Error 2
> make[3]: *** [debian/rules:67: binary-headers] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess
> returned exit status 2
>
>
> AI told me to:
>
> Practical fix
>
> Patch scripts/package/builddeb so it uses native gcc for generated
> header tools instead of $(CROSS_COMPILE)gcc.
>
> Find the line like:
>
> make HOSTCC=3D"${CROSS_COMPILE}gcc" VPATH=3D srcroot=3D. \
>
> Change it to:
>
> make HOSTCC=3D"${HOSTCC:-gcc}" VPATH=3D srcroot=3D. \
>
> On Thu, Aug 7, 2025 at 2:17=E2=80=AFAM Nicolas Schier <nicolas.schier@lin=
ux.dev> wrote:
> >
> > (please reply below relevant quotations, cp. "Use trimmed interleaved r=
eplies
> > in email discussions" at Documentation/process/submitting-patches.rst)
> >
> > On Wed, Aug 06, 2025 at 08:46:24PM -0700 David F. wrote:
> > > Sorry for the delay, had to work on some other stuff..
> > >
> > > The output is below, it build it as ELF32 as it should.   I do note
> > > that your build command was like:
> > > x86_64_defconfig CROSS_COMPILE=3Dx86_64-linux-gnu- bindeb-pkg
> > >
> > > I don't have that, is it something new that is required, I just have:
> > >
> > > extraversion=3D"EXTRAVERSION=3D-amd64"
> > > make -j$(nproc) ${extraversion} bindeb-pkg
> > >
> > > Here's that output that worked:
> > >
> > >
> > > # make V=3D1 scripts/basic/fixdep
> > > make --no-print-directory -C /usr/src/mydisk/kernel/linux-6.15.6-64 \
> > > -f /usr/src/mydisk/kernel/linux-6.15.6-64/Makefile scripts/basic/fixd=
ep
> > > : "  SYNC    include/config/auto.conf.cmd"
> > > make -f ./Makefile syncconfig
> > > make -f ./scripts/Makefile.build obj=3Dscripts/basic
> > > # HOSTCC  scripts/basic/fixdep
> > >   gcc -Wp,-MMD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes
> > > -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu11
> > > -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64  -I ./scripts/include
> > > -o scripts/basic/fixdep scripts/basic/fixdep.c
> >
> > I am afraid, I lost track of what your actual problem is.
> >
> > It looks like fixdep is built the way it should, so the next step would=
 be
> > running bindeb-pkg with V=3D1 and finding its gcc call for building fix=
dep and to
> > verify both calls.  They should be (at least almost) the same.
> >
> > Kind regards,
> > Nicolas

