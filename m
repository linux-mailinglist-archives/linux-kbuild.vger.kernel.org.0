Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F53F8AA9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 00:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfHLWku (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 18:40:50 -0400
Received: from smtprelay0235.hostedemail.com ([216.40.44.235]:42420 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726568AbfHLWku (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 18:40:50 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 9180F18014D2B;
        Mon, 12 Aug 2019 22:40:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::,RULES_HIT:41:355:379:599:800:960:967:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2393:2525:2559:2564:2682:2685:2828:2859:2906:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4605:5007:8660:8985:9025:10004:10394:10400:10848:11026:11232:11233:11473:11657:11658:11914:12043:12048:12297:12438:12555:12740:12760:12895:13148:13230:13439:13845:14181:14659:14721:21080:21433:21451:21627:21740:21789:21811:21819:30022:30034:30054:30070:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:27,LUA_SUMMARY:none
X-HE-Tag: cats09_5e29a3c464208
X-Filterd-Recvd-Size: 3130
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Mon, 12 Aug 2019 22:40:46 +0000 (UTC)
Message-ID: <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
Subject: Re: [PATCH v2] kbuild: Change fallthrough comments to attributes
From:   Joe Perches <joe@perches.com>
To:     Nathan Huckleberry <nhuck@google.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, clang-built-linux@googlegroups.com
Date:   Mon, 12 Aug 2019 15:40:45 -0700
In-Reply-To: <20190812221416.139678-1-nhuck@google.com>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 2019-08-12 at 15:14 -0700, Nathan Huckleberry wrote:
> Clang does not support the use of comments to label
> intentional fallthrough. This patch replaces some uses
> of comments to attributesto cut down a significant number
> of warnings on clang (from ~50000 to ~200). Only comments
> in commonly used header files have been replaced.
> 
> Since there is still quite a bit of noise, this
> patch moves -Wimplicit-fallthrough to
> Makefile.extrawarn if you are compiling with
> clang.

Unmodified clang does not emit this warning without a patch.

> diff --git a/Makefile b/Makefile
[]
> @@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>  
>  # Warn about unmarked fall-throughs in switch statement.
> +# If the compiler is clang, this warning is only enabled if W=1 in
> +# Makefile.extrawarn
> +ifndef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> +endif

It'd be better to remove CONFIG_CC_IS_CLANG everywhere
eventually as it adds complexity and makes .config files
not portable to multiple systems.

> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
[]
> @@ -253,4 +253,8 @@
>   */
>  #define __weak                          __attribute__((__weak__))
>  
> +#if __has_attribute(fallthrough)
> +#define __fallthrough                   __attribute__((fallthrough))

This should be __attribute__((__fallthrough__))

And there is still no agreement about whether this should
be #define fallthrough or #define __fallthrough

https://lore.kernel.org/patchwork/patch/1108577/

> diff --git a/include/linux/jhash.h b/include/linux/jhash.h
[]
> @@ -86,19 +86,43 @@ static inline u32 jhash(const void *key, u32 length, u32 initval)
[]
> +	case 12:
> +		c += (u32)k[11]<<24;
> +		__fallthrough;

You might consider trying out the scripted conversion tool
attached to this email:

https://lore.kernel.org/lkml/61ddbb86d5e68a15e24ccb06d9b399bbf5ce2da7.camel@perches.com/


