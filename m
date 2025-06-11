Return-Path: <linux-kbuild+bounces-7451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6634AD522E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 12:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9CB918959E1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jun 2025 10:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5060A26659A;
	Wed, 11 Jun 2025 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTu8WU9q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C3286A9;
	Wed, 11 Jun 2025 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638316; cv=none; b=KLLQ/R12JE/l5515uBX8/DSgROAfVe1MOxgo7zi/t0OS5KtUOyItJXh3m7yE/pC86gkNnbpa4L0hkhOvhWlq7BPhxpki7ouWp5ziG+A4YelLybJHZrHTVFBu4qboeVOxdHSJ/rYC72MGbRKSkao0+9jvzqxZlRqpOGGP6wpikzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638316; c=relaxed/simple;
	bh=u1/Nc/mxiK63XpSvu3fPhoY0JtJGkKnqVVXwTANKFJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwQw+wKj87gdaMzX9CRyrYGy2DWihGKkGZJXVIkrfgJa3tQ4Iv5v9P3uuXNN68NHyFsl2lVdUaDDPmpihMqCYpWxOAsLEQB4Nv07hnHTAZLmudzmlcJF11pPUhFs09oGNDB+LCmLx9Kg7lAJN/htgFPMTyz7DhS15uoG0ZWxlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTu8WU9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDBAC4CEEE;
	Wed, 11 Jun 2025 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638315;
	bh=u1/Nc/mxiK63XpSvu3fPhoY0JtJGkKnqVVXwTANKFJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTu8WU9q9KkpyLfCNYzNXkR/ECJeqFJ9bPbJ9zntyOk2mzUZIHeIhk2u/9X+tvOvk
	 aLaS9M5ixnC59uCPZPEqhRd2TW79aERqgQOmNE4Bj/sY1s4XSY7YG4SpXahvTapJY1
	 iF+VLo0dzbFTn/6sXaNZ84p1RijqmdW3Xvfn/MFjj8l/KXaTO8JadgNKThovn0g7ug
	 2Eks2qBvNxZ60/bgXu/oe0VaLOMb2qVIrSr21uiWtIO89a1xMIaOrJ5P75l09TatBJ
	 9t4kjuHuKT1b8UJUYb3KLOQ9GUR4kSxOvjhPcf44o6+gYZ0Oz2UpF4ltgSIAyUntxa
	 k+BKmpEz3VXLQ==
Date: Wed, 11 Jun 2025 12:38:30 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from
 vmlinux.unstripped
Message-ID: <aElcpj7sC2XUiMPb@example.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
 <20250606041029.614348-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606041029.614348-5-masahiroy@kernel.org>

On Fri, Jun 06, 2025 at 01:10:26PM +0900, Masahiro Yamada wrote:
> Currently, we assume all the data for modules.builtin.modinfo are
> available in vmlinux.o.
> 
> This makes it impossible for modpost, which is invoked after vmlinux.o,
> to add additional module info.
> 
> This commit moves the modules.builtin.modinfo rule after modpost.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.vmlinux   | 28 +++++++++++++++++++++++++++-
>  scripts/Makefile.vmlinux_o | 26 +-------------------------
>  2 files changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index e2ceeb9e168d..45597068f11f 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  PHONY := __default
> -__default: vmlinux
> +__default:

I found the problem. The problem I was talking about earlier [1] is caused
by this hunk. If I revert it, everything will work.

[1] https://lore.kernel.org/all/aEWhwur_W6UwDsx_@example.org/

>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> @@ -96,6 +96,32 @@ targets += vmlinux
>  vmlinux: vmlinux.unstripped FORCE
>  	$(call if_changed,strip_relocs)
>  
> +# modules.builtin.modinfo
> +# ---------------------------------------------------------------------------
> +
> +OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> +
> +targets += modules.builtin.modinfo
> +modules.builtin.modinfo: vmlinux.unstripped FORCE
> +	$(call if_changed,objcopy)
> +
> +# modules.builtin
> +# ---------------------------------------------------------------------------
> +
> +__default: modules.builtin
> +
> +# The second line aids cases where multiple modules share the same object.
> +
> +quiet_cmd_modules_builtin = GEN     $@
> +      cmd_modules_builtin = \
> +	tr '\0' '\n' < $< | \
> +	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
> +	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> +
> +targets += modules.builtin
> +modules.builtin: modules.builtin.modinfo FORCE
> +	$(call if_changed,modules_builtin)
> +
>  # modules.builtin.ranges
>  # ---------------------------------------------------------------------------
>  ifdef CONFIG_BUILTIN_MODULE_RANGES
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index b024ffb3e201..23c8751285d7 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  PHONY := __default
> -__default: vmlinux.o modules.builtin.modinfo modules.builtin
> +__default: vmlinux.o
>  
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> @@ -73,30 +73,6 @@ vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
>  
>  targets += vmlinux.o
>  
> -# modules.builtin.modinfo
> -# ---------------------------------------------------------------------------
> -
> -OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
> -
> -targets += modules.builtin.modinfo
> -modules.builtin.modinfo: vmlinux.o FORCE
> -	$(call if_changed,objcopy)
> -
> -# modules.builtin
> -# ---------------------------------------------------------------------------
> -
> -# The second line aids cases where multiple modules share the same object.
> -
> -quiet_cmd_modules_builtin = GEN     $@
> -      cmd_modules_builtin = \
> -	tr '\0' '\n' < $< | \
> -	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
> -	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
> -
> -targets += modules.builtin
> -modules.builtin: modules.builtin.modinfo FORCE
> -	$(call if_changed,modules_builtin)
> -
>  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
> -- 
> 2.43.0
> 

-- 
Rgrds, legion


