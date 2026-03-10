Return-Path: <linux-kbuild+bounces-11769-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNQjJKAFsGlAegIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11769-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:50:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFBF24BAA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C012A3042D63
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C629381B06;
	Tue, 10 Mar 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNfuVfjs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD336D9F9;
	Tue, 10 Mar 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142630; cv=none; b=av7Ch/gaq6H+WPFJpRGR1iGHy0VJbJzGa63p9K+Ii+68RAwWqo07SUlSAqjjjJ4nWhHS0cqBs+qIvnAVXM0fk9POAi5Gd4jiZ3n009l2LGISI4DJydWKbjybYqE1jo1ibuoPWPiCyQccxJ3Fmzjy8Wjl9qpllay7iookBZk3bfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142630; c=relaxed/simple;
	bh=3PRrvetc6l8kZixOc0omV/5fMd6TDf97j2Oqz1o0lqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Flcf4Wv/KlhC0jKdhVGkxL+5JGuD01j9dCSKeLpeZPCIcxkLE8iT6v0pOX7gbDh7hMiyarFBqPqClVGboiTvFwlXyuMNe1x7KpRW3HBF7qglqKAwaV3tnKbjmUB2cCvOG1mVCU5yQa4HmQYElprkJ8EL+afdU2crssH+hhbHmqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNfuVfjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0F8C19423;
	Tue, 10 Mar 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142629;
	bh=3PRrvetc6l8kZixOc0omV/5fMd6TDf97j2Oqz1o0lqQ=;
	h=From:Subject:Date:To:Cc:From;
	b=hNfuVfjsuK8ccC/bL1I8xFpuhnxmMEin6rbYa5KtuEz0E69yvH/9/2ZZu3CeP0eYc
	 6rzF7hFMhS2ylQa0+/L8nJX3Srq3ssIDMl0BGQVRKiSoUZ4NmxizqdXXJ3/Uvl67m3
	 NQO1SPxOIzrXnr3P/z9llYuycdYtXa8RyzVC7eZku1MMyerxTZTawNCE+3QKYmNuKf
	 bCz01NUV/aFtPwAYMU9EQf6uEJWBmhWyF+e+hhzxZpFTCu6veiITyfAuKp7KV7l3m3
	 0m9bbvg3xk+igLpjrDD5Zw63nLrBrLNLEEYRjrVukoIVUyNJEp8amNAP87H3Lozwdy
	 T2yaKZIt/mEGA==
From: Daniel Gomez <da.gomez@kernel.org>
Subject: [PATCH 0/3] Fix merge_config.sh
Date: Tue, 10 Mar 2026 12:36:22 +0100
Message-Id: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYCsGkC/x2LTQqAIBQGrxJvneBPSHSVaBH6aW+RhUIE0d17t
 Bxm5qGGymg0dQ9VXNz4KAKm7yhsa8lQHIXJauu1M1olvtHUjioqHCVxVl77YNcBcXQgGc+Kv5J
 vXt73A8fQeQNkAAAA
X-Change-ID: 20260310-fixes-merge-config-606c2a4ed83e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Anders Roxell <anders.roxell@linaro.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=3PRrvetc6l8kZixOc0omV/5fMd6TDf97j2Oqz1o0lqQ=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAJaBFE3Wsl+vCxbMPDCeGGc+Qp5OXRjMw8Mi
 xpM6eV/f2+JAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabACWgAKCRBAnqPEHxlR
 +wRFD/403SxPfMsLSkpyRXF4xM9bp41ncswBK7yb2MRVpX7vmQo6+g+rJwty0Nds+UKvgDLm7oA
 A4ddcA5RhHL08+yl4hGRdohEJABvfFFGAiuPVJ39AmW5crRAPeit8I/nDwVcpebCSQfL1ZO7QwN
 o/f6Eu/89HJEc7ohW+IPtM7q77+QqMvWS5VA5zBQGyjOy72SK6CSrBXXE913ZDmiZRmCL81SXxM
 Wic3tgEPKZb55xqqF/jznRO0MgvCDP6Ymb8b+7sfNp/PxTTPD8EsQwT4eIOTlxAStSswthpDnAe
 PT3xDYjB/0S4xqRAjBy2i8HIBVco2uP9kLdYy81vxs7hjzJJglMWkCs2jYn9cl3NAaWulgCVLJN
 ouMeJbPoYOy+CGGpdtwWx+kqAf5eOpvvwWF5AGAWejeKSdL+y6v9BSai0WEdHOlMfb4GBuvO8c0
 OW+uT64ScD1LpMZIAEOBGv5VlImwrvAQ6QHCM305qKTzU0OCgP4wygqSlP6vMvIy2Ma+zPvRVIK
 vTZElExuDuWtElJCSIy1kDyiBrpVZrUxqQr4kFaxl+Dj0Z20gTX0cZGzCDsixXDsnyb2VSFiD3W
 3svaFwfZvnjnpGVbATSQXjFp/egrdT2bwbT7LSPufZWlHPpIYGjDFy1TGBf6JUY0TFc7euTbYEJ
 karAocXOKo5m0Fg==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: 4FFBF24BAA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11769-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:mid,samsung.com:email]
X-Rspamd-Action: no action

Restore empty base file support introduced by a26fe287eed1 ("kconfig:
merge_config: use an empty file as initfile") broken by the awk
refactoring in 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh:
refactor from shell/sed/grep to awk"). Also fix POSIX compatibility for
non-bash /bin/sh and clean up whitespace.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Daniel Gomez (3):
      scripts: kconfig: merge_config.sh: pass output file as awk variable
      scripts: kconfig: merge_config.sh: fix indentation
      scripts: kconfig: merge_config.sh: use POSIX test operator

 scripts/kconfig/merge_config.sh | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260310-fixes-merge-config-606c2a4ed83e

Best regards,
--  
Daniel Gomez <da.gomez@samsung.com>


