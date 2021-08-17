Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6614D3EE463
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbhHQCc3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhHQCc3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:32:29 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37284C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 19:31:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpZmT47K3z9sSn;
        Tue, 17 Aug 2021 12:31:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1629167514;
        bh=Sbl7iwvidphWnlv72t22to+YRD61jI5SCh+FcuNJUFM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QafEecHqTiJwnBHFAhE4KNbK4unc7vdxNF3JYrk7TU2aWcr5wMtoj9RVescaB1JjO
         A5EcWq54ayhgKKpWHmhb/4lhHOMrbsgpG1JKMvkFN9gSG2OhXfEd2jA1QsyShzvObO
         obhMO4uE216rUaQ74r0ch32pC2LoJoIAsyxlW2yNSOEbAcRLN8KzXgpT8yv2IjEoOH
         LKEO9QLnYx7hh9tegE8e3tS5D118mxoJIqRKiVu7tKrpNM1lTiU6XDAUN++jPP9xNz
         A9wXHJTdKfbvohdi+QBoxPzNQ9vpzlCxAct8ValJrwdByQIicIhNPpjBUC+XaWx//6
         s6wyz9WCuc7Ig==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
In-Reply-To: <20210817002109.2736222-4-ndesaulniers@google.com>
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-4-ndesaulniers@google.com>
Date:   Tue, 17 Aug 2021 12:31:52 +1000
Message-ID: <87a6lghkdj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nick Desaulniers <ndesaulniers@google.com> writes:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
>
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
>
> This allows us to pursue removing cc-option-yn.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/powerpc/Makefile      | 12 ++++++------
>  arch/powerpc/boot/Makefile |  5 +----
>  2 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9aaf1abbc641..85e224536cf7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -12,12 +12,12 @@
>  # Rewritten by Cort Dougan and Paul Mackerras
>  #
>  
> -HAS_BIARCH	:= $(call cc-option-yn, -m32)
> +HAS_BIARCH	:= $(call cc-option,-m32)
>  
>  # Set default 32 bits cross compilers for vdso and boot wrapper
>  CROSS32_COMPILE ?=
>  
> -ifeq ($(HAS_BIARCH),y)
> +ifeq ($(HAS_BIARCH),-m32)

I don't love that we have to repeat "-m32" in each check.

I'm pretty sure you can use ifdef here, because HAS_BIARCH is a simple
variable (assigned with ":=").

ie, this can be:

  ifdef HAS_BIARCH


And that avoids having to spell out "-m32" everywhere.

cheers
