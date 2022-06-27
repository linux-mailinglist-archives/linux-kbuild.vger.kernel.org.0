Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788C055DADB
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbiF0GYJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jun 2022 02:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiF0GYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jun 2022 02:24:09 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F732DD2;
        Sun, 26 Jun 2022 23:24:06 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id o4so5345275ilm.9;
        Sun, 26 Jun 2022 23:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=fzwHqVS26Lxq2VcuS4Z4waTive1YJrXgZqV1fBZrFKw=;
        b=lgJ430a++ujHu3lEpAZV2O6BOFHtXe1pne1rpKOzzTOSVoRdChKtsO0+WpsMnarJ+S
         lZs58I4EEw/Xqb2wLEH6FzpyZd+rUOgDrevF2MKAmN07EjlZH35mvVssdVoR4Z6KIiF8
         DIWk5LJIRxUfDx68dI5Nx0iIKdKD2GXyySx8R5fjqZuY63sHdUY7vepMdjGCo9X4ZFB+
         +b08xpgbhy3jCfb973CcgTyFA+y19FRQDTACWmZ1eh+j/cbTf/DDHnbZQGwhKOhB089V
         0U10BZpfyHIHnz67YYrzM2RD39I7+qebGZIzVFmVUm/KLJVI6bHQ8FeJeqgS0aE/QOVK
         m0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=fzwHqVS26Lxq2VcuS4Z4waTive1YJrXgZqV1fBZrFKw=;
        b=xc0TSyuS1fDaYhO7Tga2v+jDuwzIMJSLX1VOAkkRcGGDsuixlUzTzOu/xNnXagKJYU
         0gRU0fhNi5KWWprtLC3UEpjIXs911aWPRqLZ0pCvjizZWzB6tYFrkhlymat2Xu2MaGGQ
         vqBwU6tNUeFceq1urtfqbx75tdbGCNrRL3lV9Dz7qLm3bgbbiimAhOXVBgGONWpAwjf6
         R99xssRZ4aeCLgpsGCQp8v22LiSEkpxIFucg81b7A5SUHaMgrLMwtiReHkV7bu+K18Ab
         i4JUwh6Kxz/G+qGbm2J0uOPDv4UizNXZY+BkobsOoS+Ze+irjxMy22OkKti82V6uWpQT
         ihpQ==
X-Gm-Message-State: AJIora8LtiGIACHZIJ0BQhwLRvML/cOgrsIXdgfvcUMPH7eVpd5ZegdQ
        6L9SFj1yImdVE7juHSyVe7cXMDM/bctOSGFfDfMGjBzNezrSAw==
X-Google-Smtp-Source: AGRyM1vbnYXXyZTfMgDrTUNYevUe9CA6XW5dKz+9i45FfgYsfL15wvEKO1knMceeNG/FNtAayifhKsCLwEAPGWyRwUY=
X-Received: by 2002:a92:1908:0:b0:2d9:2beb:bc61 with SMTP id
 8-20020a921908000000b002d92bebbc61mr6478689ilz.245.1656311045707; Sun, 26 Jun
 2022 23:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX-=vjX1WgJLDGZYZhrpxy+KqynMMFmNPp8pWu0q2sDcg@mail.gmail.com>
In-Reply-To: <CA+icZUX-=vjX1WgJLDGZYZhrpxy+KqynMMFmNPp8pWu0q2sDcg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 27 Jun 2022 08:23:29 +0200
Message-ID: <CA+icZUWFUC5eiKS96vpoPQbX+jx5OYBfD40Ns86sUxE0hcft1w@mail.gmail.com>
Subject: Re: [Linux v5.19-rc2] rtla: Errors when running `make tools/clean`
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 15, 2022 at 12:23 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ CC linux-kbuild folks ]
>
> Hi,
>
> while digging into a perf issue I see this:
>
> $ cd /path/to/linux.git
>
> $ LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
> ...
>   DESCEND tracing
> make[1]: Entering directory '/home/dileks/src/linux-kernel/git/tools/tracing'
>  DESCEND latency
> make[2]: Entering directory
> '/home/dileks/src/linux-kernel/git/tools/tracing/latency'
> rm -f latency-collector
> make[2]: Leaving directory
> '/home/dileks/src/linux-kernel/git/tools/tracing/latency'
>  DESCEND rtla
> make[2]: Entering directory
> '/home/dileks/src/linux-kernel/git/tools/tracing/rtla'
> make -C /home/dileks/src/linux-kernel/git/tools/tracing/rtla/../../../Documentation/tools/rtla/
> clean
> make[3]: Entering directory
> '/home/dileks/src/linux-kernel/git/Documentation/tools/rtla'
> rm -f rtla-osnoise-hist.1 rtla-osnoise-top.1 rtla-osnoise.1
> rtla-timerlat-hist.1 rtla-timerlat-top.1 rtla-timerlat.1 rtla.1
> make[3]: Leaving directory
> '/home/dileks/src/linux-kernel/git/Documentation/tools/rtla'
> /bin/sh: 1: test: rtla-make[2]:: unexpected operator
> rm: cannot remove '/home/dileks/src/linux-kernel/git': Is a directory
> make[2]: *** [Makefile:120: clean] Error 1
> make[2]: Leaving directory
> '/home/dileks/src/linux-kernel/git/tools/tracing/rtla'
> make[1]: *** [Makefile:26: rtla_clean] Error 2
> make[1]: Leaving directory '/home/dileks/src/linux-kernel/git/tools/tracing'
> make: *** [Makefile:170: tracing_clean] Error 2
> make: Leaving directory '/home/dileks/src/linux-kernel/git/tools'
>
> Please check yourself.
>
> Regards,
> -Sedat-

Friendly pting!

The issue still remains with Linux v5.19-rc4:

$ head -5 Makefile
# SPDX-License-Identifier: GPL-2.0
VERSION = 5
PATCHLEVEL = 19
SUBLEVEL = 0
EXTRAVERSION = -rc4

$ LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
[ ... ]
  DESCEND rtla
make[2]: Entering directory '/home/dileks/src/linux/git/tools/tracing/rtla'
make -C /home/dileks/src/linux/git/tools/tracing/rtla/../../../Documentation/tools/rtla/
clean
make[3]: Entering directory
'/home/dileks/src/linux/git/Documentation/tools/rtla'
rm -f rtla-osnoise-hist.1 rtla-osnoise-top.1 rtla-osnoise.1
rtla-timerlat-hist.1 rtla-timerlat-top.1 rtla-timerlat.1 rtla.1
make[3]: Leaving directory '/home/dileks/src/linux/git/Documentation/tools/rtla'
/bin/sh: 1: test: rtla-make[2]:: unexpected operator
rm: cannot remove '/home/dileks/src/linux/git': Is a directory
make[2]: *** [Makefile:120: clean] Error 1
make[2]: Leaving directory '/home/dileks/src/linux/git/tools/tracing/rtla'
make[1]: *** [Makefile:26: rtla_clean] Error 2
make[1]: Leaving directory '/home/dileks/src/linux/git/tools/tracing'
make: *** [Makefile:170: tracing_clean] Error 2
make: Leaving directory '/home/dileks/src/linux/git/tools'

-sed@-
