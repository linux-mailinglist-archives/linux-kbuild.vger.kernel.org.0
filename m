Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF16A356A
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2019 13:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfH3LJT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Aug 2019 07:09:19 -0400
Received: from smtprelay0043.hostedemail.com ([216.40.44.43]:43654 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726660AbfH3LJT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 07:09:19 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 5FEE4182CF668;
        Fri, 30 Aug 2019 11:09:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1567:1593:1594:1711:1714:1730:1747:1777:1792:2198:2199:2393:2559:2562:2736:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3870:3873:4321:5007:10004:10400:10848:11232:11658:11914:12114:12297:12740:12760:12895:13069:13255:13311:13357:13439:14659:21080:21611:21627:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:84,LUA_SUMMARY:none
X-HE-Tag: comb79_33fd188898c22
X-Filterd-Recvd-Size: 1235
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Fri, 30 Aug 2019 11:09:17 +0000 (UTC)
Message-ID: <ccc65bd29747f8ad4d0ba1b3eda6c9d230f03c70.camel@perches.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough to
 -Wimplicit-fallthrough=2
From:   Joe Perches <joe@perches.com>
To:     Michal Suchanek <msuchanek@suse.de>, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Date:   Fri, 30 Aug 2019 04:09:15 -0700
In-Reply-To: <20190829120215.1977-1-msuchanek@suse.de>
References: <20190829120215.1977-1-msuchanek@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2019-08-29 at 14:02 +0200, Michal Suchanek wrote:
> In particular the default value of 3 does not match the comments like
> /* falls through to do foobar */

How many comments are there like this in the kernel?

Also you have to deal with gcc/clang differences.
As far as I know, clang doesn't take a value for this.


