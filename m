Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7116C245B63
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 06:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgHQETa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 00:19:30 -0400
Received: from smtprelay0019.hostedemail.com ([216.40.44.19]:41620 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725765AbgHQET1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 00:19:27 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 93D9C181D302B;
        Mon, 17 Aug 2020 04:19:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2110:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3871:4321:5007:7903:10004:10400:10848:11232:11658:11914:12114:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21433:21627:21939:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: rest34_300d56527013
X-Filterd-Recvd-Size: 1414
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Mon, 17 Aug 2020 04:19:25 +0000 (UTC)
Message-ID: <7d0be10602e31e334ff41299c06f537880c55bd0.camel@perches.com>
Subject: Re: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
From:   Joe Perches <joe@perches.com>
To:     Michael Witten <mfwitten@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Date:   Sun, 16 Aug 2020 21:19:23 -0700
In-Reply-To: <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
         <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
         <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2020-08-17 at 03:37 +0000, Michael Witten wrote:
> Matters of  style should  probably not be  enforced by  the build
> infrastructure; style is a matter for the maintainer to enforce:

I rather doubt style advice should be taken from someone who
right justifies fixed pitch block text.

cheers, Joe

