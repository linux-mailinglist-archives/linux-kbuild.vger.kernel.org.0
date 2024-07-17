Return-Path: <linux-kbuild+bounces-2561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0293361B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 06:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C19B1F220AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 04:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B28B64C;
	Wed, 17 Jul 2024 04:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7ghpope"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9223D2;
	Wed, 17 Jul 2024 04:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721191630; cv=none; b=G55aL72MnyY6uoGKUju94m7Za8KQbwIQRCBxxzETRiehTpgxIBXNkFgL4onsYUCeCMmwFYLYP+B7x8dummJ/NfBCiH41nHh4EVADMlV6dkMhDpOSJKkKQY6q2xccJM9gf86G8liNmcDETB/9tHGyHUZ11MSE2B2hDr4j2AnK4d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721191630; c=relaxed/simple;
	bh=O00HlWRq3/YI66sw0KHGSmVq8UO+Yk0xqgU9Ht2Ogu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e26Dj0Xjb/2xhrd+Nm7rSf6hxUOuBsvRVP2KESSvCy4t0GIthrxlG80hq+dt/si6fs0jxUuIQBMovPd7wWW7BqpGjxXA9U7Jeb5NI5on2CT05bdqy7ns97YzgTBWxmVBRCeikTgqLLgtuBU37SWQUkdlaNfVI22W17hGGMaBRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7ghpope; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6EC2C4AF0E;
	Wed, 17 Jul 2024 04:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721191629;
	bh=O00HlWRq3/YI66sw0KHGSmVq8UO+Yk0xqgU9Ht2Ogu4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K7ghpopeYN2cDE2jv1GuUBMvARpEscDUNxnExZN8nLgmtEA9CX0kR/uFglBoTYvw7
	 YYDpMS16bPzTVvWLI7R3fNHL4584MgLCaC98Fn5s3VPvP3OabO7cOyFlpOQpTK/k4y
	 lgASxUq3R9Srfe/9spW/HoRRaltnxko7eQwrEbjZpRz7vLKbJM6wAZ9rS40GFZYx4n
	 VpAc8H/Oi7PkMZo2rHJ1oKNnSr9dJ9cDl3IAbeG9bqhQl/OhSmy0vEVav05HH1jcyB
	 4cLc5jOq+cHtPl+wjz+aAHcten2kJj4LsQewtfwrwKF72HHgvdLyiOU8L591VLJwFf
	 uoXGqRWAFjtWQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so88751831fa.2;
        Tue, 16 Jul 2024 21:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHq/6x8ya9OIqO+Rdl7jovj3dHm2Fe1XotEXcyYiVakaDyY1dfPIJ2WqavylcAHOT4GfcTTL0Q3IIB5Ox2p9ht5VYW8b6qX2TU3swFN5vfU8lRvSaYtfd7fJ25FSHqOXZSCokKRB8c4QOz6zP4ZgoDQUFQZY7ZBxGqx3fkUAsUf+DCeU0Qv0Vwansx
X-Gm-Message-State: AOJu0YxaXdd81Ms7nMIFTAc2H1QH7RGDB3F97ggZevmiBJOcWLc1TrKR
	H4vm7JrdafxGWZWNehj4zWDgL/6/Bs1XGu4ExxC0onDvPhs1SV2QTCkjB2EV4iM+tspUHZahfR4
	G4pwJwD+RiIBUyT/4P6s7GqKQTx0=
X-Google-Smtp-Source: AGHT+IFhJUAahC0YXBMFeaWxUm1UYTIiYutbuK+Xbs1qfllp2riK57VQcHNcH4yDtC9N5eQw5wY0SvhE1HPavxXuqWg=
X-Received: by 2002:a2e:3c11:0:b0:2ec:5fa1:2434 with SMTP id
 38308e7fff4ca-2eefd06e7dcmr3309641fa.9.1721191628509; Tue, 16 Jul 2024
 21:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715144529.101634-2-masahiroy@kernel.org> <202407170104.dCe5MKsA-lkp@intel.com>
In-Reply-To: <202407170104.dCe5MKsA-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Jul 2024 13:46:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmJcyyzL-jVJfBPi3W684LTDmuhMf1koF0TXoCpKTmcw@mail.gmail.com>
Message-ID: <CAK7LNARmJcyyzL-jVJfBPi3W684LTDmuhMf1koF0TXoCpKTmcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] fortify: use if_changed_dep to record header
 dependency in *.cmd files
To: kernel test robot <lkp@intel.com>
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 2:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Masahiro,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.10 next-20240716]
> [cannot apply to akpm-mm/mm-nonmm-unstable kees/for-next/hardening kees/f=
or-next/pstore kees/for-next/kspp]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/fo=
rtify-use-if_changed_dep-to-record-header-dependency-in-cmd-files/20240715-=
224820
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240715144529.101634-2-masahiro=
y%40kernel.org
> patch subject: [PATCH 1/3] fortify: use if_changed_dep to record header d=
ependency in *.cmd files
> config: i386-randconfig-004-20240716 (https://download.01.org/0day-ci/arc=
hive/20240717/202407170104.dCe5MKsA-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240717/202407170104.dCe5MKsA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407170104.dCe5MKsA-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-memcpy.lo=
g.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcmp.lo=
g.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr.log=
.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy-li=
t.log.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memmove.l=
og.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-strncpy-s=
rc.log.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.read_overflow-memcmp.log=
.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.read_overflow-memscan.lo=
g.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy.lo=
g.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-memmove.l=
og.d: No such file or directory
> --
> >> fixdep: error opening file: lib/test_fortify/.write_overflow-memset.lo=
g.d: No such file or directory
> ..



This issue seems to occur with GCC <=3D7


$ echo 'void b(void) __attribute__((__error__(""))); void a(void) {
b(); }' | gcc -Wp,-MMD,test.d -c -o /dev/null -x c -


did not create *.d with GCC <=3D 7.

I do not see the issue with GCC >=3D 8 or Clang.


One quick solution is to skip the test for GCC <=3D 7.





>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>


--=20
Best Regards
Masahiro Yamada

