Return-Path: <linux-kbuild+bounces-13991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4nRbHT80U2obYwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13991-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 08:29:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE75D743FCD
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 08:29:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K7Q4EoV8;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13991-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13991-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5D13011C4F
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jul 2026 06:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C59369D7C;
	Sun, 12 Jul 2026 06:29:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D539B37104A
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Jul 2026 06:28:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783837742; cv=none; b=o0eqqPiJg920h9sy0ucdxCaQAW+8E6v2igTGTGSgS0vQWi5RDwa0rSdTMB9IDU1Ik274vXCHOBNbb0wC6Rp9ic9xzL4M5p7dRUOv4D6trba7K92Ny7Fn4LgYmYhhmgNNt3HE63rDNJkxoXJIEFKRdmtRFUnB5izSMGde/ISwLLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783837742; c=relaxed/simple;
	bh=2K/KkTjUhL2nqJ3NlPCO/aThziaUhz1j1o5yMyvHTSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1rlqn86cop+UxbXSy98IneRvT+aCGyR3J+hEp/QY/sy87f4dyiuPROwsa8J0xI1EM2bXoOESWdiMjDJpxgJ2Tn5flOGDVNqkt48RdPzLdQwypqoFsdXES7OtA6cEh0nl7XhXAIy4vdM8TqAzr7cr09KkC7U8AzvjvSGY5seioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7Q4EoV8; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso24256685ad.3
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Jul 2026 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783837739; x=1784442539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLn6r+Z8S2FKgSLoMy7A5DQNAUBY1hMIxhMu8ezOLig=;
        b=K7Q4EoV878Y1YgTmqDf/3ed5Ao0DivPzMImxvI/QxKyA85izWdO0xWHdviVZIKn7vF
         KCRFcfznQJwxrCsSYYS9sKm9Ux+tYAezTbFChpiPNDv/moA5uoZW9OjfHQ+6n7OUeSuZ
         QqYtktmfh8E2nrjFe2vbC8rH0ZVCNEoZ2vtwOctq5idL7gcWAdNBOm5dGt5+GDu0lx4E
         izftkwXIp4Lf5eQKdXY7BRFtjMOrNJephRE5exo2Vx6gBqM9gUwoQyf+fZT0XUKrJVQm
         05yZCQuYt4lXxtCMJ2ZrqgnO3UsOnVntRJbEN0naCL2LYKgwb1+24VfRw68w83vE+B0M
         pnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783837739; x=1784442539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLn6r+Z8S2FKgSLoMy7A5DQNAUBY1hMIxhMu8ezOLig=;
        b=bhoXvHpDFYUOy0Sry6ivscL+R9yRHhd6m4PIdSffHyH6q9dsouMz26TkAR9eYxO+my
         r/m5yWuvhdZdISo9mH12QFyExM/694vn2cGlUBftoV025DdcbZRN5EQl3dA/w/J1Zirm
         KLaqANe57jJFg7LqHumN+A5fZ8rPQePfOL+1oSbDN1a5q4ieHnQMZ22xa8xSQamtT+bv
         3JWBus+yjE1lXvO3ewpI/khT5cJ1brF0BvnMStO9nSbGcSruGjrBFjiT7V01A/qF88y8
         yPiiNl/BHe9ZeyinpvnlGeCqF0BqiI8msUlWq7xoOgAC7l2HOkGCuWHlvBCz2VnHfRo7
         BWDg==
X-Gm-Message-State: AOJu0YyG+rZPkFcffBv3c5Sdzu12C0kwHMMmEPhNjSRgLYdoljSF9YBt
	NNvpf7c1aVMxT50IzeCrO5jz5sK3hPR/Ik7S52yxUF0u9uKMVlKu7hFd
