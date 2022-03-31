Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2FD4ED178
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Mar 2022 03:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241393AbiCaCBN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Mar 2022 22:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240201AbiCaCBM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Mar 2022 22:01:12 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5058359A50
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Mar 2022 18:59:26 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i4so12807126wrb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Mar 2022 18:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Ybt0k9RlDS+Cob3c2Nri6i6agmQS6h2yDd5CaRARZY=;
        b=Om9v/U3IT72STKyChyxqFZ1SVBkdP9RI2WCGYHkkoZvdnU1qCnh1uNc6OzFIsDGLO0
         31mzrIMETM5s4SdPiku3AUImVaTFrZape78fbJij27gkxYtXQFg5ahiLNVsStaQY1mbd
         VMAAjICY3ERWSX2PJ3S0RpQR6dj8O7z7Q8Wh3jUdQSwo11clMkBiiUa4rp7cBeNJ7Ujo
         rB5pZWlz22wG1M0deFMcJ4ySz3Lwb933o09Y2/AXNx6XYowO6br+unG1L/bPJaMIjS5b
         MN4K0NFpPSzhHZle6xvjS78KQUF4PYHONmtyQXNUHyTm+50LxIyjXVjDmQraVl/ovcOd
         1oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Ybt0k9RlDS+Cob3c2Nri6i6agmQS6h2yDd5CaRARZY=;
        b=VwqQolDawp9tW84EeJSiq74rrx3BQ1JDYCz99PGvnMA9JKs+51vevMnZd4AXgm+PwE
         +WlDqo4GzMHSfSw9846+bVMeEmJWZ1u+KO8f+9tfjkkuTs+9ZX6tje4+LUZkg1wrZfJ9
         P6N7n6k1gHZ8BBQwxDfZmqtnCoguvubiCiQUscbITGte+39uZ77twnLrMR3/vTxfLkOX
         6y6hui0zIp7pbXh34+VN+J8Wsuh0CC2b8mwJdolaY9/6fyEJVCWf8stl+z/ChsyjXLQ1
         qdtNn6inW13I92Ls/5uMaKkVZaNNBIXYPDDN/Lew+YG5XOwHZqWURIQXxolGt6k3S/+e
         Gq9g==
X-Gm-Message-State: AOAM533sCrm93ux0YbstBpPrpnNJinkW78h47MymjeMuNy8clVuol2yh
        ouTk7bFPGXFIgj1FAbZjCHk0lB0rXH/f0g0H9Z1aew==
X-Google-Smtp-Source: ABdhPJxi8USaiUwY4CgwkWfCUhokIDE1YzoofShfAp1LRspAuGEBeBTnMRLYe521dkaOddBXzuDZf6vGupiBNeTmed0=
X-Received: by 2002:a05:6000:12c3:b0:203:e0e0:7d18 with SMTP id
 l3-20020a05600012c300b00203e0e07d18mr2128487wrx.46.1648691964765; Wed, 30 Mar
 2022 18:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220330234528.1426991-1-nathan@kernel.org> <20220330234528.1426991-2-nathan@kernel.org>
In-Reply-To: <20220330234528.1426991-2-nathan@kernel.org>
From:   David Gow <davidgow@google.com>
Date:   Thu, 31 Mar 2022 09:59:13 +0800
Message-ID: <CABVgOSk+qM8o5okFG=BbshQq_gSh5dGvy99sqjOAznHDJ3BxqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Remove '-mno-global-merge'
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>, llvm@lists.linux.dev,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 31, 2022 at 7:46 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This flag is specific to clang, where it is only used by the 32-bit and
> 64-bit ARM backends. In certain situations, the presence of this flag
> will cause a warning, as shown by commit 6580c5c18fb3 ("um: clang: Strip
> out -mno-global-merge from USER_CFLAGS").
>
> Since commit 61163efae020 ("kbuild: LLVMLinux: Add Kbuild support for
> building kernel with Clang") that added this flag back in 2014, there
> have been quite a few changes to the GlobalMerge pass in LLVM. Building
> several different ARCH=arm and ARCH=arm64 configurations with LLVM 11
> (minimum) and 15 (current main version) with this flag removed (i.e.,
> with the default of '-mglobal-merge') reveals no modpost warnings, so it
> is likely that the issue noted in the comment is no longer relevant due
> to changes in LLVM or modpost, meaning this flag can be removed.
>
> If any new warnings show up that are a result of the removal of this
> flag, it can be added back under arch/arm{,64}/Makefile to avoid
> warnings on other architectures.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

This seems to work fine here under the KUnit tooling, with both x86_64
and arm64. That admittedly doesn't do anything with modules, so
wouldn't reveal any of those issues, but at least the warnings about
--mno-global-merge existing remain gone.

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David
