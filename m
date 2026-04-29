Return-Path: <linux-kbuild+bounces-12940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE+KFjiN8mnKsQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12940-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:59:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31C49B31C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 00:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 257EB3011C71
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 22:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AE37C90D;
	Wed, 29 Apr 2026 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMgnYiYc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02C35AC3B;
	Wed, 29 Apr 2026 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777503539; cv=none; b=qkE0q1DnlRVsdSFZfKNn6mLRPjpu4+QxRgEdS74Ki6pZe92n5H+z3++eDZVislyKZdghxqcHA1qfHEIaviLnMXbfwAo4Ykgf3daK3IGf/O+BBhBnFOaeIeoSyU/njoSB0+xdM7l1mEzKuX46KpzIBMlQo+DbtKFzVLOVswmG+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777503539; c=relaxed/simple;
	bh=JZ2dQtuSqNvmyO972E8Cw86DZiEVQOdaDb1lPUxPkLY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=p6oVs20iqPEhVS/xnQIfPKq6s53Se8els8syqgpcywXLMOVJUBWeN38DTxjb//dh4uJM3BYMB6wiuHxWOZPner5XP5cnfFNufhK6faxgyWcZLhdIEburHodbWs852bvRtQxyFKQoMvLYFQW7pIhbFHk9Ch7byaSp8u8P+Z1FcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMgnYiYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D876C19425;
	Wed, 29 Apr 2026 22:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777503539;
	bh=JZ2dQtuSqNvmyO972E8Cw86DZiEVQOdaDb1lPUxPkLY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=DMgnYiYcDowtsgMAe3l1M+dtexFgjpmswftl4frPbHSnQqKAsTvNZ6lYo2Rqxhsez
	 2uKytoo2K6wIW6kdwproDRuVP8alA+YZAuhcGlReH7MHshkf4jvKEZ+zF1vtZxYrW5
	 StIHZoRnQT0qgCV10pWdqSgbPhnP8VfJqcBCegi+7HLOJ30zly8BP7dAlzyiz6uMyG
	 REGZU3P9dPtQBkzysSC1pHgEk269oJyIR3rNxLpALyXp7r5mbgYy7GQ1cvFRmT1sK0
	 ghxw1OUjrK27qHOlHSsNeSkN5GFFL9s3127Y2WvEYPxc5AV1r/slm3cykVWEYf48XS
	 fYokkeVxGx3oQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] kbuild: rpm-pkg: provide kernel{-devel}-uname-r
From: Nathan Chancellor <nathan@kernel.org>
To: Avi Kivity <avi@lists.scylladb.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260414210457.41675-1-avi@lists.scylladb.com>
References: <20260414210457.41675-1-avi@lists.scylladb.com>
Date: Wed, 29 Apr 2026 15:58:52 -0700
Message-Id: <177750353283.2042162.2428392874460453148.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197; i=nathan@kernel.org;
 h=from:subject:message-id; bh=JZ2dQtuSqNvmyO972E8Cw86DZiEVQOdaDb1lPUxPkLY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmfeg0PtRmXW7EYLJKpPnz/zsanFzhfqBea/D9tPu12/
 wTr1Y+mdZSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJzJjCyLCz12JmRtmR0o9h
 V4xKMw9ETz/A43T+z6rJWcLy13uMlV8wMpy8/TVmc6WVKPcrOeNIee3Thu/NigMWfn/C9jKzJyh
 TlgUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: CE31C49B31C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12940-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,scylladb.com:email]

On Wed, 15 Apr 2026 00:04:57 +0300, Avi Kivity <avi@lists.scylladb.com> wrote:
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index b3c956205af0..dcb04c1e7e8e 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -15,6 +15,7 @@ Source0: linux.tar.gz
>  Source1: config
>  Source2: diff.patch
>  Provides: kernel-%{KERNELRELEASE}
> +Provides: kernel-uname-r = %{KERNELRELEASE}

Sashiko notes that this will cause the build to fail when there are two
or more hyphens in KERNELRELEASE:

  https://sashiko.dev/#/message/20260414210457.41675-1-avi@lists.scylladb.com

I can confirm this easily reproduces when CONFIG_LOCALVERSION_AUTO is
enabled:

  | $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- mrproper defconfig binrpm-pkg
  | Building target platforms: aarch64-linux
  | Building for target aarch64-linux
  | error: line 24: Invalid version (double separator '-'): 7.0.0-08202-g663bd6ce5b7f: Provides: kernel-uname-r = 7.0.0-08202-g663bd6ce5b7f
  | ...

This should probably be %{version}? Please test and verify that change
still works for your use case then send a v2.

-- 
Cheers,
Nathan


