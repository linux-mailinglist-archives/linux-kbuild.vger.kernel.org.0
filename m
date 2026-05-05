Return-Path: <linux-kbuild+bounces-13035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEDmGMgV+mlRJAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13035-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:07:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F64D0E31
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A191302DCDA
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 16:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDA548BD40;
	Tue,  5 May 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbNnjsip"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5CB48BD3F;
	Tue,  5 May 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997150; cv=none; b=CWahjQ3o7TQFLvUir3IgFaCLwfupdcR0HJiYLpKRUTcn9VisuCyw2ttw9A7nWkXG3P3ab/XJuaPkmPg21GL2n3vBjoQzdcpVbpBEFRv5Hhfjs01rbZYpzR2OVuxxpo6GQa9wxpyc+tk8W15wHHL1kp3H6ieYxaNoQFkonwJxT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997150; c=relaxed/simple;
	bh=Fh4RljvUQdB+px0eJM2Apj0mQ0Ns6lFP72vAArR0Fzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeHPqFyFauSGseSVlkAfsdsC+WXXaMh0JBrpPcHSu1BuKZ2LshdPBh79jcoEguIDj5y8148ZqvyB7h/raDQ6vmLrqCQfYeYcbItpb4sGJziZ71zwKhRPbcnSy4E3XIKnVywzYnvE3eSq3qNWvbNiXhkqlqHzB0xPnflsOQb1YUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbNnjsip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C79C2BCF5;
	Tue,  5 May 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997150;
	bh=Fh4RljvUQdB+px0eJM2Apj0mQ0Ns6lFP72vAArR0Fzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbNnjsipmKSmPls/GMJubF9SOidZeXY9ILdS96X79c8hITM7PH87EiTnFrKKF2jms
	 eoW4M+Don7JXm7tXJwaRdk2aKfmsGbbUmSQSORAtM9LdH12b/58R+xqfDKYYrLtKqv
	 oAVNU2q/djiixct+IDlftjhJIKQ7M4ZHJH8KzBUiMaNEjaMh3M9lHVwDQXJ6jymwwY
	 ymbXnGdR5LQDb5cguU1flxVAD2GrOA1fYocgdznCMuFurAgsX9yuLQJZJh9lPYG2Um
	 rLy+AcQlCv/k15OD2vgv+NKNKq539sn0k4giQs5f/9cAzoQpsQQ5iJ5FM5tiL0mTj4
	 9vd5rAoG/xISw==
Date: Tue, 5 May 2026 17:31:37 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 10/14] scripts/Makefile.warn: Drop -Wformat handling for
 clang < 16
Message-ID: <afoNWcrF7Z1xoTwt@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-10-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-10-81d9b2e8ee75@kernel.org>
X-Rspamd-Queue-Id: 439F64D0E31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13035-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 10:59:16PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, the block dealing with -Wformat with clang
> prior to 16 can be removed since the condition for its inclusion is
> always false.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Makefile.warn | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

