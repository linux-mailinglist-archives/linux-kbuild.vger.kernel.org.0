Return-Path: <linux-kbuild+bounces-9835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2310C85259
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 14:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A933AD383
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721D93246E3;
	Tue, 25 Nov 2025 13:18:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D71322C99
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076734; cv=none; b=BZlLIs8uCU64gg90Iw9ZwYhxemshmQEPN7F81A+ltbhJk7nI6IhabK6UBsHgamqwVMsIxWnss/RV52uyDZfUW9OSPYXTPxHrSf4DNrAKi6J2UI3YCAvvBtTsoJ24LDjzUuSIS2bNcwGjdWbTowpvxcKypQ80h4dOERj2iB8CTEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076734; c=relaxed/simple;
	bh=5rrjmXwhas9OxIhsFINtvvydwxcmgr7QlC+fTAMLFfE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=En+KPSLqskcaDC4yg26tIK8dQAPHRXUnqc7gipYEXitUpOD4XyEssPNM1d80z9878gZpD4hl5uqwn1NMgTf6GneGH+IoTG8PL7OpPJAFfFGZOt1OUVh+OH7ho8LQuO1qEm3U0lx/nm108jv23EuRHSBZCUuclTP2vKd8aptKOF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-00041i-Uo; Tue, 25 Nov 2025 14:18:30 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-002PEX-23;
	Tue, 25 Nov 2025 14:18:30 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-0000000243F-2LZF;
	Tue, 25 Nov 2025 14:18:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 0/2] kbuild: add target to build a cpio containing
 modules
Date: Tue, 25 Nov 2025 14:18:18 +0100
Message-Id: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJqsJWkC/32NQQ6CMBBFr2Jm7ZhOQwVceQ/DAukIE7VtWiAYw
 t2tHMDle8l/f4XEUTjB5bBC5FmSeJdBHw/QDa3rGcVmBq20ISKDXRCPb2+nFycMzx5LZSvTnuu
 q1nfIsxD5IcuevDWZB0mjj5/9Yaaf/RObCQkVWdOqsqiKQl8Du34ao3eynCxDs23bFxwH/AO1A
 AAA
X-Change-ID: 20251115-cpio-modules-pkg-70d85a69892b
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


---
Changes in v2:
- Add Simon's Tested-by and Reviewed-by
- rename to modules-cpio-pkg (Nathan)
- add separator/doc comment heading (Thomas)
- Make temp directory ignoring and cleanup automatic (Thomas)
- Use CONFIG_SHELL instead of shebang (Thomas)
- Use -o instead of redirecting stdout when creating cpio (Thomas)
- Drop superfluous -f as $(build)= overrides it (Thomas)
- Add extra preparatory patch that makes hostprogs := gen_init_cpio
  unconditional
- Link to v1: https://lore.kernel.org/r/20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de

---
Ahmad Fatoum (1):
      initramfs: add gen_init_cpio to hostprogs unconditionally

Sascha Hauer (1):
      kbuild: add target to build a cpio containing modules

 scripts/Makefile.package | 20 ++++++++++++++++++++
 usr/Makefile             |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)
---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251115-cpio-modules-pkg-70d85a69892b

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


