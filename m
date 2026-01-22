Return-Path: <linux-kbuild+bounces-10832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHDcJm6ycmn5ogAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10832-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C36E7A1
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BB0730095F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 23:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DB3389452;
	Thu, 22 Jan 2026 23:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgK2pGk1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E83DB757
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 23:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124452; cv=none; b=oW5O3APbNlSdB467fgpX/eNQBqgPQ6d4EXTujOEFrumHsj5p6dS3flTAlMhRx9DBdErm7dA58RfAqQ8DUqhUOflZgwRSKHMrv36xvmMcNor4khAjTPPM9GWMlEj6KGWPY8tJ9GFEOfQgdeAfnJoq/3qXDSGnz0iRJW6eP4o58mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124452; c=relaxed/simple;
	bh=pEuQYhNfzcrqZS1sMzYI5aKtp9TjL+4Pg78eNcIsJM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQHqiRxgrSVzVIWjpbvT0ox15OczEm3nfCMeitG8OXGnYZMBmU0eujxU9OQDN83zznlK1HfN6mVqREczpluftaI54n8QlpPvNDhgvRhlEo5FPW53i3q9Y8Yq7a/sCNt8k4E4zqba0WNYvitxssJKsSow4i0QB1Wb1HF310i+MeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgK2pGk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66559C116D0;
	Thu, 22 Jan 2026 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124450;
	bh=pEuQYhNfzcrqZS1sMzYI5aKtp9TjL+4Pg78eNcIsJM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AgK2pGk17ytzkNE1U7e7iW2wrz3nrFqeyzmM7Lbqd6pqHWSnGFMdzgtdNsEJ6Yacd
	 p54UY56878bNJj5lTdaiTEK3v3Uhql+ObStzPTokvbs/5rrp/S6BjYJZ9FMx4jVghj
	 /iB3GPDCt9x/PWv157P0Vw24e3iNPOS+LCYwWywjyfxnV9khj8564c0UsPym23e/mh
	 OTOjbWiSDGPYCojeSEwgV9oDt4IVDAWOoTqhwM8wMpf28gtQbbwI6SaY+yDqO4R5Gi
	 SVdqDNaa+uigtOlQ8muLshE1t0dlrSO8T+ZQgyjDjqJPq1j4TqOwpwntWG96VdxMyX
	 OVJIiqHpPo+sw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 22 Jan 2026 16:27:22 -0700
Subject: [PATCH 2/3] scripts/container: Use list comprehension in
 get_names()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-scripts-container-ruff-fixes-v1-2-fd1b928c3f10@kernel.org>
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pEuQYhNfzcrqZS1sMzYI5aKtp9TjL+4Pg78eNcIsJM4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlFm+Lk066wHjqjIbpPoVfuTtfuxcp7G1Zq1PV2iEz5v
 Yn7pkBbRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIz12Gf+ZhxZeZJqzNnVMy
 7znjf/ZQ70VdXjbz+FMUOTkPtGb/fcHwVy5Febf9nBUqnYJpX8KlxJy3H20Mvye30XpK2ZzMlMP
 T2AE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10832-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runtime.name:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C07C36E7A1
X-Rspamd-Action: no action

'ruff check --select C4 scripts/container' warns:

  C400 Unnecessary generator (rewrite as a list comprehension)
     --> scripts/container:113:16
      |
  111 |     def get_names(cls):
  112 |         """Get a list of all the runtime names"""
  113 |         return list(runtime.name for runtime in cls.runtimes)
      |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  114 |
  115 |     @classmethod
      |
  help: Rewrite as a list comprehension

Do as it suggests.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/container | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/container b/scripts/container
index dae475c6d262..5afaad762492 100755
--- a/scripts/container
+++ b/scripts/container
@@ -110,7 +110,7 @@ class Runtimes:
     @classmethod
     def get_names(cls):
         """Get a list of all the runtime names"""
-        return list(runtime.name for runtime in cls.runtimes)
+        return [runtime.name for runtime in cls.runtimes]
 
     @classmethod
     def get(cls, name):

-- 
2.52.0


