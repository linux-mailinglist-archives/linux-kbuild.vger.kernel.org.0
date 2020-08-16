Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F9A2458E8
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Aug 2020 19:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgHPR45 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 13:56:57 -0400
Received: from smtprelay0152.hostedemail.com ([216.40.44.152]:55694 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726855AbgHPR45 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 13:56:57 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 180E0180A9F31;
        Sun, 16 Aug 2020 17:56:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:4321:5007:7904:9389:10004:10400:10848:11232:11658:11914:12114:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21627:30012:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: drop82_3e0ba4527010
X-Filterd-Recvd-Size: 1614
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Sun, 16 Aug 2020 17:56:54 +0000 (UTC)
Message-ID: <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
Subject: Re: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
From:   Joe Perches <joe@perches.com>
To:     Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Date:   Sun, 16 Aug 2020 10:56:53 -0700
In-Reply-To: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 2020-08-16 at 16:35 +0000, Michael Witten wrote:
> Requiring every declaration to be at the top of a block is an
> antiquated, vestigial naivete from a time when C was just a
> glorified abstraction over conventional patterns in assembly
> programming.

I rather prefer block declarations instead of
sprinkling declarations around with code.

> We are not just programming anymore. We are now encoding our
> very thoughts, and thus we need this expressiveness in order
> to capture those thoughts with sufficient clarity.

So how does this removal have anything to do with
expressiveness and clarity?


