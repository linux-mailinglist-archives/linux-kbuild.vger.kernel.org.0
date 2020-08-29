Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFC4256615
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgH2IiT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:38:19 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31013 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgH2IiS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:38:18 -0400
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 07T8bbuv003773;
        Sat, 29 Aug 2020 17:37:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 07T8bbuv003773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598690257;
        bh=TDHUeNZsKPwy/PD6mwXkHIvgKkQTHeNe2XKf3jC0y7M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hPiZzQ3d4eOr+PX6UC+rUsw/FWWZ27FFbvTVOs5Bi1qWUapeKYf5SArOiWqxXHNZ5
         MWJT+is3FljOgtIAIOsiVTyhfJjikZXiHMu0LsY7vRQ+1ChxPa0cf2B7jgFLmCKkrt
         ZIcTFY3+JbkEPTF2VIFfMvXKLAuEQK1zhW28fEipAw3PutHndZjb/HhFnx/ouvx2uc
         E0tlBwvMAy3k9ho14L82eCBS8vqb0+hzcX9J15OQ7S8phuPYp8ME3KJffJKPFXthxq
         YSn3Btk7Lw9BBxRlE2GmsaJfH5Nq1NnCog1f4wjYMDuQG2QbIZK5m8rpK4kXFnnruM
         /Q3x4SpgFhkCQ==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id ls14so629587pjb.3;
        Sat, 29 Aug 2020 01:37:37 -0700 (PDT)
X-Gm-Message-State: AOAM5339+0Bsr72GbSppD55MNbWzsiG/x2eM6mvV5mwBg86ijE+KtaXV
        x8e8E2vDIMMW3ao6/rLKWifarBnkmmS1/XfwjsU=
X-Google-Smtp-Source: ABdhPJwg+EvBeHoEW1CrXTn7x7w/ZDM3P4oC+tmp1R3reUzXjKf9Y1GMauas8WUyJTGHsRwRqCn6gAQU8OrNi7KvtjM=
X-Received: by 2002:a17:90a:8904:: with SMTP id u4mr2425907pjn.87.1598690256580;
 Sat, 29 Aug 2020 01:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <9fea5110-680e-2876-f014-c1e9f0484179@infradead.org>
In-Reply-To: <9fea5110-680e-2876-f014-c1e9f0484179@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Aug 2020 17:36:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8zFav2dB53BfBcE0YN4rmbvPKpYYrDzJOWA58f3Mr2A@mail.gmail.com>
Message-ID: <CAK7LNAT8zFav2dB53BfBcE0YN4rmbvPKpYYrDzJOWA58f3Mr2A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Documentation: clean up makefiles.rst
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 29, 2020 at 2:26 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> This is a general cleanup of kbuild/makefiles.rst:
>
> * Use "Chapter" for major heading references and use "section" for
>   the next-level heading references, for consistency.
> * Section 3.8 was deleted long ago.
> * Drop the ending ':' in section names in the contents list.
> * Correct some section numbering references.
> * Correct verb agreement typo.
> * Fix run-on sentence punctuation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org


Applied to linux-kbuild/fixes.
Thanks.


> ---
>  Documentation/kbuild/makefiles.rst |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> --- linux-next-20200828.orig/Documentation/kbuild/makefiles.rst
> +++ linux-next-20200828/Documentation/kbuild/makefiles.rst
> @@ -16,7 +16,7 @@ This document describes the Linux kernel
>            --- 3.5 Library file goals - lib-y
>            --- 3.6 Descending down in directories
>            --- 3.7 Compilation flags
> -          --- 3.8 Command line dependency
> +          --- 3.8 <deleted>
>            --- 3.9 Dependency tracking
>            --- 3.10 Special Rules
>            --- 3.11 $(CC) support functions
> @@ -39,8 +39,8 @@ This document describes the Linux kernel
>
>         === 7 Architecture Makefiles
>            --- 7.1 Set variables to tweak the build to the architecture
> -          --- 7.2 Add prerequisites to archheaders:
> -          --- 7.3 Add prerequisites to archprepare:
> +          --- 7.2 Add prerequisites to archheaders
> +          --- 7.3 Add prerequisites to archprepare
>            --- 7.4 List directories to visit when descending
>            --- 7.5 Architecture-specific boot images
>            --- 7.6 Building non-kbuild targets
> @@ -129,7 +129,7 @@ The preferred name for the kbuild files
>  be used and if both a 'Makefile' and a 'Kbuild' file exists, then the 'Kbuild'
>  file will be used.
>
> -Section 3.1 "Goal definitions" is a quick intro, further chapters provide
> +Section 3.1 "Goal definitions" is a quick intro; further chapters provide
>  more details, with real examples.
>
>  3.1 Goal definitions
> @@ -965,7 +965,7 @@ When kbuild executes, the following step
>                 KBUILD_LDFLAGS         := -m elf_s390
>
>         Note: ldflags-y can be used to further customise
> -       the flags used. See chapter 3.7.
> +       the flags used. See section 3.7.
>
>      LDFLAGS_vmlinux
>         Options for $(LD) when linking vmlinux
> @@ -1121,7 +1121,7 @@ When kbuild executes, the following step
>
>         In this example, the file target maketools will be processed
>         before descending down in the subdirectories.
> -       See also chapter XXX-TODO that describe how kbuild supports
> +       See also chapter XXX-TODO that describes how kbuild supports
>         generating offset header files.
>
>
> @@ -1261,7 +1261,7 @@ When kbuild executes, the following step
>         always be built.
>         Assignments to $(targets) are without $(obj)/ prefix.
>         if_changed may be used in conjunction with custom commands as
> -       defined in 6.8 "Custom kbuild commands".
> +       defined in 7.8 "Custom kbuild commands".
>
>         Note: It is a typical mistake to forget the FORCE prerequisite.
>         Another common pitfall is that whitespace is sometimes
> @@ -1411,7 +1411,7 @@ When kbuild executes, the following step
>         that may be shared between individual architectures.
>         The recommended approach how to use a generic header file is
>         to list the file in the Kbuild file.
> -       See "7.2 generic-y" for further info on syntax etc.
> +       See "8.2 generic-y" for further info on syntax etc.
>
>  7.11 Post-link pass
>  -------------------
> @@ -1601,4 +1601,4 @@ is the right choice.
>
>  - Describe how kbuild supports shipped files with _shipped.
>  - Generating offset header files.
> -- Add more variables to section 7?
> +- Add more variables to chapters 7 or 9?
>


-- 
Best Regards
Masahiro Yamada
