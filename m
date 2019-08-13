Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D028B156
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 09:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfHMHnS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 03:43:18 -0400
Received: from smtprelay0107.hostedemail.com ([216.40.44.107]:43637 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726810AbfHMHnS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:43:18 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id BBDD75009;
        Tue, 13 Aug 2019 07:43:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2525:2559:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3871:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6119:7903:9025:10004:10400:10848:11232:11658:11914:12043:12297:12555:12679:12698:12737:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:30012:30054:30060:30070:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: van78_1c3a8abe7f93e
X-Filterd-Recvd-Size: 2204
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Tue, 13 Aug 2019 07:43:13 +0000 (UTC)
Message-ID: <2a6c7952793a7973c7edc6b2c44ac3c2587562fd.camel@perches.com>
Subject: Re: [PATCH v2] kbuild: Change fallthrough comments to attributes
From:   Joe Perches <joe@perches.com>
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date:   Tue, 13 Aug 2019 00:43:12 -0700
In-Reply-To: <3078e553a777976655f72718d088791363544caa.camel@perches.com>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
         <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
         <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
         <20190813063327.GA46858@archlinux-threadripper>
         <3078e553a777976655f72718d088791363544caa.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2019-08-13 at 00:04 -0700, Joe Perches wrote:
> On Mon, 2019-08-12 at 23:33 -0700, Nathan Chancellor wrote:
[]
> > a disagreement between GCC and Clang on
> > emitting a warning when falling through to a case statement that is
> > either the last one and empty or simply breaks..
[]
> > I personally think that GCC is right and Clang should adapt but I don't
> > know enough about the Clang codebase to know how feasible this is.
> 
> I think gcc is wrong here and code like
> 
> 	switch (foo) {
> 	case 1:
> 		bar = 1;
> 	default:
> 		break;
> 	}
> 
> should emit a fallthrough warning.

btw: I just filed https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432


