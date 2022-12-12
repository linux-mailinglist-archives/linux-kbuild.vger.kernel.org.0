Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E212C64A5B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Dec 2022 18:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiLLRVP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Dec 2022 12:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiLLRVO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2022 12:21:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C45C60F1;
        Mon, 12 Dec 2022 09:21:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 214B860F80;
        Mon, 12 Dec 2022 17:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341A3C433D2;
        Mon, 12 Dec 2022 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670865672;
        bh=SjqVDmbIgQ90Gj/CuVJ2qW4208M6r7Sx8Km8aUFKiMo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A3T49RDi0UVpofh4afireWECmHKDdm5gH+HSwuiMKkjE4PzHGD6ywFiEBntFsr9Gt
         dIh0YoQYzuH0dBG7gj7rNKxf906zM+46VlHcQNpm1tijboRZPy2DPZCl6gRuY0cXRl
         dO05+5FjYX8TlmlPclSQbJjA4cBBlkYNU1r2k0RLupiO7t0j277i41FerDQw5R4LCg
         xcGFRtr2eQKHAWuzTiv78zAo3QbwJ433fNTGGM6K59oVmReePIqzyfVwQY3RwIeVVE
         Kdtnexiv34VwO4kKZr6uWZgV9f/6nWJRuDkdLM5G2kX2BgAqLPxenLItnBUQ+xZecr
         Nq1wnTpDI/z7w==
Date:   Mon, 12 Dec 2022 10:21:10 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: ensure Make >= 3.82 is used
Message-ID: <Y5djBr9rVhSq8+iK@dev-arch.thelio-3990X>
References: <20221211030352.2622425-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211030352.2622425-1-masahiroy@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 11, 2022 at 12:03:52PM +0900, Masahiro Yamada wrote:
> Documentation/process/changes.rst notes the minimal GNU Make version,
> but it is not checked anywhere.
> 
> We could check $(MAKE_VERSION), but another simple way is to check
> $(.FEATURES) since the feature list always grows although this way
> is not always possible. For example Make 4.0 through 4.2 have the
> same set of $(.FEATURES).
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Changes in v3:
>   - Check the version in a different way
> 
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 2dda1e9a717a..66dfc5751470 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -11,6 +11,11 @@ NAME = Hurr durr I'ma ninja sloth
>  # Comments in this file are targeted only to the developer, do not
>  # expect to learn how to build the kernel reading this file.
>  
> +# Ensure Make >= 3.82
> +ifeq ($(filter undefine,$(.FEATURES)),)
> +$(error Make $(MAKE_VERSION) is too old)

Would it make sense to state what version is needed, similar to the
Kconfig checks for compiler and binutils?

> +endif
> +
>  $(if $(filter __%, $(MAKECMDGOALS)), \
>  	$(error targets prefixed with '__' are only for internal use))
>  
> -- 
> 2.34.1
> 
