Return-Path: <linux-kbuild+bounces-12967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALNcBEIA9Gn99QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12967-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 03:22:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E04A9993
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 03:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41D92301D313
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 01:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929829B8D3;
	Fri,  1 May 2026 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm5DZWZY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A02DF68
	for <linux-kbuild@vger.kernel.org>; Fri,  1 May 2026 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598434; cv=none; b=TNi33qubWHYNZN+lg9ROcMQALuAdIuuiMkkRl1jPFgkc5l0gwehPLY4jXTWKjo5GfapPNKXOS8KRF6yORl/EiU/tqSVtWyv4AwHT+iubQ9sw1L9Ok0Ex4VA6IBYFeurQIu94xgd701MIAxaWIKMdFaaXQBIWJL7lHdCAXeYjcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598434; c=relaxed/simple;
	bh=qa1J9tvRjf+hWZ+INskt6MJ6Obfb3oNzM1mRf0J0Raw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfEEEb3vWkE4ToLi6MmxHtXFR6HNYxrqsiKF2Nb4HoevyokzdX8NgSGA0DQkESRusUL3+vH3lZ8dPCDQlBvHRTGUvvkNzs2wlkCxHeswBu7n60ERZ2qHM/UWJNOVJuJy919ZUDUyduwezvxr5ZfV1obXVXjwKMbyD/D+qrcsmN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm5DZWZY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so1070580a91.1
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 18:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777598431; x=1778203231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mROi/W3aau0j0KmM7dptCO86NLdZrXDyD4jhv+28e+Q=;
        b=Tm5DZWZYKeVqfbNdrgSldG/2p1eUtyosuUu8CNXw00lW20IthM5EWKuik0Za5epMFz
         Q5mWWxzxl8WOSd1IegbhHQoMp30QB5h/yQwNcF4YYQrTlnWsc+LCB9qb1QnXG+wf3iL3
         e5Sp63Xcm4NLYc1H8c0I8+kv63pHSFSuvLyQj9Qa3EjMLiRu/vDZ13W/C6zKOgHedQYY
         Cjs42pilR7/vAn3TMtgUZtDICTNuQ65ZKCU+dPh3YsmhNMC7668PkloWeSg4/1WXx6C2
         mjg0R7hoxvA9V5k+hV8TPfbcY7xI70k/EoRlZ60Ckwkk2hVW3ceMwq9jT8gDwqnT/3As
         lN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777598431; x=1778203231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mROi/W3aau0j0KmM7dptCO86NLdZrXDyD4jhv+28e+Q=;
        b=e0o/bhq8/92JULpil8bo8BwGunpRTvtKprcPucxyawmVmvyBV7BFd/ZsazH57oJcLA
         YDRgL5dIYWUTlLgxVx4sM9B4gs5IS1rCkK0bXsn+2As6s8wappE1pYP7NxSHz7OEgEeB
         49R6cFGYPqfbnAFC0SJOUpp0g6cqP/U9hJ0227KwGDi0GnQFzM15d7Fxi0ytK8CsdJMR
         jQOkT7SqbJT1GoR4ImBZc6OPl/Gz0xC9e50oFYMexELv7P89EtKUlcyIwdmvTaQJ3/v6
         8rbZx8EdtLqbI22Jw4uX+jtmN4Hp6Mm1JvaqGypplZP4Qtt4Sb+uhqQJBfJ03FnQKil7
         xEfg==
X-Gm-Message-State: AOJu0Ywf1Fdg3EeXAZs20nuhVHA6X8ConECKOj2u/gsYHqhbNuAkkusX
	Lc4XfrltvP9vFiyVWWJYw2AK0Ta5Rzbh9qZWecfqaURWpV9ESRU3va7x69/cxy4q
X-Gm-Gg: AeBDiet6awIcFC5I3VqOUWQY3ypf1I3JZsS63N3Gr4Y1fzr/oh6/W6sDDSDD+mwRriQ
	jRmCAUR+kiaUJLLk+tx0N0pNX4o+Xu1hHIXIiTXU2DVqSQAVjqYFXUBB7vmnjJkGWQrZueNfK6p
	AcEZEv8vPdA4b5XJJDyyoK1itla/d2dDq9sHYI4SR5HW8Yt/y9MVTBytBMtWsG2lsKg77joLKfW
	m/J0tgQ1GvRiicpjlp+9sHu+B1r0T9flayugCPPSNxOJF6VlZTVihVGpScgtkYQv3XNXj3TkLPK
	R0gX6rT/L/QtJQYNXRdx12fyTUXkEUWFZsC1XdHwYA1l2mxnB17uXUg7EiYYDezebnR81w2HLV6
	I7J6DU4mlThI+njTcYGgtv6O9Kxt6VcZxwKjiheNcjxDTMOZbDDL+VDFkG8Ju7nNaxXLTcVuTbF
	lMh0+NDlhNvrmvlOmkHe/idiG97KpS/ueHedHK5WtOZE0X3fcaBdm8mOITFjYsjsnMBNETpYdyK
	Imd
X-Received: by 2002:a17:902:d2ca:b0:2b9:8ee1:73ac with SMTP id d9443c01a7336-2b9d3dcb90dmr8018475ad.11.1777598431493;
        Thu, 30 Apr 2026 18:20:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:202f:2568:587b:c36b:da6f:1410])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e84asm8472735ad.17.2026.04.30.18.20.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Apr 2026 18:20:30 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	Jill Ravaliya <jillravaliya@gmail.com>
Subject: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
Date: Fri,  1 May 2026 06:50:18 +0530
Message-ID: <20260501012018.43278-1-jillravaliya@gmail.com>
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
X-Rspamd-Queue-Id: 6B6E04A9993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,fjasle.eu,gmail.com];
	TAGGED_FROM(0.00)[bounces-12967-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jillravaliya@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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

Signed-off-by: Jill Ravaliya <jillravaliya@gmail.com>
Link: https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/2141741

---
v3:
  - Fix variable escaping in run-parts invocation
  - Fix indentation to use tabs consistently
  - Fix Signed-off-by name formatting

v2:
  - Resending via git send-email to fix formatting issues.
  - Refined commit message for clarity and professional tone.
---
 scripts/package/builddeb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3627ca227..21c929dd3 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -98,7 +98,12 @@ install_maint_scripts () {
 			hookdirs="\$hookdirs \$dir/${script}.d"
 		done
 		hookdirs="\${hookdirs# }"
-		test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs
+		if [ -n "\$hookdirs" ]; then
+			if ! run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs; then
+				echo "E: Post-install hooks failed." >&2
+				exit 1
+			fi
+		fi
 		exit 0
 		EOF
 		chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.51.1


