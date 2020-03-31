Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0045A199D54
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 19:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgCaR6T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 13:58:19 -0400
Received: from smtprelay0188.hostedemail.com ([216.40.44.188]:52270 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725999AbgCaR6R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 13:58:17 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 83B8C18021E49;
        Tue, 31 Mar 2020 17:58:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:6119:7903:9025:10004:10400:10848:11232:11658:11914:12043:12297:12555:12740:12760:12895:13019:13069:13311:13357:13439:14096:14097:14181:14659:14721:14764:21080:21324:21524:21611:21627:21740:30054:30056:30060:30064:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: boys35_481ed8d64f731
X-Filterd-Recvd-Size: 2177
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Tue, 31 Mar 2020 17:58:15 +0000 (UTC)
Message-ID: <78a8ba04459f8a4ea6bcb8811f35490018b763f2.camel@perches.com>
Subject: Re: single target builds are broken
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Date:   Tue, 31 Mar 2020 10:56:20 -0700
In-Reply-To: <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
         <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
         <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
         <CAK7LNAT-8TbLRPB=PNsbAORKYvYL+m3JmA-iSDieK8Uv7MAvGA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2020-04-01 at 01:03 +0900, Masahiro Yamada wrote:
> On Tue, Mar 31, 2020 at 8:02 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
> > It's really useful to be able to build object files separately, but as
> > if it was part of the kernel (so e.g. with all the gcc flags, include
> > paths, etc.).
[]
> So, there were lots of cases where single builds did not work:
> 
> https://www.spinics.net/lists/linux-kbuild/msg21921.html
> 
> The way to do this correctly is to
> descend directories one by one, parsing Makefiles.
> 
> With no entry in obj-y/m,
> Kbuild cannot determine where to build that object.
> 
> > At the very least, can we find a way to reduce the typing overhead for
> > testing one-offs like that? 'make STANDALONE=1 test.o' or something?
> 
> Probably, I do not want to do this.
> 
> Supporting everybody's demand is not a good idea.
> So, I draw a line somewhere.
> 
> Saving some typing is less important.

I too find this regression less than desirable.

make <single_object> is/was quite useful even
if it didn't always work.



