Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C95628B074
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 09:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHMHEg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 03:04:36 -0400
Received: from smtprelay0062.hostedemail.com ([216.40.44.62]:40640 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725820AbfHMHEg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:04:36 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 86BA53811;
        Tue, 13 Aug 2019 07:04:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 40,2.5,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:800:960:967:973:981:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1544:1593:1594:1605:1711:1730:1747:1777:1792:2198:2199:2393:2525:2553:2567:2682:2685:2693:2731:2828:2859:2892:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4387:4605:5007:6119:6691:7903:8660:8957:9010:9025:10011:10394:10848:11026:11232:11658:11914:12043:12050:12297:12438:12555:12679:12740:12760:12895:12986:13095:13148:13161:13229:13230:13439:14181:14659:14721:21063:21080:21365:21366:21433:21451:21627:21740:21789:21796:21811:21819:30012:30022:30029:30034:30036:30054:30056:30060:30070:30075:30083:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,S
X-HE-Tag: spot34_7efd70b731944
X-Filterd-Recvd-Size: 5872
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Tue, 13 Aug 2019 07:04:32 +0000 (UTC)
Message-ID: <3078e553a777976655f72718d088791363544caa.camel@perches.com>
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
Date:   Tue, 13 Aug 2019 00:04:30 -0700
In-Reply-To: <20190813063327.GA46858@archlinux-threadripper>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
         <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
         <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
         <20190813063327.GA46858@archlinux-threadripper>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2019-08-12 at 23:33 -0700, Nathan Chancellor wrote:
> On Mon, Aug 12, 2019 at 04:11:26PM -0700, Nick Desaulniers wrote:
> > Correct, Nathan is currently implementing support for attribute
> > fallthrough in Clang in:
> > https://reviews.llvm.org/D64838
> > 
> > I asked him in person to evaluate how many warnings we'd see in an
> > arm64 defconfig with his patch applied.  There were on the order of
> > 50k warnings, mostly from these headers.  I asked him to send these
> > patches, then land support in the compiler, that way should our CI
> > catch fire overnight, we can carry out of tree fixes until they land.
> > With the changes here to Makefile.extrawarn, we should not need to
> > carry any out of tree patches.
> 
> I think that if we are modifying this callsite to be favorable to clang,
> we should consider a straight revert of commit bfd77145f35c ("Makefile:
> Convert -Wimplicit-fallthrough=3 to just -Wipmlicit-fallthrough for
> clang").

oh bother.

> It would save us a change in scripts/Makefile.extrawarn and
> tying testing of this warning to W=1 will make the build noisy from
> all of the other warnings that we don't care about plus we will need to
> revert that change once we have finished the conversion process anyways.
> I think it is cleaner to just pass KCFLAGS=-Wimplicit-fallthrough to
> make when testing so that just that additional warning appears but
> that is obviously subjective.
> 
> > > You might consider trying out the scripted conversion tool
> > > attached to this email:
> > > 
> > > https://lore.kernel.org/lkml/61ddbb86d5e68a15e24ccb06d9b399bbf5ce2da7.camel@perches.com/
> 
> I gave the script a go earlier today and it does a reasonable job at
> convering the comments to the fallthrough keyword. Here is a list of
> the warnings I still see in an x86 allyesconfig build with D64838 on
> next-20190812:
> 
> https://gist.github.com/ffbd71b48ba197837e1bdd9bb863b85f

> I have gone through about 20-30 of them and while there are a few missed
> conversion spots (which is obviously fine for a treewide conversion),

The _vast_ majority of case /* fallthrough */ style comments
in switch
blocks are immediately before another case or default

The afs ones seem to be because the last comment in the block
is not the fallthrough, but a description of the next case;

e.g.: from fs/afs/fsclient.c:

		/* extract the volume name */
	case 3:
		_debug("extract volname");
		ret = afs_extract_data(call, true);
		if (ret < 0)
			return ret;

		p = call->buffer;
		p[call->count] = 0;
		_debug("volname '%s'", p);
		afs_extract_to_tmp(call);
		call->unmarshall++;
		/* Fall through */

		/* extract the offline message length */
	case 4:

The script modifies a /* fallthrough */ style comment
only if the next non-blank line is 'case <foo>' or "default:'

There are many other /* fallthrough */ style comments
that are not actually fallthroughs or used in switch
blocks so this can't really be automated particularly
easily.

Likely these remainders would have to be converted manually.

> the majority of them come from a disagreement between GCC and Clang on
> emitting a warning when falling through to a case statement that is
> either the last one and empty or simply breaks..
> 
> Example: https://godbolt.org/z/xgkvIh
> 
> I have more information on our issue tracker if anyone else wants to
> take a look: https://github.com/ClangBuiltLinux/linux/issues/636
> 
> I personally think that GCC is right and Clang should adapt but I don't
> know enough about the Clang codebase to know how feasible this is.

I think gcc is wrong here and code like

	switch (foo) {
	case 1:
		bar = 1;
	default:
		break;
	}

should emit a fallthrough warning.

> I just know there will be even more churn than necessary if we have to
> annotate all of those places, taking the conversion process from maybe a
> release cycle to several.

Luckily, there's a list so it's not a hard problem
and it's easily scriptable.

There are < 350 entries, not many really.

btw: What does the 1st column mean?
      
              1 fs/xfs/scrub/agheader.c:89:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           3507 include/linux/jhash.h:113:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

Number of times emitted?

