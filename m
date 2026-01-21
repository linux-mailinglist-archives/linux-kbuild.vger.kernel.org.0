Return-Path: <linux-kbuild+bounces-10775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD1kCIVGcWn2fgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10775-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 22:35:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B18725E1FB
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 22:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37F9B8405BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 20:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08C740B6EA;
	Wed, 21 Jan 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToW32xAE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D53624BE;
	Wed, 21 Jan 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028008; cv=none; b=kgbWwdWGCDAO7HeN1ySbOplhg4pqPdppUxdDQQimmljRq5pbo6JAZw0XXYnkZd13cSrViOVdlD3uRbHrA63exWN/7/CTloZr6ibodXQHbV3avMj9KyY9fS86bHqHkuZC/V/1ewCwyJJja64J80+LqzuCncGABvw3i3w/XmK9oUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028008; c=relaxed/simple;
	bh=gFJeBAg88zKE/u3gxrcj75Gml0nWNwcyyn9j3HnasaY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hyBW/kuh9pLHH4N3HBRNECM/2KluepSMDIYwiWCnnreUnNxIuOFgmPYubYjKx5vdMGVFftdaxRapS1Mwkjf7gKDuvAwdDzS+k88vrwpzqEgYaYxDjZGA7IpHW8EAYTrrN9l8O1xpA6uPc70H+2gBu17MSos4FOvHNhXb1tZ5EIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToW32xAE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7FEC19425;
	Wed, 21 Jan 2026 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769028007;
	bh=gFJeBAg88zKE/u3gxrcj75Gml0nWNwcyyn9j3HnasaY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ToW32xAERcK6fHuvB1xv8/Oz5vmGKiDNzXEGPRj0jteeD7uYUkVf2va8HiW0K3YMJ
	 xheKphHXKEtuzO9Difbdm8TZHIIwV7X2XEHziXPWEzrdn0n3QsI+LuRvXuY3D1SaWO
	 a7SCjVmrCxkUmQwDkTpZ//bwyy5w+N5OA+p0WIOmEkEo+ItAWYYkCtDyC1iYpGJoEV
	 REvCGMrH1m+5FgkJnx8GSwEKgbY7YOT3xfTboqxXsZV1sdKqUX6jNVC2XpekQWUnZC
	 EyDS8xMA7FHZ9uSdng/lWEVtEH2q3ca70wV5xCwZR3NBMRn8rebmaE/NfYzNzeEsf1
	 1UbG2Ro8+2C/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11B173808200;
	Wed, 21 Jan 2026 20:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next v1] scripts/gen-btf.sh: Use CONFIG_SHELL for
 execution
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176902800486.1439450.8530354445006332824.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 20:40:04 +0000
References: <20260121181617.820300-1-ihor.solodrai@linux.dev>
In-Reply-To: <20260121181617.820300-1-ihor.solodrai@linux.dev>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, gary@garyguo.net, linux@weissschuh.net,
 nathan@kernel.org, nsc@kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10775-lists,linux-kbuild=lfdr.de,netdevbpf];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,gen-btf.sh:url]
X-Rspamd-Queue-Id: B18725E1FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 21 Jan 2026 10:16:17 -0800 you wrote:
> According to the docs [1], kernel build scripts should be executed via
> CONFIG_SHELL, which is sh by default.
> 
> Fixup gen-btf.sh to be runnable with sh, and use CONFIG_SHELL at every
> invocation site.
> 
> See relevant discussion for context [2].
> 
> [...]

Here is the summary with links:
  - [bpf-next,v1] scripts/gen-btf.sh: Use CONFIG_SHELL for execution
    https://git.kernel.org/bpf/bpf-next/c/26ad5d6e7630

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



