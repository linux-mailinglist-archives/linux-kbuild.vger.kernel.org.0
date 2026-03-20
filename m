Return-Path: <linux-kbuild+bounces-12090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MnROZzuvGme4gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12090-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:52:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E84DA2D6588
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC30F3010810
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 06:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CAF355F59;
	Fri, 20 Mar 2026 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKolX9RI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B79355F57;
	Fri, 20 Mar 2026 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989526; cv=none; b=utx7FBC8nPqLHCifhWp10kf9kVGkvedk5I1s4h3h70fzacXTw1Je65+1vEk6To3w2BPX7WyDh/IDTmZEcf8JNVioY9TwVUJ3Kc+qGuV5IGRnJ6z9O2saLr+dDsoqLx+MqnSnCcAPsTqEyBrPKJfyszvC00aSC0I4q2GMSCrXnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989526; c=relaxed/simple;
	bh=PT9jhy2Kt4EJGgFgWPJaP53AWaiDA1WBvOIWWUQBsEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaPqH9WQVTxAX3jcGt6i1tRid/1AQHmByiV70Uh/xHIVrOoPdNiybVBAKiUj+x0ieFseE02eOS4rphHoNJjIzqR/iv4kWYXwHxgs5EFYjTlmHeyAEfvlb0gkaPTGzQM5ZrbHCpZ7iRyM6LsUBqt3rnnFST8Jr1hnE1axMOLdbYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKolX9RI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B06DC4CEF7;
	Fri, 20 Mar 2026 06:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773989525;
	bh=PT9jhy2Kt4EJGgFgWPJaP53AWaiDA1WBvOIWWUQBsEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKolX9RIvOfwFehFVzNVtuRvknQv2WWsLdzndY4R8AV5KPleTPsMQML5+JK5MZanm
	 KVOrx+L6l5YIGgRXWL6V1W38fP5gGtaVqzTS+HnRoSESQ0fSggHpg32yikQBbfq9v1
	 Ocp36ThwO1JKy3gEOXCYknDI0yX1BcqXBqd9J3yoCmdU9GJPXHA4lR5Zi2bDL3zk8Z
	 yEvaahDVmk2LZCD8J/wkGTkOQCWgatJtCEYW+rdXVFdmMhovV/rPkSfHVTOXdSi+N/
	 Y5Q1yzotre5vmTbAP7xHt1J9Y4vGrqV2If7yF3pWUEoNzW12y939YbIJWtBogxheUH
	 vKGzlx59+IUdg==
Date: Fri, 20 Mar 2026 07:51:44 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net,
	miguel.ojeda.sandonis@gmail.com, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v4] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <abzuCFiO3mB3nUM_@derry.ads.avm.de>
References: <20260312002852.11292-1-mo@sdhn.cc>
 <20260317112021.14353-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317112021.14353-1-mo@sdhn.cc>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12090-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,gmail.com,vger.kernel.org,smile.fr];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fr:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,derry.ads.avm.de:mid]
X-Rspamd-Queue-Id: E84DA2D6588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:20:21PM +0300, Mohamad Alsadhan wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Generate a small wrapper script and pass it to -Clinker e.g.
> ```
> exec sh -c 'exec "$0" "$@"' ccache gcc "$@"
> ```
> 
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
> 
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> ---
> v3 -> v4:
>   - Use filechk instead of if_changed macro to regenerate script
>   - Remove trailing space at EOL
> 
> v2 -> v3:
>   - Scrap previous hacky approaches (e.g. using lastword) and go with
>     a proper fix which turned out not that complex to implement.
>     Apologies Gary, I should have listened to you earlier :/
> 
> v1 -> v2:
>   - Rename HOSTRUSTC_LINKER to HOSTRUSTC_LD for consistency
>   - Introduce explicit HOSTRUSTC_LD override
>   - Warn when falling back due to multi-argument HOSTCC
>   - Error out if a user-specified HOSTRUSTC_LD is not an executable
> 
> v1: https://lore.kernel.org/all/20260225102819.16553-1-mo@sdhn.cc/
> v2: https://lore.kernel.org/all/20260227132713.23106-1-mo@sdhn.cc/
> v3: https://lore.kernel.org/all/20260312002852.11292-1-mo@sdhn.cc/
> ---
>  scripts/Makefile.host | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..e41753828 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,29 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
>  
> +# rustc's `-Clinker=` expects a single executable path, not a command line.
> +# `HOSTCC` may be a multi-word command when wrapped (e.g. "ccache gcc"), which
> +# would otherwise be split by the shell and mis-parsed by rustc.
> +# To work around this, we generate a wrapper script that forwards arguments to
> +# `HOSTRUSTC_LD` so that such commands can be used safely.
> +#
> +# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
> +HOSTRUSTC_LD ?= $(HOSTCC)
> +define filechk_rustc-wrapper
> +	printf "%s\n" \
> +		'#!/bin/sh' \
> +		'exec sh -c '\''exec "$$0" "$$@"'\'' $(HOSTRUSTC_LD) "$$@"'
> +endef

This printf-based solution needs some more tweaking to also support
complex commands in HOSTRUSTC_LD with quoted spaces.  A straight forward
way could be:

	'exec sh -c '\''exec "$$0" "$$@"'\'' $(call escsq,$(HOSTRUSTC_LD)) "$$@"'

to escape single quotes within HOSTRUSTC_LD.  Then the complex example
from v3 works again (make HOSTRUSTC_LD="env 'CCACHE_DIR=/tmp/my cache' ccache gcc").

With the quoting fixed:
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>



I am still not seeing a benefit in calling usage of 'exec' and 'sh -c'.
If we'd skip both, there would be no need to use 'env' for environment
updates:

	'$(call escsq,$(HOSTRUSTC_LD)) "$$@"'

But I may be missing something here.

Kind regards,
Nicolas

