Return-Path: <linux-kbuild+bounces-12607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMzJBHh7zmnBnwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12607-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:21:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6638A647
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1B16307057D
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 14:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0553ED118;
	Thu,  2 Apr 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SdjdwZH7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374163E959A
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139597; cv=none; b=dcfmDH5iSkPOFx9VWmssxmPXMKWJBeJqcbKRy2mlxjc/b35K8rWRx1sP5CZk+EaFhwOzVZ/2syhSdj+3n7IqMhOndq2rGTL9uSlIbbt0uNXbt6Tu8010wa1piWyk2WFaxmPFBefFWkY/YbMlSIaZMro0Hi0lPqiyEXcwTXXv+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139597; c=relaxed/simple;
	bh=cyVMP9Kyo1scTrFB2LAaQ/90OVciv1KyB7OE0taNBB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sea8IvcNYc3eWA8fbY3oQ4gS61kJTH/NNT9sH1zm9tgsuTg1t2rwhCxVjDy9EhHmiaNDAQqN4H0s0RaCr3e/JeMSJBpBUCs1asHSvJ5nusItGJwMRya6UexHb15icUMEVMpR3aTzHcOam58nXD4MVSXH8X/vp0tSYmZWCIzKBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SdjdwZH7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so835791f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775139592; x=1775744392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkH+lobUTgIXjLrXq0Aorb2k1wsHUrp5cbKHFvjFzNY=;
        b=SdjdwZH7ORwF0PTFgr47fahmbNTCkh8sH2yGbNg+Px3nxe6LufZXy4A1ljskE43AWZ
         EeNOEV39EtEos49BEaOvJ+XtX5i+lryx9zHD+P22it0wBq54BbZqO7ax95SgtlvgYIEI
         x0fXKDLmTuCXt0gGCgDcRQJJsl8jk7cXj1LMwYEzr1Roqo4ARb3AWSfVSTQ8sXDiG7fT
         XF9iW2YiZ3pTDKdwmvGZhoZeEP9PaNc3k5QHvnE74HQptla3pQ3OuVnT3m91autnLkMP
         n+DEKDLLoAZRvHDn+rOALzqXa91YJiB+tmXuYX94xBwklZsl2qI1UjTmWkxkwcGLPaQx
         ehsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139592; x=1775744392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkH+lobUTgIXjLrXq0Aorb2k1wsHUrp5cbKHFvjFzNY=;
        b=MQmIeQZskyox9AFV4WSqFTtogeIlYKM+zkvOqkVUEokdv3KFxof31oT+I/uV8991+8
         gOXpc1gU0WXyjU03xDV8+1fxzMNGxSE2KkWe2wNnIBBiDBtVr6mJpLpUHPBeZQD5fVdo
         OLAwdthK16F9ildhQ0clDC82A0K/labyjJaI9CWb5ssES9PpRACxuROJ3QE1xaAZB8v+
         RYRsw44qnfEHA5v5szfjIu8L10+wy2f6s3XCoDgJFDj2RS7TYbDaw6TjZf9/kmliawBx
         uEfKcCFulgc9pcWAuJGLNsH/I2EZegdVQboOntSAcPomGKB5mtH4CA3vD7JdzJ3bQCyx
         8scg==
X-Forwarded-Encrypted: i=1; AJvYcCXRKEoszOOPpCL6gkYouJIs0EgboqMgkII73jUV7M8HYX0gI/YIkKN7Vn7Y3eiCNFV9c43IUehiQmurNnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vkokpOdYlVBot9MP6DcidfBELyGAEXSKc4XAr4vvog8GBWLh
	jWkr3HjfXl6OimyNclqiLOqWqGv6DAOvT7JJdnPdrkoY5tikZHdAzz4Y0BDog5Rj0f0=
X-Gm-Gg: AeBDiesGDbioVZfFHEvEwwjAPi8Bt9P1V+yxN1MmWu5tz4xlCYmifH2WdTUTSAdXlUx
	yITYI9c39rArVYiV14Vqkj0IOXYmRXYxzjx2X8MSHKV3UB5hHdXXPuaPlscLZy4wiabHhEjUgZ1
	cklZ3/Swc57aHXZR3bJsSnpaZ4W+hZxCfsa3RY6tZItpGxhIi//qCwLhm5dnlBqjJhhHjtu7ChO
	sl4m26RWvvpjoL+KHXC2vZW7NCtIZVTUtBxwGg/JYXJOYIoV+YRRJCu7crC+j+fvRPc7KOASgOg
	DiZef3+R/BWw9hYjlc/Zg5UaA4vLXWZhA6W/B3QbueqJd8N78Ixp3xsRlWafaWpAnncNAm5PW7M
	8jwBY2VQFkIjvC5Ngwx4I/uUwjIfD/14S9blFLoWdl/ziEgvI5+GK/w4T7tNvGFEEeMGB5g4Gz3
	ku1ETUetzW3Hw98Z0hefGI2ppjcpSfRIqi6VGGp47B
