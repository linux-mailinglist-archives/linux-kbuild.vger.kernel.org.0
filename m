Return-Path: <linux-kbuild+bounces-11744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMb0MGUxr2kYPgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11744-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:45:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BC2410C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8818307D609
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 20:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8375636C5B2;
	Mon,  9 Mar 2026 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZEHbm07"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F236C5AA;
	Mon,  9 Mar 2026 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089094; cv=none; b=Nbcxm8wXsMgraYlfUzJIdF6fHPeyV8zxDQ6TFRwabvO8R+OJJoZ++Pm77zYASgnaC4lrNq8G+aRojPwVyhJZr9waR6KHNbN1jE5FS/IWp44AotJTx7kJVvtdKMY9zofn0OaCqQ1FsJbMWg//P96ufbZepMH3n1SKrxytZu9c8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089094; c=relaxed/simple;
	bh=KMAsXJi/xnHgAkewg/8K0BayGesvDOrlVfMD4uKkkN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RlsIpFpNonl8VYXNpbWLZ/Yu1dmSOgiD8fwNnNku1F7msxi4mogMxuAnJG8vcIhQCPr57cbeETvwBxGJ1OpFDv59CgAYix4vgGmo7YsaYQJbqZX3cyIojVkzs1w5I9g8pEhqAsQLo9K5NAT0iG5T7XYnnw0syWgdqFShOeCGqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZEHbm07; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A405C2BC87;
	Mon,  9 Mar 2026 20:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773089094;
	bh=KMAsXJi/xnHgAkewg/8K0BayGesvDOrlVfMD4uKkkN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bZEHbm07d4vK1HrpKwNGZz034U5/wncLuybQq3rLbqRXrn8oiWv1tjfi1sL3HASE0
	 bs1mAhS6kWxzViW7YLoehZqqwYKIgwPsc3VJk52DbzQNS0Izqq8DGVHLx5TGX0HEHQ
	 wAIz4IcT96lbRIGcT8fONc5BSwxmf+OvZNfRuNI4dlLyX0Om58Cw94i4Sstv0w7XQD
	 eDBHbxgtSsn9pCyqMh0IEEIpFD8viq0PJQppdho9YgXaL6m+5nZadsPy4+UXR+5aJQ
	 TA5vDTkxuKSaEInbHDRVJdhfdNUTS5izT9etQkZl6YDemAju6tHudBLJysjj48A0wX
	 PKdaHspxvInMQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, Daniel Gomez <da.gomez@samsung.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Weizhao Ouyang <o451686892@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309121505.40454-1-o451686892@gmail.com>
References: <20260309121505.40454-1-o451686892@gmail.com>
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: fix unexpected
 operator warning
Message-Id: <177308909202.2903875.13663071115217399607.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 13:44:52 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Rspamd-Queue-Id: 2C1BC2410C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11744-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,samsung.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 09 Mar 2026 20:15:05 +0800, Weizhao Ouyang wrote:
> Fix a warning for:
> 
> $ ./scripts/kconfig/merge_config.sh .config extra.config
> Using .config as base
> Merging extra.config
> ./scripts/kconfig/merge_config.sh: 384: [: false: unexpected operator
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] scripts: kconfig: merge_config.sh: fix unexpected operator warning
      https://git.kernel.org/kbuild/c/3b4a3a00de877

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


