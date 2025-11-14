Return-Path: <linux-kbuild+bounces-9628-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D8C5D70A
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:52:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 575E33628D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F442459E1;
	Fri, 14 Nov 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U+rHcWUA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QIaYmoGS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB9F14B950;
	Fri, 14 Nov 2025 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127845; cv=none; b=gqNwl7M2/E7kG1hdopD1pjQmuNR2XqFIs7hytgDBhSAZx7513TGBG8pgB7O2rBwF6YsjF/3pWhyla7KbpmNlG1Oi2dJz3itR4xIsj/Xlj1DFJfc5yFmVbQ7iNcYht9/XpLLNuMMTkrmtqu4UOkQvEzBWsCksVzNQJ29Al6Syk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127845; c=relaxed/simple;
	bh=vmhUQcdPA9xN+CqPkq77ObxgivTQH8kTBBIE4cvpcNo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rAcX6CXla4h8vn6fg04JsP8PD2PgYB9rGGATeMLEZK0fzz0VpImhFDnc0wRVZnoN0IEnM31euAo+jBYQD1yjOrl+61x9fCA6yaA12nvPEV/YYZlg5wzxVuRFK5ohr6HUBDVzWRGgxuVnjPqvMSJavo8TfKR6WjzvfNuEKYtQ9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U+rHcWUA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QIaYmoGS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AGPbHk1KfhXxTA6//0KB10/k2tuI8GLHPEz9EV+lenA=;
	b=U+rHcWUAq1f9ch1PN9YZ3651SYR1Qbgg7ZBzSA5un3p80OCOuCP45weUK0rRaMbLrLBO8x
	0BNfzEnei8rY7e8f8G2VkIMFc9MMF8Ds2EYBCNyWJFfczD+Z8YD/GXZBWO7tEOIyN3elJm
	/b+2nNYFQvuduUcfsA/U9H10rNMkAfRRmbcaVSYt9Y22kXPUg1MEIsLW4WCDfbIyZeOxDy
	rcp09zcJRpCihpk57ee/HDmXC60FCn+B2ANeQ+1T3gt57ANh/B61ef6ieZSJctOVL3qth3
	vDwoBy4GZLYLfpMWGt163oR06SaJA0Wz6wSpy8H2i5fN8i7ksUBridh70ZiE1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AGPbHk1KfhXxTA6//0KB10/k2tuI8GLHPEz9EV+lenA=;
	b=QIaYmoGS9Vq6bh58Y67UkO3BM8hLxOFof0y4g5a/gCu4e/YPmc66iNZlBMSLMjZif7NvgX
	y9SrYCLFPgiYuMBw==
Subject: [PATCH v3 0/3] kbuild: userprogs: introduce architecture-specific
 CC_CAN_LINK and userprog flags
Date: Fri, 14 Nov 2025 14:43:55 +0100
Message-Id: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABsyF2kC/4XNQQ6CMBCF4auQrq3ptCDoynsYF4VOYaKhpIUGQ
 7i7hYULE+Pyn+R9s7CAnjCwS7Ywj5ECuT6FOmSs6XTfIieTmkkhC1GB4o96oqfhU9oN3rWB1zQ
 GLlQDUBqdm0KwtB08Wpp393ZP3VEYnX/tbyJs139iBC64NGdb2hxAVOr6pH4avetpPhpkmxrlR
 wIB+S9JJslqxCY/YVWV+lta1/UNaefRVwgBAAA=
X-Change-ID: 20250813-kbuild-userprogs-bits-03c117da4d50
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763127841; l=1757;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vmhUQcdPA9xN+CqPkq77ObxgivTQH8kTBBIE4cvpcNo=;
 b=stRdoupFbyxa7j6zuTPPttcxu6ZP/Dfv94jMtv3uQFaoqH/cCcWRY41rdWQhhdmw4s6ID8d3l
 UP6eH02pj6yCbBT3nTm2d+zgh/sjiADi90qKwFflo7Ce9SfGZaMkGEN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The current logic to inherit -m32/-m64 from the kernel build only works
for a few architectures. It does not handle byte order differences,
architectures using different compiler flags or different kinds of ABIs.

Introduce a per-architecture override mechanism to set CC_CAN_LINK and
the flags used for userprogs.
This revision only contains the generic kbuild infrastructure bits.
The architecture-specific will go through the architecture trees.
They are present in v2 of the series linked below.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v3:
- Drop all architecture-specific patches, they will go in through the architecture trees.
- Trim recipient list.
- Fix old reference to CONFIG_ARCH_USERPROGS_CFLAGS
- Link to v2: https://lore.kernel.org/r/20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de

Changes in v2:
- Rebase and drop already applied patch
- Disable CC_CAN_LINK if the test program generates warnings
- Move to architecture-specific logic
- Link to v1: https://lore.kernel.org/r/20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de

---
Thomas Weißschuh (3):
      kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings
      init: deduplicate cc-can-link.sh invocations
      kbuild: allow architectures to override CC_CAN_LINK

 Makefile                | 13 +++++++++++--
 init/Kconfig            |  8 ++++++--
 scripts/Kconfig.include |  3 +++
 scripts/cc-can-link.sh  |  2 +-
 4 files changed, 21 insertions(+), 5 deletions(-)
---
base-commit: 10f8210c7a7098897fcee5ca70236167b39eb797
change-id: 20250813-kbuild-userprogs-bits-03c117da4d50

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


