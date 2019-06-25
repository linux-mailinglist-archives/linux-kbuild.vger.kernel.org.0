Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECCD5560C
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 19:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbfFYRh7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 13:37:59 -0400
Received: from smtprelay0199.hostedemail.com ([216.40.44.199]:55667 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729974AbfFYRh7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 13:37:59 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9D02718224D97;
        Tue, 25 Jun 2019 17:37:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:421:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2691:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:7808:7903:8527:8879:10004:10400:10848:11232:11658:11914:12050:12297:12663:12740:12760:12895:13069:13161:13229:13311:13357:13439:14096:14097:14659:21080:21433:21451:21627:30012:30054:30070:30083:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: tent74_2823a894be11f
X-Filterd-Recvd-Size: 2858
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Jun 2019 17:37:55 +0000 (UTC)
Message-ID: <360e2cd7578450d1a24729bf4483d0e762c21dc5.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From:   Joe Perches <joe@perches.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Date:   Tue, 25 Jun 2019 10:37:54 -0700
In-Reply-To: <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
References: <20190625160103.GA13133@embeddedor>
         <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
         <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2019-06-25 at 12:06 -0500, Gustavo A. R. Silva wrote:
> 
> On 6/25/19 11:52 AM, Joe Perches wrote:
> > On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> > > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > > cases where we are expecting to fall through.
> > []
> > > This patch is part of the ongoing efforts to enable
> > > -Wimplicit-fallthrough.
> > 
> > Just enable the thing already.
> > 
> > If you stopped trying to do it all yourself, others
> 
> What are you talking about?
> 
> Anyone can enable it, I'm adding this to every commit:
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3

No one does that by default and almost no one
is helping eliminate these.  Not even on th

Almost no one uses make W=<levels> either as it's
generally extremely noisy and can emit a lot of
false positives.

> And I'll send a PR with a proper patch for the Makefile
> during the next merge window.

That's great.

> If had the power I would have enabled this option since day 1,
> so every developer can take care of their own code.

You have always had the power to send a patch.

You also seem to believe the build needs to be
completely clean before enabling the switch.

I don't.

> Lately, you are not being of much help, Joe.

<smile> What kind of help are you expecting?

I'm not submitting patches adding fallthough comments
as I think that's not a good form.  I've said so
repeatedly.

I believe I suggested months ago you default enable
the compiler switch.

So it's up to you to either do it or not.


