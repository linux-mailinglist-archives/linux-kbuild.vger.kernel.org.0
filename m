Return-Path: <linux-kbuild+bounces-10959-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKdAO4Acfmn5VgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10959-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:15:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16FC2A5D
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECAC93001FF6
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 15:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D2424A049;
	Sat, 31 Jan 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOOvCxv/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3017311967;
	Sat, 31 Jan 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872510; cv=none; b=B1Hq03d2LO0TBhVCft5Mm8/luES83YGlmZoic7izFyGDz6ki+CyF0oAZCzrFZNg/QzSxhoynuNErzFtpQIfxSUZjge6a5LFgDZg/a0d5FzkhFpzDLSdS6dlvWIFFCz4nr6pQG6jyDy0qxcrEn+1IYNb5mM8zwqNHVghlmZixNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872510; c=relaxed/simple;
	bh=Rq2hicaHYETtelHvVqw0B0CBq77TKKw70RkDiNd/h7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bu9DPNUeaBUPtcqNtFbHCBgkS5D0POC94A9JDSHfdWocSvrhdOvYXrGsFtQsq1LsLeUlYkgj4NOF5B7O4IfK/wxbuHm9I0LZ4/lFPVswTdEav8ALp1mwbHl/0HC0UAct9ApT6Kmaon93zOHrW1SpewsvyOQUzNB+nGKzukTk6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOOvCxv/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC249C4CEF1;
	Sat, 31 Jan 2026 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769872510;
	bh=Rq2hicaHYETtelHvVqw0B0CBq77TKKw70RkDiNd/h7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOOvCxv/PU3fbYJSxlp9K/j7E1u5XV5KCd6V3ydGY7VL+QTS2wyGfo1/gzz7ED/rK
	 SPuMWv4H/246daQUqOFGb0UYxK3c5ihJuGqcGam1hpIA6by4jcLSc5WF1losYIv87R
	 lrJ/txO/R30kRolguiLmSL4Ac2PubJCAf89ju8gbMK8gIUaerXMTPAIbIO//e4B7rM
	 n21hbmMSTKUJN4Fa/iEmtX5SDDq0mXGQDwhLuliBD+jKkbg7qPvCAtb3WgpqplkHrl
	 MVLLfv+R/B+vOVkV6dyrgx51cjG7LNrm3de1RHsDd7reCkKvDuJP6tmWq45OB/ph/Y
	 WsE00+VQRDU+A==
From: Nicolas Schier <nsc@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Rong Zhang <i@rong.moe>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external modules
Date: Sat, 31 Jan 2026 16:15:01 +0100
Message-ID: <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10959-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B16FC2A5D
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 14:37:47 -0700, Nathan Chancellor wrote:
> After commit 778b8ebe5192 ("docs: Move the python libraries to
> tools/lib/python"), building an external module with any value of W=
> against the output of install-extmod-build fails with:
> 
>   $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=$PWD W=1
>   make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build'
>   make[1]: Entering directory '...'
>     CC [M] ...
>   Traceback (most recent call last):
>     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 339, in <module>
>       main()
>       ~~~~^^
>     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 295, in main
>       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   ModuleNotFoundError: No module named 'kdoc'
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: Do not run kernel-doc when building external modules
      https://git.kernel.org/kbuild/c/8e249948

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas


