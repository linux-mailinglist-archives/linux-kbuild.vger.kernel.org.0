Return-Path: <linux-kbuild+bounces-11968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDF4M101uGkDagEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11968-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:52:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7A29DAD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30065303123E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 16:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C903CFF62;
	Mon, 16 Mar 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aOdBU55F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F653CF67E;
	Mon, 16 Mar 2026 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679931; cv=none; b=jeIn+npXVoR1/r8RsgWGe91fnOl64oM4ne8o/PVhWt/KbkmDw3cwHDXVFwUVnKvwhJe823PNVWHuIcQw4FsHA9WvG9+1Fan5lPOrdJAivzvLReTY5djnu4A/Adr3BGSKfQH+b7gJ39QfamR4ioV5WHtVVN5PsqGapn3fvpo65A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679931; c=relaxed/simple;
	bh=/d9uTb8lpguhHEi+JxjNFpFcFYqtR3gJDfleYqFkWsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrIYzQZ0IqnysMjipUVEErZwFgup/eeU2cmAh1wKEnuNwbeDxFlSTR7DgHBSKpB3b8gHfNRB4/W4+sawpUOoLO3MclfCI+qtzJsyV1lQsH7OrKBzPe4Nv7lVF7rCckGMKKBLX5f2RYwkWaBiz/l6db0KdH5RkM48Q0fHsHkYTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aOdBU55F; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773679919;
	bh=/d9uTb8lpguhHEi+JxjNFpFcFYqtR3gJDfleYqFkWsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aOdBU55FO8krvC33X6aufc7I2rcIK5hwdi7HBpKyCibg6OLQ0eOtte2nULErYwmwg
	 HhYYLxM+cNXgaoz8zstPn/8w06x79gILZWK7HXL24CiLL820uGjK0WBntZ2LmPuLcE
	 dBjo/fIDvK7bZbgyQJ6B+WTHuuQzjZNWueNPtW0k=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Mar 2026 17:52:02 +0100
Subject: [PATCH v2 5/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-kbuild-uapi-c-v2-5-35d6d0ed863f@weissschuh.net>
References: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
In-Reply-To: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773679918; l=2907;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/d9uTb8lpguhHEi+JxjNFpFcFYqtR3gJDfleYqFkWsA=;
 b=Rf867dfg8pc2Ei9wBq/ZCIroWe5YVBnjK5uI2gGJozOIKdMiLs/9BFhbMEFVZK2WQYpDSgB4+
 55L9z8rkRogBzlGKzczyFpVYF6Rpq7lzsC8AB6JVJ7N7c6R7JJSxOAs
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11968-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFA7A29DAD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

C++ language requirements differ from those of C.

Also test the headers against C++ compilers to make sure no errors
creep in accidentally.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/include/Makefile | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index edeaf9d778c4..ee69dd9d970e 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -10,6 +10,7 @@ UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 UAPI_ARCH := $(or $(HEADER_ARCH),$(SRCARCH))
 
 override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
+cxx_flags = $(filter-out -Wmissing-prototypes -Wstrict-prototypes -std=%, $(KBUILD_USERCFLAGS)) -std=c++98
 
 # The following are excluded for now because they fail to build.
 #
@@ -61,6 +62,27 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 no-header-test += asm-generic/%
 
+# The following are not compatible with C++.
+#
+# Do not add a new header to the list without legitimate reason.
+# Please consider to fix the header first.
+#
+# Sorted alphabetically.
+no-header-test-cxx += linux/auto_dev-ioctl.h
+no-header-test-cxx += linux/map_to_14segment.h
+no-header-test-cxx += linux/map_to_7segment.h
+no-header-test-cxx += linux/netfilter/xt_sctp.h
+no-header-test-cxx += linux/target_core_user.h
+no-header-test-cxx += linux/vhost.h
+no-header-test-cxx += linux/vhost_types.h
+no-header-test-cxx += linux/virtio_net.h
+no-header-test-cxx += linux/virtio_ring.h
+no-header-test-cxx += scsi/fc/fc_els.h
+
+ifeq ($(UAPI_ARCH),x86)
+no-header-test-cxx += asm/elf.h
+endif
+
 # The following are using libc header and types.
 #
 # Do not add a new header to the list without legitimate reason.
@@ -138,8 +160,12 @@ endif
 
 always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
+# $(cc-option) forces '-x c' which breaks '-x c++' detection.
+cc-can-compile-cxx := $(call try-run,$(CC) $(CLANG_FLAGS) -c -x c++ /dev/null -o "$$TMP", 1)
+
 target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
+target-can-compile-cxx = $(and $(cc-can-compile-cxx), $(target-can-compile), $(filter-out $(no-header-test-cxx), $*.h))
 
 hdrtest-flags = -fsyntax-only -Werror \
 		-nostdinc -I $(obj) $(if $(target-libc), -I $(srctree)/usr/dummy-include)
@@ -149,6 +175,8 @@ quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) $(hdrtest-flags) -x c /dev/null \
 			$(if $(target-can-compile), -include $< -include $<); \
+		$(if $(target-can-compile-cxx), \
+			$(CC) $(cxx_flags) $(hdrtest-flags) -x c++ /dev/null -include $<;) \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 

-- 
2.53.0


