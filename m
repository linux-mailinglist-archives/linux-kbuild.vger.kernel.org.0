Return-Path: <linux-kbuild+bounces-10951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NQGHb4kfWnxQQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10951-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 22:38:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C711DBED21
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 22:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABEC13013D51
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 21:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC1734F490;
	Fri, 30 Jan 2026 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsjlDWcu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CA346FB7;
	Fri, 30 Jan 2026 21:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769809083; cv=none; b=tdqtOhonO3OFFW2qohfDZN2IOaI6EwLbAa2zhbS4llSja+OnFIiIyd7NLjSibFPEjgS3kq+/yfxTPuMVnt6NhspIpAZ3Ul3PPcBe+lbBZ+W1gSWvUfZwPYqIWd1bmx2SmnkdjQLbTPZu8FTWn56B8/HrG5Rd5ihFZU4BMYwLQjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769809083; c=relaxed/simple;
	bh=hG/FMFjw+Bsjjqf6+oGgdTmtU6Rj6R39FcIG0oxjB4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7A8kagxYchLSMT+yxQGfSk+pkt0HIEkwOO2wP8zxH/C2HUJX5laoNZxThE0/8IPSR5W9eEkH4juX08FaCsg1kDe3E05zIFkjTf6XdDgTPcTHrK9jSBJnCBcd6G9x7nrw4+8sfGGw5N97kk+hBSE4noL6cYetNoRN7mOMd8R2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsjlDWcu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC43AC4CEF7;
	Fri, 30 Jan 2026 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769809082;
	bh=hG/FMFjw+Bsjjqf6+oGgdTmtU6Rj6R39FcIG0oxjB4g=;
	h=From:Date:Subject:To:Cc:From;
	b=WsjlDWcuspRPbESmBhstfkK56VpUEZUT92aisw++uiwRD4OKUnC2X8DKECtzIiUP2
	 2tqIyEXoCUlglp1bnkKp9uAyMt0TJJ9MX1XKZK3F65QJyn7Y+lR5Lk2Kl8xg+h5Sb8
	 aZrKCBq+PZbswnML9coHYmWvjHmP6wOwpvGF1s1Kpy76dl6r56jnfrpcpAMpNJZTKA
	 NMxbjf2zXMXI/NM/zMDXS8E3iW/V4Rns4kurM00r9Te84Qfirk9IYxT0DPPEJEmpHf
	 tzKqUuoCRxGpAy3NBvUnu/lUYHy+Q8V3d5A4g30YVwfx61wYqt5HifZ48C7+2ccE9X
	 ugSdkZ5dlNQ5Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 30 Jan 2026 14:37:47 -0700
Subject: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTtJqQjGqxgWtv3qWGxJC4SEc
 HerLt/mbZSRBJku1UYJi2SJoaA+VGSft/AAiysmrXSr6qNib2YZHGcvI3ukgIFdtIx1ekfHumt
 P5wad0UZROcaEu6y//9r/nWfzgp2+Ke37By0QqAGBAAAA
X-Change-ID: 20260130-kbuild-skip-kernel-doc-extmod-276584e7b2b0
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Rong Zhang <i@rong.moe>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3283; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hG/FMFjw+Bsjjqf6+oGgdTmtU6Rj6R39FcIG0oxjB4g=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm1KjvqVhdnRG95sMfWl01Q86Jq6XKWE2Vu3LqZr2oPT
 fiqXu3YUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbSls3wh7d8m2vrhFfH6ybw
 WH9bukDgxqkF5y7wz5Zgtazweekue5yRob2lT54n5/QSWb4n/OEnGCyPPU7NL7EJvtQvLcjm/ng
 CHwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10951-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,kernel-doc.py:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C711DBED21
X-Rspamd-Action: no action

After commit 778b8ebe5192 ("docs: Move the python libraries to
tools/lib/python"), building an external module with any value of W=
against the output of install-extmod-build fails with:

  $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=$PWD W=1
  make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build'
  make[1]: Entering directory '...'
    CC [M] ...
  Traceback (most recent call last):
    File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 339, in <module>
      main()
      ~~~~^^
    File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 295, in main
      from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  ModuleNotFoundError: No module named 'kdoc'

scripts/lib was included in the build directory from find_in_scripts but
after the move to tools/lib/python, it is no longer included, breaking
kernel-doc.py.

Commit eba6ffd126cd ("docs: kdoc: move kernel-doc to tools/docs") breaks
this even further by moving kernel-doc outside of scripts as well, so it
cannot be found when called by cmd_checkdoc.

  $ make -C /usr/lib/modules/6.19.0-rc7-next-20260130/build M=$PWD W=1
  make: Entering directory '/usr/lib/modules/6.19.0-rc7-next-20260130/build'
  make[1]: Entering directory '...'
    CC [M]  ...
  python3: can't open file '/usr/lib/modules/6.19.0-rc7-next-20260130/build/tools/docs/kernel-doc': [Errno 2] No such file or directory

While kernel-doc could be useful for external modules, it is more useful
for in-tree documentation that will be build and included in htmldocs.
Rather than including it in install-extmod-build, just skip running
kernel-doc for the external module build.

Cc: stable@vger.kernel.org
Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/20260129175321.415295-1-i@rong.moe/
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
This is an alternative to Rong's proposed fix for the first error:

  https://lore.kernel.org/20260129175321.415295-1-i@rong.moe/

I noticed the second one by inspection of -next and further testing.
---
 scripts/Makefile.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5037f4715d74..f01d7957edf7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -166,11 +166,13 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
+ifeq ($(KBUILD_EXTMOD),)
 ifneq ($(KBUILD_EXTRA_WARN),)
   cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
         $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
         $<
 endif
+endif
 
 # Compile C sources (.c)
 # ---------------------------------------------------------------------------

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260130-kbuild-skip-kernel-doc-extmod-276584e7b2b0

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


