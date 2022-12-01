Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EF063FAA3
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Dec 2022 23:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbiLAWex (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Dec 2022 17:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiLAWei (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2022 17:34:38 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC0FC1BFA
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Dec 2022 14:34:37 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id h16so2905850qtu.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Dec 2022 14:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV6KFD9YqA6lKSOXLvQRH2g5CSKKQrJwkWRUDrNk+kk=;
        b=ehvAF16aSghfiXkGXngjpxVnBBs6TZwMTXlObj/xffGDtJfNao5dGcl3TYm5npiWEs
         6pR1X7q+fzGjetdM8vb3jjQ2QDP3Oy2cSPX37sZmwiMoPLR3p4dCY+otM1VxGJhIWO2G
         OnMfppL0boL0tQ8a1CI+1goTsXNWmwKoPUEFKwieUimCDLM+GFHpiWcAEp1voo97jsHe
         THmU97ZYy79Wqdc74fhFImkcgUlPsvGfq33X9luOLvL+PNO3wRyQ7LqPei3l0q36u4w7
         7xyYVNI8wt2dEd19hDEkeudzkRgKVkdCYbgDTl/3rSEs38vl7jJ9DAcFc3SY7iTNWJcb
         lvOg==
X-Gm-Message-State: ANoB5pltzriYY2Rxp60DUT5YeaWrY/yBXS7ka6RMGoFNPy64Fz/WZ2kY
        MhqrfKhMEQeUO75tG0sl+mXS/ysQghuT0CrWWSEsm5FXI7k=
X-Google-Smtp-Source: AA0mqf7EB92zCX/vJzGTMIWfUnCHDyWJ12PEykm/anNCladcaDiqVniO3EuENJNXLDplz0vu/eD+0uP5+tPMzonXbJU=
X-Received: by 2002:ac8:6792:0:b0:3a5:1c8b:8890 with SMTP id
 b18-20020ac86792000000b003a51c8b8890mr64908458qtp.63.1669934076754; Thu, 01
 Dec 2022 14:34:36 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com> <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Thu, 1 Dec 2022 17:34:25 -0500
Message-ID: <CAG+Z0CsTtXctFE2LG0+B+zWQCJTnfJkkYweV3qzFBgxZsXKLxw@mail.gmail.com>
Subject: Re: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>, dgoncharov@users.sf.net
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 30, 2022 at 6:41 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> I think the following code will work
> for 3.82, 4.x, and future releases.
>
> diff --git a/Makefile b/Makefile
> index 78525ebea876..58dfd7475448 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -94,7 +94,7 @@ endif
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> +ifneq ($(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS)))),)
>    quiet=silent_
>    KBUILD_VERBOSE = 0
>  endif


make-4.4 (and later) stores -I<path> in makeflags.
$ cat makefile2
$(info $(MAKEFLAGS))
all:
$ make-4.4 -rR   -Isrc --warn-undefined-variables   a=s -j2 -fmakefile2
rR -Isrc -j2 --warn-undefined-variables
make-4.4: warning: undefined variable 'GNUMAKEFLAGS'
make-4.4: Nothing to be done for 'all'.
$

$(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS)))),)
confuses 's' in -Isrc with -s.

What about the following?


diff --git a/Makefile b/Makefile
index 6f846b1f2618..3a97494a9989 100644
--- a/Makefile
+++ b/Makefile
@@ -94,9 +94,15 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands

-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
-  quiet=silent_
-  KBUILD_VERBOSE = 0
+ifeq ($(filter 3.%,$(MAKE_VERSION)),)
+silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
+else
+silence:=$(findstring s,$(filter-out --%,$(filter -%,-$(MAKEFLAGS))))
+endif
+
+ifeq ($(silence),s)
+quiet=silent_
+KBUILD_VERBOSE = 0
 endif

 export quiet Q KBUILD_VERBOSE

Tested 3.82, 4.3, 4.4, latest master.
regards, Dmitry
