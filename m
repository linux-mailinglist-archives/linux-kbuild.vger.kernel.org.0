Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D155564D
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 19:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfFYRtG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 13:49:06 -0400
Received: from smtprelay0009.hostedemail.com ([216.40.44.9]:48564 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726791AbfFYRtG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 13:49:06 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 368CB180A8142;
        Tue, 25 Jun 2019 17:49:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,::::::::::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2110:2393:2553:2559:2562:2828:2902:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:8879:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14180:14659:21080:21627:30054:30062:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:54,LUA_SUMMARY:none
X-HE-Tag: mask89_8921d5caef211
X-Filterd-Recvd-Size: 1887
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Jun 2019 17:49:02 +0000 (UTC)
Message-ID: <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.ngsorg>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Date:   Tue, 25 Jun 2019 10:49:01 -0700
In-Reply-To: <201906251029.08B862130@keescook>
References: <20190625160103.GA13133@embeddedor>
         <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
         <201906251029.08B862130@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2019-06-25 at 10:31 -0700, Kees Cook wrote:
> On Tue, Jun 25, 2019 at 09:52:23AM -0700, Joe Perches wrote:
> > On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> > > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > > cases where we are expecting to fall through.
> > []
> > > This patch is part of the ongoing efforts to enable
> > > -Wimplicit-fallthrough.
> > 
> > Just enable the thing already.
> 
> Linus has been pretty clear about not wanting warning options enabled
> without first fixing all the cases it warns about first.

Hey Kees.

I don't recall that particular tidbit.  Got a link?  

cheers, Joe

