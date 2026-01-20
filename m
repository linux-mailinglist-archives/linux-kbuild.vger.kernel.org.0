Return-Path: <linux-kbuild+bounces-10753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMLtE2bRb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10753-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:03:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9449F4F
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38EE18AD153
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C6F44D005;
	Tue, 20 Jan 2026 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWzalO5t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359744CAE6;
	Tue, 20 Jan 2026 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934348; cv=none; b=mLf77RgaGVOFwgTmWlN0C7zA98GhNY6Ca8V3YjA8PfaCnFWVTEwB4zsYvjQDHV8xYJurO8trQApfeCjzL8Rmkb6wlMQTiC5gO5GIEMrmsKwwSY4DzZVLnRn9991UyQFxQeNr6kiQ9BFILifVQiWrhDF4kzBV1JEE32i0d/z5Ljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934348; c=relaxed/simple;
	bh=rTYyl5X5O+XYzpIbFuw0zsstxXaXfzt7BUh3bAWVKvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj/FbqezCLAEEQASF/Zr/Qtv1bFJ0+iSEkTFN12VwDtzHkjtYviEg4samacHTxRvELvwuzy5+Dw/PmoxiB0lbvysZhmsAaDb8KMqwStU1TYKNp1q9U0xSHS7yqaKSzY5sPQFm+74fGtQMHr4kVJGoJbdwsFufLrKqNzq6sdATSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWzalO5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E974C16AAE;
	Tue, 20 Jan 2026 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934345;
	bh=rTYyl5X5O+XYzpIbFuw0zsstxXaXfzt7BUh3bAWVKvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZWzalO5tOPyEn+iDgdeFpMZ0biyzg9chnE+Lqw8cvh/MDQGqxxO5MT9xtyAumUPJk
	 2YNykJDbz8eDLg9hXlyIX9X9Da/T0WTG7n5O5hRSnOr+IUbOnxOArcYFyqJgOxXV2Y
	 DMkLLcmo4FP9hRCTl4aNFBkJ19peqTiPIGVH/mCP/CskPel8DgoVtG6AjgNBEsMPSM
	 Zpv+llnKyV9+YvxayZBnibEofCoJlyi/FQIUCriaNK0CzpXqGPk4i7oYkVCqivAVhV
	 CGMKcS4XJZrcPlTEaPtj/AfIrnsxJh5kt8Ail57GOqZc6A7vWi3KydiXt+miSkVnXK
	 wX4yfx99oizrA==
Date: Tue, 20 Jan 2026 11:39:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Guillaume Tucker <gtucker@gtucker.io>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <20260120183900.GE2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
 <20260120183550.GD2749368@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120183550.GD2749368@ax162>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10753-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[podman.io:url,docker.io:url,quay.io:url]
X-Rspamd-Queue-Id: F0C9449F4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Actually sending to Nicolas now :) sorry for the noise!

https://lore.kernel.org/linux-kbuild/20260120183550.GD2749368@ax162/

On Tue, Jan 20, 2026 at 11:35:50AM -0700, Nathan Chancellor wrote:
> On Tue, Jan 20, 2026 at 02:53:33PM +0100, Nicolas Schier wrote:
> > I probably have just read it over: I have to prefix the
> > 'tuxmake/korg-clang' by 'docker.io/'.  Is that a problem of my system
> > configuration (Debian forky, no special podman config)?
> 
> Some distributions ship registries.conf [1] to allow unqualified image
> names but I do not think Debian does. Personally, I use the full name
> regardless but it should be easy to create it for commands such as these
> to work. I use:
> 
> unqualified-search-registries = ['docker.io', 'ghcr.io', 'quay.io']
> 
> [1]: https://podman.io/docs/installation#registriesconf
> 
> > I tested a tiny bit with podman as runtime backend.  If I leave out the
> > '-r podman' podman's docker emulation is in effect and fails with:
> > 
> >     $ scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j8 olddefconfig
> >     Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
> >     mkdir: cannot create directory '.tmp_15': Permission denied
> >     mkdir: cannot create directory '.tmp_19': Permission denied
> >     mkdir: cannot create directory '.tmp_22': Permission denied
> >     mkdir: cannot create directory '.tmp_25': Permission denied
> >     mkdir: cannot create directory '.tmp_28': Permission denied
> >     mkdir: cannot create directory '.tmp_31': Permission denied
> >       HOSTCC  scripts/basic/fixdep
> >     error: error opening 'scripts/basic/.fixdep.d': Permission denied
> >     1 error generated.
> >     make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
> >     make[1]: *** [/src/Makefile:655: scripts_basic] Error 2
> >     make: *** [Makefile:248: __sub-make] Error 2
> >     [exit code 2]
> > 
> > But with '-r podman' it works like a charm.
> > 
> > Would it make sense to switch the default runtime to podman to
> > prevent non-functional podman-docker emulation?  (Or is this just a
> > problem on my machine?)
> 
> Yeah, I think it would be better to prefer podman over docker if both
> existed on the system. Something like this should do that?
> 
> diff --git a/scripts/container b/scripts/container
> index dbe92630f05b..50c4ae851001 100755
> --- a/scripts/container
> +++ b/scripts/container
> @@ -105,7 +105,7 @@ class PodmanRuntime(CommonRuntime):
>  class Runtimes:
>      """List of all supported runtimes"""
>  
> -    runtimes = [DockerRuntime, PodmanRuntime]
> +    runtimes = [PodmanRuntime, DockerRuntime]
>  
>      @classmethod
>      def get_names(cls):
> 

