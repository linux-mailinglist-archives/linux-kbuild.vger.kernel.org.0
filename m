Return-Path: <linux-kbuild+bounces-11436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEafJGdun2mZbwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11436-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:49:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A021519E05D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40253304EA94
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 21:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C040314D1D;
	Wed, 25 Feb 2026 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWTiPA2P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A5719EED3;
	Wed, 25 Feb 2026 21:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772055928; cv=none; b=HSD5j53Lep9d+d+9myHd7F0Lk/HobSY28a+wfB6af/rKL2lr1uo7PY9Lcu/poXYBtyXYWlYNpo/0YnR7uzymHhINJvIMotCXt/dLS32JdHJZD5x+CokE1dbnZBCNjtJQ/nmRHs4RGy68BhWvrgq3QyZfyXKYS7UeXp9pSBLO0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772055928; c=relaxed/simple;
	bh=o7reDApa0xqbzpim42KaogctgjCuaUcp/E3l1NqMhm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgXITfkGnBx86cRcGVza1F0KVrCLqhmAcLkBQ9fxx4xL8yYVI6SmT+IGTy8Iueuq86r6JZgN5Ll2aWXndgmr1jmQ9AHc5EkgxfTWdlXb4MppyrbNAiBG58JgfbZ6SKiBsUH8OVpNaR6+aCrLWTUzJl+b8S9Rx9j6d84Veg8qFDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWTiPA2P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C277C116D0;
	Wed, 25 Feb 2026 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772055927;
	bh=o7reDApa0xqbzpim42KaogctgjCuaUcp/E3l1NqMhm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWTiPA2P0eRx4O7dL0NguIkyR7UFI6T5cQn/OZmChZXUrdAuscEiZhtZZa7ScM7eZ
	 CRZ9zdgvq+maOm0+GwRq/QA2Y8Yy192CkkG82uulVaXUSi9ECXLEMBEzVLQp8L2oLK
	 upGWo1olENOQ4cV42I4WbdsgP5ArBdm3yZKc5V3P3K9QxPhngPSZWDkEtcZUAGdGr9
	 p/mMt/wH/csor4biUD2hAW1eCxBHdjZJ+SJWJ4EZ8XQR+II2H9Ixj6mvcnwjCPewSe
	 m7FzZ8hngUPBHi2McbjI5XyXcmBORZqXO2k8cC4TaCF/Sn73GjE9Npxw/v/5XbemD+
	 zAXy8XDRSO0jQ==
Date: Wed, 25 Feb 2026 14:45:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>, Miguel Ojeda <ojeda@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: host: use single executable for rustc -C linker
Message-ID: <20260225214523.GA4062959@ax162>
References: <20260225102819.16553-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225102819.16553-1-mo@sdhn.cc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11436-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sdhn.cc:email]
X-Rspamd-Queue-Id: A021519E05D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 01:28:19PM +0300, Mohamad Alsadhan wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> -Clinker=$(HOSTCC) results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Use the last word of HOSTCC as the linker executable for host
> Rust tools. This preserves wrapper usage for C host tools while
> ensuring rustc receives a single executable path.
> 
> Closes: https://github.com/Rust-for-Linux/linux/issues/1224
> 
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Miguel, as this is a Rust fix, do you want to take it? If so:

Acked-by: Nathan Chancellor <nathan@kernel.org>

Otherwise, I could take it via kbuild-fixes for 7.0.

> ---
>  scripts/Makefile.host | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index c1dedf646..22eab2734 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -87,11 +87,18 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
>                   $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(target-stem).o)
>  
> +# rustc's `-C linker=` expects a single executable path, not a command line.
> +# HOSTCC may be a multi-word command when wrapped (e.g. "ccache gcc"),
> +# which would otherwise be split by the shell and mis-parsed by rustc.
> +#
> +# Use a dedicated variable for the linker program used by host Rust tools.
> +HOSTRUSTC_LINKER ?= $(lastword $(HOSTCC))

I would probably use HOSTRUSTC_LD to mirror how the rest of Kbuild
refers to the linker.

> +
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
>  # modules case.
>  hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
> -		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
> +		 -Clinker-flavor=gcc -Clinker=$(HOSTRUSTC_LINKER) \
>  		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> -- 
> 2.52.0
> 

