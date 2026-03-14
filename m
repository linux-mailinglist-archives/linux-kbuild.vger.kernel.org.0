Return-Path: <linux-kbuild+bounces-11934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAogK6xutWlz0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11934-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:20:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E76B28D7D4
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 15:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 056653051468
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Mar 2026 14:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF2C37AA6C;
	Sat, 14 Mar 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4p/LfWl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604C377EBA;
	Sat, 14 Mar 2026 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773497914; cv=none; b=NkUmrcTpErtXamnOK4ig/FI6Xl63/xRTNjBa1kYMTG+ADcqfoauCoBm+c0p700dP/xObtpYowHEVDKuFQjDobIyS6Gy15NGsjgjOMFnb7hIIOjvv1k+jly4q+aIVlXxuedGf7eudjcyGPoxJ3pv218llUWQ+hpEqljzkzJXOohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773497914; c=relaxed/simple;
	bh=cI+kSXFXn30p+LMwB0/AK36QZVSloLPjESbeCuBih94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViVjx8YGzrG4fFV/z2UUXYtdm7eOGR7wAm+IqAUbd/cl8O0lseD1JBCGOwSBBLxpkeF6wu76/9sVh5R2u41NODnhLdrEps5kxfZwTEJrIYkJRYlqJpjmtnXfsaimLDza9WpUtKe30pz3sKamatgiCPZXjTcC0wiIhD9JQI6ZTwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4p/LfWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D17C116C6;
	Sat, 14 Mar 2026 14:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773497914;
	bh=cI+kSXFXn30p+LMwB0/AK36QZVSloLPjESbeCuBih94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H4p/LfWlHMy3AKoJMvno1mFyoiirZTQoEF3RTU+QWjYt1labE+zD9RHkcaRjTJoHW
	 fJXnClziyP0RxhfVpG3Tmr8QVoWXemj/pv8QdAl5O+hQYxbIj9RMjJ0wWtqtHjKu/6
	 WVM9ME+qWo1cG1XGYrGvc/0dJVChqgV4utM8hNl+HIVF55QwD6j4swUitSevLULGk5
	 2xKFsWXxnhHlyb2I9KVkAQfO85CuaXLNtpYDgXb+h2S5KflovLqH4YBC1MZiE3Y/nh
	 cnjAOtsHR6l2Vfjw0cSvsYNdBVTRrT9Q+/bJUavM4Z4WMq587sJnd+twoD2PwgBZQr
	 eF+ggmPuyGFBg==
From: Sasha Levin <sashal@kernel.org>
To: oberpar@linux.ibm.com
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4/4] Documentation: gcov: document MC/DC condition coverage support
Date: Sat, 14 Mar 2026 10:17:49 -0400
Message-ID: <20260314141749.3382679-5-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314141749.3382679-1-sashal@kernel.org>
References: <20260314141749.3382679-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11934-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4E76B28D7D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a section documenting MC/DC support, including the GCC 14
requirement, how to view condition coverage data with gcov --conditions,
and the 64-condition-per-expression limitation.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/gcov.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index 075df6a4598d8..57b9345060c5e 100644
--- a/Documentation/dev-tools/gcov.rst
+++ b/Documentation/dev-tools/gcov.rst
@@ -180,6 +180,31 @@ b) gcov is run on the BUILD machine
       [user@build] gcov -o /tmp/coverage/tmp/out/init main.c
 
 
+MC/DC Coverage
+--------------
+
+When using GCC 14 or later with ``CONFIG_GCOV_CONDITION_COVERAGE=y``,
+Modified Condition/Decision Coverage (MC/DC) data is collected alongside
+standard branch coverage. MC/DC verifies that each condition in a
+decision independently affects the decision's outcome.
+
+To view MC/DC data, use::
+
+    gcov --conditions -o /sys/kernel/debug/gcov/path/to/dir file.c
+
+MC/DC coverage is required by safety standards such as DO-178C
+(avionics) and ISO 26262 (automotive).
+
+GCC's condition coverage implementation has a limit of 64 conditions per
+boolean expression, due to the use of 64-bit bitmasks internally.
+Expressions exceeding this limit cannot be instrumented and will produce
+a compiler warning. This does not affect the correctness of the kernel;
+those expressions simply will not have MC/DC coverage data.
+
+Note that MC/DC instrumentation increases binary size and execution
+overhead compared to standard gcov profiling.
+
+
 Note on compilers
 -----------------
 
-- 
2.51.0


