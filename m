Return-Path: <linux-kbuild+bounces-8998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF51BB9164
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Oct 2025 21:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACBAE4E49F0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Oct 2025 19:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820A72868A6;
	Sat,  4 Oct 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9dKdNva"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2F28688E
	for <linux-kbuild@vger.kernel.org>; Sat,  4 Oct 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759607087; cv=none; b=V4z5O1X33VsCxEc4QKbPXsmRbqAbjjfDpRP27xEesTk9g7snMQ1xidHffQCGqLOMxLTHFUPW5Z5xH+XsQaM4nItMju67DM95sOHZwNKr3rs4pkQ+Sy4NdeH6nIDZH6uiEaEWXjfrVtN3zaEzkQdLx11tCpqr0h1O3rjexgKFEhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759607087; c=relaxed/simple;
	bh=9nkAewDrs9jT1kq0EmKmCzMCk++a7cpgzLbOZF+8FX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THakx3NxvDrnpBJOWJW4X1Pnw/v8My/UqpJbUsWSWsLUd451nBK5w09+lCd+SYYhz8AjldczuI9UCHsYMc6BCbCPr2PWHgz/r3iQPxyP6vn6MF3cDsixLDAGGx217Bj+jJsayCqftWIL5oc5jSpFnV6obvveDhv0R2ahj1l/pIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9dKdNva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E750C4CEF7;
	Sat,  4 Oct 2025 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759607086;
	bh=9nkAewDrs9jT1kq0EmKmCzMCk++a7cpgzLbOZF+8FX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9dKdNvaWdXCWe4jUDVRAJyTOGtleUbNo1SCu17M8qUDFShYPNNJVnlDxFTWL1LaR
	 H28Gak1+1jiJiNgzfbZi4eMIJ7U65E5ZkfiU3Me6frwWCu2D2fKGm3tRzT954/aOTg
	 7EpeKrgMKJZo8wgldqTZn6Uqi8Z54fFKB/+DEa7nu1HC3+YUkN07Yy8gxqOlGknjfw
	 q7GZbL6WTH7VhzRWWwr9W+JfjYR/Ez26QZGwo6vxoWpS0AfpBEfndnp+BsP894WFru
	 XqLsP30ir+Yhd3hIwwWc+pa6zB1aujO+gnFGJG8CM5W/QMavZ73r/xdbOEe/FZzFOe
	 fzoEyxwvHhGSg==
Date: Sat, 4 Oct 2025 21:43:23 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
	naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
	npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
	christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
	mahesh@linux.ibm.com
Subject: Re: [RFC PATCH v2 2/3] kbuild: Add objtool integration for PowerPC
 feature fixups
Message-ID: <aOF4223Q5egUS_in@levanger>
References: <20250929080456.26538-1-sv@linux.ibm.com>
 <20250929080456.26538-3-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929080456.26538-3-sv@linux.ibm.com>

On Mon, Sep 29, 2025 at 01:34:55PM +0530, Sathvika Vasireddy wrote:
> Add build system support for PowerPC feature fixup processing:
> 
> - Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
>   build-time feature fixup processing
> - Integrate objtool feature fixup processing into vmlinux build
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  Makefile                 |  7 +++++++
>  arch/Kconfig             |  3 +++
>  scripts/Makefile.lib     |  5 +++--
>  scripts/Makefile.vmlinux | 13 ++++++++++++-
>  4 files changed, 25 insertions(+), 3 deletions(-)
> 
...
> diff --git a/arch/Kconfig b/arch/Kconfig
> index d1b4ffd6e085..d870aab17cba 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1334,6 +1334,9 @@ config HAVE_UACCESS_VALIDATION
>  	bool
>  	select OBJTOOL
>  
> +config HAVE_OBJTOOL_FTR_FIXUP

For me, FTR is not that natural to parse.  Is there a reason for using
FTR instead of FEATURE?

...
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index b64862dc6f08..94cc2bba929a 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -84,7 +84,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =							\
>  	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
> -	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
> +	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
> +	$(cmd_objtool_vmlinux)
>  
>  targets += $(vmlinux-final)
>  $(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> @@ -131,3 +132,13 @@ existing-targets := $(wildcard $(sort $(targets)))
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>  
>  .PHONY: $(PHONY)
> +
> +# objtool for vmlinux
> +# ----------------------------------
> +#
> +#  For feature fixup, objtool does not run on individual
> +#  translation units. Run this on vmlinux instead.
> +
> +ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
> +cmd_objtool_vmlinux = ; $(objtool) --ftr-fixup --link $@

This cmd_* definition is broken as $(call cmd,objtool_vmlinux) would be
evaluated to '... ; ; ...' (shell syntax error).

What about putting the objtool call right into cmd_link_vmlinux?


cmd_link_vmlinux =							\
	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true);   \
	$(if $(CONFIG_HAVE_OBJTOOL_FTR_FIXUP), $(objtool) --ftr-fixup --link $@, true)


Kind regards,
Nicolas

