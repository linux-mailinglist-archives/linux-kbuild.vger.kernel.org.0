Return-Path: <linux-kbuild+bounces-562-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BB82D8FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 13:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CB5281CB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 12:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DC9EAF7;
	Mon, 15 Jan 2024 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="aYyQWSil"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163E15AD9;
	Mon, 15 Jan 2024 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NgzXg3+8ZGRa5iz9M09l6POJCYlEO7PNx8wx6jNDsKg=; b=aYyQWSilEfWST9srx/0hI1KXUR
	N0BHTDVpD8Ms8kTttAfH6jFYNqO/xyVYb6s4LWHJzJCZAm8UwkwCj8XANUJTy6ta7MPHDplZI8zKc
	YMOobd0ezYEpHxFN5gBXfmn3Mhu/2pw4JfTQIWbJdp/dG/AlY/KiNAlW693rjQz5cPW15N9qVhbYx
	FfKP//aeXBkiny8kM4UqBcLW8pkrtw7ghPlUUimHpCJ8wLgrEJ0HiXtNdkr6WsfYEcUWwwcVSGh3t
	H8Y1FSs3Zmt7uuNEetKDr3YnXie1UQQQAgMy9p2sAycpS5rHHTeTPE6vN8YMIWVtQ8PSWo15BpJm3
	TjEzVbBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39144)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPMLO-0002Oc-2D;
	Mon, 15 Jan 2024 12:45:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPMLO-0002xX-0v; Mon, 15 Jan 2024 12:45:34 +0000
Date: Mon, 15 Jan 2024 12:45:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
Message-ID: <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Ping?

On Wed, Jan 10, 2024 at 10:24:43AM +0000, Russell King (Oracle) wrote:
> When using the SHA3 module signing options, kmod 28 segfaults during
> "make modules_install" on the build host.
> 
> When running depmod under gdb, it reports:
> 
> Program received signal SIGSEGV, Segmentation fault.
> __strlen_sse2 () at ../sysdeps/x86_64/multiarch/strlen-vec.S:133
> 
> Therefore, SHA3 can't be used on a build system with an old kmod. Add
> a script to retrieve the version of depmod, and use that in the Kconfig
> to determine whether the SHA3 options should be made available.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> I don't know what the minimum requirement is for SHA3 to work, so I have
> chosen a minimum of version 29 for the purposes of this patch.
> ---
>  kernel/module/Kconfig     |  8 ++++++++
>  scripts/Kconfig.include   |  3 +++
>  scripts/depmod-version.sh | 11 +++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100755 scripts/depmod-version.sh
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 0ea1b2970a23..d2ba454026a9 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -223,6 +223,11 @@ config MODULE_SIG_ALL
>  	  Sign all modules during make modules_install. Without this option,
>  	  modules must be signed manually, using the scripts/sign-file tool.
>  
> +config DEPMOD_VERSION
> +	int
> +	default	$(depmod-version)
> +	default 0
> +
>  comment "Do not forget to sign required modules with scripts/sign-file"
>  	depends on MODULE_SIG_FORCE && !MODULE_SIG_ALL
>  
> @@ -250,14 +255,17 @@ config MODULE_SIG_SHA512
>  
>  config MODULE_SIG_SHA3_256
>  	bool "Sign modules with SHA3-256"
> +	depends on DEPMOD_VERSION > 28
>  	select CRYPTO_SHA3
>  
>  config MODULE_SIG_SHA3_384
>  	bool "Sign modules with SHA3-384"
> +	depends on DEPMOD_VERSION > 28
>  	select CRYPTO_SHA3
>  
>  config MODULE_SIG_SHA3_512
>  	bool "Sign modules with SHA3-512"
> +	depends on DEPMOD_VERSION > 28
>  	select CRYPTO_SHA3
>  
>  endchoice
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 5a84b6443875..052f581c86da 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
>  cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
>  m32-flag := $(cc-option-bit,-m32)
>  m64-flag := $(cc-option-bit,-m64)
> +
> +# depmod version
> +depmod-version := $(shell,$(srctree)/scripts/depmod-version.sh)
> diff --git a/scripts/depmod-version.sh b/scripts/depmod-version.sh
> new file mode 100755
> index 000000000000..32a8a6f6b737
> --- /dev/null
> +++ b/scripts/depmod-version.sh
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +: ${DEPMOD:=depmod}
> +
> +# legacy behavior: "depmod" in /sbin, no /sbin in PATH
> +PATH="$PATH:/sbin"
> +
> +LC_ALL=C "$DEPMOD" --version | sed -n '1s/kmod version //p'
> -- 
> 2.30.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

