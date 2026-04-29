Return-Path: <linux-kbuild+bounces-12939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOl1EEOF8mn3sAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12939-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:25:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F049AE7B
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E018A300A742
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 22:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0593643E49E;
	Wed, 29 Apr 2026 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjqRL7Yi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A63C6A56;
	Wed, 29 Apr 2026 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777501409; cv=none; b=HjNyPQvA9ZSdam01+mTEaw9c5LydVjSMOLRr0bq/cqEiLn12IZxX1ykTawB+8sPXBmadeuXI7YrFgSmT3QmjWmIKnZd0m4yOaYHxeFnio7VQi70wqJFofiZwIgVxxDqO1qAcHEjAFA6kDFZk4lL0puBCgTJfmD+2Ag9FqEqD3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777501409; c=relaxed/simple;
	bh=bsiyZCEx8CXFhHd/cVXAIOc2o13sph3AyidNid3r/i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d/SqxgzWkxN8THAP3X5Q+8xOjLph7JIiBJ+jC+TAHEgj/+XTrQfdu630Z/ZUQ3JhXzrcMOS5JH4Q5uznZ5cMAN2swKPV8ailCa/MqHEy6E+3rTRQG89vAMu5zcRxMv/UTyTT4l1JLTkT5OQsIzrwi5F9S93OqdFwhVEg/3Zx+u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjqRL7Yi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C04C19425;
	Wed, 29 Apr 2026 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777501409;
	bh=bsiyZCEx8CXFhHd/cVXAIOc2o13sph3AyidNid3r/i8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CjqRL7Yi2sHRwEobFMVIxSb0ISgAr7RAopbyMfFD5SZyb4KM1wf2LOCz6fUa8B1yd
	 javzjOzNYcvV/+212kLPMVqmMr+9IeduovOPUyS8r2Tuz21rSZi3mDGkZwt6WnX4i5
	 IdVkVU/zzK66jY0Rp2FlDdQPU4QX9gwKMr0YBXpzUR3yzi2tQo7L6LCeFCnPdOrEDH
	 l5RBySe15WdJD8afjhN6igXP6e1S5hRzTWj31Rh4FLyklqbOKMdSuxQVGFrlcwQUgf
	 hMlwBcj2ECXwOMn9iFo8j85gUmDMe8biRxJ4PtKDhQWhVkWkaA28VpEZRSGp+Ddx1X
	 aDbf//YGPd0cw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, Piyush Patle <piyushpatle228@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Mark Rutland <mark.rutland@arm.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260410221257.191517-1-piyushpatle228@gmail.com>
References: <20260410221257.191517-1-piyushpatle228@gmail.com>
Subject: Re: [PATCH] kbuild: document generation of offset header files
Message-Id: <177750140674.3339968.2881377977439714351.b4-ty@b4>
Date: Wed, 29 Apr 2026 15:23:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Rspamd-Queue-Id: E01F049AE7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12939-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, 11 Apr 2026 03:42:54 +0530, Piyush Patle wrote:
> Replace the placeholder reference with a description of how Kbuild
> generates offset header files such as include/generated/asm-offsets.h.
> 
> Remove the corresponding TODO entry now that this is documented.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kbuild: document generation of offset header files
      https://git.kernel.org/kbuild/c/a0d7be4ab3ece

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



