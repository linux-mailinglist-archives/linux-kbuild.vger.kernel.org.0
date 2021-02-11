Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53114318887
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 11:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhBKKr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 05:47:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:54320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230433AbhBKKoW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 05:44:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84ADA64E13;
        Thu, 11 Feb 2021 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613040221;
        bh=MhyCNPilNp1n0/hhzu9n9mbGtPkE6nkufd4sqjrol+4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uTR27TXA4/X1UAKf1pTli7gCRp6AgTTlhM4bABBjTpn/W67kGcS5vh/9+Yx/wilDd
         0JoOSrePpT70xJ9mGkLqNhGpj3TDqpc3lCb70v8zKJTkADhLkg8Etf9CeMjLMZARjU
         YwHC0r/JJT5hRyfH5ArPflcQe40DOc8lwliwxd2P1jsy2Szwu8AYpa1ktliE18fpBf
         dvwkWeA8TCrf7L0UtvNec2h5bEAHkhfEWT1smXu6y3hU+NuC8YMXK638lixgEktDSQ
         NHEg5NQDNT4yzSlFma8UQMhPMc8JfMhEuuyFnLfjA7XFVY/+nYnUO7IIE6nQv+UYXs
         TyZ2OBP60htvg==
Date:   Thu, 11 Feb 2021 11:43:35 +0100
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64
Message-ID: <YCUKVyMcVoNDAYJv@gunter>
References: <20210211061416.3747231-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210211061416.3747231-1-masahiroy@kernel.org>
X-OS:   Linux gunter 5.10.12-1-default x86_64
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [11/02/21 15:14 +0900]:
>Stephen Rothwell reported a build error on ppc64 when
>CONFIG_TRIM_UNUSED_KSYMS is enabled.
>
>Jessica Yu pointed out the cause of the error with the reference to the
>ppc64 elf ABI:
>  "Symbol names with a dot (.) prefix are reserved for holding entry
>   point addresses. The value of a symbol named ".FN", if it exists,
>   is the entry point of the function "FN".
>
>As it turned out, CONFIG_TRIM_UNUSED_KSYMS has never worked for ppc64,
>which has been unnoticed until recently because this option depends on
>!UNUSED_SYMBOLS hence is disabled by all{mod,yes}config. (Then, it was
>uncovered by another patch removing UNUSED_SYMBOLS.)
>
>Removing the dot prefix in scripts/gen_autoksyms.sh fixes the issue.
>Please note it must be done before 'sort -u', because modules have
>both ._mcount and _mcount undefined when CONFIG_FUNCTION_TRACER=y.
>
>Link: https://lore.kernel.org/lkml/20210209210843.3af66662@canb.auug.org.au/
>Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot for the quick fix. This fixes the ppc64 build issue on my end:

    Tested-by: Jessica Yu <jeyu@kernel.org>

Do you plan to take this through the kbuild tree? If so, please let me
know when you've applied it, then I can undo the temporary workaround
I currently have in modules-next.

Thank you!

Jessica
