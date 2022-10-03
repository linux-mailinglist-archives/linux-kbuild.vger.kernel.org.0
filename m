Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6970D5F3763
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Oct 2022 22:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJCU6F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Oct 2022 16:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiJCU55 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Oct 2022 16:57:57 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC144B0DF
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Oct 2022 13:57:55 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso8435678pjb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Oct 2022 13:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=ku6V0uIMACEoIGbJ5aRjuUpzl2e0iFbWX6RQH44sWX0=;
        b=P4qZU0rxjthTT1WyI1k5fzDz6fUkOmv0yf4SjPl8Dz6WsrcZfuYXAZ4zKn8b2mEllU
         6MvuK60tViVQN4OGOd0kzNlRFcd8Xt+jO+LeIR95c9Th9d86j6q3BML6q7RQ3Ari/Q4I
         RZm1SVelMLTBf7LFMZf5BpXatRLMaV6LFBnQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=ku6V0uIMACEoIGbJ5aRjuUpzl2e0iFbWX6RQH44sWX0=;
        b=YA5ygDEYe9bnkgcO29e1E2q8L02MzY5pILU3cz96CX2lDoS1u+oR8lySmwbiAQDyZL
         PxRZIJmDmUpC55K9GrK1iXmXRiXB7vYJGZx5Hq6hsG7/vgK1hreTKR+bqf50M6C3OvLY
         k9+87Nh9NdY1ghYPRyF4h3gfDa7mC4Y1h1LhwjJfE00Xt8igJ3lRZsZffXr6vRDRXx9x
         XjVqdLxDni2BlVIWbWMJU8qfiDjVVW9RpmgpMQDrC8cB748DJwoyHCh7esZE/+w+4JGV
         I3Q77LQC0boMUz2aKCs8fj9Kx6Of+Zm0QAbytBNnGESusGcd1DjrBjcTiYUqgtppMzQh
         tItA==
X-Gm-Message-State: ACrzQf152t8WoTeP1ova/CHQOfcNXJ6EiQDOByx5FhogMV3BliB41ejV
        tZaZcSpYrTrhjzbgzE7Akv1LlyAHCHrikA==
X-Google-Smtp-Source: AMsMyM4mJRybC6nqfHNqmr0/NlnExJovhirAQBcmovq5U1cGY5pmsKlLbbrllGAlzfcxIpgHGgV5fQ==
X-Received: by 2002:a17:90b:254a:b0:200:53f:891d with SMTP id nw10-20020a17090b254a00b00200053f891dmr14196360pjb.168.1664830674759;
        Mon, 03 Oct 2022 13:57:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090a668a00b00203ab277966sm10527636pjj.7.2022.10.03.13.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 13:57:54 -0700 (PDT)
Date:   Mon, 3 Oct 2022 13:57:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hardening: Remove Clang's enable flag for
 -ftrivial-auto-var-init=zero
Message-ID: <202210031356.C32F69B6@keescook>
References: <20220930060624.2411883-1-keescook@chromium.org>
 <YzsQr/DqrNzJILkr@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzsQr/DqrNzJILkr@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 03, 2022 at 09:41:19AM -0700, Nathan Chancellor wrote:
> On Thu, Sep 29, 2022 at 11:06:24PM -0700, Kees Cook wrote:
> > Now that Clang's -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
> > option is no longer required, remove it from the command line. Clang 16
> > and later will warn when it is used, which will cause Kconfig to think
> > it can't use -ftrivial-auto-var-init=zero at all. Check for whether it
> > is required and only use it when so.
> > 
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: llvm@lists.linux.dev
> > Cc: stable@vger.kernel.org
> > Fixes: f02003c860d9 ("hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for sending this change!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> 
> Please consider getting this to Linus ASAP so that this can start
> filtering into stable now that the LLVM change has landed, as I lost the
> ability to use CONFIG_INIT_STACK_ALL_ZERO after upgrading my toolchain
> over the weekend :)

Yup -- it's in my PR for the hardening tree sent on Saturday.

> Additionally, I am not sure the fixes tag is going to ensure that this
> change automatically makes it back to 5.15 and 5.10, which have
> commit f0fe00d4972a ("security: allow using Clang's zero initialization
> for stack variables") but not commit f02003c860d9 ("hardening: Avoid
> harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO"). I guess if I
> am reading the stable documentation right, we could do something like:
> 
> Cc: stable@vger.kernel.org # dcb7c0b9461c + f02003c860d9
> Fixes: f0fe00d4972a ("security: allow using Clang's zero initialization for stack variables")
> 
> but I am not sure. I guess we can always just send manual backports
> once it is merged.

Ah, good point. Yeah, probably just do backports of f02003c860d9 and
this one.

-- 
Kees Cook
