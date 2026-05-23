Return-Path: <linux-kbuild+bounces-13318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBhvNEIfEWovhgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13318-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 05:30:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F335BCFD3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 05:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D3233011BE3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 03:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4322F83A2;
	Sat, 23 May 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qx0TKf0m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB387282F10
	for <linux-kbuild@vger.kernel.org>; Sat, 23 May 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779507007; cv=pass; b=Fr/jovoG7lb0tgROM0xoS0GQzAYsNz6f96Oly73dimlODpl7nUelPIGaZcIZcmEWqBa7sQDKGEMy7UdxvHmfbyrH/yTgSVmDxtn0PfS1nk3T33fiGOD1U/pM+jA2TAD64yfdw7y91bgnGtw9XtSv+FV20qx8leOCg9TdhPKv0PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779507007; c=relaxed/simple;
	bh=8fhYLevNnBF4qV5jx88wOotlEU/Kvhd9jg/p+f/Zl+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/GbhQHYki8HYwpx99Nc/LZpG/cJ3hpo+twecRL+CxNZMLgpnRqWpGa55TKxVfmdiN4w9GM5UnISvMO1blIgzfRRcq656xyZVJyTKwnYbkaJOeKwNtXwiSNYENoo71SjhnYJhLEq4N6PCCfMjcjFSaOshEICVA4/sHYWQsB0sxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qx0TKf0m; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e61648f10so3291cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2026 20:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779507005; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5mBSbaEsKcUzogqGTOXhCKqO23dy1xCqgcKJiBiU5oe5BV+Ro1KX4BAlKGQXTMCaG
         KVZeVMtNKSqEeIIiWLXHelAsvhuRevRGJHCdF50uw11rJyNGKrrvRgKylNNnwJVD9WAM
         PDnBRtvCBhAbaootuciWRhXE7Uce8qASkBixtC2CXpcNaOPz3mBdPrpTeS4kTmdyU2dC
         1lu9NZxkYsAk4lHgfDWj93AmCMJlNh3p9N4zP7BP43HTviBeNj87XPx5dRZydY/8W/Yy
         /Nc8VXm7XHNuJvs6H83vezdUYzXRHtUrn4KwJ591N9z1CIgGukAu8NysYtZyknB3xuUU
         TEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        fh=eQOBYH2e+kLbjZ6tpG6vz2iIK53ZsDaTVz30GaT6ruM=;
        b=EQ31drG2YZU4pTL40rnzrL1mBkOS6OjyPXpUi/8ZcI9fOLnQZG6WVOyQ7KXUy8HV6v
         WLpHlm+sHi+eowSwqO3Qa5hRDorV5RHrxYF4psipa2WXbT65DH00XxPlaj/FyTEi+Msb
         I/E2utbDHFYICY0/Cn9PO+M2T0ZB4u4Q84qsuYaqwtzF4wGSBZe8vIiiDg3Uf3fdShH4
         ZTGRc9VK3rrB8NMPqc0lQ2BfPV7m4GldxVrjQfIhPNchdHlmkusXIPYDYwLfGBLGAcu7
         l07qRaL91JzJAVB1v3Qz6idNTQ+bxmAH8Kgs0t+KvW44+VXb20pgJxQ8zIAWdhuEmExc
         3T/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779507005; x=1780111805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        b=Qx0TKf0m5UhJ5Tg9Q1T/O1MpZMC7HAOM2Hp/Nu9YIHNUv1r31NzOowzMIQXEZG9QeA
         Y+gpjDvBRvUatCO+H9/CslYfm8mkW2HrJi/wGUvg11GwULCS/IsBPXo4ho/yqA90NgMz
         gzMMXx/nfeP2JLrSBHV4HVGSE1a7MAMYs2F5D8vEpbL7iOxK6sgFGeouIav+tYDgk8fM
         nsZHxSt663oE0nEIIKgmo+iMUYyQHF1TJKjpnDzB0a8wtgwzi48ptaHqFPjcFKk1kQl4
         i4VwyIVJvjktzYaI/I3vQvEhulKMPr+xBytrXyK10kmCcYDyN2tBPOt7aasIP/9Z8RFb
         5vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779507005; x=1780111805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JK5gLxQbjIkEbCgE/V3XaU3F+kQQGKdHkKUQ+3yQlX0=;
        b=qW+wMj59tcojLVmhKOxowFfK6vAdwp1xxU+dyAaWWYtp+NSshfnRhf1xFIZSm09lqG
         LIUB6auFSjhowcvivw4pDd6VgZOqaK8thAfdcB4i5C2SeEGXvi5O6capdB7uBgxTW//8
         SIi0zwecVEBvh8V2Zt1ArbxDECOckXBusIOgBxvs37o09FyJcbVGgsNI4YQgFluCqSFF
         Mz+cs5lUHO6CxniT/2n9y37J1677TxukNTtsGaJVKv2uAllezqNzXgwBzzRJh8Hj9BiU
         Xe84TSF0DhnCBGmwU0OdP1iwbFfvg+CNfs3MKxuhKk7n8y6ZWEl2dHyLW0gOacmn4guP
         TusQ==