X-Gm-Gg: AfdE7cn/dnbeLb9kbFCw0rC3AEPHIkuWwLRmODY5ehxEKOA2g7rs9XRIT9dOHc3OLmD
	W8ldin6gbZvYqA4Raeqs9XEaI1+JQTnfuYFwKgNh45R+r6EXzOcKVwNJrjzFHca03RDV8/8QgOv
	Y/XacwYjP60FehcVMQkriIhkGS6kC1Kf0UXxGMDsAyDiUMRhiU0/7nLdv+4QSNBAk6VCBrDCdOY
	sEP1ktAwbuB7FTiye1G5ljzsxrFrz5Wk4UBZ0i5obpRdCOYKfF4tpbC5S1/ZXZ6fcPKyG9xpLC4
	6hBB8gF5RZ95w+iglYnoIgcUyZS5sCL+xXg4HrZ9JyGiWLkikBN2uYaOuhfoBNWQH+r58iYXZ2F
	sH5iSSrrB7AQ/SF08aO1wHtVY6nBNWOUL0Va5/llxOgMN2j6rW2e9xdupMBtKRWveg46bIN6dlY
	Q5l8hnyf39W/RU+qQ6gt2OToAPhcQU+4+gdE7OY0fQQp4nwHL6JSql8hrjTsvVypo9B9qGidDjI
	E1XE4zlQoQ0X02GPOI=
X-Received: by 2002:a17:902:e808:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ce9e79f45amr50552315ad.2.1783837739080;
        Sat, 11 Jul 2026 23:28:59 -0700 (PDT)
Received: from localhost.localdomain ([240e:46c:a300:12ed:a5f4:d452:8dd:52e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8f26sm83270835ad.27.2026.07.11.23.28.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 11 Jul 2026 23:28:58 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH] kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo stripping
Date: Sun, 12 Jul 2026 14:28:33 +0800
Message-ID: <20260712062834.77872-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13991-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:laoar.shao@gmail.com,m:laoarshao@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,find-debuginfo.sh:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE75D743FCD

After switching to the kernel's default package scripts for our local
kernel RPM builds, we noticed that module BTF entries were missing:

  $ ls /sys/kernel/btf/
  vmlinux    <<<< only vmlinux, no module BTF

Root cause: find-debuginfo.sh (from the debugedit package) prefers
eu-strip over strip when elfutils is installed, which is the common
case on RHEL 9. eu-strip removes non-allocated ELF sections, including
the .BTF section that contains BPF Type Format information for kernel
modules. Without .BTF, BPF tools (bpftool, bcc, bpftrace) cannot resolve
kernel types at runtime, and /sys/kernel/btf/<module> entries are not
created when modules are loaded.

Fix by passing --keep-section .BTF via _find_debuginfo_opts, which adds
-K .BTF to the eu-strip/strip command, preserving the .BTF section while
allowing normal debuginfo extraction to proceed.

After this change, all module BTF files are properly generated:

  $ ls /sys/kernel/btf/
  aesni_intel         drm                 i2c_i801            mfd_core
  ahci                drm_client_lib      i2c_mux             net_failover
  backlight           drm_kms_helper      i2c_smbus           pcspkr
  ccp                 drm_shmem_helper    input_leds          qemu_fw_cfg
  dm_log              failover            intel_rapl_common   sch_fq_codel
  dm_mirror           fat                 intel_rapl_msr      serio_raw
  dm_mod              fuse                irqbypass           sunrpc
  dm_region_hash      gf128mul            iTCO_wdt            vfat
  virtio_balloon      virtio_console      virtio_dma_buf      virtio_gpu
  virtio_net          virtio_rng          virtio_blk          vmlinux
  xfs

Assisted-by: Comagic:DeepSeek-V4-Flash
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 scripts/package/kernel.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index c732415662ef..abc73de019e0 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -67,7 +67,7 @@ This package provides debug information for the kernel image and modules from th
 %undefine _unique_debug_srcs
 %undefine _debugsource_packages
 %undefine _debuginfo_subpackages
-%global _find_debuginfo_opts -r
+%global _find_debuginfo_opts -r --keep-section .BTF
 %global _missing_build_ids_terminate_build 1
 %global _no_recompute_build_ids 1
 %{debug_package}
-- 
2.52.0


