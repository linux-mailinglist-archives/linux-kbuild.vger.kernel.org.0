Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCED52708E8
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Sep 2020 00:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgIRWXA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 18:23:00 -0400
Received: from smtprelay0190.hostedemail.com ([216.40.44.190]:34686 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726134AbgIRWW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 18:22:59 -0400
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 18:22:59 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id C3B711801BD7F
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 22:17:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id B478F180A9F5C;
        Fri, 18 Sep 2020 22:17:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3865:3867:3868:3873:3874:4321:5007:6119:9010:10004:10400:10848:11232:11658:11914:12043:12295:12296:12297:12679:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:14777:21080:21433:21451:21627:21819:30003:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: fuel96_17095382712e
X-Filterd-Recvd-Size: 1749
Received: from XPS-9350 (unknown [172.58.22.179])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Fri, 18 Sep 2020 22:17:07 +0000 (UTC)
Message-ID: <db060a64c2499fc497d50ee480696b1450c07125.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: fix KERNEL_BUILD entry
From:   Joe Perches <joe@perches.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>
Date:   Fri, 18 Sep 2020 15:17:05 -0700
In-Reply-To: <20200918220431.251873-1-pierre-louis.bossart@linux.intel.com>
References: <20200918220431.251873-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 2020-09-18 at 17:04 -0500, Pierre-Louis Bossart wrote:
> the get_maintainer.pl script throws the following errors:
> 
> Unmatched () '(open list:KERNEL BUILD + files below scripts/ (unless
> mai...)' '' at /usr/lib/git-core/git-send-email line 546.
> 
> error: unable to extract a valid address from:
> linux-kbuild@vger.kernel.org (open list:KERNEL BUILD + files below
> scripts/ (unless mai...)
> 
> Removing parentheses and adding dash separators makes this go away.

That's the git send-email program, not get_maintainer.pl.

btw: you should add --norolestats to get_maintainer.pl if and when
you use --to-cmd or --cc-cmd for git send-email.


