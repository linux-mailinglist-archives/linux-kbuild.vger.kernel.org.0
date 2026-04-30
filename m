Return-Path: <linux-kbuild+bounces-12947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLdBGIIZ82nNxAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12947-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 10:57:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2549F88C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 10:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48A693009F9F
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794363C9EE4;
	Thu, 30 Apr 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0QXqJ/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735525A2A4
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539318; cv=none; b=pxNHnHCWg+UwW1j7fyPkzESZ3DZuQTE8UHZsJ6aC2crI4ZsyrtvNYLJQD7kbE3EUaqFUevqKa28LyiNoakLempRTzfl1ttZWfsFp5ZNmlNPxXhjzzhmv3OgjLX2FoEDg9J9B3DDFxK1KgdoD4TpbCpRNGlC4jkn5FTBqPLdJrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539318; c=relaxed/simple;
	bh=k+repuCid/29q5WexcHLmTRTBLtDByH5LzJcLpPbhWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P7mVIp9HpfsByIFp3N3yhd3085loAhBzg9UWRDpIBYSyX4TyVk+CpH+Bmk0fqeYwjOB3NSamgw4RG/1X7rqNPP7b2ENLLx26yWmGUY56vxboZ6QmXNahnUe4BuW4djlYMlTEHpdUdPb12ddgl+YqbENZr9UpGXvhvbTCqpNtiUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0QXqJ/X; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35fb16e56efso406097a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777539316; x=1778144116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7Kav7Rl3BLHZWXcdvNYD2yMsdiQpSzKe+3r5sVARL4=;
        b=L0QXqJ/Xe10PxrbyW6QmHfu9Kx7HrDJKsq2uACHRrd6/dImCtWDWs7R6qLfg6IeSU1
         pziOslAjqHUlNh+SUeFsNp6S+2Z3tyE2ZWO0w62ZtSHjskfqlQAfTAyy7XhzBZjRGPJs
         9dR+Yng24acJkP/cMKatmc57a9p1wnVcf4PQaGkeCYY+PflYwBtenknSGVT5weHsMOkB
         JV18btnDCuGxsJVqAeUsnakPCBwz1ybLCKzeFH/YTPvNskkiHf+DSe717OBVQvNahvBN
         GXMvVTktWUPdsDG+uVl5LdZm4IcfbYQhjkB5GMBmILtwE8N6+/cYtbibzidO+Putuhir
         ebww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539316; x=1778144116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7Kav7Rl3BLHZWXcdvNYD2yMsdiQpSzKe+3r5sVARL4=;
        b=WsUCw2yfB+LI/y3UKBciLddf872Rmw1CSD3CwolNzThHafqAs5LwxZ4nrld5oIeKae
         Kb8GwMxLck+YgNJbHP8CnyrMUStfBu3V9EVk9ioysdzkZ1xMhSMmMwYCPtExJtbFPLl7
         eHO6sQZBGELdIQ+rh32heE9tqsCsR7IzVlYSDaHnFoMhB6rwGqZH0qKmHK7XwvgXkzhC
         HLEB4XYRj6y6mjgXeD+6iOIrJHYndzybZz6pgNBwIT6oy53135+a+ypJ6ehKy9tW1/0F
         fGj/WKo79wOWkOXXyQNwqq5kokwoRgSsH/MBtIohoMdcwsB/gtgmf5/Il9eERevZ6iIc
         S6Cg==
X-Gm-Message-State: AOJu0Yzf0Te7QOtY5nRFJzpG9By29NCEQ52GC4tg0fSeiX/pEwAbONak
	1ZP+N5Rnx7wEIt5X4vBFcUj6j7/fsBMHoKrbVvZvfSCqyzkRGMx9ZrxiZ91yvovl
X-Gm-Gg: AeBDieuTmq7mkJZeEGNLI+HfIdX3ZHv4dP9qHNSOv0Qj4mNmdOLado4dJR5SCQgnxoK
	xejv3Dhopf63N8xxoDl4DahYxZ8NNCP3s6/0pjDXM2KVtXsMF5KLVc+WfpN7B09C734qUSix7YX
	IXLtoi8TCBvTJ4kWeDQ22eTLPbJyQW6P5kS2n0vMoxueRDuzid9Dxk4MyDwKyfjKfm85lJDcchq
	oNp0GWgALOflplXEcOP0iUM6opIFiC12/cKIDIejSwBDUXgaanOtzoo8xk0BA8pl7QM0s3+GnfT
	B8K0JNIPKvhj1uYn67dwI1jLxCY/FssnSLTD0AqQbRStkXxKuJuIBJShLwpknC8gSfr7XQaQ8Xe
	6/ZcZ70XMrWCWX9+iCTFBo8TpnFCFChlTJGeijxKjiANKQ3qOeZacnTMnvEUxSdvbw0XBk1AtIe
	dyB/WOw2M7KCJFQxrQTOxP/EVVQav8D82RxJfP0VgTqaPmnmfweQLwWz6rt3MV2WUX6oT9pmjKn
	7+J
X-Received: by 2002:a05:6a20:72a8:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3a3cf6493e7mr2547377637.21.1777539316487;
        Thu, 30 Apr 2026 01:55:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:203b:4e5a:69a9:1581:4a4b:2636])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6cf4asm4290255a12.2.2026.04.30.01.55.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 01:55:15 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	Jill Ravaliya <jillravaliya@gmail.com>
Subject: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
Date: Thu, 30 Apr 2026 14:24:42 +0530
Message-ID: <20260430085442.35666-1-jillravaliya@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
References: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4B2549F88C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,fjasle.eu,gmail.com];
	TAGGED_FROM(0.00)[bounces-12947-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jillravaliya@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,launchpad.net:url]

The 'builddeb' script generates maintainer scripts for Debian-based
distributions. Currently, it invokes post-installation hooks via
run-parts but unconditionally exits with code 0. This masks failures
from downstream hooks (e.g., initramfs generation or DKMS).

On systems with modular storage drivers (CONFIG_BLK_DEV_NVME=m), an
unnoticed failure in an early hook can prevent the initrd from being
correctly updated, leading to a panic on reboot.

This patch ensures that failures in 'run-parts' are correctly
propagated, allowing the package manager to abort the installation
upon hook failure.

Signed-off-by: jillravaliya <jillravaliya@gmail.com>
Link: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/2141741

---
v2:
  - Resending via git send-email to fix formatting issues.
  - Refined commit message for clarity and professional tone.
---
 scripts/package/builddeb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3627ca227..6ea768f08 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -98,7 +98,12 @@ install_maint_scripts () {
 			hookdirs="\$hookdirs \$dir/${script}.d"
 		done
 		hookdirs="\${hookdirs# }"
-		test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs
+		if [ -n "\$hookdirs" ]; then
+                    if ! run-parts --arg="\${KERNELRELEASE}" --arg="/\${installed_image_path}" \$hookdirs; then
+                         echo "E: Post-install hooks failed." >&2
+                         exit 1
+                    fi
+                fi
 		exit 0
 		EOF
 		chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.51.1


