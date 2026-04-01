Return-Path: <linux-kbuild+bounces-12588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GYANh2nzWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12588-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:15:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516D38189D
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45819314DA38
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C943F0755;
	Wed,  1 Apr 2026 23:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njC9pNsM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72473CE48D;
	Wed,  1 Apr 2026 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084682; cv=none; b=UckARAGVAgpektj74INWvGiqGDX48gfIazByRvydQo49hh3SkfQywJ7EdJOY4W3efxcewiJV1HvRc4K51AdWVEHvgVRmqwOcceDJJnpl14Z1cE2E8lb+Gfj4WOiChYLn45T9cVbyhTOyOxxBe3n27GqcsVUeM6ph/rzKIsoPP/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084682; c=relaxed/simple;
	bh=979aSmaLio+8xpUh4kWBF1FSamarRf48YG0g0DqRC4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dNTFu8NKuPY1bYxxihCATE91su8UqRNGcqS2e+wn4mW4eot1cOfTIHYAkd+jpViPlbQPflGVe+bF1sHax+g+rN71zzio6NGAl7LfFdRaSbIrDrghovi9IJxPeXgJyltl0uxsNnlfX6z06qk2aOBgdefJcbxvulDwgN7++rSnxbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njC9pNsM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F38C4CEF7;
	Wed,  1 Apr 2026 23:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084682;
	bh=979aSmaLio+8xpUh4kWBF1FSamarRf48YG0g0DqRC4Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=njC9pNsM5mZ5gVUw0STRN+DeuDpvdItga/yiGd2oFUtvpZ6S9vyIyuV/jO161t22u
	 H6XlHxBBBnYzusCNY0D+TkMWm26hz/ZH7K++v0ayu99Hm8VAwNbWuFl6s5FSL4JE0f
	 LHDnEvWC176C4k1sA2dj2UlTJ8FkCfKG6JxNlnGgE402ly+CaLV6PcTymO5luj9KG4
	 +XfFi3uA1qrjO05h9KZr4JawjJXZxeTvV4nm6kvl2vbJYdF9wI1+E4rQ0UU2gvxbuh
	 PeU+kLQjkJMDlHRSxDipl5Q6lmqFSEj2o2fdCygFmwU97H24yECQqYVNI9mNyC/Yv1
	 iln9WAtPN1Oww==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>
References: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>
Subject: Re: (subset) [PATCH] modpost: Declare extra_warn with unused
 attribute
Message-Id: <177508467966.1735993.3178343195907981949.b4-ty@b4>
Date: Thu, 02 Apr 2026 00:04:39 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
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
	TAGGED_FROM(0.00)[bounces-12588-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,oss.qualcomm.com,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4516D38189D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 18:20:30 -0700, Nathan Chancellor wrote:
> A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> in clang under a new subwarning, -Wunused-but-set-global, points out an
> unused static global variable in scripts/mod/modpost.c:
> 
>   scripts/mod/modpost.c:59:13: error: variable 'extra_warn' set but not used [-Werror,-Wunused-but-set-global]
>      59 | static bool extra_warn;
>         |             ^
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] modpost: Declare extra_warn with unused attribute
      https://git.kernel.org/kbuild/c/deb4605671cfa

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


