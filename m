Return-Path: <linux-kbuild+bounces-11012-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIk7IeaPgmkMWQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11012-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D12DFF89
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3D91300D4EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 00:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8621A0BD0;
	Wed,  4 Feb 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyqjaWiy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1C19D074;
	Wed,  4 Feb 2026 00:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770164188; cv=none; b=fwm4TMXXn3wG2RK5HI471SEvd8lFd01zkMnXZJwxNIyOCZZkFicOwcoaWkd0uOzu1FzaDA86oiLO/ZuS7k97r1cLvd5el2BICW8gt3K2idO5XQGag2v0BhLvXXv8nQLr7roMhODbHOPFfTCWQTnKneqLPX39hzLfAXMxwtmE4xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770164188; c=relaxed/simple;
	bh=JkXg6nTKqL+lTQmJgx2t/nfT8M3LJ1PrxOftNgMUV3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O/yQ/FCOCgISuJvkJzd/Kdg7z9t9BVppf3Pp8DxvKVfCTER7rGi/0Ss7Bx9bKxfvyp6VkFijeB4xDG3GQ3vBExQQdH3kpIwqNOE59yDd0wEhuRIY8jF/kwJjJpsIaQtoMCwmw9GNcJBrslJRpEL6tcxPTRrYpZRh18ghE1q9zz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyqjaWiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF30C19425;
	Wed,  4 Feb 2026 00:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164187;
	bh=JkXg6nTKqL+lTQmJgx2t/nfT8M3LJ1PrxOftNgMUV3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iyqjaWiy+ZTnAiMkmEu8e1x99U1IkPU00lgVqqlRGdpwNeg8WK5FVYqINjhTgcOuH
	 4rpsgdacH4V1Ha67fxJJGHbBrivWT8hWOHsBGPKv19hFHgFC/x0Y/u7oGzupp6Jdgf
	 eS0xwrDFqcCpMSok5t+hJAechKZs2bmgMxJuWNS9xjo3CUBi/tkCKK2mQvtbBIAa+s
	 IUlewBGyu7BPphUYt6TgnK2k/8ZUz1mansltNBIHEBYQCpo6pwqsqo0Yt4chj3RGRN
	 JKD+MtufjuH4U2crDXJf/g1LCyBnwOjv9yYqCQQl+OoYepiEhRD+JoZWCsNLLvG9yu
	 TvEMsu+9x9log==
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20250909-docrem-v1-1-dcc69059a5cb@google.com>
References: <20250909-docrem-v1-1-dcc69059a5cb@google.com>
Subject: Re: [PATCH] rust: kconfig: Don't require RUST_IS_AVAILABLE for
 rustc-option
Message-Id: <177016418652.1146354.981060291224113155.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 17:16:26 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11012-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E5D12DFF89
X-Rspamd-Action: no action

On Tue, 09 Sep 2025 18:14:20 +0000, Matthew Maurer wrote:
> The final version of this macro does not fail in the absence of an
> invokable `$(RUSTC)`, so we don't need to be careful not to invoke it.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
      https://git.kernel.org/kbuild/c/f2445d6f264c6

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


