Return-Path: <linux-kbuild+bounces-2242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D79914838
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 13:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C225B25117
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 11:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C23137901;
	Mon, 24 Jun 2024 11:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="vsxkvzD/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60EB1386D8;
	Mon, 24 Jun 2024 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227545; cv=none; b=DLbLEzjfSPEDfs5+TCB+ARx3pvyFuBKzlFYNIK4mPTUtkPgYk/CwxpFzIYDLWe+HTEW3sdloxj3rrz/99WD6sFUiwxYGxKETl7aiHOLAEmC63jbbkmI7aizvZRnoWMC0cbWjihjWEUyVlQ6LaS0dF9Qa464A6C8jfmqMdTLgM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227545; c=relaxed/simple;
	bh=C7v68YrxalPAI1xgZuKhZ0iKr1W4zLTjeVWq5JmPBCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i4XScp26f9taEfVHE3ASt9NH6bED5mwabj+0qUZCohv1F4jTjAV0aYVgZEHrpEOq9jOR79KkOYhSemlVoXoaVUTFggHHZJueersd7kPIuGpfniSRgUUCFciTDWLQc4nksCTO2kSde1efGko6zZyDBBO8b9Gt/s5alN8byoLpMZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=vsxkvzD/; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1719227539; bh=C7v68YrxalPAI1xgZuKhZ0iKr1W4zLTjeVWq5JmPBCM=;
	h=From:Date:Subject:To:Cc:From;
	b=vsxkvzD/t6lUQg+ZjYCpxQLIWCla2f8VhYXq5yqJRHYiycrihWp/9H1dmE7vRWlzS
	 D4WJUCaPvDSUiizzgylisPZIdhhdRxxYPW2pdrC+V3CmRRbqJAH4AggGEtc+hl1IW8
	 ifVC0BcKSOnOaqjqmfWOP9DlEBTqq5r4JXT+XQwE=
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 24 Jun 2024 13:12:19 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 6475280544;
	Mon, 24 Jun 2024 13:12:20 +0200 (CEST)
Received: from l-nschier-z2.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:7792::1])
	by buildd.core.avm.de (Postfix) with ESMTP id 5B1061825E6;
	Mon, 24 Jun 2024 13:12:20 +0200 (CEST)
From: Nicolas Schier <n.schier@avm.de>
Date: Mon, 24 Jun 2024 13:12:14 +0200
Subject: [PATCH] kbuild: Use $(obj)/%.cc to fix host C++ module builds
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
X-B4-Tracking: v=1; b=H4sIAI1UeWYC/x2MQQqAIBAAvxJ7bsHEivpKdEhdbSkslCKQ/p50H
 IaZDIkiU4KxyhDp5sRHKNDUFZh1CZ6QbWGQQirRSYWbvni36PjBxxzBsUcnaGitsK2WPZTwjFT
 0P53m9/0AOMnJn2QAAAA=
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rolf Eike Beer <eb@emlix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502; i=n.schier@avm.de;
 h=from:subject:message-id; bh=C7v68YrxalPAI1xgZuKhZ0iKr1W4zLTjeVWq5JmPBCM=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBmeVSTwwHzE2AkX6U3spJ6AZ/tbJLl2pPamSCd3
 Oi7543R5pmJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCZnlUkwAKCRCIxryciJpt
 uPhkD/9tJSumJrr21ltO3uMLLOJPeisbT/hD89V0t7W/JOzS+kvK1RHUpViCPNsXEiwsQr/1q7I
 kx3P4l6liMy57gMy+EWgFa6Oar74bPWyuEL3VelO73umM/FU359fc0UybEMM6ZjqIWxbA/KNRes
 rdB1aXyHTG59y4iN0aq7UJWSeS+obS45uEvT03rUG95ym7F4nUlOzfXoJAy0dBnS9fGX4UVkL32
 npV1bUuZ01Q7HfzOJ1Yhb5T0b0FDqy7t75qokXxwkybqM7PCHMmT+Q2BB9gdymp5CfXofNhBwXZ
 lbzz0viHV0/WghPx9atwRZ8H7+VKnguSFu//jx/aP+LFBlVn6jwJA/XAJHj2VXuOFGfwgGdktsN
 TjxiA+K0elRHGtg1e1iedGZFayZGOGPCfHRKJR/S+gANhYeheLyz212CIhUKlu6SeVP2p0BeK+5
 7wfaEfzBz/hm0A/6NLkewM/D6heDGm4JAoOSqWSl/irDni/dxCK7YNQjXSirWASkNNDq5qKlQb4
 jCItw+Lyl7yvxTWb97deKmyf7jlvr1y4hr06i6rOS42b+ftlneVTrBuKwUJcj5cjECWrAywF4tM
 o6MakZYL4qUfaVH6Jhijl0UmZtD5i2X4YTIBAoaGOp5fytL5Mn1RmR5vgObO8eiKFct8ybq9zl6
 XzlKGf6vd2eoveQ==
X-Developer-Key: i=n.schier@avm.de; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1719227539-627AAE4F-BC86F478/0/0
X-purgate-type: clean
X-purgate-size: 1504
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

Use $(obj)/ instead of $(src)/ prefix when building C++ modules for
host, as explained in commit b1992c3772e6 ("kbuild: use $(src) instead
of $(srctree)/$(src) for source directory").  This fixes build failures
of 'xconfig':

    $ make O=build/ xconfig
    make[1]: Entering directory '/data/linux/kbuild-review/build'
      GEN     Makefile
    make[3]: *** No rule to make target '../scripts/kconfig/qconf-moc.cc', needed by 'scripts/kconfig/qconf-moc.o'.  Stop.

Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for source directory")
Reported-by: Rolf Eike Beer <eb@emlix.com>
Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 scripts/Makefile.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index d35f55e0d141..e85be7721a48 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -146,7 +146,7 @@ $(call multi_depend, $(host-cxxmulti), , -objs -cxxobjs)
 # Create .o file from a single .cc (C++) file
 quiet_cmd_host-cxxobjs	= HOSTCXX $@
       cmd_host-cxxobjs	= $(HOSTCXX) $(hostcxx_flags) -c -o $@ $<
-$(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
+$(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
 # Create executable from a single Rust crate (which may consist of

---
base-commit: 224a21441b0925ce1e60afb27629773a522c946e
change-id: 20240624-kbuild-fix-xconfig-f0e95d0d5b27

Best regards,
-- 
Nicolas Schier


