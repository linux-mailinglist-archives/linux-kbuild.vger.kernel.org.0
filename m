Return-Path: <linux-kbuild+bounces-12383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIUZEOaYy2mYJQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12383-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:50:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F31B53675BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF9630AC6A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F064F3EF0AB;
	Tue, 31 Mar 2026 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKXobV+h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A923EDAAE
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950277; cv=none; b=nPF+fZdXOx+sVWT2X5VZ5DPuaB+iUrpN9wylSQUyvdXwpWEC8Ry8IKVz1+lMwVLDXI0J2kLXYvjNMUGrVDTuxsCn51lYGNipURYndb1pK8xOmF+fPDlWED6crxbProcf3iApTHj4/auOedlrJm8XOVxrw1OsgHhgq30XMdfcMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950277; c=relaxed/simple;
	bh=LuaLH82C8VFNeHuhNYFLbCMO+j5piSLkQ0JuEiRjpSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8KdedWVpJJji5wrdmqUom07weW/p+8+0uxn2tWd6ZR/nOppehJgFInmdBywneCXdBh6+WKYWXCcM2LdtN0x9ZCHPM/CEKb9XN0B1CV52vGniwSmgqUDwrRVevLA0RbpgPAET7BRabV0aMRp4X6AuetfEGB83iV8ivQpkODq7Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKXobV+h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbIbNiX+eqkEdr0SMcNuiwraBoTf68pP2H/YvQLprqw=;
	b=CKXobV+hGhe4v5C0o6itJ6Hsxwg1pSgtdySmkIHjLdHe1I+vX9FDlxDRIY7teRW8BeQx8L
	XSjCx5zkKhntU0DnwmRKeqz9mZpLKVTVhyURt4WTMOFdqIjyyad7zAZIOIRPEacOfvRNWn
	LcewBzJQmjRjX8YsjHjzx6mE+WGe0hE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-K4IZLIOxNGq32mAcJSMVoA-1; Tue,
 31 Mar 2026 05:44:28 -0400
X-MC-Unique: K4IZLIOxNGq32mAcJSMVoA-1
X-Mimecast-MFC-AGG-ID: K4IZLIOxNGq32mAcJSMVoA_1774950266
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90E5F1955EA1;
	Tue, 31 Mar 2026 09:44:26 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9392030002C3;
	Tue, 31 Mar 2026 09:44:20 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 2/2] selftests/mm: suppress compiler error in liburing check
Date: Tue, 31 Mar 2026 17:44:02 +0800
Message-ID: <20260331094402.144131-3-liwang@redhat.com>
In-Reply-To: <20260331094402.144131-1-liwang@redhat.com>
References: <20260331094402.144131-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12383-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liwang@redhat.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,local_config.mk:url]
X-Rspamd-Queue-Id: F31B53675BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When building the mm selftests on a system without liburing development
headers, check_config.sh leaks a raw compiler error:

  /tmp/tmp.kIIOIqwe3n.c:2:10: fatal error: liburing.h: No such file or directory
      2 | #include <liburing.h>
        |          ^~~~~~~~~~~~

Since this is an expected failure during the configuration probe,
redirect the compiler output to /dev/null to hide it.

And the build system prints a clear warning when this occurs:

  Warning: missing liburing support. Some tests will be skipped.

Because the user is properly notified about the missing dependency, the
raw compiler error is redundant and only confuse users.

Additionally, update the Makefile to use $(Q) and $(call msg,...) for
the check_config.sh execution. This aligns the probe with standard
kbuild output formatting, providing a clean "CHK" message instead of
printing the raw command during the build.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 tools/testing/selftests/mm/Makefile        | 3 ++-
 tools/testing/selftests/mm/check_config.sh | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 3b222cd6a048..2f6d2a207a0c 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -262,7 +262,8 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
 local_config.mk local_config.h: check_config.sh
-	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
+	$(call msg,CHK,config,$@)
+	$(Q)CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
 
 EXTRA_CLEAN += local_config.mk local_config.h
 
diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/selftests/mm/check_config.sh
index b84c82bbf875..32beaefe279e 100755
--- a/tools/testing/selftests/mm/check_config.sh
+++ b/tools/testing/selftests/mm/check_config.sh
@@ -16,7 +16,7 @@ echo "#include <sys/types.h>"        > $tmpfile_c
 echo "#include <liburing.h>"        >> $tmpfile_c
 echo "int func(void) { return 0; }" >> $tmpfile_c
 
-$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o
+$CC $CFLAGS -c $tmpfile_c -o $tmpfile_o >/dev/null 2>&1
 
 if [ -f $tmpfile_o ]; then
     echo "#define LOCAL_CONFIG_HAVE_LIBURING 1"  > $OUTPUT_H_FILE
-- 
2.53.0


