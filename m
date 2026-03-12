Return-Path: <linux-kbuild+bounces-11880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPevJFZ2sml/MwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11880-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 09:16:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77526EBF8
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 09:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B55E301BC1F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 08:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920C32D8DDB;
	Thu, 12 Mar 2026 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9cMuSRM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325FE30E835;
	Thu, 12 Mar 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303378; cv=none; b=d00VLe3sFxVD+DufQatoI8pOrir24Zp0K+ITZl/+W474HhPr9smey3AkXTsf0vdVw5zGHF7f4PKWPjIN+icxENu6tP373qvtr4kzjytODmwzvlUTAMWR1j28g5ZhFg6JyBNiNsy2kfD/ZBYzvVX/ePPBMCDLyu6+NflUFDulmYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303378; c=relaxed/simple;
	bh=vAfNuBSEgknJnz8ahAr2u3bH4UaM+5PBVU85Cj2jm1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtj3vzpWjDoqkWAU6VpOBGEJ3UZ6KB0QbvMJrUz/85v+F55lLXHdmf2xFpdXhBegmN5zkicoUQToQC3OgwvxwniwHJO3XCNYPmKK1bacxD826btvGJuAc9ylsFThwoChOAaBTeUF+nMMtQedlWVsGcdspqhUABytm/m5sk+tewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9cMuSRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52898C4CEF7;
	Thu, 12 Mar 2026 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303377;
	bh=vAfNuBSEgknJnz8ahAr2u3bH4UaM+5PBVU85Cj2jm1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9cMuSRMhk9JWaC5EM4NRdgXXRPEhFsKELYHd4F4dXJHo5ougJiAzxVmj/zPpuIUJ
	 +mlx3/qjo6/CgYoVMszcl9hwaDj/PuNhAKZ2Sr03/CiivFEmUYC+ZRLIU9HSLC63r3
	 EY8CpFNOSK7QBA/GMpEN+LJvvDTDsUw6DAQQqw7B+s9wtUwyAat8lhCDhWXvAbCx8K
	 63Kfdqutduq9ctWOz2IdDsqMby+lDgCxQmpni98a/QS2zAKeowhVUmi7A/Er7JPCfH
	 CdKmOqhdIDI+5OYoR5v0W/+JqxCFKur+dYvq4PZ4fpos5b4rxlKB2wN2SB59+0uo3r
	 UWkgPFt4SLKLA==
Date: Thu, 12 Mar 2026 01:16:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH RFC 0/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Message-ID: <20260312081613.GB3161678@ax162>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
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
	TAGGED_FROM(0.00)[bounces-11880-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: DA77526EBF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 08, 2026 at 10:24:00PM +0100, Thomas Weiﬂschuh wrote:
> C++ language requirements differ from those of C.
> 
> Also test the headers against C++ compilers to make sure no errors
> creep in accidentally.
> 
> There was a previous attempt by David Howells[0], but today with the
> existing UAPI testing infrastructure the implementation is a bit nicer.
> This series does not derive from David's, as I found it only after
> writing my patches.
> 
> [0] https://lore.kernel.org/lkml/nycvar.YFH.7.76.1809052120510.24932@n3.vanv.qr/
> 
> This depends on my other series "kbuild: uapi: remove usage of toolchain
> headers", which is currently in kbuild-next-unstable.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Thomas Weiﬂschuh (5):
>       kbuild: uapi: move some compiler arguments out of the command definition
>       kbuild: uapi: move all include path flags together
>       kbuild: uapi: handle UML in architecture-specific exclusion lists
>       kbuild: uapi: provide a C++ compatible dummy definition of NULL
>       kbuild: uapi: also test UAPI headers against C++ compilers

Aside from my comment on patch 5, this seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

