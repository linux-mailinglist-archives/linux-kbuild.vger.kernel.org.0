Return-Path: <linux-kbuild+bounces-9863-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A494C8859A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 08:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3D614E19DB
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 07:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299C527F73A;
	Wed, 26 Nov 2025 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UmvSZV+x";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="r1BJr4UT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68165246781;
	Wed, 26 Nov 2025 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764140777; cv=none; b=JOomJ2hbLZkg7w2YSeRjDQCvDImKd+3c9FuLe2hvOLk/v9jIj9kqLmh3DNENJApLkhRB42uw59M5kzIu6EueiAvZuWtwQpodolthxl+AUHOB371pQpBf9AeR7ko/c4ZuE/G7rAOSlIKqnV2yVJylF29tRG2m38W0g8x/bpeFZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764140777; c=relaxed/simple;
	bh=pV5sv6onlTC6XjpRfp7OItjIxWezbvJtPXSekANAfQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKr3Js4/kD5CAPnbVCW1LDzI7AkbFFUTCNUTohgxYb4cxJZhHuTbtLASNmzQTpk8xSg2htbcGQeXre/DCNuCsgn0ajbJw3leIXb5eBy3rBR3appB2MLNGXTX7CC40tGEgjBszR7uFz4nduk+ssEcE4U78fO0sVzgHTzoFWAV/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UmvSZV+x; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=r1BJr4UT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 26 Nov 2025 08:06:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764140771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkkWIOQSs1MWAI1LaymQ+TIxLM+HD+bzVqX0QOMY+NE=;
	b=UmvSZV+xsnaDbtzrj69iqb0ZYvItMe7VUoo577d615S79PDnL8ogGBV2RGt20gn8n2PamC
	ROFphHBf/uVH72gHIoHCAEcYsA7GR926MSxAz9zKKYqUbD3Fi2zgvdHLWD1mVJ/AwkkxOS
	yDKhWROSApiHyL2bBGaqAGtTMG4crFfDx/bqPQZ3Stq0j9Bh7azx0x6DnWAaAkJnzlZrQz
	VOhBYB8IyTV/glCSW1Vz4XyOJ9T3oE09pDACQ9OBJVGZN/PuwAzU5jet4lDZ7oFM94MGyt
	qkbpKLaQ6xAQ5hbLH8PYzqQAsIoZF8i4tYbTaOCaTDDrQEBAatm4fXIxq9NUGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764140771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkkWIOQSs1MWAI1LaymQ+TIxLM+HD+bzVqX0QOMY+NE=;
	b=r1BJr4UTpbTfLuwDWfYxqomkKA4jMnuvBVW+alA5Gn4T52XxSzJyBkRcJw6SaSENle20/U
	XtBa2gL5LW9DxjAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Simon Glass <sjg@chromium.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/2] kbuild: add target to build a cpio containing
 modules
Message-ID: <20251126080543-5d5031da-b11e-4b04-930f-6c57a3bd4534@linutronix.de>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>

On Tue, Nov 25, 2025 at 02:18:18PM +0100, Ahmad Fatoum wrote:
> 
> ---
> Changes in v2:
> - Add Simon's Tested-by and Reviewed-by
> - rename to modules-cpio-pkg (Nathan)
> - add separator/doc comment heading (Thomas)
> - Make temp directory ignoring and cleanup automatic (Thomas)
> - Use CONFIG_SHELL instead of shebang (Thomas)
> - Use -o instead of redirecting stdout when creating cpio (Thomas)
> - Drop superfluous -f as $(build)= overrides it (Thomas)
> - Add extra preparatory patch that makes hostprogs := gen_init_cpio
>   unconditional
> - Link to v1: https://lore.kernel.org/r/20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de
> 
> ---
> Ahmad Fatoum (1):
>       initramfs: add gen_init_cpio to hostprogs unconditionally
> 
> Sascha Hauer (1):
>       kbuild: add target to build a cpio containing modules

For the series:

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> 
>  scripts/Makefile.package | 20 ++++++++++++++++++++
>  usr/Makefile             |  4 ++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> ---
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> change-id: 20251115-cpio-modules-pkg-70d85a69892b
> 
> Best regards,
> -- 
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 

