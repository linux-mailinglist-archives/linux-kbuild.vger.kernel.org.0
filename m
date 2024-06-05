Return-Path: <linux-kbuild+bounces-1990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C28FC26F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 05:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864811F2623F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 03:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F195FB9A;
	Wed,  5 Jun 2024 03:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRoHsDGB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03922450FA
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717559352; cv=none; b=AvCnFASpbIpURThRGf4HzzZldHMbahVX/mN6t/8QP2MHifFgxVL2Xx1Xbc2leYkw2thxtixoaInA3K5xjNE4coMeiLzHtsrkXRg4f0zNo18lMkG2Vljb61aEyf441alfKolCKP94MO24ZigVsjCKMXtcN94H/4nfELGCGFjWiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717559352; c=relaxed/simple;
	bh=K2EGQ0v/E9RN26HRgdwoRIoseREVjzGba6IP1ErlP8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnsR5B5VirkeFk1qbmbbYDIR6Gg1TJxKPd5hP/kTns5PGo5upat3TjggJea1ZPSx2zdI01b883FKHAPbdor7eBb2+MWfENr477D2LMRsmFs6w/QyXNsihKmNjL7+cSiZTyKHArw8VwpSgiEzqmjxvTzgDUg1PqjCPS38QwtIvJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRoHsDGB; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43fb094da40so4282051cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2024 20:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717559350; x=1718164150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4brXEZdo8YX8iPoVHZn64bp3SpwHnG72R9oxlQQCZQ=;
        b=iRoHsDGBSNKJur5uobbXT28QMh+CBUqsPpS5x0HR/pSkZt2UQyksh7qBZ9gG32zd5/
         0CNt9rzwWXMJ1S1NuKEJ/j/StgGeKnNmpl/QT3sr386fieoic5lw+rhNM0FXHrGaImn0
         IDGFiFsuHFyAZl8gOt98didc/+nuRYixOPXNqHgaDXszzCoXK6lMfqiLNVjUCbi12RBj
         pbqrz2rbRsARQhKBCRwYOe+ITRL+OpK8U/UnoNEOV5fIw12p1qpwrviJ0nl4t0wBJDU/
         dW34MW8J9By/qU73n7C4Yx3TSV7G28ErzRQ89ER1EMerjJ/Zw0f9TGEdZQCamCWc6lEN
         dMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717559350; x=1718164150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4brXEZdo8YX8iPoVHZn64bp3SpwHnG72R9oxlQQCZQ=;
        b=CbHat9vBE3JKfN7c8w7LH8A8zmp81FJvQOzSUeN40pYm9JqmaM0JDNxW5lUz/NNHqh
         QjpKQDcQF8s5Pk3nf1qIPcDg7olUNB3M2J6bh7YE0ZJXVhRjANH5SH5EdwXCQ39VJy3V
         0KgBbvOLrHBndNm1Z51C6oX8HzghjpJb7fsH9nBeqi1uJwDlrmpVPv+BQMgILZLP2rHH
         +eBtjS935TeCh78JnQjFjA3eHzDX2A830Jr/yJdg6/dIb6lxAWhfeRqdeozg7mhs5KFb
         cVUcivJJqRk+G3BvZr4/2foR5/zFQrwokIAup028QrVNjwH32NZeu9dJXpXgjY0wP6k+
         e/jw==
X-Forwarded-Encrypted: i=1; AJvYcCX7DFzlhLXzIS8yHaInIlloqLvjGmySpEEpjsW6an2PAvKnzZU3X6Ce8gqP+tRbJIng90P/Lxpxv/YLCLl3tgilIneeBL7wLd9BVfYf
X-Gm-Message-State: AOJu0YyvjkdV/ZLB5LbyXcENH7DU5+FZy+W4z0MzlPXjXVVK5YkOSIbO
	PUNCd1vqk5rxLWE9l6BX0wOR6m8qk+hQYFf1phe676Ndg4dD58r9
X-Google-Smtp-Source: AGHT+IHBGRsNkn7+pEacvOhbuP55jjSdRfK2AVjTPosjbR9pcz1PzR+cWGhCq3anOWS/4KaosT1iTA==
X-Received: by 2002:a05:6214:c62:b0:6ad:7562:c286 with SMTP id 6a1803df08f44-6aff72c11b3mr71451646d6.15.1717559349813;
        Tue, 04 Jun 2024 20:49:09 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a750298sm44934646d6.70.2024.06.04.20.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 20:49:09 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kbuild@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH -next] kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh
Date: Tue,  4 Jun 2024 23:49:04 -0400
Message-ID: <20240605034903.373617-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
script"), the mksysmap script was transformed into a sed script,
made directly executable with "#!/bin/sed -f". Apparently, the path to
sed is different on NixOS, fixed by using the env command.

To accommodate the number of arguments above the normal maximum for
hashbangs, the -S flag of env was used (as in
"#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
Explicitly use sed instead of relying on the executable shebang to keep
compatibility with build environments using Busybox.

Fixes: 973eca8db557 ("kbuild: mksysmap now works on nixos")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 46ce5d04dbeb..518c70b8db50 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -193,7 +193,7 @@ kallsyms_step()
 mksysmap()
 {
 	info NM ${2}
-	${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
+	${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
 }
 
 sorttable()
-- 
2.45.2


