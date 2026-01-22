Return-Path: <linux-kbuild+bounces-10784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPMpFkFpcWmaGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10784-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 01:03:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B45FC79
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 01:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CD5D361BCF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466E47260F;
	Thu, 22 Jan 2026 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb9hF9LZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3863B2AF00;
	Thu, 22 Jan 2026 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769040185; cv=none; b=UFJyYopmFETur3TsiGOBHLPAzx7ieRcTjZMSKfHHR4WK5IEcGRK2KXt5YfK3wBVHIipg11S3yHfBSdkjv+EIxxGb7tlUbz+ltbK067q9B/qZEvR43S1g6Pnon7oas98KVxu7Wh4W/lYybmbxzSdCmdcHP2CJnp9BOjX/InGRZso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769040185; c=relaxed/simple;
	bh=I9pdNdwwGCu/pmlSLxnbwumFj0DXKXxwhgrWRTn5fU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Z01B4JzqG5l/mbcw6zoEEykc9/2kLs4dbE5cCk7ana04AnNfh07h59XaIRUqhJBd/M9K2cu+O0N1ioRxtjkJ/Ie9y51Qsoj7ruekFADMRYwUPqWv+tDBi60J+NC5FF6lFczJvrpMaR/+n0pkURYX5BGzMjL1kYNXEQoE1frHgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gb9hF9LZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DFCC4CEF1;
	Thu, 22 Jan 2026 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769040182;
	bh=I9pdNdwwGCu/pmlSLxnbwumFj0DXKXxwhgrWRTn5fU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gb9hF9LZ8p9aDCid2V8NMMFLltE3I9F9WzpoRiQ+yRzyfCqU92tJkZOZAqqAQ+N1s
	 VBkhE4G1LQwVPtAlFgKpUQqNFawLsquGi8uTt6j+/TSSRQkks9deh3rVTSyv6yxnpd
	 etBDs1VNGfVGRI3qhmZRf3wp4tJ8PpZS2SMzKsfHEA8z87yP0ZyUznH5JACE3HUhEk
	 zFBtwGc7GuAmXIAd24WfFr9AdyaTxaePq2L0TXoxa3FJxYApXyRkA6SnZyV5DVvbXM
	 Z8Z1OpVmYWWAUbHiwJPWm6roV7kWEs04JCzUoYkUZszO/170vetyUL+5iNBW7jt7Ye
	 mFzN/JnlFvXlg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
References: <20260121-kbuild-llvm-arg-v2-1-5e4d8dca4ad8@weissschuh.net>
Subject: Re: [PATCH v2] kbuild: Reject unexpected values for LLVM=
Message-Id: <176904018061.36280.9070517793890679732.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 17:03:00 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10784-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,weissschuh.net];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ED5B45FC79
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 14:42:39 +0100, Thomas Weißschuh wrote:
> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
> 
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: Reject unexpected values for LLVM=
      https://git.kernel.org/kbuild/c/502678b88cb3b

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


