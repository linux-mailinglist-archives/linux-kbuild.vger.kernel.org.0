Return-Path: <linux-kbuild+bounces-11011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCTPFt6PgmkMWQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11011-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F92DFF6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 01:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F43D301CF67
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 00:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD06E156F20;
	Wed,  4 Feb 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOtkguxK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6401799F;
	Wed,  4 Feb 2026 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770164186; cv=none; b=PKJwxyGq1kAZ3eWxSoLTEet2W6sMVbwmZGS/jXn343KdwS2VlTeV5tmbzFuS1YkiNZkWOWVL99eTy1TMMiIZJlBmttSTQU0BfMmBnOhBdiiDvoSzj6aLAife/cKpnguYZYyCABsU7mMsMUNklnICZmxbVp3cfXWcseoptrtIItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770164186; c=relaxed/simple;
	bh=cXCSnWacZsqPBcxrOOn9sOegsfptyG2c8Efyn/WtQU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XzpH7RSGtK6XZxP0L8UJcUvonLSjJJglFLoc24DxIJPteFcTFFzMMgJHOUjbsBKUr5ZvLl2S1gSZL3VE+wVLTMbfwQq9QoK23ONfvG0fICS4XNanoLaZNwRN3G0aH12x50YNApPoVFf7gfHVv4Ngk4QXACSYgx3A3CWmjY7XTlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOtkguxK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEB8C19422;
	Wed,  4 Feb 2026 00:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770164186;
	bh=cXCSnWacZsqPBcxrOOn9sOegsfptyG2c8Efyn/WtQU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LOtkguxKAXJtMzfynOAUfLNVpulek3c4KVdhriArnrqAaoQHq2k8DogKT4eIEYLz7
	 KKyUYd310W/BonZUuK/xp+vMVocIz0Z1PCBwNFLpm+SHA6ofEMZm5THw5YpxSZyek5
	 BnoRHPtia8GsPPklVTlLu1b2dLiquFqCTKeMI2XFBK/BQ+a1mEVknfypMsBmnEGb/0
	 S59OjODssXJrjcmJK4GdFNYncplRgvoRTRSaS1Or/KjnaltdlTsyJKBSPNJ1icZn79
	 HdsOYn/wNcdAekeo3jxMYBIZtWxP36pJIFWrIkiuWLHsaIQ0fbft53wBQyz1ZYb7xZ
	 MS2znbh8Ijszw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260120123730.30487-2-yangtiezhu@loongson.cn>
References: <20260120123730.30487-2-yangtiezhu@loongson.cn>
Subject: Re: (subset) [RFC PATCH 1/3] MAINTAINERS: Add scripts/install.sh
 into Kbuild entry
Message-Id: <177016418511.1146354.1905685795770381118.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 17:16:25 -0700
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11011-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05F92DFF6A
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 20:37:28 +0800, Tiezhu Yang wrote:
> The common installation code is in scripts/install.sh, add it into
> Kbuild entry to reflect the reality.
> 
> With this updated entry, folks running get_maintainer.pl on patches
> that touch scripts/install.sh will know to send it to linux-kbuild@
> as well.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/3] MAINTAINERS: Add scripts/install.sh into Kbuild entry
      https://git.kernel.org/kbuild/c/1f77593d304e7

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


