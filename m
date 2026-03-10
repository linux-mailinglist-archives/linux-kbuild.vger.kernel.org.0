Return-Path: <linux-kbuild+bounces-11749-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGwQLYFwr2m6YQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11749-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:14:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6A2436C6
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25B4130C5502
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307472D97A4;
	Tue, 10 Mar 2026 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXYEdYkK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33B2C027C;
	Tue, 10 Mar 2026 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104840; cv=none; b=ZtH4r3wHhnZ+Y49k7mH56EHpM6XpyDvUgexnEk7PSUGVDh30Eaoj141VGQ+knIlk0ecfsjOFkVdazxb8czoY+k/80hFxAV1s4mD1JyPAQFtWr5zVqMPDIScaYMS6yBX7T/9RAREYAzBerGfV6K9sT5PLOTN5MtLcxrVbjgJ1KYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104840; c=relaxed/simple;
	bh=ww4QvsbJnWR50xSwYVu/llfSRfdxHoj+TlSxTEgXVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exvj1qSfpzg+VgCI5CPGZYV6+E0VHtko0yC1N96SpgcVgDsJZTjtt70lmDnWgSaByOfdXYBMVQCaQ6kwZu0frEXvlt6emaaPhCRk/LZHunbffbOn0sO1s4lklaD7q0bR4KMvKd538sSe7QuzJeaU7lZSWhpLP06H6NG6A7mSciA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXYEdYkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1264C4CEF7;
	Tue, 10 Mar 2026 01:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773104839;
	bh=ww4QvsbJnWR50xSwYVu/llfSRfdxHoj+TlSxTEgXVXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXYEdYkKLqwDVytLwPP9J8bU6eIjTZxBx9spoONjuAI82fE0odLcsUubP2tJWVc02
	 bGWhOXRE5uo0Y4CEAyrxsabvqBO1uTE9vdRhZWLLTel8g2UgQY7D781123zgD+aIbW
	 BpqQyV96IpgA+ZmgUR2qDFWUj1H7Fnm01JzwM9E2EhtrFe2GfhDMmx7s8+W34T+d0a
	 6YsARfM/RppuDw3oyL+MULSkFEo4Z5FsabJWYTM3BDV+eLthF0qRUGx3AaJAaNovYt
	 QDO5LXjf473pJ5tu0vwUlpwfMLCBIFWjBFQ4nP4uKEuKSzQBGO0I6f0jWNTpdbJy7z
	 RjjGc7b//+cFQ==
Date: Mon, 9 Mar 2026 18:07:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: reduce output spam when building out of tree
Message-ID: <20260310010716.GA1656066@ax162>
References: <20260305-kbuild-makefile-spam-v1-1-910f6cf218a1@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305-kbuild-makefile-spam-v1-1-910f6cf218a1@linutronix.de>
X-Rspamd-Queue-Id: 22C6A2436C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11749-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:04:07PM +0100, Thomas Weiﬂschuh wrote:
> The execution of $(call cmd,makefile) will print 'GEN Makefile' on each
> build, even if the Makefile is not effectively changed.
> 
> Use a filechk command instead, so a message is only printed on changes.
> 
> The Makefile is now created even if the build is aborted due to an
> unclean working tree. That should not make a difference in practice.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e944c6e71e81..fae52ab03525 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -676,14 +676,19 @@ print_env_for_makefile = \
>  	echo "export KBUILD_OUTPUT = $(CURDIR)"
>  endif
>  
> -quiet_cmd_makefile = GEN     Makefile
> -      cmd_makefile = { \
> +filechk_makefile = { \
>  	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
>  	$(print_env_for_makefile); \
>  	echo "include $(abs_srctree)/Makefile"; \
> -	} > Makefile
> +	}
>  
> -outputmakefile:
> +$(objtree)/Makefile: FORCE
> +	$(call filechk,makefile)
> +
> +# Prevent $(srcroot)/Makefile from inhibiting the rule to run.
> +PHONY += $(objtree)/Makefile
> +
> +outputmakefile: $(objtree)/Makefile
>  ifeq ($(KBUILD_EXTMOD),)
>  	@if [ -f $(srctree)/.config -o \
>  		 -d $(srctree)/include/config -o \
> @@ -704,7 +709,6 @@ else
>  	fi
>  endif
>  	$(Q)ln -fsn $(srcroot) source
> -	$(call cmd,makefile)
>  	$(Q)test -e .gitignore || \
>  	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260213-kbuild-makefile-spam-4e72f6792dfa
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

