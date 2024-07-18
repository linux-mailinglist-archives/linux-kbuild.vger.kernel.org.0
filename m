Return-Path: <linux-kbuild+bounces-2591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD9934720
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 06:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACB3CB214A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 04:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D15A3C6A6;
	Thu, 18 Jul 2024 04:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG4LYBXO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9141E520;
	Thu, 18 Jul 2024 04:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721276618; cv=none; b=bwcH0spAXsdy9Grrzu2lwqVkmEwuXUzuSpI93Z7WgbrJJ/DPXskedbwKfFIO6OjBM8aZuHlAmIPHKOOUanG0e4tH499jlYDv9LimRPzLezPAIa2pjCEDBr5fKzpuyTq+aBRQQ2zgAhISeBBfdrreOi8HuvxxzA1VtGzU1EVLvZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721276618; c=relaxed/simple;
	bh=BC1ly2XhabHaargWQzMhTuH7TYChEjz2PkjD7IEgYLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDgqS63bm0Dan26J7z4YDW2lykZU70PYhg2XIgEEnLjgtVTBlDzjzdy//wSK8GDc9B8TdZvhDgoE9yoD54jJotZOb1CruB+VoVc4gA1p+ZH6NLaqzmhmiDdRYhiagbdiAsWFe4mc8JWCkcF2xSaG4Y3ubTvcXSrj+I8vtYTviuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG4LYBXO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F486C4AF0B;
	Thu, 18 Jul 2024 04:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721276617;
	bh=BC1ly2XhabHaargWQzMhTuH7TYChEjz2PkjD7IEgYLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SG4LYBXOKiCD6ZNct82wKnaBIZ4gHkZVV653qh3I8tI2sO74ty6vY/4AGvV+4/bfb
	 DNtFmkmlMmSB2M5nls/Uj3R2maIV/d2NF70mfGPuVwBT4Cj+RjxCDPYEYIBnCh4GbF
	 spEHSOdivph9ZYs9H1bG3iulREJLRifGN3HDpvcjR1N75QpcTCwI0erwYSNZ/QI8TT
	 O3l9UfSjo9a3L96J8laRr0Cwqz8zOVkTeni8pwn0Vw2QDclzUODt3PEEPFWLxsBlJA
	 IXL6hifdHde9pbf9sfR9VnsYRtfWPDh59TFLcZVYln9n2ih2OsgcjnBeFPr5qJRzCw
	 2kPWwOGzTFYQA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eee083c044so4220471fa.3;
        Wed, 17 Jul 2024 21:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFLP2AejJC9K7VNaVuTO4IGVQH3JKqSVCfjLK9aw116Dy1k+jNk7iabAuI0/eHrQ7vjouDpZ1OF+a1GDAMJDoEHSHr+Ry6Trh0ax//x1RWPhBxR5a7KZxr5fI1Ud5iBlJXoDpQtfSO4rUops6hex9prSfwD6rLT6aJRALG9pC1LBMPqw6u4bMoAkqk
X-Gm-Message-State: AOJu0YxfU13/fEWFcE5fykqnBR98/K78efle9+SBODelM6w7b8W9fP5S
	/pKbkSu8jywUD/apHNkOWfzQTLOsyMLSLfruEQB3CGot48dhFRMAJWn2cysWjB18ydbnZerPV3B
	Gecd0moIAOfBKyz7xe5x9+UPE024=
X-Google-Smtp-Source: AGHT+IHVMC7ZBPrOh8Be2nCK/k5Smu8cjV1zA2tfZpClitYjhQaSXezCsrYpK5lpzYRa0zfrXfCt+CglMTNx90aiosU=
X-Received: by 2002:a05:651c:b2b:b0:2eb:d924:43fb with SMTP id
 38308e7fff4ca-2ef05d4d2abmr9556511fa.41.1721276616278; Wed, 17 Jul 2024
 21:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715144529.101634-2-masahiroy@kernel.org> <202407170104.dCe5MKsA-lkp@intel.com>
 <CAK7LNARmJcyyzL-jVJfBPi3W684LTDmuhMf1koF0TXoCpKTmcw@mail.gmail.com> <202407171517.EC9EE07@keescook>
In-Reply-To: <202407171517.EC9EE07@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 13:22:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaXiYviTz=pYnnjsrfssw7P+o7eXTAuY_30cayRRv8KA@mail.gmail.com>
Message-ID: <CAK7LNAQaXiYviTz=pYnnjsrfssw7P+o7eXTAuY_30cayRRv8KA@mail.gmail.com>
Subject: Re: [PATCH 1/3] fortify: use if_changed_dep to record header
 dependency in *.cmd files
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-hardening@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 7:19=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Jul 17, 2024 at 01:46:32PM +0900, Masahiro Yamada wrote:
> > On Wed, Jul 17, 2024 at 2:51=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on linus/master]
> > > [also build test ERROR on v6.10 next-20240716]
> > > [cannot apply to akpm-mm/mm-nonmm-unstable kees/for-next/hardening ke=
es/for-next/pstore kees/for-next/kspp]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamad=
a/fortify-use-if_changed_dep-to-record-header-dependency-in-cmd-files/20240=
715-224820
> > > base:   linus/master
> > > patch link:    https://lore.kernel.org/r/20240715144529.101634-2-masa=
hiroy%40kernel.org
> > > patch subject: [PATCH 1/3] fortify: use if_changed_dep to record head=
er dependency in *.cmd files
> > > config: i386-randconfig-004-20240716 (https://download.01.org/0day-ci=
/archive/20240717/202407170104.dCe5MKsA-lkp@intel.com/config)
> > > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240717/202407170104.dCe5MKsA-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202407170104.dCe5MKsA=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memcp=
y.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcm=
p.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr=
.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcp=
y-lit.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memmo=
ve.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strnc=
py-src.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memcmp=
.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memsca=
n.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcp=
y.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memmo=
ve.log.d: No such file or directory
> > > --
> > > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memse=
t.log.d: No such file or directory
> > > ..
> >
> >
> >
> > This issue seems to occur with GCC <=3D7
> >
> >
> > $ echo 'void b(void) __attribute__((__error__(""))); void a(void) {
> > b(); }' | gcc -Wp,-MMD,test.d -c -o /dev/null -x c -
> >
> >
> > did not create *.d with GCC <=3D 7.
> >
> > I do not see the issue with GCC >=3D 8 or Clang.
>
> Any idea why this happens here and not for other sources in the tree?


Because the logic is opposite.


For other locations, you need to write the correct code.
When it is compiled successfully, *.d is generated as well.



Under lib/test_fortify/, you intentionally incorrect code.
GCC emits a compile error, and test_fortify.sh checks
the error message.
I believe *.d should be still generated unless a pre-processor error occurs=
.





> > One quick solution is to skip the test for GCC <=3D 7.
>
> I'd be fine with that -- it is designed to catch regressions/misbehaviour=
s
> in newly release compilers so I don't mind dropping checks against older
> versions.
>
> --
> Kees Cook



--=20
Best Regards
Masahiro Yamada

