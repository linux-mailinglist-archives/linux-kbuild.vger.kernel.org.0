Return-Path: <linux-kbuild+bounces-11092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OFsK6fYimnrOAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11092-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7502117A4B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E2CF3019BA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 07:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFF332E727;
	Tue, 10 Feb 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu+xd2LB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469692D7DED;
	Tue, 10 Feb 2026 07:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707107; cv=none; b=paAZyBaXJ6/6jZ+nsPXpw22NPK20btzKT5f52CgtvOgP0wQ7xINb1pzkjcrRx20ib/wUCKlDukO5vu7SA8z4I9UgCjNBSIfxMWYpPsD12wDC+dHOp1yd23C9UNHnBoeiXi13ZljO5jvrVSOHbjP3fSDthy0YK7T0RvogpSjPsn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707107; c=relaxed/simple;
	bh=Pjbc3jYlEb+wom9cvFtpbnosugWUKKVeKlUJdpUc59M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kEFgGa8P2hg3dx54V+beelcS2lyBfiqTghcb5IS8Bnmnptv7o6p2E6TfclQPRcBo/xY/2zrDyFz2yIBZ0gIvcpmGx1G1oPClGp+LrcyIpBqLckyno6foAKXOVLPM+2b8gTKoxxYO2gFtwlYfR5QiqGyR866CW8xfDtIZx6NSVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu+xd2LB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C77C116C6;
	Tue, 10 Feb 2026 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770707106;
	bh=Pjbc3jYlEb+wom9cvFtpbnosugWUKKVeKlUJdpUc59M=;
	h=From:Subject:Date:To:Cc:From;
	b=fu+xd2LBQFvXHxcxrSCM3CbWYSIUQDOAPH00ON6czMwoZB/EjECfKh2eU1SVw9IMY
	 sjEv2mLNUuGOweAEa0GEZxQqV+iWWkXuL/R0SZNEZ1bIOg5SI7GA+SPFxbwlOOmB3L
	 pt6gD9xryzbz7E+S+/uU4lIou7ei2n4pWXB+CyCCbZNsCT5cZcfNFKq0Qz65VZW+rz
	 0T+rYMIx7+tsz8JzsjSVSmzd3UlPjO4bUa83BRqUwnfKEdwWrWLB8gRj8PSFkwajtf
	 qJ4pcsTPBjQ/rzrzO9JwtcrMcOS5lUDttK4uZROq+3Rw2HgZaWltDwoMX95Wa+CUAs
	 HStym9Q/qvdaA==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Date: Tue, 10 Feb 2026 00:04:47 -0700
Message-Id: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTuQZKHWVxEXuUzstBolMVIQ3
 72xXX5wzn9CosiUoK9OiHRw4jUUyLoC+9RhImRXDEqoRijxwLfJPDv0/EFHJk8c/IpxW7CVne+
 kM1brBsp9i1RGv/Qw/p2yeZHd7x5c1xcbmMc/fAAAAA==
X-Change-ID: 20260209-kbuild-fix-debuginfo-rpm-718f81dbcaa6
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Steve French <smfrench@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Pjbc3jYlEb+wom9cvFtpbnosugWUKKVeKlUJdpUc59M=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJldNxY+jO/5W64/sUw12l9iyry3PtVRCxid+j05/WxdW
 KPrHq3vKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABNxdmT4p8x46+jijsyVr8U3
 3l/ZJv7oXGTjtRpFWW7WtmW7SupW7GX4n/UrKPH07EDVql0C2Z9Nm9smZRxv589KWn7ynuTSC8/
 zOAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11092-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[find-debuginfo.sh:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7502117A4B
X-Rspamd-Action: no action

Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
Generate debuginfo package manually") on RHEL9, which has an older
version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
issue with specifying %files for a -debuginfo subpackage.

The first patch restricts the new -debuginfo package generation process
to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
necessary and working. The second patch restores the original -debuginfo
package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
-debuginfo package around for older versions of RPM.

---
Nathan Chancellor (2):
      kbuild: rpm-pkg: Restrict manual debug package creation
      kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package

 scripts/package/kernel.spec | 57 +++++++++++++++++++++++++++++++++++++++------
 scripts/package/mkspec      | 38 +++++++++++++++++++++++++++---
 2 files changed, 85 insertions(+), 10 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260209-kbuild-fix-debuginfo-rpm-718f81dbcaa6

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


