Return-Path: <linux-kbuild+bounces-13147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOXvIbwnBWq3SwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13147-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:39:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC953CC3B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 03:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8513028EDA
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 01:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAFB31E83E;
	Thu, 14 May 2026 01:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFPwYKOX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CD231A053;
	Thu, 14 May 2026 01:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722663; cv=none; b=lmEbQXxPUlLeO49IMNfiMSq+z/HqBed/X58GESw5kyVO+MbQEQEItrvEXt+sGJ8k7IpqeZQsEsYyAxGwowppPn3iBCF9nfIgAvIt1griMgMnRGtZFt8Z/bTlllRoJo6KwtTYCy6sPKuK6YIgGjPI+jW6U7OCI7NFvH7so0+w6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722663; c=relaxed/simple;
	bh=JAiknqCeMzr1Jm72EO+k4Z4Q0E6NbNXwKVqDC+oNyHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KCpVv+zEiJZpXkaJwr9wqFngF/6YRk18z8H4vfuQD89kCgHJdKX0iPZ6ul/gFuNcyyrYGyUYWg2f/3Vk/GB6UN0DJhxMVvhHIrJkhZoXsbXuWI3v3B9fuUD1OcJ53fyGfIg4/c1rG8h9qAommZMQP6IweTObiKcF90PdEqcLTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFPwYKOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D02C19425;
	Thu, 14 May 2026 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778722663;
	bh=JAiknqCeMzr1Jm72EO+k4Z4Q0E6NbNXwKVqDC+oNyHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RFPwYKOXAvHStZDKdPz7MjigMMcpdfevXvFUCv0TBh2askYK/dm4fxlIv5rB6fo0D
	 2S212xZ+0Y+51KMtBrfY1oV4kfwt07CpKrS0fCMuMPoLJqFTI+uyG0BzYu0IVpty6W
	 V0JoduGio8XxtwNzU8+NXf5ECc1JSL87DGjBWvm3EsYM9sC2m17cDfIz/J/qoZ9hrZ
	 Lln80LD7TcgmaBfNMFOKuoQvsNSDr3WFXqstSmo8DO5bUwuYEUC8+B63Kxc4hcVAyX
	 1TLOdVT01Sgw43XianozG5j1lMF9pUkXnCQdX4e80Y+WLIVOt+TYWbYhaZ+0oQu8fy
	 QJCzpr2/aF0Jw==
Date: Wed, 13 May 2026 19:37:41 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 08/14] riscv: Remove tautological condition from selection
 of ARCH_SUPPORTS_CFI
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
Message-ID: <8a77b39f-1a44-df07-2586-9f568164bad5@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 1EBC953CC3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13147-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026, Nathan Chancellor wrote:

> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the condition of the selection of
> CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv

- Paul

