Return-Path: <linux-kbuild+bounces-11554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AL8oNmLQqGlOxgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11554-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 01:37:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14420986C
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 01:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 226A130707A9
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 00:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C7E21CC51;
	Thu,  5 Mar 2026 00:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2JkLcd9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FFB1E1A17;
	Thu,  5 Mar 2026 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671011; cv=none; b=knv4b8hmUluuJacUf1VJVqvvTwJmBbqOpU7mOU5BvvO5/+PWLa96Cedqgl+bZXu2zorWxEFmEdFzNWYrx2tnZhXNB4AjDj/49urncqbVDthDXvpmW3tTFw481TF8pxicE8UKUY5d2Ly5aO+tBbDvc9LLqFP7gidpnDXFn7bJQr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671011; c=relaxed/simple;
	bh=tzuFCI24bwS8HCKt25R4sIMI1VbvflEm4xsnkR1rYTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eXucsFckqzBZ03+0RJ5b1rCTNmSUhewgdtbTLuo5i8kCTJPwTOSGe/lhxWdQrVxuliaHbrLoIsXQO0rXKw/TSxgyzML9bYoTtswqOJnKNE5VLZwOI8nt8iqFPRN58ZkqGu3wvwVo8ThBu+Vontn8aAN7xMHyL+87jUhJcNzYvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2JkLcd9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AF5C2BC86;
	Thu,  5 Mar 2026 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772671010;
	bh=tzuFCI24bwS8HCKt25R4sIMI1VbvflEm4xsnkR1rYTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U2JkLcd96QTBSI07AjPcJBBy12dvTkXubk1JTsaorzrp5PEdjSMegQO4Xb8NKlGBt
	 Ws17d/OI7ckoYs99fdG8AV5a3ptV3H/8PcQ6bFNXk8p9tHHw2zfsPbn3eXlETbbmsT
	 bkkr59imQQ2hmdPIQ/k6hfV8ajzUH9e0I0kttmdHcjKt9J4Vr7ph/czsQMnESzz5RQ
	 +YrQGWXUCXqAt8OotOYSE1hBF/CGQtaYoMiht+9N+4J6/KKR7ZtZUk5GokIPnGyxuZ
	 Mrnza6E87bff+FNA6z34ipUMzMY6bDrtdkOf6k+v49BMpYRxALe0pDibQFmtDtid5I
	 xgnRgzeBvJfng==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Michal Suchanek <msuchanek@suse.de>, 
 Rainer Fiebig <jrf@mailbox.org>
In-Reply-To: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
Subject: Re: [PATCH] kbuild: Leave objtool binary around with 'make clean'
Message-Id: <177267100875.1730256.18390640642113206359.b4-ty@kernel.org>
Date: Wed, 04 Mar 2026 17:36:48 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Queue-Id: 5C14420986C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11554-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 27 Feb 2026 22:40:48 -0700, Nathan Chancellor wrote:
> The difference between 'make clean' and 'make mrproper' is documented in
> 'make help' as:
> 
>   clean     - Remove most generated files but keep the config and
>               enough build support to build external modules
>   mrproper  - Remove all generated files + config + various backup files
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: Leave objtool binary around with 'make clean'
      https://git.kernel.org/kbuild/c/fdb12c8a24a45

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


