Return-Path: <linux-kbuild+bounces-10776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFOxG2NIcWn2fgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10776-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 22:42:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62D5E318
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 22:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D8667CD422
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A742426682;
	Wed, 21 Jan 2026 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toMgk0UL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D3213E9C;
	Wed, 21 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029553; cv=none; b=OabAl+Uo7Lea60KFfcOiZD6rvve5swBQw8CpAhM87ZfAMegoT5g1V6OHGWVyvz7+Lbci+C9PojUjk25iDo14xm6aF677Iy6NVnZM6MgMb9CrEU8qkwYrvxVJ3T3jOR4LMzKq7K2VD1yJ185m0XcfAwUiCAXsM3KN3Zp2D64LBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029553; c=relaxed/simple;
	bh=gg/sA0JHc6uueGjq+c5x5YlAceVPBMD+jAVHIE4qbSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6wHFoiOe86uYNudAqA+UQdSkZ4rTehN/zlFdmPj2fAgryrBPPdFxLlpVCnSYhpaCi1SAghPhLYkw24LApD95ObHOLne8ZLIHNOyaeVj9kQy9sTF4tLeAvRYU123N7pR2H1m7OKju2QGiDvCoZfTS0+aCRAhz39jh6uQgVPHKZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toMgk0UL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E195C4CEF1;
	Wed, 21 Jan 2026 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769029552;
	bh=gg/sA0JHc6uueGjq+c5x5YlAceVPBMD+jAVHIE4qbSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toMgk0UL6yQnPW3rB5A54LgWPcGmvG37hBrJSwfu3OCjElg7hP4BRJlNW08gGThP+
	 jsaeyAsJmqdo3Y7VYWt2l5gBIBtrCJI/lqskLn0Zkh/ACQ3B/xi8CyDD0TkRfaDQGL
	 TS3kKDlfZKZkKdWLWrFPZ0BLGssUYbRrvsccYwxvZ/AgMw+J7XD/ZBaLwKK8GNsBru
	 J7cQQjCogu8Kgs9dYrrUXVjQxyFM+8GCEHcuEOmKNsvaLgyMQ80p0hlIiHCKHjrGcE
	 6K8qQ/vnZxoyUKTf+yfFSHjXyO/onZm0U+k7jFgphhCJJmACSibxqc2p370shl4lrG
	 54RUijhKS2aog==
Date: Wed, 21 Jan 2026 22:05:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	WangYuli <wangyuli@aosc.io>
Subject: Re: [PATCH v2] kbuild: Reject unexpected values for LLVM=
Message-ID: <aXE_gOfh9NwQcc8X@levanger>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	WangYuli <wangyuli@aosc.io>
References: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10776-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev,aosc.io];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,msgid.link:url,weissschuh.net:email]
X-Rspamd-Queue-Id: 0F62D5E318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:42:39PM +0100, Thomas Weiﬂschuh wrote:
> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
> 
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.
> 
> Instead report an error if the user specified an invalid value for LLVM.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Add pointer to the documentation.
> - Link to v1: https://patch.msgid.link/20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

