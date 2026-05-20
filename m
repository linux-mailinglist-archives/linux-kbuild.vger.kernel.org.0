Return-Path: <linux-kbuild+bounces-13292-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGBGOze3DWrC2QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13292-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 15:29:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398558EC3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 15:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36B38303988C
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 13:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6403A6B6E;
	Wed, 20 May 2026 13:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRNFjMv6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742636404D;
	Wed, 20 May 2026 13:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283473; cv=none; b=RXGWrgbRZy/WAdiV6rJDogAYWYxtJvRSFyED8EihQq2qhqDU52A9LAV7FHBO3mlSIZ2K2Obf78qaVcc1Ahe59b+Qxn2dHONk7XwMSvavCHDZALEaK2hPB1iX7MuHk5BxDd0YKAUB32GejRbI1PBfjk176Oyc401yTgcOmfX+VBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283473; c=relaxed/simple;
	bh=2cNFdyN5VT31JfJN4VD7mJcFelSukO+xXWTKYz4yYeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eBsVMT/uIDNzzKVJKzw8a8xnrFD1llFUER5Vgnm3rneijvpG4wyj6qCgvFI3ADnB+xSVpXuKsOINanTIzH7e3YGbn6cngYzdL6uJ7UBH+HnFtyckNMyFBdvmjBT15T8hyiJuEH+I5fq3dZhatGxHgbrkatKiAsZ/hihQj/EolHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRNFjMv6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4E5DA1F000E9;
	Wed, 20 May 2026 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283471;
	bh=RE8AbZxBp15Xc+2318UAFg+uyUMMmMsyTd4PgttQDjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eRNFjMv6chKtJce2duvdYwKWCZAXR3dzCLHDnj0l0vSMQmfA9XSn51/EFZ5sJzaWF
	 Bx4SOp7S6+Pi0Oe11V5xjPVs7OPLxgC7gkdRqh5KQJKmTIajRlB3tv3EBRuWn251gg
	 22kCv6FTUVzsyCXcOoJDU3GKUOGYldaQ9fgmeEVIcpq1Vtq8XApJqZHHdH3UixiUjr
	 MUCOVTfBMNSreu1/OIq4gBtk/IZMKvXaU05HmKdEtpCA5TDFhMkdHg8sDLqDxSz1XF
	 GOo/n/yUoiTNDs/RJfflzWbf4pUKo+p0CJ8aX6RAy7UOwCtqI3bxSLjnfOniNE5oKP
	 KoQt0lK2HUT7g==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	Zhou Yuhang <zhouyuhang1010@163.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhou Yuhang <zhouyuhang@kylinos.cn>
Subject: Re: [PATCH] kconfig: Fix repeated include selftest expectation
Date: Wed, 20 May 2026 15:24:23 +0200
Message-ID: <177928344933.2557215.4480066876520910982.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520070800.2265479-1-zhouyuhang1010@163.com>
References: <20260520070800.2265479-1-zhouyuhang1010@163.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13292-lists,linux-kbuild=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5398558EC3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 15:08:00 +0800, Zhou Yuhang wrote:
> The err_repeated_inc test was added with an expected stderr fixture
> that does not match the diagnostic printed by kconfig.
> 
> Running "make testconfig" currently fails in that test even though the
> parser reports the duplicated include correctly:
> 
>   [stderr]
>   Kconfig.inc1:4: error: repeated inclusion of Kconfig.inc3
>   Kconfig.inc2:3: note: location of first inclusion of Kconfig.inc3
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kconfig: Fix repeated include selftest expectation
      https://git.kernel.org/kbuild/c/e3658d2b

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).  Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas


