Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDA53FCC46
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhHaR0d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbhHaR01 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:26:27 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D18C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:25:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq28so340289lfb.7
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fTdszUcQhCEcNHCRiqUNDLFAJTHQZIWzSNpVbTbX/VY=;
        b=hUaQwObYAuDbsWA/9uGHjRmUxuNLw6ibIs8E7fB1bhhn+sahRBrK60fDXo7zi1KOFO
         ClDvMscz9ySY24WS6aBrEjkft2a4scrRSPyE3Mkaf4BvD4HBJsXaxWzYDjv0KoEvTxK1
         XpJrTwCzlVTXskwuQ+GprL/stAEU/1zfsYCwFIbDpnxK97eIpMk5FtvLE9dbHPXkXy7k
         OPnqcJlk4wnpMIA8F6xu7yHE3RXle9jZM4DqYEjHQLOocdS+2sCtMXFoWjpaiXOIBsPC
         +zWth2fKn78sSbXodB7L9O0qg6LMNoaHuyBiOXF1XgIPjoKBDhzQNeLnMSVzMSjANd+M
         +CMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fTdszUcQhCEcNHCRiqUNDLFAJTHQZIWzSNpVbTbX/VY=;
        b=TSz1J0Ld0YaxfSc1vL/3Aj2/4ZhQLFxSYcpWKf4BffuzN244bnGTg2jq8KrviJx+eh
         WmqjfoVZRnhsaevX1g1yodu9VBL4UIPWyeAdryUE21272xL7xFXJE+yfNpQ401kN5w93
         PZRt+CQCo07R1d074baBKLJx8EMS4GscBjemffDs+QmJdpRbUwPVRsK5tqSD+H2ccm/3
         CI9YgUAINZFLUofXDt1BYabL+HsyG0ACh0y2uQxr16twdbih7FGUJX8zkVNC0RzIyGIV
         pniZvSYURyHcjbtn32IP7HkQsNvxrvCsOI064Qpcz614tHqVN+jzKOJezrCDoM1H7s93
         QlZw==
X-Gm-Message-State: AOAM531XJCrJuyorPrbBHEogEPVtB4Zcbz7GE4bs9OmScUDT72q5Moo8
        gHli41OK1tFIm8vtRrrJPZI96rg0L/lJPlm33EYkyBdS7DW/NA==
X-Google-Smtp-Source: ABdhPJwG8sD3YoVSTL+ENxEtVsaDRitkN3N8Wi0lvrzw+En4HEAswfMkVCcJwYiFVBLTy4KiSOQ9UFB7e6LVd6N9I8c=
X-Received: by 2002:a05:6512:1583:: with SMTP id bp3mr21914434lfb.122.1630430729451;
 Tue, 31 Aug 2021 10:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org> <20210831074004.3195284-5-masahiroy@kernel.org>
In-Reply-To: <20210831074004.3195284-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Aug 2021 10:25:18 -0700
Message-ID: <CAKwvOd=MenVNzFCgB0om75_r4uKtEsWnMkzC8_6zc3Pst6=X-g@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] kbuild: factor out OBJECT_FILES_NON_STANDARD
 check into a macro
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The OBJECT_FILES_NON_STANDARD check is quite long.
>
> Factor it out into a new macro, objtool-enabled, to not repeat it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.build | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 021ae0146913..720a86642f48 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -241,12 +241,12 @@ ifndef CONFIG_LTO_CLANG
>  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> -cmd_objtool = $(if $(patsubst y%,, \
> -       $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -       ; $(objtool) $(objtool_args) $@)
> -objtool_obj = $(if $(patsubst y%,, \
> -       $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -       $(objtool))
> +
> +objtool-enabled = $(if $(filter-out y%, \
> +       $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
> +
> +cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> +objtool_obj = $(if $(objtool-enabled), $(objtool))
>
>  endif # CONFIG_LTO_CLANG
>  endif # CONFIG_STACK_VALIDATION
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
