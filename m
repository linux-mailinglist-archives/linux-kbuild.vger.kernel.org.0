Return-Path: <linux-kbuild+bounces-10764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DZLFgKzcGndZAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10764-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:05:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2D55B22
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24678948A5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 10:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6813144102D;
	Wed, 21 Jan 2026 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="woo91ueD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wE4POGjt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="woo91ueD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wE4POGjt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D44344CF22
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993100; cv=none; b=GO3Sav7aBjUDRAbVzMHfH1LM+NIckfHBnkDQ0mHQ5lCnQLWYozRpE8GCJu/MvXyyv9AxwStUw2YBtHZWium1thAjIs6CpPxIn2zLVbk93BBgm5TvSVY1VboEiBEnNwn4wZYlNuAGzKAyQpDmMuOzlI4IX+si5Dyl4y4MfL5H8tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993100; c=relaxed/simple;
	bh=+wk2OERHJcEIXCIoAHMUEQZtY7ZrHGtsxmhHSA5wVHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqxwJeX7uU3fKAv69/63egEvJX+ZwY+sFhapTpkHvngBDI6+XmPGcW16ywTo/YesMbSH21/zyoypXlvAZ2/8CHSMVvZRiKIVlP6E5x9hRAlXggZxeP8s7HWgulMZERARClKrY0j63sclUAECeVwdfYnf0hmMS5k7ovCl4k43IE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=woo91ueD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wE4POGjt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=woo91ueD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wE4POGjt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id 8D7B833694;
	Wed, 21 Jan 2026 10:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768993096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2gcYP/t5vvPuhymGiOtUEwwcFXhJPLA/oGTfjrYWk78=;
	b=woo91ueDBpAiC/TA1/wjauv4XZ0ezUQqof2hs1F9e72WJJdcX9Q/c0KtCT/MvfOP1tIkLo
	204Jg5k9sai2KSOqD/0kLyfUIyhXS/dNEcMA5xvFVL6FaDsaj1YwnKAN8xqrolpD0kPIAL
	qtiRR6MZd7zEp65lW9oq3WjAdp3R70I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768993096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2gcYP/t5vvPuhymGiOtUEwwcFXhJPLA/oGTfjrYWk78=;
	b=wE4POGjt57HC7F7UbF00UQ6KMjbHOVBjIfaT5BRRcCb8qaecjO0TzFHznUV2j8vPy+LqlP
	obKoLK5khb4DVBCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768993096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2gcYP/t5vvPuhymGiOtUEwwcFXhJPLA/oGTfjrYWk78=;
	b=woo91ueDBpAiC/TA1/wjauv4XZ0ezUQqof2hs1F9e72WJJdcX9Q/c0KtCT/MvfOP1tIkLo
	204Jg5k9sai2KSOqD/0kLyfUIyhXS/dNEcMA5xvFVL6FaDsaj1YwnKAN8xqrolpD0kPIAL
	qtiRR6MZd7zEp65lW9oq3WjAdp3R70I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768993096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2gcYP/t5vvPuhymGiOtUEwwcFXhJPLA/oGTfjrYWk78=;
	b=wE4POGjt57HC7F7UbF00UQ6KMjbHOVBjIfaT5BRRcCb8qaecjO0TzFHznUV2j8vPy+LqlP
	obKoLK5khb4DVBCQ==
From: Michal Suchanek <msuchanek@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: dummy-tools: Add python3
Date: Wed, 21 Jan 2026 11:57:57 +0100
Message-ID: <20260121105801.1827-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10764-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msuchanek@suse.de,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: B2C2D55B22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
interpreter to make it possible to configure this option with dummy
tools.

Fixes: b587f413ca47 ("drm/msm/gen_header: allow skipping the validation")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 scripts/dummy-tools/python3 | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100755 scripts/dummy-tools/python3

diff --git a/scripts/dummy-tools/python3 b/scripts/dummy-tools/python3
new file mode 100755
index 000000000000..1f3ac6541dd3
--- /dev/null
+++ b/scripts/dummy-tools/python3
@@ -0,0 +1,5 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+true
-- 
2.51.0


