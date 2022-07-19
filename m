Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71B357A351
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jul 2022 17:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbiGSPhg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jul 2022 11:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237754AbiGSPhe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jul 2022 11:37:34 -0400
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E09599C7
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jul 2022 08:37:33 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 26JFbGQb004743
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 00:37:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 26JFbGQb004743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1658245037;
        bh=HZdBnb7ZtNykPTY90pR615dySni9Oq9kBLRUeSOKtE0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eNj5WATjM16kvtgGW1nkfl3XJLM1Qr17xTSxnLVeufeYik8U1XSyajTZA4M4cyDEb
         z+zADY8007qdKMYGwRZlMmboKzwED1K62slHaliOiMmqFnmlAdqGFTLk+lbL7qQtOZ
         f/uD+sk2PiwA4OyaDcU6cl3x6bBx7cYAXn6UvuxsNBvUG29Mtze95Crz1mzO6bbz8u
         cClXv2RK4ua4V0ENGp52t5LfLiNSYJtBzRxZL3zliIxdFwc10tBzI1b/KsHiwLB8e8
         0H6uE0+sR+oFtINrYH9/w4uL+o6pnTzk3SbmJTyTrJ/76gHcYZqBdrwv8gReLMrHvF
         cI+I98hXL+L4w==
X-Nifty-SrcIP: [209.85.128.50]
Received: by mail-wm1-f50.google.com with SMTP id ay11-20020a05600c1e0b00b003a3013da120so10250315wmb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jul 2022 08:37:17 -0700 (PDT)
X-Gm-Message-State: AJIora9z/ObfHPbYRh9bQJKp8TVjLGZEXo5FD2yGK9g3zZJONZRTmPBt
        s3+IQXwG/tVy5Ii7oKmovvsP9APqOFr2NGyH/k0=
X-Google-Smtp-Source: AGRyM1v+z2xaKYX/dZ0mEc/v/OFzQxUVDJ7LYzpj4TuTkFbaA/xFDU22WMEMm4IOmBHqnB3y8YypBRsBr12s7QCK+I0=
X-Received: by 2002:a1c:cc1a:0:b0:3a0:39b1:3408 with SMTP id
 h26-20020a1ccc1a000000b003a039b13408mr30842206wmb.157.1658245035572; Tue, 19
 Jul 2022 08:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220718061413.4643-1-nicolas@fjasle.eu>
In-Reply-To: <20220718061413.4643-1-nicolas@fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jul 2022 00:36:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJu=rokLLmcX2-UMFhzrZYGVR0qgA2tAiRwLMfyJ3Jyw@mail.gmail.com>
Message-ID: <CAK7LNATJu=rokLLmcX2-UMFhzrZYGVR0qgA2tAiRwLMfyJ3Jyw@mail.gmail.com>
Subject: Re: [PATCH] scripts: headers_install.sh: Update config leak ignore entries
To:     Nicolas Schier <nicolas@fjasle.eu>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 18, 2022 at 3:15 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Remove two dated config leak ignore entries from scripts/headers_install.sh:
> arch/alpha/include/uapi/asm/setup.h does no more leak any CONFIG_* symbol to
> user-space any more since commit 3cb8b1537f8a ("alpha: Move setup.h out of
> uapi", 2021-09-14).
> Same holds for include/uapi/asm-generic/fcntl.h since commit 306f7cc1e906
> ("uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h", 2022-04-05).
>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>

Applied to linux-kbuild.
Thanks.



> ---
>  scripts/headers_install.sh | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index dd554bd436cc..4041881746ad 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -70,7 +70,6 @@ configs=$(sed -e '
>  #
>  # The format is <file-name>:<CONFIG-option> in each line.
>  config_leak_ignores="
> -arch/alpha/include/uapi/asm/setup.h:CONFIG_ALPHA_LEGACY_START_ADDRESS
>  arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
>  arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
>  arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
> @@ -84,7 +83,6 @@ arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
>  arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
>  arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
>  arch/x86/include/uapi/asm/mman.h:CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> -include/uapi/asm-generic/fcntl.h:CONFIG_64BIT
>  include/uapi/linux/atmdev.h:CONFIG_COMPAT
>  include/uapi/linux/eventpoll.h:CONFIG_PM_SLEEP
>  include/uapi/linux/hw_breakpoint.h:CONFIG_HAVE_MIXED_BREAKPOINTS_REGS
> --
> 2.36.1
>


-- 
Best Regards
Masahiro Yamada
