Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F8863996F
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Nov 2022 06:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiK0Fra (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Nov 2022 00:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiK0Fr3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Nov 2022 00:47:29 -0500
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455DE97
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Nov 2022 21:47:27 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 2AR5lCc1014313
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Nov 2022 14:47:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 2AR5lCc1014313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669528033;
        bh=DGMCTLZ3wg3cv2e1veFgacons6hsQcBMlru926B9AAI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kpbpLwnayaTIYZCO7Vbt94FYQJAAAGrXNeGVX9EUtZIVsugFytWkmyPla+pg7IC3/
         UqZ+pzdwiVLce5TaX2kp5vT27MC+Wp29AvfLpK+jSq9widUqydU9Q5xq6pPrpdBGpC
         rBs0sGpditTo8jZgZlI1+nZhy/moNcs+7NJKIfBbgwXBiW0Ryyo8HcJv2lctZV6D1C
         XvIRs7MLYrX4AXVdapZ3yCKEBmkmWPShSoNJ2hYud7fMHVpDy6leL5dFePP4rpYkLw
         3wbB/ihRSSyh4xQtz0jf8PB35l9fY/QC2TuSbuHTAJ6diXObURluzFt10n7H9Gfn4R
         70aYabPaebBYw==
X-Nifty-SrcIP: [209.85.167.179]
Received: by mail-oi1-f179.google.com with SMTP id c129so8518864oia.0
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Nov 2022 21:47:12 -0800 (PST)
X-Gm-Message-State: ANoB5pkCBLFt8G2FCpLZMLQkkn8H7S5OpVmZhgv2P/D/R9XVd4/atKNq
        gfNAOSmb7+jN1knaW3QezTZorBuSOgzLAA+ektQ=
X-Google-Smtp-Source: AA0mqf4YoTV4C+RIt7K3wigqA0sxPM6dxmqloG7bWuJSTyxrkV2fLtTarJAk28rRHVw5R3SFEEYCn4ndufFpC4rLFhE=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr13476688oic.287.1669528031833; Sat, 26
 Nov 2022 21:47:11 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
In-Reply-To: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 27 Nov 2022 14:46:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
Message-ID: <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
Subject: Re: Port silent mode detection to future gnu make.
To:     Dmitry Goncharov <dgoncharov@users.sf.net>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 27, 2022 at 12:43 PM Dmitry Goncharov
<dgoncharov@users.sf.net> wrote:
>
>
>
> Port silent mode detection to future gnu make.
>
> Makefile uses the following piece of make code to detect if option -s is
> specified on the command line.
>
> ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>
>
> This code is executed by make at parse time and assumes that MAKEFLAGS does
> not contain command line variable definitions.
> Currently there is a change to make under discussion here
> https://savannah.gnu.org/bugs/?63347.
> This proposed patch modifies make such that at parse time MAKEFLAGS
> contains command line variable definitions.
> Currently if the user defines a=s on the command line, then at build only
> time MAKEFLAGS contains " -- a=s".
> With the patch proposed in sv63347, MAKEFLAGS will contain this " -- a=s"
> at parse time and build time.
>
>
> Once this change is applied this code will confuse a command line variable
> definition which contains letter 's' with option -s.
>
> E.g.
> $ # old make
> $ make net/wireless/ocb.o a=s
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
> $ # this a new make which defines makeflags at parse time
> $ ~/src/gmake/make/l64/make net/wireless/ocb.o a=s
> $
>
> We can see here that letter 's' from 'a=s' was confused with -s.
>
> This patch checks for presence of -s using a method recommended by the make
> manual here
> https://www.gnu.org/software/make/manual/make.html#Testing-Flags.
>
> This suggested method will work with the old and new make.
>
> Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
>
> Reported-by: Jan Palus <jpalus+gnu@fastmail.com>




I like MAKEFLAGS defined on-the-fly in the parse stage,
so I appreciate your sv63347_fix.diff.


I have no objection to changing the kernel Makefile, but I am
not willing to do it based on the proposal that has not even
queued up in the git tree.

Please come back after your patch is applied
(and please have the patch include the commit hash
causing the behaviour change)


BTW, the GNU Make manual suggests $(word 1) instead of $(firstword).
Is it for the purpose of backward compatibility for older
Make versions?

The kernel build only supports Make>=3.82, and I personally prefer
$(firstword).








>
> ---
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..1ab3d6f098fb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,7 +94,7 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +ifneq ($(findstring s,$(word 1,-$(MAKEFLAGS))),)
>    quiet=silent_
>    KBUILD_VERBOSE = 0
>  endif
>
>
>
> regards, Dmitry



--
Best Regards
Masahiro Yamada
