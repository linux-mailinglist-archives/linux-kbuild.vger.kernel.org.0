Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519204656AB
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Dec 2021 20:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhLATou (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Dec 2021 14:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhLATok (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Dec 2021 14:44:40 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333ACC061574
        for <linux-kbuild@vger.kernel.org>; Wed,  1 Dec 2021 11:41:19 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id m15so24704247pgu.11
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Dec 2021 11:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N/c4XBzpAhfh2fxIk2nQwH9IJv2DHkpMOkPrtJqbaqM=;
        b=dsiSvgd8t9Py/T3ZMYz6xVEjcpefT6ANJp1ZgG2dPTBQcClq6XSD22WnMaNmJ+3HSw
         VL7WlY/6MsaGanSDA/J8kLW2Q6zo9mP3WubF9BCQb4xX/EJBjG7nsFuUDTQ8302491dR
         8izBQ0e07WFR3Dkczk8Fqza/sytMMahJUbi0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/c4XBzpAhfh2fxIk2nQwH9IJv2DHkpMOkPrtJqbaqM=;
        b=kpLssLUGLrKEolQj/VNV077HtGq7K7jCZp7/zvh6GjHPZXSZZoiRa7AfinxYOU5Bfr
         nExq6CJPX2pEN18UF0ZCdRuG0Qx9n3h3lzbcGA6wA2JO3/CuwBlzMBDcBN83KcEE/MIQ
         4csUe14DZ7uzvW2wn6XCDt3kl2pbNQFPq7esAqGdAcC3OOnaiSWZDb1fjdDiYrXw0i1G
         bLOf6WlLYdVcL8rXGocsZPlMme9aIeTHyVkTHq4x7Y7fjjtNBepCU9e9WpyPKKr6rA8C
         fQN7eARly3kf1vyOIUponvXc1O9Uq82xPjw2Kay1J5kcr3+wahJhPcBao495djoF2ewG
         utWQ==
X-Gm-Message-State: AOAM532ImyZDqS0Ls7H5HAfsq7S5oUR0R+l2Qgn4SSusY/ttUpAhiLe9
        2/EOXsi9DXOl7D3hKXfyUb+uX5jjyBjfvA==
X-Google-Smtp-Source: ABdhPJwnrkf5VV8lOR8ofvTy2eEtkrOUbvs6jU3Ueml81H0PE/585+9TxwtaKPip2KS4chmI1tUn0g==
X-Received: by 2002:a05:6a00:2ab:b0:49f:997e:23e2 with SMTP id q11-20020a056a0002ab00b0049f997e23e2mr8130898pfs.22.1638387678756;
        Wed, 01 Dec 2021 11:41:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm647466pfj.42.2021.12.01.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 11:41:18 -0800 (PST)
Date:   Wed, 1 Dec 2021 11:41:17 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Tom Stellard <tstellar@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com,
        kernelci@groups.io, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
Message-ID: <202112011140.DA93B3E@keescook>
References: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 29, 2021 at 09:57:57AM -0700, Nathan Chancellor wrote:
> This patch series raises the minimum supported version of LLVM to
> 11.0.0.
> 
> Patch #1 outlines the issue, goes over the potential impact of the
> change, and does the actual bump. Subsequent patches clean up the
> various checks that are always true after the bump.
> 
> I have marked this revision as RFC to give various parties the option to
> comment on this bump before it is done, namely KernelCI and Linaro's
> LKFT, who are still testing clang-10. I have added some other folks to
> CC that I know are testing with clang to see if this impacts them in any
> way (as I would like to impact as few people as possible) but as far as
> I am aware, most other CIs and developers are testing closer to tip of
> tree. If that is not true, scream so that we can see what can be done
> about that. If I missed anyone who is actively testing with clang,
> please key them in and I will make sure to include them in future
> revisions (if any are needed).
> 
> It probably makes sense for this series to live in -mm.

Sounds good to me. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
