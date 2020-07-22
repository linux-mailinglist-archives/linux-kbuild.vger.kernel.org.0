Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A22228F71
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jul 2020 06:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgGVE5r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 00:57:47 -0400
Received: from smtprelay0174.hostedemail.com ([216.40.44.174]:38800 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725862AbgGVE5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 00:57:47 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 47E931829508C;
        Wed, 22 Jul 2020 04:57:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3865:3866:3867:3868:3872:4321:5007:8660:10004:10400:10848:11232:11658:11914:12296:12297:12555:12740:12760:12895:13069:13138:13148:13230:13231:13311:13357:13439:14093:14096:14097:14181:14394:14659:14721:21080:21220:21433:21451:21627:21939:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: milk10_2f0383b26f33
X-Filterd-Recvd-Size: 2811
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Wed, 22 Jul 2020 04:57:44 +0000 (UTC)
Message-ID: <b545eb4e3f2b4b676959e4666ef536f2691041eb.camel@perches.com>
Subject: [PATCH] Makefile.extrawarn: Move sign-compare from W=2 to W=3
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>, davem@davemloft.net,
        herbert@gondor.apana.org.au, mripard@kernel.org, wens@csie.org
Date:   Tue, 21 Jul 2020 21:57:43 -0700
In-Reply-To: <11ac49bc33546ef9ebc4120878206bd882667d8a.camel@perches.com>
References: <1595358391-34525-1-git-send-email-clabbe@baylibre.com>
         <1595358391-34525-17-git-send-email-clabbe@baylibre.com>
         <11ac49bc33546ef9ebc4120878206bd882667d8a.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This -Wsign-compare compiler warning can be very noisy
and most of the suggested conversions are unnecessary.

Make the warning W=3 so it's described under the
"can most likely be ignored" block.

Signed-off-by: Joe Perches <joe@perches.com>
---
On Tue, 2020-07-21 at 14:32 -0700, Joe Perches wrote:
> On Tue, 2020-07-21 at 19:06 +0000, Corentin Labbe wrote:
> > This patch fixes the warning:
> > warning: comparison of integer expressions of different signedness: 'int' and 'long unsigned int' [-Wsign-compare]
> 
> I think these do not really need conversion.
> Are these useful compiler warnings ?

Perhaps move the warning from W=2 to W=3 so
it's described as "can most likely be ignored"

 scripts/Makefile.extrawarn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 62c275685b75..95e4cdb94fe9 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -66,7 +66,6 @@ KBUILD_CFLAGS += -Wnested-externs
 KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
-KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += -Wtype-limits
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
@@ -87,6 +86,7 @@ KBUILD_CFLAGS += -Wpacked
 KBUILD_CFLAGS += -Wpadded
 KBUILD_CFLAGS += -Wpointer-arith
 KBUILD_CFLAGS += -Wredundant-decls
+KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += -Wswitch-default
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
 


