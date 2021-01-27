Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D49F4305346
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 07:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhA0GdW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 01:33:22 -0500
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]:48334 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233742AbhA0DMJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 22:12:09 -0500
X-Greylist: delayed 525 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 22:12:09 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 9C8041803738F
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jan 2021 03:05:08 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id BDA5318224D68;
        Wed, 27 Jan 2021 03:02:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2197:2198:2199:2200:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3871:3873:4321:4362:5007:7652:10004:10400:10848:11026:11232:11473:11658:11914:12043:12297:12438:12555:12740:12895:13069:13255:13311:13357:13439:13894:14181:14659:14721:21080:21221:21451:21627:21889:30054:30062:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: arch06_0e14db527593
X-Filterd-Recvd-Size: 1821
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Wed, 27 Jan 2021 03:02:22 +0000 (UTC)
Message-ID: <c973355e545bcdc52b619f2d13bfa41915074307.camel@perches.com>
Subject: Re: [PATCH] Revert "checkpatch: add check for keyword 'boolean' in
 Kconfig definitions"
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Christoph Jaeger <cj@linux.com>,
        Andy Whitcroft <apw@canonical.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 26 Jan 2021 19:02:20 -0800
In-Reply-To: <20210126191541.210168-1-masahiroy@kernel.org>
References: <20210126191541.210168-1-masahiroy@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2021-01-27 at 04:15 +0900, Masahiro Yamada wrote:
> This reverts commit 327953e9af6c59ad111b28359e59e3ec0cbd71b6.
> 
> You cannot use 'boolean' since commit b92d804a5179 ("kconfig: drop
> 'boolean' keyword").
> 
> This check is no longer needed.

Thanks.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Joe Perches <joe@perches.com>

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3390,13 +3390,6 @@ sub process {
>  			}
>  		}
>  
> -# discourage the use of boolean for type definition attributes of Kconfig options
> -		if ($realfile =~ /Kconfig/ &&
> -		    $line =~ /^\+\s*\bboolean\b/) {
> -			WARN("CONFIG_TYPE_BOOLEAN",
> -			     "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
> -		}
> -
>  		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
>  		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
>  			my $flag = $1;


