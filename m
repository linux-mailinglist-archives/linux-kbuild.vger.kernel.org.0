Return-Path: <linux-kbuild+bounces-11777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHfjG0gisGkkgQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11777-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:53:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83D250EF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D138362A538
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2D83C141D;
	Tue, 10 Mar 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THeFMQT8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0913C062D;
	Tue, 10 Mar 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145382; cv=none; b=DWJHhj1KDjQLWIdZQcGygVU4Y55Jfy7E33EI4g+uAi/nEEihbY04SQY9gPK+c7aAQOp7+ZAfWHXXM+eynpU9+QtjCvsdwoSnARR2iwAscxVdtJQULO6DVViene2Yw/HoU4lCS40syLkC9GT6BZNT4m4C63mBm0VAA1FMge9PPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145382; c=relaxed/simple;
	bh=knmLZgJSFb8MB6VkxUE8lZ0vStr30mAi6l/BSJBq8kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us+Qh/0XHPamxYzn/kjQyqGNlU137yyfi8PEkk0HxWNZJKCY+qkw2ypytpDr1ZPDu6BioErsl7xgv4MPVzR8v69kPDeUWnngo/fPAXUrvwH3C+jyZk9SFFsXFBsjohntGmtVbBMykyNG532fGfZdIznteHMxFZrEEuY+VSnWGPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THeFMQT8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071F2C19423;
	Tue, 10 Mar 2026 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773145381;
	bh=knmLZgJSFb8MB6VkxUE8lZ0vStr30mAi6l/BSJBq8kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THeFMQT8CbzGFhk7ftBUJO0PJfiyf50SO5GK/5s7S/0j6oed1Vg3o180FFGVe9NVR
	 UHmoAFTmPmA8e2SXmL8ru9Tm3RQdV5AZy5I6P/lwv5nu7RbZOOyDZSTnYkcmLKJa7U
	 VLSBPpsesK8ImTeGvMt4TcdAtII56Dx6OcfoVJIB4QmG8/JmbmlQV6lWxAqsyjcOrl
	 0SHQOsVaKBlnAPqReN9+fPPkLkVyKTqKaU8uXPvOKT3q8iMFeZ2ccHj3Hvhq8r3RJg
	 IsSePhRxPu84AQFKJuSZEKgB1tbArFM+fvxkGCX/AOZ+wjiWoeB7X8AjEWoPmEddIy
	 ZvZkCLKCg9jSg==
Date: Tue, 10 Mar 2026 13:22:58 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/kbuild: fix empty string
 KBUILD_BUILD_TIMESTAMP
Message-ID: <abAM3LMPJIJYCF9m@macos>
References: <20260310-fix-llvm-docs-v2-1-5e52173aabc7@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-fix-llvm-docs-v2-1-5e52173aabc7@samsung.com>
X-Rspamd-Queue-Id: EF83D250EF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11777-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email]
X-Rspamd-Action: no action

On 2026-03-10 12:50, Daniel Gomez wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 

Please, ignore v2. I've sent it twice by mistake.

Link to v1:
https://lore.kernel.org/all/20260310-fix-llvm-docs-v1-1-234878874762@samsung.com/

