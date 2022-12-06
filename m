Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0A5643AF3
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Dec 2022 02:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbiLFBuL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Dec 2022 20:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbiLFBuK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Dec 2022 20:50:10 -0500
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFD4167ED
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Dec 2022 17:50:08 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 2B61nnD7020467
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Dec 2022 10:49:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 2B61nnD7020467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1670291391;
        bh=tUB9JCUZHavm0PtBJ+cEWG+9LdOrvCvjNMKV+dOOPN8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eLMLn0RDNxEjhAf2F5qtMDOb4b7KLQ34AYXfG1ZZK+Y6ySkq4USpzcs8QPHteZrbp
         drC4FHcDp0RgBVwcaKgojePmo4m5hcRXDiAK30kzCjqPJpM14fL+fuQAx6tRyrl854
         4qwaSFOzdy/fgeVQBJ9fAb1Thu/dF1en9ulNkTlAoPO75cb9sQd9k4ZtvnkOYai15D
         5HlqhRXsSpUwd0U0vsgU/OT5WAonIHOqBBcPRkZODIEZK96eKCelOjOw6di3cZKfDQ
         Hp2UbQ6gXwlEdS7sdxBojoQK0ZdICodMy+mP8d73kbsdEdVoR16fM3P8RXGr8S0FcV
         RU9IVIDOX/17g==
X-Nifty-SrcIP: [209.85.167.51]
Received: by mail-lf1-f51.google.com with SMTP id 1so7782403lfz.4
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Dec 2022 17:49:50 -0800 (PST)
X-Gm-Message-State: ANoB5pmyjHrUoyznLMGpCtmCUXMGow4H+tClXaSTgINR7ccKHvtPFDdG
        Z/XB1t/Og02GycM755bZhfscNXVkGnAohzVrVxI=
X-Google-Smtp-Source: AA0mqf5mfDotd+F3aGiMtPssrncvYweZ6k4tBs8eQD8HQxxSDqRVkPkrlPtBTGAiAljDbYUymtkfFkBB3dFFUsOpBJk=
X-Received: by 2002:a05:6512:32d0:b0:4b4:b5ed:c71f with SMTP id
 f16-20020a05651232d000b004b4b5edc71fmr27756018lfg.227.1670291389167; Mon, 05
 Dec 2022 17:49:49 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvbeLYoY0DpPK14inUMTat=zkRLJgqZ4mW0c10Vf_d6ow@mail.gmail.com>
In-Reply-To: <CAG+Z0CvbeLYoY0DpPK14inUMTat=zkRLJgqZ4mW0c10Vf_d6ow@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Dec 2022 10:49:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnmGm20UyHBNYSEeWjfQFuB=2cxj7_9rp-5JpUtO59BQ@mail.gmail.com>
Message-ID: <CAK7LNASnmGm20UyHBNYSEeWjfQFuB=2cxj7_9rp-5JpUtO59BQ@mail.gmail.com>
Subject: Re: [v3] kbuild: Port silent mode detection to future gnu make.
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

On Tue, Dec 6, 2022 at 6:48 AM Dmitry Goncharov <dgoncharov@users.sf.net> wrote:
>
> Port silent mode detection to the future (post make-4.4) versions of gnu make.
>
> Makefile contains the following piece of make code to detect if option -s is
> specified on the command line.
>
> ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>
>
> This code is executed by make at parse time and assumes that MAKEFLAGS
> does not contain command line variable definitions.
> Currently if the user defines a=s on the command line, then at build only
> time MAKEFLAGS contains " -- a=s".
> However, starting with commit dc2d963989b96161472b2cd38cef5d1f4851ea34
> MAKEFLAGS contains command line definitions at both parse time and
> build time.
>
> This '-s' detection code then confuses a command line variable
> definition which contains letter 's' with option -s.
>
> $ # old make
> $ make net/wireless/ocb.o a=s
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
> $ # this a new make which defines makeflags at parse time
> $ ~/src/gmake/make/l64/make net/wireless/ocb.o a=s
> $
>
> We can see here that the letter 's' from 'a=s' was confused with -s.
>
> This patch checks for presence of -s using a method recommended by the
> make manual here
> https://www.gnu.org/software/make/manual/make.html#Testing-Flags.
>
>
> Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
> Reported-by: Jan Palus <jpalus+gnu@fastmail.com>
> Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html
>



Applied to linux-kbuild. Thanks.



> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..fbd9ff4a61e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -93,10 +93,17 @@ endif
>
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
> +# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
>
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> -  quiet=silent_
> -  KBUILD_VERBOSE = 0
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
> +else
> +silence:=$(findstring s,$(filter-out --%,$(MAKEFLAGS)))
> +endif
> +
> +ifeq ($(silence),s)
> +quiet=silent_
> +KBUILD_VERBOSE = 0
>  endif
>
>  export quiet Q KBUILD_VERBOSE
>
>
> regards, Dmitry



-- 
Best Regards
Masahiro Yamada
