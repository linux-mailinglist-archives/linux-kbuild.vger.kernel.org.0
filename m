Return-Path: <linux-kbuild+bounces-12309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PUKH57OxWm5BwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12309-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 01:26:06 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76A33D88F
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 01:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F13BE300E3C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 00:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25E71DBB3A;
	Fri, 27 Mar 2026 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYp9d/xu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7FB15A86D
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 00:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774571081; cv=none; b=hCspsn88yKGk75REX2pQD/rryw7cWPjz+sPIDev0MiqNEnArMJTby33HC18dMWFv31hvEDTEzRMqg4/FcYLIo+6YHECyOTpy+Nqsk3X2SCZmQbR8txuvKAxu2QfGiFW3r9fPGOyGOdHsu7Lkla/VpVlLMoQMUoz9ZHmFv3skRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774571081; c=relaxed/simple;
	bh=ivzse+/nAXb7ib7teE4Nq/4iaSLxuqNcf6yPItUPve4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FFwU5IQ1m6cdu0Z+m0er5Sdr+fiZ9SPCaxRNKMN9U+lS9OoRbeqcBYbTUrbKdD49HuLyDCTQHxGZJdFoJCil5dqQyi/4LDWdwSfmzpA7LK/6ee+PhgQgpThyTJCJe58CL1aoM5ShHCLgnQpDlhprvctIN+r2fQUUPspzCJFclfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYp9d/xu; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76682834a3so691394a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 17:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774571079; x=1775175879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UWsMQjWV2vPlmAZwr13SnFrA1+Vxf9k10ooF0s0GV8M=;
        b=LYp9d/xu1MijBaAr8aeomMqU4zoKAnFoAy4opoqJSPbNCYljKOzagUOiKCKnuq8qNb
         ecn3SfIq0SOLsa1Qvc5Rhxv53V1diJrJGs7OFVrf3zIVE/JlpydmgA1JLLSntiHxdL2Z
         DIdOAglL8WosTVWFcZJv9AqJ4pLNj03oiJN16hRcZ+aB+QTiIgj1MdWeyQ8qKcsS6DEA
         BzOq4qVe0NxfcZlBl2lBsQ42ewiEib3fXZfMq35VBXIO0Ai7Nbqj8u1lkGEA1yKUy1Mx
         +Q8kUbOUd9iD6SodxEIVKq2yRwCkbfem2VroVu/9BU02OM+OXouaLDWsUkPK0IjVh/+0
         0rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774571079; x=1775175879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWsMQjWV2vPlmAZwr13SnFrA1+Vxf9k10ooF0s0GV8M=;
        b=STCTthXveaibat5LF5IwWRyFtoNja6NMOdtx6qnznMR2dpVB7AocFEO23cIBJhLMrb
         hKXzNo4Y13dN9U6SBvclAZ/njVAL6eCipqHNAR4tswzDUBpZQxhUhSL2mXm0QSNRxYdh
         jmWVk2JjxdrA239ofi7N1alNbYYdrwI4Il/7AhcvwKyTd5ZAQJpMcMZnP6/bYTGaiZV8
         xLC/jR393hJQerL/Kz/pHl864gSuriHx0OcMZTGSmJi4huP2a3oHFQkoD6KRLoyFNgfJ
         ESrwPR5KCjBdK/1aeQa1AEIcqmsikYCHiKGLI2s6XLAnqV9AEvv93/rTHUwBc7YpT0Ev
         ylRA==
X-Forwarded-Encrypted: i=1; AJvYcCXKwY1hr+ysLhykMEMRu3NpZ/GYJdnM8RDmWQ5dsZ3USRclVAoqPiiYTItqhLXnzn06zvLKpfoc5ru5TPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWLD5r2BwLlaMj1I5UsolX9qbgPW8Emwf9MNwoUYUhngsWFOK
	sg/8EpfIn4O7+hIT2d82BlmlfhuE8m0jjCR9zfOk3NtNT2E3bK2zbF81
X-Gm-Gg: ATEYQzyNlW2nrYgW+jEyeOQCbmhnxmLXruIQG+uFCwSI+yQxZmaUB9mpM82AHtPaqEt
	VFGJCMOQU39MPawvczGfYcsjkhbBOmFrMc7xDiZKzaElG1jOMKcFK1z1U3+LfM29zjYMMrk7rCJ
	ysxLt5jl0tSeLUjNDxptUFQxalHZ7vjmGVl+6nMto9vW2JjglYXrf/ir7MiAzt0+cwhzII5UVwf
	5vL3FRERYpDR3WfyPDK9K1/sQt0EU8DUAq1nEElLU80B2RTVupk2RTUEQ/Pfv7slzEcI4bRj9ib
	Kfwi+dOl0Mm6M9/C0XiD/0j9APjzmGJUHGIkLIk10+ubdizOZWKG4NuX68Q5pg5aMlR4LatKuNh
	sNDHW/I+S7N7jUETPWTd3TYkWkuYpvcaH1zWDQzRwGwNtkuZGe7ZBlK6z6w0EwpgJQXzj3m+oJ0
	INn2hpknSduxle23Q6OtTuW5V/Q58pqsKRgDSctMf9fwjnF7Hljzl73G81DkqepVcHadirhob1h
	Os=
