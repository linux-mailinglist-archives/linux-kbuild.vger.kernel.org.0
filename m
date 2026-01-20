Return-Path: <linux-kbuild+bounces-10747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOIPDsrSb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10747-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:08:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A44A09A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90D6C64DACF
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0FF44B663;
	Tue, 20 Jan 2026 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIJUQCEB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D87449EA0;
	Tue, 20 Jan 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931754; cv=none; b=HPsgU6Ppg8Uh46cWUuk7fomVL7LnSCIZKhQYRIIux9IxItSnk7VGNhvSpTRba7InLOrWm6o16+vYP6ve3V53WXPie1G8HEu2skB9Muqu0WM8+WnZCog+/4pyyxJNq1uGTi9wjDhNfKlehNtYk2ne/02m8VrxaYpzeAfHZeGG+XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931754; c=relaxed/simple;
	bh=YdlHdpPvefXlQJs8q/aV3FbVwI7IGilgSt53A6aDmkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYn9iPEyZP5Jr8K9DjukhFilYAsxUQhYIjLs4rKdikQMNNIIZKJHhebP/xaczollaFd0SfkB6YtdaC622f9YZSCSuFrNIsEJZHLRUNLkfs8Z88wzGIcr8Az51Xmd7dCPrKuQLK+5RcLqmyR30b3zt2AqPZhsW8+as7jWH/beWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIJUQCEB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50556C16AAE;
	Tue, 20 Jan 2026 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931753;
	bh=YdlHdpPvefXlQJs8q/aV3FbVwI7IGilgSt53A6aDmkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIJUQCEBJCzX0meiRg0BArNr0wQH/PkDIgcKRlqN5FVUgdbGXbScY/M2Kl6t7xJkI
	 FM3SOHLxeuNjfGuWw/93uJPDyqOS2xHIx0sZ94KvnpWmzlF3GrECyt+KM3kpnG9Nym
	 n454XfYhRhtcJ2YaFbDCfvmvdSws0NqUZjO3XsD1ap0vB9i27jGIyir4cY61vAho3Z
	 oiN+n92s81id5kCK4C7qt3jj0eGgstHImWAKUnJPj6FovBZF9Tj/j2jw2i70aojtMK
	 P1FIWPyBkjgWTzwDWkzHa3T1ZeIFNdYxtY+A3NzxcSMRqXQfYJkiknp57mI+GktcoX
	 +aVmU9QohPv6A==
Date: Tue, 20 Jan 2026 10:55:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260120175548.GA2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162>
 <4d4ec41f-1203-4cef-8f49-402440f3e983@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d4ec41f-1203-4cef-8f49-402440f3e983@gtucker.io>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10747-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,docker.com:url]
X-Rspamd-Queue-Id: A00A44A09A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:46:15AM +0100, Guillaume Tucker wrote:
> Well the tuxmake LLVM image is mentioned in the first example:
> 
>     scripts/container -i tuxmake/korg-clang -- make LLVM=1 defconfig
>     scripts/container -i tuxmake/korg-clang -- make LLVM=1 -j$(nproc)
> 
> So that should just work out of the box.  Or did you mean to add
> something else to the docs?

I was just envisioning a blurb like "Additionally, TuxMake has prebuilt
containers for various architectures: https://hub.docker.com/u/tuxmake"
or something like that at the end of the paragraph before "To build just
``bzImage`` using Clang::" in the documentation.

> But yes, the topic of available container images will be something to
> expand upon once the tool starts getting used.  If things go well
> with this initial version then we can try and move forward with
> hosting first-party images as per the other discussion thread:
> 
>     https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/

Yeah hopefully usage of this tool will spur some movement on that
discussion thread.

Cheers,
Nathan

