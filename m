Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DC722A6CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 07:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgGWFNF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 01:13:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:5479 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgGWFNF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 01:13:05 -0400
IronPort-SDR: Vxw6ZeLAVOdUBpFKPCTd8v4jlu8zNEpoF/aYtdUiP5t2TNO07gJvsWLd46KySLKP0si/rFlUzq
 OadSqiRidVRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="215084171"
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="215084171"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 22:13:04 -0700
IronPort-SDR: gWZrBm1izJAl9u0I2A39lXA1JwszO9u0GETX0aRo97DL/4voJPgOAvox4QwLJYkj71JI9+T4WW
 QDyX/EtErkVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="284454590"
Received: from feng-iot.sh.intel.com (HELO localhost) ([10.239.13.114])
  by orsmga003.jf.intel.com with ESMTP; 22 Jul 2020 22:13:01 -0700
Date:   Thu, 23 Jul 2020 13:13:48 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        andi.kleen@intel.com, ying.huang@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [RFC PATCH] makefile: add debug option to enable function
 aligned on 32 bytes
Message-ID: <20200723051348.GA5150@feng-iot>
References: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
 <20200722203919.8b7c9b35ff51d66550c3846c@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722203919.8b7c9b35ff51d66550c3846c@linux-foundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Andrew,

Thanks for the review.

On Wed, Jul 22, 2020 at 08:39:19PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2020 11:30:01 +0800 Feng Tang <feng.tang@intel.com> wrote:
> 
> > Recently 0day reported many strange performance changes (regression
> > or improvement), in which there was no obvious relation between
> > the culprit commit and the benchmark at the first look, and it causes
> > people to doubt the test itself is wrong.
> > 
> > Upon further check, many of these cases are caused by the change
> > to the alignment of kernel text or data, as whole text/data of kernel
> > are linked together, change in one domain may affect alignments of
> > other domains.
> > 
> > gcc has an option '-falign-functions=n' to force text aligned, and with
> > that option enabled, some of those performance changes will be gone,
> > like [1][2][3].
> > 
> > Add this option so that developers and 0day can easily find performance
> > bump caused by text alignment change,
> 
> Would they use it this way, or would they simply always enable the
> option to reduce the variability

We've had concerns about side effects, like increased kernel size won't be
accepted by embedded system, the possible i-cache usage/contention increase.

And I've only done limited benchmark test, so I thought it may be safer
to be off by default. Though my bold thought was it could be default on :)

> It makes sense, but is it actually known that this does reduce the
> variability?

Yes, at lease for the strange performance bumps reported by 0day, like
in [1][2][3].

> > as tracking these strange bump
> > is quite time consuming. Though it can't help in other cases like data
> > alignment changes like [4].
> > 
> > Following is some size data for v5.7 kernel built with a RHEL config
> > used in 0day:
> > 
> >     text      data      bss	 dec	   filename
> >   19738771  13292906  5554236  38585913	 vmlinux.noalign
> >   19758591  13297002  5529660  38585253	 vmlinux.align32
> > 
> > Raw vmlinux size in bytes:
> > 
> > 	v5.7		v5.7+align32
> > 	253950832	254018000	+0.02%
> > 
> > Some benchmark data, most of them have no big change:
> > 
> >   * hackbench:		[ -1.8%,  +0.5%]
> > 
> >   * fsmark:		[ -3.2%,  +3.4%]  # ext4/xfs/btrfs
> > 
> >   * kbuild:		[ -2.0%,  +0.9%]
> > 
> >   * will-it-scale:	[ -0.5%,  +1.8%]  # mmap1/pagefault3
> > 
> >   * netperf:
> >     - TCP_CRR		[+16.6%, +97.4%]
> >     - TCP_RR		[-18.5%,  -1.8%]
> >     - TCP_STREAM	[ -1.1%,  +1.9%]
> 
> What do the numbers in [] mean?  The TCP_CRR results look remarkable?
 
For each of the benchmark listed above, I took 2 or 3 test platforms
and run it with different parameters. So each of the benchmark will
have several cases run, and [] lists the lowest and highest result.

For the netperf/TCP_CRR case, the lowest is +16.6% on a Skylake server
with 16 testing threads, and highest is +97.4 on a Cascadelake server
with 96 testing threads.

Thanks,
Feng

> > [1] https://lore.kernel.org/lkml/20200114085637.GA29297@shao2-debian/
> > [2] https://lore.kernel.org/lkml/20200330011254.GA14393@feng-iot/
> > [3] https://lore.kernel.org/lkml/1d98d1f0-fe84-6df7-f5bd-f4cb2cdb7f45@intel.com/
> > [4] https://lore.kernel.org/lkml/20200205123216.GO12867@shao2-debian/
> > 