X-Received: by 2002:a17:902:ef4c:b0:2b0:6ce3:8f7 with SMTP id d9443c01a7336-2b0cdd14590mr5120905ad.43.1774571079318;
        Thu, 26 Mar 2026 17:24:39 -0700 (PDT)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b936sm41568675ad.11.2026.03.26.17.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:24:39 -0700 (PDT)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	nathan@kernel.org,
	zhidao su <suzhidao@xiaomi.com>
Subject: [PATCH] kbuild: fix decl_tag_kfuncs gating to require pahole v1.27
Date: Fri, 27 Mar 2026 08:24:33 +0800
Message-ID: <20260327002433.4138813-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12309-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soolaugust@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB76A33D88F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

decl_tag_kfuncs was implemented in pahole v1.27 (dwarves commit
72e88f29c6f7 [1]).  However, ebb79e96f1ea ("kbuild: bpf: Tell pahole
to DECL_TAG kfuncs") appended it to the list of --btf_features flags
already gated on pahole >= 1.26, making it silently inactive on any
pahole v1.26 build.

Without decl_tag_kfuncs, pahole does not emit DECL_TAG BTF entries for
__bpf_kfunc-annotated functions.  resolve_btfids then skips
process_kfunc_with_implicit_args(), so KF_IMPLICIT_ARGS kfuncs keep
their full prototype (including the implicit aux parameter) in vmlinux
BTF.  BPF programs loading such kfuncs as weak ksyms fail with:

  libbpf: extern (func ksym) 'scx_bpf_create_dsq': func_proto [N]
          incompatible with vmlinux [M]

Fix by splitting decl_tag_kfuncs into its own >= 127 line in
Makefile.btf.  Add a PAHOLE_HAS_DECL_TAG_KFUNCS Kconfig symbol so
build rules can gate on this feature explicitly.  Update
Documentation/process/changes.rst to reflect the corrected minimum
pahole version for KF_IMPLICIT_ARGS support.

[1] https://github.com/acmel/dwarves/commit/72e88f29c6f7e14201756e65bd66157427a61aaf

Fixes: ebb79e96f1ea ("kbuild: bpf: Tell pahole to DECL_TAG kfuncs")
Reported-by: Ihor Solodrai <ihor.solodrai@linux.dev>
Closes: https://lore.kernel.org/bpf/e0ca748d-3204-4160-b37d-0f76cbac8c6c@linux.dev/
Signed-off-by: zhidao su <suzhidao@xiaomi.com>
---
 Documentation/process/changes.rst |  4 ++--
 lib/Kconfig.debug                 | 10 ++++++++++
 scripts/Makefile.btf              |  6 +++++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 02068d72a101..bfe98e38c9c0 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -38,7 +38,7 @@ bash                   4.2              bash --version
 binutils               2.30             ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
-pahole                 1.26             pahole --version
+pahole                 1.27             pahole --version
 util-linux             2.10o            mount --version
 kmod                   13               depmod -V
 e2fsprogs              1.41.4           e2fsck -V
@@ -145,7 +145,7 @@ Since Linux 5.2, if CONFIG_DEBUG_INFO_BTF is selected, the build system
 generates BTF (BPF Type Format) from DWARF in vmlinux, a bit later from kernel
 modules as well.  This requires pahole v1.22 or later.
 
-Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.26
+Since Linux 7.0, kfuncs annotated with KF_IMPLICIT_ARGS require pahole v1.27
 or later.  Without it, such kfuncs will have incorrect BTF prototypes in
 vmlinux, causing BPF programs to fail to load with a "func_proto incompatible
 with vmlinux" error.  Many sched_ext kfuncs are affected.
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 93f356d2b3d9..38ef8b6ce98d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -425,6 +425,16 @@ config PAHOLE_HAS_LANG_EXCLUDE
 	  otherwise it would emit malformed kernel and module binaries when
 	  using DEBUG_INFO_BTF_MODULES.
 
+config PAHOLE_HAS_DECL_TAG_KFUNCS
+	def_bool PAHOLE_VERSION >= 127
+	help
+	  Support for the decl_tag_kfuncs BTF feature, which is required for
+	  kfuncs annotated with KF_IMPLICIT_ARGS to receive correct BTF
+	  prototypes.  Without it, such kfuncs retain their full prototype
+	  (including the implicit aux parameter) in vmlinux BTF, causing BPF
+	  programs to fail to load with a "func_proto incompatible" error.
+	  Implemented in pahole v1.27 (commit 72e88f29c).
+
 config DEBUG_INFO_BTF_MODULES
 	bool "Generate BTF type information for kernel modules"
 	default y
diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
index 562a04b40e06..c804643c5040 100644
--- a/scripts/Makefile.btf
+++ b/scripts/Makefile.btf
@@ -14,7 +14,11 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsis
 else
 
 # Switch to using --btf_features for v1.26 and later.
-pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func,decl_tag_kfuncs
+pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func
+
+# decl_tag_kfuncs was implemented in pahole v1.27 (commit 72e88f29c).
+# It was incorrectly gated on >= 126 by ebb79e96f1ea.
+pahole-flags-$(call test-ge, $(pahole-ver), 127) += --btf_features=decl_tag_kfuncs
 
 pahole-flags-$(call test-ge, $(pahole-ver), 130) += --btf_features=attributes
 
-- 
2.43.0


