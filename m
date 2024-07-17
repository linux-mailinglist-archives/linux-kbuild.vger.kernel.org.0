Return-Path: <linux-kbuild+bounces-2589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 791599344B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 00:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1821C20E93
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 22:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B63347F7A;
	Wed, 17 Jul 2024 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG00w2g7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A0374F6;
	Wed, 17 Jul 2024 22:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254746; cv=none; b=M//MFIxw2/hxZYgBORbKaaQSGye8wGAcBuhhcX+A5EmO642zub1Q/IcxDjnMXbPJQaOeQqUfBz0ljDuATJ13USb16o7XUvhyfosGe1a2CfwXxqSQqS0vLhhjtwwUPUIZ5IJVnYioMRQrwcH/Iefl6LrfabD+q6wrvMpCfEaqrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254746; c=relaxed/simple;
	bh=xc24c4DCXp9DmXRuS+gGjrGQINabT9K3W2WonlbSMP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ3cl4o+8LcKePjAIHOiE2728VgQa63qC7fnzJbH5szPFMlbFJP3UVmn1x1qUDCf++xJXyb9yDlrstzHxdkSifkIMShTPOxpyP5NQFlq4w+PDFscZLJnElSFg5rX0JLCW0FxnAjNAiUQ83WtJNWs5uFMVlggWNo4BLuh7cJ0MTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG00w2g7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F86BC2BD10;
	Wed, 17 Jul 2024 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721254746;
	bh=xc24c4DCXp9DmXRuS+gGjrGQINabT9K3W2WonlbSMP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VG00w2g7RKks1WqUv1BSAmpIy/Cx1npWfI4ZccNod8IrQWGhWOoCzAKp4ROsnOtC/
	 GKII1BI8AwS6hDYiQr1zTR4suyLH+Qje+f9x0/bNYnfFeZfYVq4xiAqR62/qcFrY+8
	 6yopV/i+rGFPsMAA1V4edFpgzQaWzX9xrCCVgJC+3MXO5fc/7F2LjZYifC/nGjNu4d
	 4M79UY/H1d+KWPiLgtbN1EBdMbgo6qcbukiIWVHfKsE7Rf3XlpXwHhSQ953ENY6RSR
	 jS+s0SsC58DbdZ6o1gqp+RJlvcXvocBuMkayMkSLpKjsWqW5iXjSgM4YkotO7ghlk8
	 fzTusG+7EOqeg==
Date: Wed, 17 Jul 2024 15:19:05 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-hardening@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] fortify: use if_changed_dep to record header
 dependency in *.cmd files
Message-ID: <202407171517.EC9EE07@keescook>
References: <20240715144529.101634-2-masahiroy@kernel.org>
 <202407170104.dCe5MKsA-lkp@intel.com>
 <CAK7LNARmJcyyzL-jVJfBPi3W684LTDmuhMf1koF0TXoCpKTmcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARmJcyyzL-jVJfBPi3W684LTDmuhMf1koF0TXoCpKTmcw@mail.gmail.com>

On Wed, Jul 17, 2024 at 01:46:32PM +0900, Masahiro Yamada wrote:
> On Wed, Jul 17, 2024 at 2:51 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Masahiro,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.10 next-20240716]
> > [cannot apply to akpm-mm/mm-nonmm-unstable kees/for-next/hardening kees/for-next/pstore kees/for-next/kspp]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/fortify-use-if_changed_dep-to-record-header-dependency-in-cmd-files/20240715-224820
> > base:   linus/master
> > patch link:    https://lore.kernel.org/r/20240715144529.101634-2-masahiroy%40kernel.org
> > patch subject: [PATCH 1/3] fortify: use if_changed_dep to record header dependency in *.cmd files
> > config: i386-randconfig-004-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170104.dCe5MKsA-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170104.dCe5MKsA-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407170104.dCe5MKsA-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memcpy.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcmp.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy-lit.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.read_overflow2-memmove.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strncpy-src.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memcmp.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.read_overflow-memscan.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memmove.log.d: No such file or directory
> > --
> > >> fixdep: error opening file: lib/test_fortify/.write_overflow-memset.log.d: No such file or directory
> > ..
> 
> 
> 
> This issue seems to occur with GCC <=7
> 
> 
> $ echo 'void b(void) __attribute__((__error__(""))); void a(void) {
> b(); }' | gcc -Wp,-MMD,test.d -c -o /dev/null -x c -
> 
> 
> did not create *.d with GCC <= 7.
> 
> I do not see the issue with GCC >= 8 or Clang.

Any idea why this happens here and not for other sources in the tree?

> One quick solution is to skip the test for GCC <= 7.

I'd be fine with that -- it is designed to catch regressions/misbehaviours
in newly release compilers so I don't mind dropping checks against older
versions.

-- 
Kees Cook

