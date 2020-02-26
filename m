Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF3E170C87
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 00:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbgBZXZH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 18:25:07 -0500
Received: from smtprelay0094.hostedemail.com ([216.40.44.94]:59350 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727910AbgBZXZG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 18:25:06 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id EFA36100E7B43;
        Wed, 26 Feb 2020 23:25:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2689:2740:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3871:3872:3874:4321:5007:7653:10004:10400:10848:11232:11658:11914:12297:12660:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21611:21627:21790:30012:30054:30060:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: error50_4912417d1f308
X-Filterd-Recvd-Size: 2340
Received: from XPS-9350 (47-209-22-207.mmlkcmtc01.res.dyn.suddenlink.net [47.209.22.207])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Wed, 26 Feb 2020 23:25:01 +0000 (UTC)
Message-ID: <8b9eaca3ab7b05db8b5562284484a24d44bf6cce.camel@perches.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
From:   Joe Perches <joe@perches.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Date:   Wed, 26 Feb 2020 15:23:31 -0800
In-Reply-To: <CAKwvOdmSix2hgDGsvcAzVD9L5XmM8tPDMyrdXmZjcvGXu_TMSQ@mail.gmail.com>
References: <20200224174129.2664-1-ndesaulniers@google.com>
         <202002242003.870E5F80@keescook>
         <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
         <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
         <202002251353.25A016CD@keescook>
         <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
         <CAKwvOdmSix2hgDGsvcAzVD9L5XmM8tPDMyrdXmZjcvGXu_TMSQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2020-02-26 at 15:18 -0800, Nick Desaulniers wrote:
> On Tue, Feb 25, 2020 at 2:21 PM Joe Perches <joe@perches.com> wrote:
> > On Tue, 2020-02-25 at 13:56 -0800, Kees Cook wrote:
> > > I think we should take a specific version stand as the
> > > "minimum" version. Being able to build x86 defconfig is a good minimum
> > > IMO.
> > 
> > Agree.
> > 
> > It's odd to say that clang 4 is fine for arm when it's
> > not fine for x86.  It's also reasonable to expect arm
> > users to upgrade their compiler to a more recent version
> > when the only cost is a very small bit of time.
> 
> That's a very x86 centric point of view.

Really?

How many code generation improvements and possible defects
have been corrected between clang 4 and clang 10 for arm?

I presume more than a few.

