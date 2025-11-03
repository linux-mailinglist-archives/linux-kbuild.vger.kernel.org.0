Return-Path: <linux-kbuild+bounces-9373-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A143BC2D1F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 17:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF5E4425287
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 16:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182E23164B7;
	Mon,  3 Nov 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJu4fRlT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4E231691F
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186806; cv=none; b=tIBQhNOseqqDuYV+ap6spJAMwhStV89IxlB/KJR8/oDEiBDnritv4GHXHNnYnkpMGLfafZPGiYybe0PIrD3zOe+CYXGdEuc2i+3ne5Y7cI6dKAk0ZMDjLa34lpulJArPWfyIxsUr3OnyRbi8nrN68HqLDiAm5OOEa2jpSt8ql68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186806; c=relaxed/simple;
	bh=/5wAYAreFX43kAUmx0C0owVCwGfgfUmGJQjEtp5PpmU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YDxCYFmrUSlKMGspjpdUplnQH10N0xKeuXsyRGWOPofVRwKKurPpXG+EfRSMgQ16ImpwJmGdUCvhlYNdpubR1OpxX6xo9xj91/yryBjRIteGtNOBq7gqxS6BgmtSBUC/WmniLe/KHQ9iC0tBrZ7tb0lo63j1yfhYWYfE+JWVQJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJu4fRlT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47106a388cfso36920005e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 08:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762186803; x=1762791603; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftIFzkEm1zjsUR3x20qQ2ikS9QsKBzHYJMroz5LF+Dc=;
        b=UJu4fRlTIAtrZ7NFRQwUJeBxNsfxMBET1Qvx9Ec2jMjSfb3X2AUQHuN0/H2xcOTlem
         0J3ixvJSyFWjTrdhHfrL97EyhLoSmR7lHpB5h8ThvVM7Dr0CDYUe5DJot1+I1/bWdb6i
         /dIgQmXayRmHP5g8xmOiXMS81VJXH2MRS8NU3MPRalTPGIMbdqK1VYkyLzK+ZXAu2aMz
         D8voxAOBBqZAVdgMJzuU8wNxXNgQ4sEAsW49Tf3EtAheFRYutjyBZuyJkOQfoxY2/9Ur
         /4w5lVkHEpuM7mzFy7cP6v2J6EM2ss+FjdlwAJb/31yvD7l1q32P2LX8q6y1LOd/z6F6
         vPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186803; x=1762791603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftIFzkEm1zjsUR3x20qQ2ikS9QsKBzHYJMroz5LF+Dc=;
        b=qqr5KJDG77Kii58nFwKWRH4pGO71EFyFDvhMhaVGybeVr41ZgRbEcag25Y9XHOb5/b
         xNqB3efhZFy9uSUnbTNS/M99VykIgj0f788Kpwv39UA2RoVpszX6bhfQ5rcfYDUD1I8p
         KIGL8kjio0XjNM+qwE2moIO/C9wNyW6+rLS4tW4GFF0Z3TSlD6/Nr2b+FB82P7fgQZTz
         wFoxBgcsZZn8hhpU+q4rreJPNsZ6BXS2OgpGh/xaBoTz8tgjTQzm9BDUlYRWt3iFh9vb
         xZRh9c4xkVF0Q0BogYIf07ZOydlugtfb/dRU9JIg7UCPP88EKPdp1vqFGipTE3OXZAMC
         9jaA==
X-Forwarded-Encrypted: i=1; AJvYcCVH3ut4KIEcLovc8lR48k7C7mZ1y4lMDSvrc781AGMF22RmrPiuQy6/zMJrSdOGE7HhQZHQbZiq0M4Irhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0zJu4rglCcei0tdvRYqNPdFyq22MPsfe4G+Kb0RiQuu8cTQf
	clNKP/dg2bZZWTfcRyXkBFEcRJKK14unfQel9Sna0CCLGjOKMKpbjfn+YnjelWsbw8bePs5Hel6
	vaAPY7fCasFuWWwQPEQ==
X-Google-Smtp-Source: AGHT+IGECLnp+Wa6r4Tdn5YaQ0l1JnV9PG0t+Gh1GDl+yBw8QkV/OxuaBN7aNEBYUrBG8kD7+TwvFiS8NMYrRcQ=
X-Received: from wmkn22.prod.google.com ([2002:a7b:c5d6:0:b0:476:9bb8:201b])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524e:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4773089c6a2mr132957575e9.32.1762186803282;
 Mon, 03 Nov 2025 08:20:03 -0800 (PST)
Date: Mon,  3 Nov 2025 16:19:47 +0000
In-Reply-To: <20251103161954.1351784-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103161954.1351784-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103161954.1351784-2-sidnayyar@google.com>
Subject: [PATCH v3 1/8] define kernel symbol flags
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com, corbet@lwn.net
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

Symbol flags is an enumeration used to represent flags as a bitset, for
example a flag to tell if a symbols GPL only.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module_symbol.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
index 77c9895b9ddb..574609aced99 100644
--- a/include/linux/module_symbol.h
+++ b/include/linux/module_symbol.h
@@ -2,6 +2,11 @@
 #ifndef _LINUX_MODULE_SYMBOL_H
 #define _LINUX_MODULE_SYMBOL_H
 
+/* Kernel symbol flags bitset. */
+enum ksym_flags {
+	KSYM_FLAG_GPL_ONLY	= 1 << 0,
+};
+
 /* This ignores the intensely annoying "mapping symbols" found in ELF files. */
 static inline bool is_mapping_symbol(const char *str)
 {
-- 
2.51.1.930.gacf6e81ea2-goog


