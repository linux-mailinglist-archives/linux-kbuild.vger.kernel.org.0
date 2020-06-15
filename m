Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B358D1F9421
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2020 12:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgFOKAO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jun 2020 06:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:50948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgFOKAN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jun 2020 06:00:13 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E2A52068E;
        Mon, 15 Jun 2020 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592215213;
        bh=NclZlsh0JNDPCh7/tgM7lDu27PNeuUCqty414H60fo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j97I5KZbz9w21gUAN1DylupVwPgIjeFytHA4gPPAudiRlCwvnhaBcnTrzyVhV1D2Y
         XFel1vN89smdSsfXFsHkK2Jjr5D/tIr/dag7doSecgYiiJJUiJMpUYaXWkpnCLEHlE
         k+IVad79C8U9qrJvICVhkTlseaDwlnHZeXHbISeI=
Date:   Mon, 15 Jun 2020 11:00:08 +0100
From:   Will Deacon <will@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: unify cc-option and as-option
Message-ID: <20200615100007.GD2477@willie-the-truck>
References: <20200614144341.1077495-1-masahiroy@kernel.org>
 <20200614144341.1077495-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200614144341.1077495-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 14, 2020 at 11:43:41PM +0900, Masahiro Yamada wrote:
> cc-option and as-option are almost the same; both pass the flag to
> $(CC). The main difference is the cc-option stops before the assemble
> stage (-S option) whereas as-option stops after it (-c option).
> 
> I chose -S because it is slightly faster, but $(cc-option,-gz=zlib)
> returns a wrong result (https://lkml.org/lkml/2020/6/9/1529).
> It has been fixed by a separate patch, but using -c is more robust.
> 
> However, you cannot simply replace -S with -c because the following
> code would break:
> 
>     depends on $(cc-option,-gsplit-dwarf)
> 
> The combination of -c and -gsplit-dwarf does not accept /dev/null as
> output.
> 
>   $ cat /dev/null | gcc -gsplit-dwarf -S -x c - -o /dev/null
>   $ echo $?
>   0
> 
>   $ cat /dev/null | gcc -gsplit-dwarf -c -x c - -o /dev/null
>   objcopy: Warning: '/dev/null' is not an ordinary file
>   $ echo $?
>   1
> 
>   $ cat /dev/null | gcc -gsplit-dwarf -c -x c - -o tmp.o
>   $ echo $?
>   0
> 
> There is another flag that creates an separate file based on the
> object file path:
> 
>   $ cat /dev/null | gcc -ftest-coverage -c -x c - -o /dev/null
>   <stdin>:1: error: cannot open /dev/null.gcno
> 
> So, we cannot use /dev/null to sink the output.
> 
> Align the cc-option implementation with scripts/Kbuild.include.
> 
> With -c option used in cc-option, as-option is unneeded.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm64/Kconfig      | 2 +-
>  lib/Kconfig.debug       | 1 -
>  scripts/Kconfig.include | 8 +-------
>  3 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 31380da53689..6eb18f45258e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1564,7 +1564,7 @@ config CC_HAS_SIGN_RETURN_ADDRESS
>  	def_bool $(cc-option,-msign-return-address=all)
>  
>  config AS_HAS_PAC
> -	def_bool $(as-option,-Wa$(comma)-march=armv8.3-a)
> +	def_bool $(cc-option,-Wa$(comma)-march=armv8.3-a)

For this arm64 part:

Acked-by: Will Deacon <will@kernel.org>

Will
