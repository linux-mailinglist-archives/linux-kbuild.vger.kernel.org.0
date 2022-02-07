Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4E44AC22F
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Feb 2022 15:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbiBGO6n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Feb 2022 09:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbiBGOgu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Feb 2022 09:36:50 -0500
X-Greylist: delayed 3091 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 06:36:48 PST
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4608C0401C2
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Feb 2022 06:36:48 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 217EaZfx023131
        for <linux-kbuild@vger.kernel.org>; Mon, 7 Feb 2022 23:36:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 217EaZfx023131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1644244595;
        bh=t9yvjc68VF9BvwHS6/KE/sNAqAFy6f/OPM8UO/nfSNE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DHQjp7bDqf4BjMwyZBzFZa6qGSDzTbbTCE0iz73FnaI2vL4bSqe0dnJ8T1QxQzKQO
         /+DMSYbwBVhXA2U6MSxaLmrpwjG/+e+FhUSRt0bCrJF/b3Y3h+/RJI0HAFKo87dtLd
         EF7ds3f9bbqnMSM7v9Jd1evU4q/i5a+9z/MAq0N9z93Ky1f3IlGoNU/+mOL7Ywekde
         oQVbkLzTfURPSWnL6R34I8U37F4QIX3wmx0VAFEvMqvDYthEphD7612RFxEq5UuS66
         Z+bOLZglngPJG7SHfRVPSEArcuCtO/zeHU3xOdq/0R7tv7tfIy/JoAzywSJ3412LR2
         NfRjU0KrY0aUg==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id y17so11261460plg.7
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Feb 2022 06:36:35 -0800 (PST)
X-Gm-Message-State: AOAM532ap/VWMTdF45JoCYrQ5xpoEv733y4pdGCCv2PObRiu1rdwVm1p
        o60A/VDSRXRv3ryonII1lrxnNk6Xl9C6VBIRp/c=
X-Google-Smtp-Source: ABdhPJwVq3uJNBx1tJMRux95yTiZ+tfP/NUUt8wD9T6PxmuMUlnB86JeCGOgJHp9uw/rO7wgyT4VplAsXYyLVBGhN/4=
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr16881537plt.136.1644244594484;
 Mon, 07 Feb 2022 06:36:34 -0800 (PST)
MIME-Version: 1.0
References: <AS8PR10MB4952A8D70F9AC76F7C2EB4809D259@AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB4952A8D70F9AC76F7C2EB4809D259@AS8PR10MB4952.EURPRD10.PROD.OUTLOOK.COM>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 7 Feb 2022 23:35:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJ4eJ6z78v96iKBnQQNThLzYpZQPgMNGq=ANCZLj9dGA@mail.gmail.com>
Message-ID: <CAK7LNARJ4eJ6z78v96iKBnQQNThLzYpZQPgMNGq=ANCZLj9dGA@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: Do not re-quote string values when invoking
 shell commands
To:     Chesnokov Gleb <Chesnokov.G@raidix.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 31, 2022 at 5:54 PM Chesnokov Gleb <Chesnokov.G@raidix.com> wrote:
>
> Fix the following shell errors during compilation of external module:
> /bin/sh: -c: line 1: syntax error near unexpected token `('
> /bin/sh: -c: line 1: `if [ "gcc (GCC) 11.2.1 20211203 (Red Hat 11.2.1-7)" != ""gcc (GCC) 11.2.1 20211203 (Red Hat 11.2.1-7)"" ]; then \'
>
> Fixes: 129ab0d2d9f3 ("kbuild: do not quote string values in include/config/auto.conf")
> Signed-off-by: Gleb Chesnokov <Chesnokov.G@raidix.com>


The current code works fine.
Maybe, you are using a stale auto.conf





> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1fc3491096cb..72205c83a339 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1714,9 +1714,9 @@ PHONY += prepare
>  # now expand this into a simple variable to reduce the cost of shell evaluations
>  prepare: CC_VERSION_TEXT := $(CC_VERSION_TEXT)
>  prepare:
> -       @if [ "$(CC_VERSION_TEXT)" != "$(CONFIG_CC_VERSION_TEXT)" ]; then \
> +       @if [ "$(CC_VERSION_TEXT)" != $(CONFIG_CC_VERSION_TEXT) ]; then \
>                 echo >&2 "warning: the compiler differs from the one used to build the kernel"; \
> -               echo >&2 "  The kernel was built by: $(CONFIG_CC_VERSION_TEXT)"; \
> +               echo >&2 "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT); \
>                 echo >&2 "  You are using:           $(CC_VERSION_TEXT)"; \
>         fi
>
> --
> 2.35.0



--
Best Regards
Masahiro Yamada