X-Forwarded-Encrypted: i=1; AFNElJ98HBFbQpmzZ744bLxU4fgIgfiGceFZPLx+Jp+vMETwenK9Tv0zM5sc5H3Drh1v/tDH80itNJ3/iOg2a6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzewnWHn4W7Hg3BQJgCDiOheLcNqcKaPd847/db95VtT9LlmbhU
	Eb/d2kM1mF5N9aNh0izoaS4FE6eU5LckBrJBewrgC9hS2Vx3YqhRfTzb4fMrSY0G6NwuihUrSnt
	ZGLoWpW7mP1Qqjkb/moEF/M5dNIw5AaSghP6GmsRb
X-Gm-Gg: Acq92OFKghqQh6IwZuKoRQdNRgDVF1mM/pgfrDpJ5QDX7sh7bOfoPS2cBPwgZzzoRWs
	97CIOoyjKFJCOAIS2Wc423dNt1mGuecIhalOa8f1zIbVoSQFgRUzlFN5+U9qtNudlgiadxaHxGB
	b4iDyt6c0rNDwHoVPW6dECtUuSGKlYKYf5rF/JABCkG8WwDQ/JbcmgZXbcNEZ+CVx7UZqLBYBGZ
	bYc0nkquOdZTK4SapagQS0Vk00OdVWpmWgwzlMI8AUgdWPnmCY5ptWVx5sSTE6M6NWZ2IN/yt00
	09XqKEVvcj4pVOFt+4UWEPTQlRRpSQ==
X-Received: by 2002:ac8:740d:0:b0:50f:d03e:6482 with SMTP id
 d75a77b69052e-516e1420bcdmr4200341cf.4.1779507004366; Fri, 22 May 2026
 20:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331154827.2793269-4-xur@google.com> <20260331162729.GA2006419@ax162>
 <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev> <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev> <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev> <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev> <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
 <20260523011721.GB520407@ax162>
In-Reply-To: <20260523011721.GB520407@ax162>
From: Rong Xu <xur@google.com>
Date: Fri, 22 May 2026 20:29:53 -0700
X-Gm-Features: AVHnY4KMRqv8x9cFMRsJgYipZ3Ido1JNxvYz-UijLOJrxb35a4lmr5hy5RjuEZI
Message-ID: <CAF1bQ=ScvbDL4TY8=FJzwULP9KS-aZ4K=o4f+QxGssca+Q7ovQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13318-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux.dev:email]
X-Rspamd-Queue-Id: 37F335BCFD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thanks Nathan for comments and suggestions. My comments are inlined.

