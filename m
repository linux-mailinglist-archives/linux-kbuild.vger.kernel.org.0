Return-Path: <linux-kbuild+bounces-11334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPSzBz4mlmmIbQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11334-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:51:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC815993F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 21:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4646C3068241
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 20:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9A2349B02;
	Wed, 18 Feb 2026 20:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELTZSZaj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F5349B18;
	Wed, 18 Feb 2026 20:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447750; cv=none; b=DOOb2+twGp9gjlfGkdOFhx17+5nZ6QawE496weAUvJdzwaoAvRsiozw3RB1xmv3XleN9MgbEUd2hxeFLzkHtzQUEwd8cviumMPBtEA7pwMa7cI4Wb44pb+kMDxYukVM0H1eVZdXQp0dmNTEL6+93Eg82N36jkzQEfLYMn6bnPwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447750; c=relaxed/simple;
	bh=Zk+Mj77zgq90Fdfha41BmQS8WpUD/2Y7LKA9LjfdPmM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fkWf+wn+GOtQtyZfOzfILX/etw1iNfXtDbCvXJiiwTE6yrJvgOxlXxUv/HQ7J3Q9ZBw5eKlizIAnpSKpir15RqiRVOgZprgOBHGQhwK8FXl2kn/1JajdWfYG8C0vn471UhngNlAZxCzLY+GEjrLN0XjmYRE+KxPFBr3fT4a7+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELTZSZaj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2E6C19423;
	Wed, 18 Feb 2026 20:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447750;
	bh=Zk+Mj77zgq90Fdfha41BmQS8WpUD/2Y7LKA9LjfdPmM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ELTZSZajK1rDCpvDXeR8Q8i5lo8sfp6UHfFVSyiyWLum38Lk9BMFvDysslc6bqIIv
	 12F5Rw3yfLb9m68yrxxcSLX74twAhdOsiCBhlNwgm0FIIlUzWJGukzkzMWRnz9Y0y6
	 NYV67EBQvypNnXDCXq49KviV9vLOH7WpSKWloh5w5X0mVc83nIiJSnru/kWUQvQAH1
	 xD3OLyRUscP0xKoCOLtqJ8fpVZrWGX82bdi+2T6p7S3kR5RauyDqfBQOoYTu2RSjIs
	 vBtKGW2NUGQ+5xpmTXBGP1uonxu1YG9bCAqcCZkfMlC8G3Cn7AyWHH9C/+iSr27WXX
	 yigMVBum1zy6g==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>
In-Reply-To: <20260216-improve-manual-debuginfo-template-v1-1-e584b3f8d3be@kernel.org>
References: <20260216-improve-manual-debuginfo-template-v1-1-e584b3f8d3be@kernel.org>
Subject: Re: [PATCH] kbuild: rpm-pkg: Disable automatic requires for manual
 debuginfo package
Message-Id: <177144774869.1769768.14474054555144797723.b4-ty@kernel.org>
Date: Wed, 18 Feb 2026 13:49:08 -0700
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11334-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BFC815993F
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 16:29:54 -0700, Nathan Chancellor wrote:
> Stefano reports that after commit 62089b804895 ("kbuild: rpm-pkg:
> Generate debuginfo package manually"), building with an rpm package
> using rpm 4.20.0 fails with:
> 
>   RPM build errors:
>       Dependency tokens must begin with alpha-numeric, '_' or '/': #�) = 0x0d000002
>       Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
>       Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
>       Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>       Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
>       Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
>       Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: rpm-pkg: Disable automatic requires for manual debuginfo package
      https://git.kernel.org/kbuild/c/f94711255a73d

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


