Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F3522A620
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 05:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733310AbgGWDjU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 23:39:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729401AbgGWDjU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 23:39:20 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66C37206F4;
        Thu, 23 Jul 2020 03:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595475559;
        bh=epodE8uy0RW5ik94H3duPLrkIOhtXkGFiZe4rORNIq0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iNEmb9oc6jfI1/PgI3HZAqnHR1dBwgO/4O7qqSJQHcLBSbjoVx6L1MyUxS8MQiIXc
         lceOUzV1Fnw9GRdhq/4gYFCIJHOQKl/NEcVRaW5xLS2KLsvrH5BHqsR0cA+KCu+deZ
         qoRy8QHfh+aMG4AnoY6ykoyhW+CnbaotJUBovZNw=
Date:   Wed, 22 Jul 2020 20:39:19 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Feng Tang <feng.tang@intel.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        andi.kleen@intel.com, ying.huang@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [RFC PATCH] makefile: add debug option to enable function
 aligned on 32 bytes
Message-Id: <20200722203919.8b7c9b35ff51d66550c3846c@linux-foundation.org>
In-Reply-To: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
References: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Jul 2020 11:30:01 +0800 Feng Tang <feng.tang@intel.com> wrote:

> Recently 0day reported many strange performance changes (regression
> or improvement), in which there was no obvious relation between
> the culprit commit and the benchmark at the first look, and it causes
> people to doubt the test itself is wrong.
> 
> Upon further check, many of these cases are caused by the change
> to the alignment of kernel text or data, as whole text/data of kernel
> are linked together, change in one domain may affect alignments of
> other domains.
> 
> gcc has an option '-falign-functions=n' to force text aligned, and with
> that option enabled, some of those performance changes will be gone,
> like [1][2][3].
> 
> Add this option so that developers and 0day can easily find performance
> bump caused by text alignment change,

Would they use it this way, or would they simply always enable the
option to reduce the variability?

It makes sense, but is it actually known that this does reduce the
variability?

> as tracking these strange bump
> is quite time consuming. Though it can't help in other cases like data
> alignment changes like [4].
> 
> Following is some size data for v5.7 kernel built with a RHEL config
> used in 0day:
> 
>     text      data      bss	 dec	   filename
>   19738771  13292906  5554236  38585913	 vmlinux.noalign
>   19758591  13297002  5529660  38585253	 vmlinux.align32
> 
> Raw vmlinux size in bytes:
> 
> 	v5.7		v5.7+align32
> 	253950832	254018000	+0.02%
> 
> Some benchmark data, most of them have no big change:
> 
>   * hackbench:		[ -1.8%,  +0.5%]
> 
>   * fsmark:		[ -3.2%,  +3.4%]  # ext4/xfs/btrfs
> 
>   * kbuild:		[ -2.0%,  +0.9%]
> 
>   * will-it-scale:	[ -0.5%,  +1.8%]  # mmap1/pagefault3
> 
>   * netperf:
>     - TCP_CRR		[+16.6%, +97.4%]
>     - TCP_RR		[-18.5%,  -1.8%]
>     - TCP_STREAM	[ -1.1%,  +1.9%]

What do the numbers in [] mean?  The TCP_CRR results look remarkable?

> [1] https://lore.kernel.org/lkml/20200114085637.GA29297@shao2-debian/
> [2] https://lore.kernel.org/lkml/20200330011254.GA14393@feng-iot/
> [3] https://lore.kernel.org/lkml/1d98d1f0-fe84-6df7-f5bd-f4cb2cdb7f45@intel.com/
> [4] https://lore.kernel.org/lkml/20200205123216.GO12867@shao2-debian/
> 

