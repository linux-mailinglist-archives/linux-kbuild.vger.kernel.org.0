Return-Path: <linux-kbuild+bounces-2271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2F91AF0D
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 20:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B5B1C222DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 18:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B7419AD61;
	Thu, 27 Jun 2024 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7znGRx8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6D1CD31;
	Thu, 27 Jun 2024 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719512874; cv=none; b=iuSzD1vfkrxxJA8+mqGTLhXF5WFTCF8r7zxow6ZME9mcDTibA7nfwcouVBHpLfnrs20c1iD2V6Bkxww0UiVUqSOTw320xWn2Fxg+MFcE9A/v0n84/5ZpwRm4pID81O6r5h+8hPsNTiQ475PzwaPpCUs9RZ+G0ylLqjnRPyLwOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719512874; c=relaxed/simple;
	bh=56QYmCBCQi/U60YRIiiZR8AMhOLTG5V5s76fX5jQUSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3QUaNLI5Q4Fqk5rvXm/M+oGENomV1SPK1Dq9eEhOvCN5qwOMGImokXrBps/oLWnDLtstb48npWdLznOf7pRC8s1rY3+xUMhaAjvgaa/Dc0l0Sh1S9vasz2uU9NyWB3MSWzRHRTdTsVOgZYqAG/uAEwwa/Dmh48oE+jds45mqBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7znGRx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3274FC2BBFC;
	Thu, 27 Jun 2024 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719512874;
	bh=56QYmCBCQi/U60YRIiiZR8AMhOLTG5V5s76fX5jQUSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7znGRx8fLQuyLACpS97kAQkC9YTDrHlHEuoimH170Gho8I6SiyxM6S9nIXF33a2E
	 4xr9N2wLF4+1qbBOskS3CyjBU0lc9GU7yk6mWdz6zSiMCQejH4BrlMLtaG/YCJE+g9
	 TbzVPqBDllme3w9WDvhd+M4JgDMwCIybxgR8FVCakRBjj8EKS2cM4pDKkWmgp7juuj
	 8ORbi3ppyeSxnH05mXnW7eUtsk8ni2OZJCw8EaUlUspfl4eecDL/ksyuSiVveW/vTg
	 LjXge+8hcVW1bLfyfFjodb2uji+8liMkI2hTKxkmhBXk8kiRXSlowjX+ve7j/YSZjv
	 wKHRNglX8v1fg==
Date: Thu, 27 Jun 2024 11:27:53 -0700
From: Kees Cook <kees@kernel.org>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Shevchenko <andy@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>, Xin Li <xin3.li@intel.com>,
	Michael Roth <michael.roth@amd.com>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PROBLEM] randconfig: =?utf-8?B?Li9p?=
 =?utf-8?Q?nclude=2Flinux=2Ffortify-string=2Eh=3A122=3A33=3A_error=3A_?=
 =?utf-8?B?4oCYX19idWlsdGluX3N0cmNweeKAmSBzb3VyYw==?= =?utf-8?Q?e?= argument
 is the same as destination [-Werror=restrict]
Message-ID: <202406271127.CEAE5F4E@keescook>
References: <f2d1425e-dc7d-444f-ba8d-4aac0c8fc882@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2d1425e-dc7d-444f-ba8d-4aac0c8fc882@gmail.com>

On Thu, Jun 27, 2024 at 08:25:01PM +0200, Mirsad Todorovac wrote:
> Hi all,
> 
> I hope it will catch your attention, for I couldn't sort out what is wrong with this:
> 
> KCONFIG_SEED=0xD859674
> 
> on vanilla torvalds tree, commit v6.10-rc4-366-gafcd48134c58
> 
> _______________________________________________________________
> $ time nice make -j 36 bindeb-pkg |& tee ../err-6.10-rc5-08.log; date
>   GEN     debian
> dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
> dpkg-buildpackage: info: source package linux-upstream
> dpkg-buildpackage: info: source version 6.10.0-rc5-gafcd48134c58-34
> dpkg-buildpackage: info: source distribution jammy
> dpkg-buildpackage: info: source changed by marvin <marvin@defiant>
> dpkg-architecture: warning: specified GNU system type i686-linux-gnu does not match CC system type x86_64-linux-gnu, try setting a correct CC environment variable
>  dpkg-source --before-build .
> dpkg-buildpackage: info: host architecture i386
>  make -f debian/rules binary
> #
> # No change to .config
> #
>   CALL    scripts/checksyscalls.sh
>   UPD     init/utsversion-tmp.h
>   CC      init/version.o
>   AR      init/built-in.a
>   CC      kernel/kallsyms.o
> In file included from ./include/linux/string.h:374,
>                  from ./arch/x86/include/asm/page_32.h:18,
>                  from ./arch/x86/include/asm/page.h:14,
>                  from ./arch/x86/include/asm/thread_info.h:12,
>                  from ./include/linux/thread_info.h:60,
>                  from ./include/linux/spinlock.h:60,
>                  from ./include/linux/mmzone.h:8,
>                  from ./include/linux/gfp.h:7,
>                  from ./include/linux/mm.h:7,
>                  from ./include/linux/kallsyms.h:13,
>                  from kernel/kallsyms.c:15:
> kernel/kallsyms.c: In function ‘__sprint_symbol’:
> ./include/linux/fortify-string.h:122:33: error: ‘__builtin_strcpy’ source argument is the same as destination [-Werror=restrict]
>   122 | #define __underlying_strcpy     __builtin_strcpy
>       |                                 ^
> ./include/linux/fortify-string.h:787:24: note: in expansion of macro ‘__underlying_strcpy’
>   787 |                 return __underlying_strcpy(p, q);
>       |                        ^~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[6]: *** [scripts/Makefile.build:244: kernel/kallsyms.o] Error 1
> make[5]: *** [scripts/Makefile.build:485: kernel] Error 2
> make[4]: *** [Makefile:1934: .] Error 2
> make[3]: *** [debian/rules:74: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> make[1]: *** [/home/marvin/linux/kernel/linux_torvalds/Makefile:1555: bindeb-pkg] Error 2
> make: *** [Makefile:240: __sub-make] Error 2

Does this patch solve the problem for you?

https://lore.kernel.org/lkml/20240604044228.2910712-1-liujinlong@kylinos.cn/

-Kees

-- 
Kees Cook

