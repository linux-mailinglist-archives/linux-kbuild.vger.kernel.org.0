Return-Path: <linux-kbuild+bounces-10831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAUrKGiycmnwogAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10831-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1C6E793
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 00:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F29F3018774
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 23:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1003DB74D;
	Thu, 22 Jan 2026 23:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gviIDwXi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFF388878
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769124451; cv=none; b=toRo+sGqjUih3wNt/mNF97wA9jM5rDrSCskGU78v/X6DuxEAbSYqCbZ06w7OXs1Ij35uHd3bSat4Ywt6giPQc+UUtXHMGRsRF8N9xSqMfF3smQIi7FaDjJA78zUN0wbKNfED/ZkBV3+6w/kWBfUOSkw2+w7yL/9L+JyfcW6Jqa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769124451; c=relaxed/simple;
	bh=4fuT4kSBYejpM1YxVatCRAaDrX+MQN4AsB/aXUX7se0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHq4CBOCDJFXqAi7kK6lb/YLoFVD8s/NZLo5wxxG0MZIIEzc7xtrIqqxPiL7kUDJ+2Tr5NGR5KhpDgKyjgWv+F1VtJ/rq4WtOxrlstG6eC/0A0jlnogfIlet+1Y60iCUlAborLQwBETRCc0PqBeZwu1La88FRwPaF+ny0k21dIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gviIDwXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE51C19423;
	Thu, 22 Jan 2026 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769124451;
	bh=4fuT4kSBYejpM1YxVatCRAaDrX+MQN4AsB/aXUX7se0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gviIDwXiqnBrRalKOSjHiCciZ26BPLsYeW+YXSMyzemhYvZq4NJwcHKbUPsMHzWpm
	 66tp4qG2mCwcFZFrok4Z9eY9vk6L5wHUZO/eAzr7pEj3cvqXVdBwhTn3v2m9AIYf2m
	 5kW40Mr6ISgiE6S40yFASXXGVKZS8LSfU2R5N9zykood0FfUH2R1GHerP4LSRDEzcu
	 tDQnyl/QQabQ9U1zCI5sVAW4eQCifWW0ihpJ7ahrcAzz0zeD1obA7VYnjK7JdEtFE9
	 ZdnkWMFI6JX/fLKvl0NWzhTJ819AEqDS3t/313IGmhYDuGAVpjuPyCqLdnhzAUqZ0e
	 /2VEbtPUxZf3g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 22 Jan 2026 16:27:23 -0700
Subject: [PATCH 3/3] scripts/container: Use iterable unpacking for
 _get_opts()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-scripts-container-ruff-fixes-v1-3-fd1b928c3f10@kernel.org>
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4fuT4kSBYejpM1YxVatCRAaDrX+MQN4AsB/aXUX7se0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlFm+I+2vY/5Jw+Z8u6IqYCk6qpJhv2qP2QEjdQtrUL/
 CkUcHhaRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIiRpGhjWHXVdcCT5QvdT/
 IeOs30rO1+XPFB25eO20rNy2O7PmBEsw/M+ebGXLkRpl8n6SetkrhbVqy27+fbjBZsWdH/eKIts
 N17AAAA==
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
	TAGGED_FROM(0.00)[bounces-10831-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61B1C6E793
X-Rspamd-Action: no action

'ruff check --select RUF scripts/container' warns:

  RUF005 Consider iterable unpacking instead of concatenation
    --> scripts/container:89:16
     |
  88 |       def _get_opts(self, container_name):
  89 |           return super()._get_opts(container_name) + [
     |  ________________^
  90 | |             '--user', f'{self._uid}:{self._gid}'
  91 | |         ]
     | |_________^
     |
  help: Replace with iterable unpacking

  RUF005 Consider iterable unpacking instead of concatenation
     --> scripts/container:100:16
      |
   99 |       def _get_opts(self, container_name):
  100 |           return super()._get_opts(container_name) + [
      |  ________________^
  101 | |             '--userns', f'keep-id:uid={self._uid},gid={self._gid}',
  102 | |         ]
      | |_________^
      |
  help: Replace with iterable unpacking

Iterable unpacking is more efficient, so switch to it as it suggests
(even if it is unlikely to matter given how small these lists are).

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/container | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/container b/scripts/container
index 5afaad762492..09a14f7e29f3 100755
--- a/scripts/container
+++ b/scripts/container
@@ -86,7 +86,8 @@ class DockerRuntime(CommonRuntime):
     name = 'docker'
 
     def _get_opts(self, container_name):
-        return super()._get_opts(container_name) + [
+        return [
+            *super()._get_opts(container_name),
             '--user', f'{self._uid}:{self._gid}'
         ]
 
@@ -97,7 +98,8 @@ class PodmanRuntime(CommonRuntime):
     name = 'podman'
 
     def _get_opts(self, container_name):
-        return super()._get_opts(container_name) + [
+        return [
+            *super()._get_opts(container_name),
             '--userns', f'keep-id:uid={self._uid},gid={self._gid}',
         ]
 

-- 
2.52.0