On Fri, May 22, 2026 at 6:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, May 22, 2026 at 11:58:35AM -0700, Rong Xu wrote:
> > On Fri, May 22, 2026 at 11:44=E2=80=AFAM Yonghong Song <yonghong.song@l=
inux.dev> wrote:
> > > On 5/22/26 11:14 AM, Rong Xu wrote:
> > > > On Fri, May 22, 2026 at 10:52=E2=80=AFAM Yonghong Song <yonghong.so=
ng@linux.dev> wrote:
> > > >> On 5/22/26 8:32 AM, Rong Xu wrote:
> > > >>> On Thu, May 21, 2026 at 2:57=E2=80=AFPM Yonghong Song <yonghong.s=
ong@linux.dev> wrote:
> > > >>>>
> > > >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> > > >>>>> Yonghong, thanks for the update.
> > > >>>>>
> > > >>>>> Regarding this guard: ther is a period of Clang (before this pa=
tch and
> > > >>>>> after your first patch), even though ld.lld having these option=
s
> > > >>>>> (specifically --lto-whole-program-visibility -mllvm
> > > >>>>> -always-rename-promoted-locals=3Dfalse), distributed ThinLTO mo=
de
> > > >>>>> remains unsupported, correct? What the behvior of using this op=
tions
> > > >>>>> in distributed mode with these compilers? nop or it will lead t=
o
> > > >>>>> error?
> > > >>>> The in-process thin-lto support is landed on Feb 27.
> > > >>>> The distributed thin-lto support is landed on Apr 24.
> > > >>>>
> > > >>>> If people are using distributed thin-lto in kernel between Feb 2=
7 and
> > > >>>> Apr 24, there will be some issues. But people typically use rele=
ased
> > > >>>> compiler, so we should be fine.
> > > >>> This is not the case for us (google). We do use compiler b/w rele=
ases,
> > > >>> and we build our own.
> > > >>>
> > > >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> > > >> If you use the custom compiler between Feb27 and Apr24 and your ke=
rnel
> > > >> will do distributed thin-lto, you can remove
> > > >>      $(call ld-option,--lto-whole-program-visibility -mllvm -alway=
s-rename-promoted-locals=3Dfalse)
> > > >> from your kernel. Since you have custom compiler, you can
> > > >> do some customization for your kernel as well.
> > > > I am referring to this specific patch -- there are cases that use
> > > > custom compilers built between the February 27 and April 24 LLVM
> > > > releases.
> > > > I don't want to see any breakage for distributed ThinLTO in these c=
ases.
> > > >
> > > > I would prefer to keep this guard for distributed ThinLTO for the t=
ime
> > > > being and remove it later. What do you think?
> > >
> > > For 'remove it later', when this will happen? When llvm23 cuts the rc
> > > in July or cut the release in September or the end of bug fix say in =
December?
> >
> > I can remove the guard when the minimal clang containis the 4/24 patch.
>
> I think we could just change
>
>   ifdef CONFIG_LTO_CLANG_THIN
>   KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility -ml=
lvm -always-rename-promoted-locals=3Dfalse)
>   endif
>
> to
>
>   ifneq ($(CONFIG_LTO_CLANG_THIN)$(CONFIG_LTO_CLANG_THIN_DIST),)
>   KBUILD_LDFLAGS +=3D $(if $(call clang-min-version,230100),--lto-whole-p=
rogram-visibility -mllvm -always-rename-promoted-locals=3Dfalse)
>   endif
>
> when LLVM 23.1.0-rc1 is out to avoid that Feb 27 to Apr 24 breakage?

I don't understand why we need this new "ifneq ..." guard. We have
already checked CONFIG_LTO_CLANG=3Dy, and CONFIG_LTO_CLANG_FULL !=3D y.
I think this "ifnef ..." will always be true (so redundant).

>
> > > If we carry the guard (for distributed thinlto) in this kernel releas=
e,
> > > that means at some point, we will need to do kernel backport, extra w=
ork.
> >
> > I don't understand here: this is part of the distributed thinlto patch
> > that you would need merge anyay.
> > where is the extra work for backporting?
> >
> > > Also, since you are building custom in-development compiler, you can
> > > disable this flag -always-rename-promoted-locals, problem solved, rig=
ht?
> >
> > I'm not only talking about me. There are other users also use this way.
> > BTW, even in google, I don't control the compiler that being used.
>
> So in general, we assume that folks who are using prerelease compilers
> (i.e., 23.0.0 in this case) are upgrading them regularly, as we may need
> to workaround or fix issues that happen in main that cannot be
> dynamically detected (at least not easily or conveniently). For example,
> recent main versions of clang have support for -Wattribute-alias, so we
> need to turn it off via #pragmas like done for GCC, which will break
> things for clang-23 versions that do not have -Wattribute-alias:
>
>   https://git.kernel.org/nathan/c/bc5ffe737f56ee2734597069ed71f4883054948=
3
>
> So the argument about breaking compilers in between Feb 27 and Apr 24 is
> not really relevant in my opinion since they should be short lived in
> terms of deployment. However, given that things work the way the check
> is currently written and the LLVM 23 branch is only a couple of months
> away, I am fine with just sticking with how it is currently written and
> updating it when things are more guaranteed to work.

This works for me. I can add a comment here.
Like the following:
=3D=3D=3D=3D=3D
 ifdef CONFIG_LTO_CLANG
-ifdef CONFIG_LTO_CLANG_THIN
+ifdef CONFIG_LTO_CLANG_FULL
+CC_FLAGS_LTO   :=3D -flto
+else
 CC_FLAGS_LTO   :=3D -flto=3Dthin -fsplit-lto-unit
+
+# The following clang options added on 2026-02-27 lack distributed
+# ThinLTO support until the 2026-04-24. Disabling for distributed
+# builds until the minimum clang version is updated.
+ifdef CONFIG_LTO_CLANG_THIN
 KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility
-mllvm -always-rename-promoted-locals=3Dfalse)
-else
-CC_FLAGS_LTO   :=3D -flto
+endif
 endif
 CC_FLAGS_LTO   +=3D -fvisibility=3Dhidden
=3D=3D=3D=3D=3D

If you are fine with this, I can send v10 for review.

>
> --
> Cheers,
> Nathan

