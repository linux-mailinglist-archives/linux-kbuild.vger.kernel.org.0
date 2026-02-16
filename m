Return-Path: <linux-kbuild+bounces-11323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN3CMHyok2nI7QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11323-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 00:30:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B62A14814E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Feb 2026 00:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B4D8300DDC8
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Feb 2026 23:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6FD2F12DB;
	Mon, 16 Feb 2026 23:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnFEokJW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD0A2EB87D;
	Mon, 16 Feb 2026 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771284602; cv=none; b=SWKIJWGYweX8eiq77AowXwT++5f7j8vzUonClEYMXTcp3fTSTPB97YkZKf7YzaKHJaoxrAwMUZYEcgLCOfKXpthf4jOA49nRp8hZwr46V/5s6vDQSAxEZ8dFyA5HQgOMSGtQeezg4/qjkBSuREUVdsYM+q7vXblf/MVPdValeFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771284602; c=relaxed/simple;
	bh=zJni9qH/aXdFgGEL8tygAGQGCbtksHU+HEbi5M5fT7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ysh4kxIaqr54QfxUPf9WmsAK4tWsSjFNCou6KLwMns2r33BZhcvbzw9cvkM3rqiGTBzP0911XfKnTxjvWfjgSGwRDkBLyefh85FlS7r7/3jATH9ZuhXYDFK0omgxY6/FySyWwIfJCzpmCnQ3GZh5Z6xkh8l2UzaSn6EfW9X47wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnFEokJW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2192FC116C6;
	Mon, 16 Feb 2026 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771284601;
	bh=zJni9qH/aXdFgGEL8tygAGQGCbtksHU+HEbi5M5fT7Y=;
	h=From:Date:Subject:To:Cc:From;
	b=bnFEokJWobDiDZXIc48kqdT7LLlAchC14mQP3yNjJx1EzCW+D9GS7jy4dSrxBqMYB
	 sEtqQVfvWBQjBgf6uyJYTNY2kyqzEK/Bd/X8wX9G7sGpR0MMLqXp2Lo16gR219sVeQ
	 7bGhCgznvKChlq0FMdvIsSqWC4/dZA472uIDsIAy9QymW9tEpx9FN5N+zeFgrmUe2b
	 hZmutSxbl3vl3XmDWzKWlUlM7YaqjGzqLYho5O5TnaXYCjRGPEB8mVc9Z8iKNN5OFa
	 7zGfbCqyx5FS3Xcw7chxHU8s13SqHNXSjGhQdVSRUm5wZA4E6BmNZglz10DJNu7JT5
	 1DVTvKIWdN8HQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 16 Feb 2026 16:29:54 -0700
Subject: [PATCH] kbuild: rpm-pkg: Disable automatic requires for manual
 debuginfo package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260216-improve-manual-debuginfo-template-v1-1-e584b3f8d3be@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBBA0V8ps3agjVLEXxEXmXRSR5oHeRSh9
 N+N7fJs7t0gcxLO8Og2SLxKluAbhksH5q39zChTM6hejb0aRhQXU1gZnfZVLzgx1Vm8DVjYxUU
 XRrJ0tbe7MooMtE5MbOV7PJ6v07nSh035h2Hff0Ae0ImFAAAA
X-Change-ID: 20260216-improve-manual-debuginfo-template-bfb3f482c2bc
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zJni9qH/aXdFgGEL8tygAGQGCbtksHU+HEbi5M5fT7Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmTV5RXaJo+3DlFSfEl18NaTr7bxnEirB33XE9f8H3p0
 PxwlfzxjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRpL0M/0wqXs/I7ZiXsY5f
 NSlaxCPLkvlkurGD5fMNArfTXf5/OsXIsHx+8ZSJmu3XDOplxQ4J3o2YkxWoWcpmsOL41r01PzJ
 OMAMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11323-lists,linux-kbuild=lfdr.de];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 1B62A14814E
X-Rspamd-Action: no action

Stefano reports that after commit 62089b804895 ("kbuild: rpm-pkg:
Generate debuginfo package manually"), building with an rpm package
using rpm 4.20.0 fails with:

  RPM build errors:
      Dependency tokens must begin with alpha-numeric, '_' or '/': #�) = 0x0d000002
      Dependency tokens must begin with alpha-numeric, '_' or '/': �) = 0x0d000000
      Dependency tokens must begin with alpha-numeric, '_' or '/': ) = 0x7c0e000000
      Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
      Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800
      Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x3130363230322000
      Unknown rich dependency op 'Hat': (Red Hat 15.2.1-7)) = 0x4728203a43434800

This error comes from the automatic requirements feature of rpm. The
-debuginfo subpackage has no dependencies, so disable this feature with
'AutoReq: 0' for this subpackage, avoiding the error. This matches the
official %_debug_template macro that rpm provides. While automatic
provides should be default enabled, be explicit like %_debug_template
does.

Additionally, while in the area, add the manual debug information
package to the Development/Debug group, further aligning with
%_debug_template.

Cc: stable@vger.kernel.org
Fixes: 62089b804895 ("kbuild: rpm-pkg: Generate debuginfo package manually")
Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Closes: https://lore.kernel.org/CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com/
Tested-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/package/kernel.spec | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index bccf58bdd45f..b3c956205af0 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -48,6 +48,9 @@ against the %{version} kernel package.
 %if %{with_debuginfo_manual}
 %package debuginfo
 Summary: Debug information package for the Linux kernel
+Group: Development/Debug
+AutoReq: 0
+AutoProv: 1
 %description debuginfo
 This package provides debug information for the kernel image and modules from the
 %{version} package.

---
base-commit: afdfb71c018e9a0aa2e51fb8186d3fb1acdd3f0e
change-id: 20260216-improve-manual-debuginfo-template-bfb3f482c2bc

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


