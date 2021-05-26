Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2CE39135B
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 11:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhEZJIJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 05:08:09 -0400
Received: from outbound-smtp26.blacknight.com ([81.17.249.194]:41077 "EHLO
        outbound-smtp26.blacknight.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229594AbhEZJII (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 05:08:08 -0400
X-Greylist: delayed 338 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 May 2021 05:08:08 EDT
Received: from mail.blacknight.com (pemlinmail06.blacknight.ie [81.17.255.152])
        by outbound-smtp26.blacknight.com (Postfix) with ESMTPS id 0AF58CADBD
        for <linux-kbuild@vger.kernel.org>; Wed, 26 May 2021 10:00:42 +0100 (IST)
Received: (qmail 24661 invoked from network); 26 May 2021 09:00:41 -0000
Received: from unknown (HELO techsingularity.net) (mgorman@techsingularity.net@[84.203.23.168])
  by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated); 26 May 2021 09:00:41 -0000
Date:   Wed, 26 May 2021 10:00:40 +0100
From:   Mel Gorman <mgorman@techsingularity.net>
To:     Michal Such?nek <msuchanek@suse.de>
Cc:     linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Hritik Vijay <hritikxx8@gmail.com>, bpf <bpf@vger.kernel.org>,
        Linux-Net <netdev@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: (BTF) [PATCH] mm/page_alloc: Work around a pahole limitation
 with zero-sized struct pagesets
Message-ID: <20210526090040.GY30378@techsingularity.net>
References: <20210526080741.GW30378@techsingularity.net>
 <20210526083342.GY8544@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20210526083342.GY8544@kitsune.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 26, 2021 at 10:33:42AM +0200, Michal Such?nek wrote:
> >  lib/Kconfig.debug |  3 +++
> >  mm/page_alloc.c   | 11 +++++++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 678c13967580..f88a155b80a9 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -313,6 +313,9 @@ config DEBUG_INFO_BTF
> >  config PAHOLE_HAS_SPLIT_BTF
> >  	def_bool $(success, test `$(PAHOLE) --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/'` -ge "119")
> >  
> > +config PAHOLE_HAS_ZEROSIZE_PERCPU_SUPPORT
> > +	def_bool $(success, test `$(PAHOLE) --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/'` -ge "122")
> > +
> 
> This does not seem workable with dummy-tools.
> 
> Do we even have dummy pahole?
> 

I don't think so but if PAHOLE_HAS_ZEROSIZE_PERCPU_SUPPORT is broken for
you then the same problem should have happened for the PAHOLE_HAS_SPLIT_BTF
check.

-- 
Mel Gorman
SUSE Labs
