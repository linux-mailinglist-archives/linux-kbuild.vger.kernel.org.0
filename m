Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F90663519
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 00:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbjAIXRL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 18:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237880AbjAIXQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 18:16:50 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C581EC76
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 15:16:48 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id c8-20020a17090a4d0800b00225c3614161so14465460pjg.5
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 15:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=UxAF7v3TwIoeGe5lQ6e+O3vtZeX5QbNQAGD5TBMn+S38e90Q1b0GycbUkS0bysawO1
         j70JyJFwOR0rIR/oqb1klqdObw5jR+JiUHccm/jMuRMZNMXFVkIhH2KId5yVjOnW9i54
         I9aMGRLe1s95Qf43s9P8xQdcdpNjzcd1YSw6aN7BHmfG7pwXHab5daDUsCHTLHmw2k8A
         rqVKKyyL/GfVB004FzuAjHJheV3X9+vuerYl1qqld80K+i1xSAdh0GDWZhMS/Ami48Ev
         yhM5TKZkw8n/ppMdjMn+Tsu7H8sVATtk3erU11epZGM8n1psz6e4etZQh8sfMzxUQiTp
         RLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdxb8zOWzmCtZYGAnOxoisnrJmGWQMSvlh0UjB+YR7k=;
        b=tTs9a44l0uKuGmQTL2eLj6+MAOcE5Qyv+RrccmzHtSx1zWZ3XI2NYXgv+K3nVXtfHm
         DJNtwEb6JdVOKBYELIHp6oeO+Gr4rPLMJCw2toT5BJnsfYjKSfsgirAe/zInitxe8LC9
         /H8jh1bYgZKFlxEOj69Tywx6QN+3nXmIqJgDoe69Aiq2pNALaP/eUsnDuaQEiShss9z2
         8AoBVDLC2atJZv+nPXy/7wr0iKARKucvnhIGev81GuqolUplBmbHbT/xJ5nmMBkoRkaJ
         esVd9ou0llamMh0FJ6HYlQ3DjsqZ5e0EWfz6zE0+QxLa0WA1lq3F+sh0Tey74lR8B+Av
         hs3A==
X-Gm-Message-State: AFqh2ko3rncFoG74+NzXhTX523t7bN7jamBsQAh88F47JOIPcNXUiUoC
        q+JiVJCq3FRbLONf49D2DY2SkkkEZgCJyvuAv7zmAA==
X-Google-Smtp-Source: AMrXdXsMjJnCJ928/8DVkJxwsFwFKDvwGlcuRFMQ6S7gEnPCv4j6W4/x9swqsAsBcDJgaZJDiwcXJafslWxfIW7YrMw=
X-Received: by 2002:a17:902:c950:b0:189:9b43:a082 with SMTP id
 i16-20020a170902c95000b001899b43a082mr4261789pla.95.1673306207372; Mon, 09
 Jan 2023 15:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
 <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com> <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
In-Reply-To: <Y7yXV3WOtWXF4PgT@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 15:16:36 -0800
Message-ID: <CAKwvOd=N9kmg2bZ5iD_-qmkYz9DsNw+pE5BP1kS3oLksEpcSkQ@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 9, 2023 at 2:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Jan 09, 2023 at 02:12:55PM -0800, Nick Desaulniers wrote:
> > On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > warns:
> > >
> > >   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
> > >
> > > This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> > > Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> > > been done for other flags previously.
> > >
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Hmm...so this was added by the top level Makefile doing a cc-option
> > test.  How did the test pass if this was unsupported? That worries me
> > that perhaps other cc-option tests are passing erroneously for certain
> > ppc -m32/-m64 configs?
>
> Sure, that is a reasonable concern. I should have expanded upon this a
> little bit more in the commit message. Is this any better?
>
>   When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
>   warns:
>
>     clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
>   This warning happens because vgettimeofday-32.c gets its base CFLAGS
>   from the main kernel, which may contain flags that are only supported
>   on a 64-bit target but not a 32-bit one, which is the case here.
>   -fstack-clash-protection and its negation are only suppported by the
>   64-bit powerpc target but that flag is included in an invocation for a
>   32-bit powerpc target, so clang points out that while the flag is one
>   that it recognizes, it is not actually used by this compiler job.
>
>   To eliminate the warning, remove -fno-stack-clash-protection from
>   vgettimeofday-32.c's CFLAGS when using clang, as has been done for
>   other flags previously.

Ah, ok that makes more sense. Sorry for my confusion, but if you
wouldn't mind adding the additional info in v3 it might help others
(or just me!)

You may add my RB to such a v3 w/ updated commit message.
-- 
Thanks,
~Nick Desaulniers
