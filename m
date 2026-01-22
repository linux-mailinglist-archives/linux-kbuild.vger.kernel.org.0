Return-Path: <linux-kbuild+bounces-10830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0qbBJ2aycmn5ogAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10830-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9A6E789
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5F903017F89
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 23:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FDD3DB75C;
	Thu, 22 Jan 2026 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0HBch1P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF213DB753
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124449; cv=none; b=dmVN3ZpuKJ30mvMGQtKsh7TItuRkC4S/3GWUjRxqzU/B5J9r4MKF43R6ATswevVC5KZZhPnIi742/4bslaHT0DzYzGfG7UA0tREQRbc2dAjTtjv/H76f10beJeTLymWyuaq0A+3keDoelyyKWS+wfdzNX6sjkTJRlPWyVbdx/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124449; c=relaxed/simple;
	bh=8mx/kuc4DA04tNsavWsqRKyGO6A6WCI1PVFFsRmYQv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kFDHm5ygUN5l404YWCgUOpyRn058FNnUYSogIZG3ZPvG4YSePP7gyYpfz4W45yJRZLwpcgmr9zuqO0izG65Wtd+joxErirHOZGvvPPuHCOuAr7KfzupYNm26LbCtm8UYPBVBV/zNFuPCQXdZoG6ROPWO7xN9FiPHDc9TfmGv9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0HBch1P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA02C116C6;
	Thu, 22 Jan 2026 23:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124447;
	bh=8mx/kuc4DA04tNsavWsqRKyGO6A6WCI1PVFFsRmYQv0=;
	h=From:Subject:Date:To:Cc:From;
	b=M0HBch1P+XdBlZdvoQ+JkHQWke2ECQIMLSHgPQjpnl5Zbg/cnxuYtyoRlmRbnY6Gh
	 az4qns3zpRC1oZ8Q8+oAnQlCcZYb+rgC/8PjQfP4r4W5QJY8AY5k487cblR/XEFlf5
	 KQ58bxOlTpC2tdC/6ZCemdYMn3yr0J0MgOkKaNAe8oYMX/a9XX2Uk74D58mtndhPxw
	 tMLPluBnQqX/TL/ZPdpGl3TasuPrdPSMk/HZroSUUZ7BTxv5ratdChUlhrjOdcEdQz
	 mSd5dGg52lRYolypGBWlsWV15fj10B6haJOXP3O5xcxvZ2MJsHibyv8Oo++D4eRKuz
	 Buxc45hTRAdKg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/3] scripts/container: Minor fixups suggested by ruff
Date: Thu, 22 Jan 2026 16:27:20 -0700
Message-Id: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCQAxA0auUrA10UrHqVaSLaZrRuJiWZCpC6
 d0ddfn48DdwMRWHa7OByUtd51wRDg3wI+a7oE7VQC2d2kCEzqZLceQ5l6hZDG1NCZO+xfE4def
 EF+r7EKEuFpNfqIfb8Lev41O4fJ+w7x9mK3m7gAAAAA==
X-Change-ID: 20260122-scripts-container-ruff-fixes-4d38fc92771a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=781; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8mx/kuc4DA04tNsavWsqRKyGO6A6WCI1PVFFsRmYQv0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlFm+Jef/RZ6Fal/O6/HtvSOc4MDhrNvTnWV4RLX01TO
 jf7s49nRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI/yuMDJMXT91re3oL77pC
 X6dlKXfu7itfU3KEmy9SYt3B90wrFUQZGbbuW8kx/+h8B6EbUqI1b+899Pba/bW6TWzekiW9AQI
 XBPkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10830-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E1E9A6E789
X-Rspamd-Action: no action

Hi all,

This series fixes a few warnings that I see when running

  $ ruff check --select C4,RUF scripts/container

which were the few warnings from my personal ruff.toml that seemed most
interesting.

I will apply these on top of the initial scripts/container change.

---
Nathan Chancellor (3):
      scripts/container: Turn runtimes class variable into a tuple
      scripts/container: Use list comprehension in get_names()
      scripts/container: Use iterable unpacking for _get_opts()

 scripts/container | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 6eac13c876805f61bbb588eaff5ada0b6dc603e8
change-id: 20260122-scripts-container-ruff-fixes-4d38fc92771a

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


