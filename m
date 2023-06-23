Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8673BC99
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jun 2023 18:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjFWQco (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jun 2023 12:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjFWQcn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 12:32:43 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47BF2100
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:32:42 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b4fef08cfdso4826595ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687537962; x=1690129962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A/ctcywp7aSY6bqn8fc8UYikW0ADqbI6njwx/CrZFMU=;
        b=QrcLfKebeRTWvt4YKw8UFWfYt25NNrQQfX99Oy6r+vCqro5wELxb3cYBNFN16R3mZE
         wFm8qKDe+LeIdcpuYKHxWJTLSCg/HePLqdZerEDwZRLgp62N7xiQGzLXsd3i5aFoj3Jt
         e+GfvgP5S9iBaVw76byCwgEpHcics5pmXMa7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687537962; x=1690129962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ctcywp7aSY6bqn8fc8UYikW0ADqbI6njwx/CrZFMU=;
        b=adiAbrKFOmwaXvRyIRqlcfKNOlItfDtmICH2SSIL5AYzBcgwNeyU5FGNB8OVpL7tiQ
         2Qo0g+1MI0IJbgW9f9gAwiNVhQGUC6QyJ9lrNHq3usMAd6IV7Abi+DRShEIbLeBHzgpg
         6LnngiiPeMsU6haH4QPCjAV4MsBe8Ixq0bF3dAqCo3C+Lcdz7au/9EHST/BphO/I+ii9
         8nni/y6O8OppljL5yuqe5ekQ8oEwm4FLG+9unrxkvEUai3uKdwKu2jWGXWtCZFLFoPn6
         jQDu+NlYgc2pAL2Fqv4W0K+a/R9/XHTWgsjUsqhoNZJVdPMfR9nV8pjmmv1vAhQ/IQ9c
         7AEA==
X-Gm-Message-State: AC+VfDy/bRL8O7nEwGumEbibMrV//ZTdpukdYNqFqYd3Gtzx+n/fYeg9
        ZzOfxRSAKJP/Rs2h6o8yWVd0mw==
X-Google-Smtp-Source: ACHHUZ7y3G0c/1K1ZxsQD1CmVObEWMkld+khXvdLHXCeF0xmvtbL20p/dlmeD6u4oVOhycyAEXH/Og==
X-Received: by 2002:a17:902:aa0a:b0:1b5:4679:568f with SMTP id be10-20020a170902aa0a00b001b54679568fmr10746105plb.45.1687537962012;
        Fri, 23 Jun 2023 09:32:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw13-20020a170903044d00b001aaf536b1e3sm7442562plb.123.2023.06.23.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 09:32:41 -0700 (PDT)
Date:   Fri, 23 Jun 2023 09:32:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix CFI failures with GCOV_PROFILE_ALL
Message-ID: <202306230932.539C9DC0@keescook>
References: <20230623001140.1111494-4-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623001140.1111494-4-samitolvanen@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 23, 2023 at 12:11:41AM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> The following two patches fix CFI failures with GCOV_PROFILE_ALL,
> where the compiler injects indirectly called functions to object
> files that otherwise contain no executable code, and are not
> processed by objtool or don't have CFI enabled. This results in
> missing or incorrect type hashes during boot and when modules are
> loaded.
> 
> Sami Tolvanen (2):
>   kbuild: Fix CFI failures with GCOV
>   kbuild: Disable GCOV for *.mod.o
> 
>  init/Makefile             | 1 +
>  scripts/Makefile.modfinal | 2 +-
>  scripts/Makefile.vmlinux  | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Nice hunting!

Reviewed-by: Kees Cook <keescook@chromium.org>

Should these get Cc: stable tags maybe?

-- 
Kees Cook
