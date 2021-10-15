Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC4342F039
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Oct 2021 14:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238623AbhJOMLW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Oct 2021 08:11:22 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55795 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbhJOMLV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Oct 2021 08:11:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW4nQ36Ktz4xb9;
        Fri, 15 Oct 2021 23:09:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1634299754;
        bh=1uMmuk8UZMQcxtOynGwwbYnNzAvhH79ibEqbN2M3pRc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=F4NEd+dGo1xipM8r2FCUb9EjW1qHdvX6I5Aed0HlRi/S3NbTKuWU3ZGp0I5Jk3r60
         Nf2L/4IMFve8quF6hLjUTELGnjHcUHNslZR+PRIoR2yomusVNlmJg1FkSXI6qzxAk/
         x/TVNIWDZ73PKr8bfO62PW7nXVu9CiGpwbzApIbbdN26Rmj5s1LiHXAjLDGpgIHBT4
         366pyu57Z/MUT8uMHjs9MoYLJPsTTcQ0BO1+CqmnOpD8OiERxONVGxVlPhqVTnBZ7m
         MDpg3edpvYfrrte6bWaZftkouB1X9tdbnimQVk/GH/DwZ2+HzTlNJyK1UyGAasQE8P
         QCXhQMUPSMGOg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting
 subdirectories while cleaning
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
Date:   Fri, 15 Oct 2021 23:09:11 +1100
Message-ID: <8735p2xzfc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
>
...
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index aa6808e70647..b61d8be3c226 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -411,9 +409,6 @@ install:
>  	sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
>  	System.map "$(INSTALL_PATH)"
>  
> -archclean:
> -	$(Q)$(MAKE) $(clean)=$(boot)
> -
>  ifeq ($(KBUILD_EXTMOD),)
>  # We need to generate vdso-offsets.h before compiling certain files in kernel/.
>  # In order to do that, we should use the archprepare target, but we can't since

Seems to work.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
