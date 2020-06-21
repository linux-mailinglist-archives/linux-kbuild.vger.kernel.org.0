Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD97202C20
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2020 21:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729390AbgFUTM5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Jun 2020 15:12:57 -0400
Received: from smtprelay0207.hostedemail.com ([216.40.44.207]:45460 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729279AbgFUTM4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jun 2020 15:12:56 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id E526018224D6E;
        Sun, 21 Jun 2020 19:12:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:152:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:1801:2393:2559:2562:3138:3139:3140:3141:3142:3351:3622:3865:3866:3870:3874:4321:4605:5007:7903:7904:10004:10400:10848:11232:11658:11914:12297:12740:12895:13069:13311:13357:13894:14659:21080:21627:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cows87_5b0326926e2c
X-Filterd-Recvd-Size: 1505
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Sun, 21 Jun 2020 19:12:54 +0000 (UTC)
Message-ID: <cb10e0a1a35e7dfc4f6a27dacb7883eaa3864811.camel@perches.com>
Subject: Re: kbuild: separate kerneldoc warnings from compiler warnings
From:   Joe Perches <joe@perches.com>
To:     Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 21 Jun 2020 12:12:53 -0700
In-Reply-To: <591473.1592679153@turing-police>
References: <591473.1592679153@turing-police>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2020-06-20 at 14:52 -0400, Valdis Klētnieks wrote:
> This patch introduces a new build flag 'K=1' which controls whether kerneldoc
> warnings should be issued, separating them from the compiler warnings that W=
> controls.
[]
> diff --git a/Makefile b/Makefile
[]
> @@ -1605,6 +1605,7 @@ PHONY += help
>  	@echo  '                       (sparse by default)'
>  	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>  	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
> +	@echo  '  make K=1   [targets] Warn about problems in kerneldoc comments'

Seems sensible. Thanks.


