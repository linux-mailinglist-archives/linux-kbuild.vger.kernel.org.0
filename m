Return-Path: <linux-kbuild+bounces-11116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI0DCr+ui2nmYQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11116-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 23:18:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7417D11FB4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 23:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BBCB3055430
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E70F339844;
	Tue, 10 Feb 2026 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/WsTOhz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C081329E5E;
	Tue, 10 Feb 2026 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761859; cv=none; b=REqXG+b4Wdqs0xxVLiykC+Glti055CfFFU8FaEIsZNhweE49Dknodhu+6uG0hJgTv6YA5fBubv6U5qCnn6rampLBsT6Rmz0jp8K9+NIa5AAmJfGm5k3K6+7d9fOCMp3BSu2wOUaUamxZlDOnvK1bkDasMnDSstBCGn9IC98Sn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761859; c=relaxed/simple;
	bh=yRgAZi+H1OgiDVSYP7jY5OY0UT2Bq/22tBBon3ak5yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfSYjc7GkE/r204toE0m+6euox2RBHGVkaWIZPZN6YKEOKaxuTYI53gxnUxy8LFtM8spvfIrMNf8TocSwJjAxSwcB3jtxzVixP+kgd7uBLOE6EdsYGByUGxFLq1gvtEUzAefkgiDGKjXOyixawt341RTat8dSurE5iBXvKieUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/WsTOhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E70C116C6;
	Tue, 10 Feb 2026 22:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770761858;
	bh=yRgAZi+H1OgiDVSYP7jY5OY0UT2Bq/22tBBon3ak5yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/WsTOhzeKRjDpT1cqgTeOvTKE+zvTcmYkzzJeH08IfB0T61xMSKOWgRnFonuIc7Z
	 XUYsL647zvEZ1idoNZ2r/pAKRrwpq1kPFG+FcqseNiyIRDScUBAH/+scUyEh8VTN4l
	 QU/U9CDMZCKEF4YaC0jDbxypwimjvCEcwC1Izihda1AxoqYy+Aobc2Vha8v8rMY4qU
	 Di1AlO8FnpnuxLNfLHJgKUzf9amYYo0JCgvNAl1zmft/d7MHwuQkBVryFtrkg6/4Xr
	 HSp3K3sFkAqTQ+YaRQCVqRpiwxBYBmxBAmIK6grvVxpo0XAjOfqaQ+W51wBrv2Zdar
	 r3NPC6gPThKXw==
Date: Tue, 10 Feb 2026 15:17:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	Jens Remus <jremus@linux.ibm.com>
Subject: Re: [PATCH] kbuild: Add objtool to top-level clean target
Message-ID: <20260210221734.GB1148627@ax162>
References: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <968faf2ed30fa8b3519f79f01a1ecfe7929553e5.1770759919.git.jpoimboe@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11116-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7417D11FB4A
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:45:22PM -0800, Josh Poimboeuf wrote:
> Objtool is an integral part of the build, make sure it gets cleaned by
> "make clean" and "make mrproper".
> 
> Fixes: 442f04c34a1a ("objtool: Add tool to perform compile-time stack metadata validation")
> Reported-by: Jens Remus <jremus@linux.ibm.com>
> Link: https://lore.kernel.org/15f2af3b-be33-46fc-b972-6b8e7e0aa52e@linux.ibm.com
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Indeed, I have noticed some funkiness in this area but not frequently
enough to have the time to investigate it. This appears to work fine for
me.

I will likely have a kbuild-fixes pull request before -rc1 so I can take
this unless you want to have it in a different tree?

> ---
>  Makefile               | 11 ++++++++++-
>  tools/objtool/Makefile |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index d3a8482bdbd0..ed850044491d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1474,6 +1474,15 @@ ifneq ($(wildcard $(resolve_btfids_O)),)
>  	$(Q)$(MAKE) -sC $(srctree)/tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
>  endif
>  
> +PHONY += objtool_clean
> +
> +objtool_O = $(abspath $(objtree))/tools/objtool
> +
> +objtool_clean:
> +ifneq ($(wildcard $(objtool_O)),)
> +	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) clean
> +endif
> +
>  tools/: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
>  	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
> @@ -1637,7 +1646,7 @@ vmlinuxclean:
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
>  	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
>  
> -clean: archclean vmlinuxclean resolve_btfids_clean
> +clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
>  
>  # mrproper - Delete all generated files, including .config
>  #
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index a40f30232929..6964175abdfd 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -29,6 +29,8 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>  srctree := $(patsubst %/,%,$(dir $(srctree)))
>  endif
>  
> +RM ?= rm -f
> +
>  LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
>  ifneq ($(OUTPUT),)
>    LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> -- 
> 2.53.0
> 

