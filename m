Return-Path: <linux-kbuild+bounces-12620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LhdMvzQzmmUqQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12620-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:26:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322738DF44
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 22:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46444305DD19
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 20:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AA238839D;
	Thu,  2 Apr 2026 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxnZv5nb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D82DCF57;
	Thu,  2 Apr 2026 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775161338; cv=none; b=jLYM+R0Piofnpy4FASpD7rtyoJidJ2RjeJkQfmm8/24WDEJSWoS5S+y5EF+uaSgiSVYrV5o5qNRCPINb4XyJjbYzkF+JTNzeect7tYCaG8hdDr0A9MtPRsddKLQux6y1NJcGQxzgD/zBl4KGT/ikOHLB590ESJU9TOmbdN65D5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775161338; c=relaxed/simple;
	bh=RiqNzOGBsVxRSIwfexxZ3/Lo2YAhdKnqiPcvdaPUgbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UJNMV+xAiZI97RsWLNII/1d19l53q8iO4s5M4FCnUdLCWCFtjCbZrIOC7MgaUNARh+dO1AZNcWt3gequMqYaPwnUkk0cmmYpVXrN9qHsMdCFHTEGIJlZrZW4/hvM+GY4HiFIC069kUK4Vz4FyA2YY9qZpCG69R10APGQDag3tr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxnZv5nb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D33C116C6;
	Thu,  2 Apr 2026 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775161337;
	bh=RiqNzOGBsVxRSIwfexxZ3/Lo2YAhdKnqiPcvdaPUgbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SxnZv5nbg49WUbV6oaKzv5ASAa+00k7lOoLp5A8BTGWNPUkXaJO9gnCIVLMqU1hXc
	 aqe4SeRHeMvTjGTRf+r3xcoECl9BjEmDBNTq/WJpTkc/Lk9t7WbckURwyI9SVZcrCt
	 ji0qOstG5VT6GttIo/4O9U/v3cySHthbX5WnxKqG8f4Qa/6ocfBUHSBgKlafVvV0/N
	 bSHpUKH/3Y3oaivzDxrPW2QzRxYS5Mbjg8nD/XnZyVopYy4H2nlCjFPFv/2nUIT4Dh
	 ePPeDIa16ZrHE83obb05/gUB2q5ZdxHP77q3ilm30P5RoLQVs9j/qmnoD3BbE6FKFL
	 upCVbYymTOg2g==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexander Coffin <alex@cyberialabs.net>
In-Reply-To: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
References: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
Subject: Re: [PATCH] Documentation: kbuild: Update the debug information
 notes in reproducible-builds.rst
Message-Id: <177516118643.3535668.18216827082404503813.b4-ty@b4>
Date: Thu, 02 Apr 2026 22:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=RiqNzOGBsVxRSIwfexxZ3/Lo2YAhdKnqiPcvdaPUgbU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpzs9t4y1LJQMiq9LLu91/MzX+A1n4Iakav09bf
 js1jITDXkKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCac7PbQAKCRAHUgpwFiYS
 aUmOD/4zV/y7nOMbLPeEnVs19LY1ke+7lJMlRPO4MM47IR9E/TY1Oyc5lBoXjxmCglmQoeMeXb2
 TbaWhfLoE9jrHAZuyO+1JIavHVbaarDdAy78tTs7Wp2FQ+e3RegYUMaj+QQKVSsA7YBVyA3nKhe
 kvDTyGT6HuplGr2yYszE5KMFVn1AE8NjDdjq7iBWtx0zxRTRXhwSXKEOPiDq46w7CAONNznYf+Y
 uXVozQeFVeHzHglWqEVbO2pmMUpAgJFY3pi1b/Ade40DXzs+IjpT7l7tRKKu0I9nAUbpXQSMqNw
 tYwenu9jEuSijZlOPomwLEwpxEig/GPdMQj9yVgkVITcmMVFRpKkDVc3qPBnx5o9b/YgmfP1IkI
 1zv5BkYds9OgV+67jbBX6MzEyazNa8mqq4psNaBO4NnngRD1SeODliSh6HhX7pw/JsKbAebDY5H
 hN98uc8SBF8ziNqKyRby+X/8C3z3PydXRndYZsRiL3iTu2Pvhx/ouw9SdusnbWdUJzMQOH71g8c
 9eO5Xhf4letKSyODpEXZI7av2q09ZeFxxpqXy0c1ArKSi7MIBvaw0fBXu95IrsksHyKQaGmnjMV
 pg/US6FQFDBY12vNw29+KGfBvi7HdqoEx3oJKlKoSTTRGm66itxCs4aY0tesQ5IZXKkai3Jrul1
 o0yCfM5kooSwgMw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12620-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4322738DF44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 16:37:29 -0700, Nathan Chancellor wrote:
> Documentation: kbuild: Update the debug information notes in reproducible-builds.rst

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] Documentation: kbuild: Update the debug information notes in reproducible-builds.rst
      https://git.kernel.org/kbuild/c/d88af9ef

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas



