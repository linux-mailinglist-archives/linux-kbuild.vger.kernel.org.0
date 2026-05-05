Return-Path: <linux-kbuild+bounces-13034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFr8DeIW+mksJQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13034-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:12:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39D4D0FFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 18:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E37C230719CC
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 16:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D388B48B365;
	Tue,  5 May 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nb4UfXk4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A948AE15;
	Tue,  5 May 2026 16:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997147; cv=none; b=HJA+nRetxmF1w3XxbVl58yw4fsfe5OkwyzGd1LajJvipFTwIFgaNI2IrlzO7y23Pp89mt+bJ9TGXaD7EeAGvdh4nYPMehabrXr0xwtGNc14UeEGRYuVOKJIcm4sIgTcfXX/G5X/J1IceWxGVzmWqeW1sTN6d3nsCJb05Wiv+dZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997147; c=relaxed/simple;
	bh=b60nPe4Aau5jZGuvAZmUi5bzjsasSzLWfaifsawlwGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFbYnP88eqmJDSmajfpG1YOZw/x0+6z/5rOy2GQqXhKpFLYcfTN7gBu6Je/ykYayizqldj31SvLaMRgK++9T8RLURUPu18BAtnyPzMF/86Wwao8DWf2dG34GIzEXu938AjX9aEvjTWWuR3v89YwlqAqixLDaC2BWoxjOj4nHxi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nb4UfXk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF009C2BCC7;
	Tue,  5 May 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997147;
	bh=b60nPe4Aau5jZGuvAZmUi5bzjsasSzLWfaifsawlwGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nb4UfXk4HQoCPbYaZq2GthL030eQUCRcCGUtZDxlQLK+zoykerXVjwx9nnwB1aIvf
	 OXKpvb6Tg/JipmvtwuSL5ROZfzvMEkNeG1pxqsPM9VE2B/zAbLaFA4RoMKwpKZ5A3q
	 A+uj6xjRSgSW8mmA2fxD/TjCAyWdSysmfaaX5IkK8KxJzDc2XsEyExsypCggxevzun
	 T4b3iOwg2tn9X6shIZlHSA7z+FJIyJUI9syrrMZ15B6M1o0KkdYTK5Fo6+CafOri+i
	 g+cfjv0QGhhytBwNPreZMfe03LJXCit+5w3Y8UENcEJOM5UxPAxwLOA4lQJQpH19Hi
	 Ut6DVCii1u2fA==
Date: Tue, 5 May 2026 17:30:22 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 05/14] arch/Kconfig: Remove tautological conditions from
 HAS_LTO_CLANG
Message-ID: <afoNDmv80i3fbw2A@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-5-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-5-81d9b2e8ee75@kernel.org>
X-Rspamd-Queue-Id: 8F39D4D0FFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13034-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 10:59:11PM -0400, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been raised to 17.0.1, two dependency lines in CONFIG_HAS_LTO_CLANG
> are always true because Clang will always be newer than 17.0.0, so they
> can be removed.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

