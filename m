Return-Path: <linux-kbuild+bounces-11479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOP/ITlWoWk+sQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11479-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:30:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086D1B491D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 09:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C06F30045B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 08:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87ED318B93;
	Fri, 27 Feb 2026 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCnD7jLb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4138B7CF;
	Fri, 27 Feb 2026 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181022; cv=none; b=cQIDgJrsCsnJl/peNJb+pwV57mOCgF+GNCpDi6K+W1ayinr5SGoheZ0WfBWdijqU19dHM2vAjAD7Qzt8Jc9SphJ8XjgGNudwCiOi/AEX0tjgDLFH5ZX2WZH9qZQHnztW9MkbK9UMZmM/qwwTHrgr4rxsViu9faoogH12MEpU1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181022; c=relaxed/simple;
	bh=BdVEkr+wxlmfU9CJukl8zobsrn5y/zOn66YZl9EAAec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeOXAy8evVjz5ghCULPp9ercYsGCLJJ6BcVWSH6zwl/H9ixg2sNJB+p9bo2KhR3TSXJ95n6t6Wi+aktakVxGZhoumlELVLZEaIafELZF+570BkHlDHTPtVXRBA863Ov07nbxE94Wz+z5yK8elZWh3B0AtUKityp0Hknow1gIKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCnD7jLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76700C116C6;
	Fri, 27 Feb 2026 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181021;
	bh=BdVEkr+wxlmfU9CJukl8zobsrn5y/zOn66YZl9EAAec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCnD7jLbcxoqVuzqTSA8dekB6Hca6UHVZ5d/7YNl68HpUQ0V74IpfiuJJ7S6iIU9B
	 KWg1JvVIrft31athOgWKtgf+7bBNKlI53b0yVqdvVDaAfArd3ITYBF6rNME6qqVmhJ
	 P5q/LbIgN+6FXmGfM2+ofEgholGhY1GIY6G9g4uGDOFPO5tyB2cSAO9n/tXjQkNSbu
	 qrCSvJ8z+QTU8rBsz9Yl8Kio/jMGajQ2qaidZaFVEPaSPmpKT2J+WCElJ3U1ll+AFZ
	 HPRgeE6Dws6Y13KW/k4fmx4simZnIebuGN9ApeG700WKuCjDO+FtvkaPQ5mwWX7/jT
	 SECLpVJTze8YA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kconfig: Error out on duplicated kconfig inclusion
Date: Fri, 27 Feb 2026 09:30:14 +0100
Message-ID: <177218091819.983702.5846102504393394089.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220-kconfig-error-out-on-duplicated-inclusion-v1-1-be78aa241a53@kernel.org>
References: <20260220-kconfig-error-out-on-duplicated-inclusion-v1-1-be78aa241a53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11479-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 0086D1B491D
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 19:55:19 +0100, Nicolas Schier wrote:
> Let kconfig exit with error on duplicated Kconfig file inclusion.
> 
> Repeated inclusion of Kbuild files are considered bad-practise with
> regard to maintenance; and Kconfig language is rich enough that there
> should be no need for that.
> 
> If repeated inclusion of Kconfig files is detected, error out with
> messages like:
> 
> [...]

Nathan, thanks for spotting the upper case letters.  I fixed it locally.

Applied, thanks!

[1/1] kconfig: Error out on duplicated kconfig inclusion
      https://git.kernel.org/kbuild/c/102d712d

Best regards,
-- 
Nicolas


