Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2D755542
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 18:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfFYQ5o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 12:57:44 -0400
Received: from smtprelay0038.hostedemail.com ([216.40.44.38]:36730 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728506AbfFYQ5o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 12:57:44 -0400
X-Greylist: delayed 316 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 Jun 2019 12:57:43 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 185CE18020B0B
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Jun 2019 16:52:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 4C3435000;
        Tue, 25 Jun 2019 16:52:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3873:4321:5007:8527:8545:8660:8879:10004:10400:10848:11232:11658:11914:12043:12297:12555:12679:12740:12760:12895:13069:13148:13230:13311:13357:13439:14096:14097:14659:14721:21080:21627:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: tramp21_4f3996ed0ab50
X-Filterd-Recvd-Size: 2131
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Tue, 25 Jun 2019 16:52:24 +0000 (UTC)
Message-ID: <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
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
Date:   Tue, 25 Jun 2019 09:52:23 -0700
In-Reply-To: <20190625160103.GA13133@embeddedor>
References: <20190625160103.GA13133@embeddedor>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2019-06-25 at 11:01 -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
[]
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.

Just enable the thing already.

If you stopped trying to do it all yourself, others
will help resolve any new build warnings.

For instance: a build of -next x86/64 defconfig has 2.  nbd.
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5102b2bbd224..df909ffdfcdb 100644
--- a/Makefile
+++ b/Makefile
@@ -690,6 +690,7 @@ endif # may-sync-config
 endif # $(dot-config)
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
+KBUILD_CFLAGS	+= $(call cc-option, -Wimplicit-fallthrough)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)