X-Received: by 2002:a05:6000:250a:b0:43d:4c:229f with SMTP id ffacd0b85a97d-43d150e161amr13806399f8f.44.1775139592291;
        Thu, 02 Apr 2026 07:19:52 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm8459818f8f.27.2026.04.02.07.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:19:51 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] kbuild/btf: Avoid relinking modules when only vmlinux changes
Date: Thu,  2 Apr 2026 16:17:16 +0200
Message-ID: <20260402141911.1577711-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,kernel.org,fomichev.me,google.com,atomlin.com,vger.kernel.org,suse.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12607-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 92E6638A647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled
and pahole supports it") in 2020 introduced CONFIG_DEBUG_INFO_BTF_MODULES
to enable generation of split BTF for kernel modules. This change required
the %.ko Makefile rule to additionally depend on vmlinux, which is used as
a base for deduplication. The regular ld_ko_o command executed by the rule
was then modified to be skipped if only vmlinux changes. This was done by
introducing a new if_changed_except command and updating the original call
to '+$(call if_changed_except,ld_ko_o,vmlinux)'.

Later, commit 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some
in-kernel build artifacts") in 2024 updated the rule's reference to vmlinux
from 'vmlinux' to '$(objtree)/vmlinux'. This accidentally broke the
previous logic to skip relinking modules if only vmlinux changes. The issue
is that '$(objtree)' is typically '.' and GNU Make normalizes the resulting
prerequisite './vmlinux' to just 'vmlinux', while the exclusion logic
retains the raw './vmlinux'. As a result, if_changed_except doesn't
correctly filter out vmlinux. Consequently, with
CONFIG_DEBUG_INFO_BTF_MODULES=y, modules are relinked even if only vmlinux
changes.

Additionally, commit 522397d05e7d ("resolve_btfids: Change in-place update
with raw binary output") in 2025 reworked the method for patching BTF data
into the resulting modules by using 'objcopy --add-section'. This command
fails if a section already exists.

Fix the unnecessary relinking issue by also excluding the normalized form
'vmlinux' when invoking ld_ko_o. Adjust embed_btf_data() to first use the
--remove-section option to remove the patched BTF section if it is already
present.

Fixes: 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/Makefile.modfinal | 14 ++++++++++++--
 scripts/gen-btf.sh        |  6 ++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index adcbcde16a07..2981745a172f 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -54,9 +54,19 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	$(cmd);                                                              \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
-# Re-generate module BTFs if either module's .ko or vmlinux changed
+# Build final module objects.
+#
+# The *.ko files are usually independent of vmlinux. However, special handling
+# is required for module BTFs, which need to be regenerated if either the
+# module's .ko file or vmlinux has changed, as vmlinux is used as a base for
+# deduplication. Consequently, vmlinux is included in the rule prerequisites.
+#
+# The regular ld_ko_o call is conditional and is skipped if only vmlinux has
+# changed. The exclusion pattern used in the if_changed_except call contains
+# '$(objtree)/vmlinux' to match the exact prerequisite and plain 'vmlinux' to
+# cover the case when make normalizes './vmlinux' to 'vmlinux'.
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index 8ca96eb10a69..6d4e629c79ca 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -104,12 +104,14 @@ gen_btf_o()
 
 embed_btf_data()
 {
-	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF ${ELF_FILE}
+	${OBJCOPY} --remove-section .BTF \
+		--add-section .BTF=${ELF_FILE}.BTF ${ELF_FILE}
 
 	# a module might not have a .BTF_ids or .BTF.base section
 	btf_base="${ELF_FILE}.BTF.base"
 	if [ -f "${btf_base}" ]; then
-		${OBJCOPY} --add-section .BTF.base=${btf_base} ${ELF_FILE}
+		${OBJCOPY} --remove-section .BTF.base \
+			--add-section .BTF.base=${btf_base} ${ELF_FILE}
 	fi
 	btf_ids="${ELF_FILE}.BTF_ids"
 	if [ -f "${btf_ids}" ]; then

base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
-- 
2.53.0


