Return-Path: <linux-kbuild+bounces-2327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B077924C38
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jul 2024 01:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1772F283E1F
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 23:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7228F17DA2F;
	Tue,  2 Jul 2024 23:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmlWu7V6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A305E17A5BD;
	Tue,  2 Jul 2024 23:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963650; cv=none; b=dUE8K+GDLkFhn1OlcsXV+a8WabfAVlc9/K8NPLQtSxMw0OK+SR+Sp9Wi9EpSP3LXPwJF6I2uxZFmRuCJpKEQpV/ayL/6bCJxP+HF7bx94LMyBGa3Q0YUSiiQhegLwmswZWaj5fLghT6dR4w/xpWH8elN8k5Qe+oypl9Mx2bc+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963650; c=relaxed/simple;
	bh=RSGpa93/BjrySJgA4hKzJdFLTDJjEWm8H0xldhPOJOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iWa/jmz2YA4ehxXegJ3LnIs14BYxze0g3ATttTuhjcbfuO0zpZJpRHNLeqNCFdz1IzhNVyGZl7lL5k/RS631WvVrRgKVbP6TZUZaM6GL7r/MQmgp7N7akYYcanu/1p7fws1hl+cakH+tATNu/grhx9PUmayfG0REhHIbzc2zDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmlWu7V6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdfb69724so5872318e87.1;
        Tue, 02 Jul 2024 16:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719963647; x=1720568447; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flZpwFnHJZAIjKR4GYgW5NmzsJCUt0trCfVDgRJheOk=;
        b=lmlWu7V6zvpD0TinqkRxGx/kXHMMJGUTHXR/aPs5WcRSdkhHKgxtFb8p4o3D+qMjVI
         UbTchTshTx+qSlg8aIeXyBgMqf/cBZ0hxhaVnJGnbaODR/ztl6AzTLsD5dfsPC++KOcY
         POZPauVCYle+iWQacpMVTBdphCPd3DJi8jvAVOm+CHB+OvG1EoC8L4cvKsDaZU/F3C7t
         X+sgF0AZ2eqQERPv3q5Z3L53WEG2bHyPFk5rOndwFNaaFwyoN/FnpoozwNgRC4C7iGD4
         8bcvoRO6AxoCbOmeYuREdtvH7SBtjb7iPbLPEVVyw8mt976zqZ+iEI7Vk+XoWcnlQzLp
         ePXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719963647; x=1720568447;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flZpwFnHJZAIjKR4GYgW5NmzsJCUt0trCfVDgRJheOk=;
        b=Pj7Bm/dYQz+xM2r4zxkliRgZF822ZA/cXR6HO/JVzK3kiBq9leyYpoDOzCdyOmeME1
         mZ7YZzO26j3TLHyo4N4O3kMcTkLne90oIKpJ73Gq2ONR7dwZUxvOA4BApuaPvtOiUQ4S
         5Bmml+0dZWoRrZsFBT6RN0o/yNZbhACy2+YBkT7wZcjCZ32gwlMAJO0mmkOiOHB+ybVh
         bGkIoxZXI3XpiO+Ojp/XS2unhfADQtcxWr7mAUIuqmLLsfSwj5+i670vKhIsA5FD2qy+
         idD07j31DldKI5I1J2MpqNCa497VZpvx2QZog92qauEhXOQqR6O4qNX7EAlI/lkGD8Ul
         yzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaDEAKkcdS8PjRKDEDepf7+mYFYZzPr2wdmU7XukRCCHtu+s/wO84JUCMhnfIssmNHvMvyxNWZrHbokgILN80xY4DJ+uMQRHGBRg2aFr2nZwXeX3eXmRuhGbCVk3X3b3JqpvnggIxQeTRN
X-Gm-Message-State: AOJu0YzXhC9/4DsDswqwLN4S0s942vm56Qu5p2bg0wfgvqGQ+vVQEm6E
	BvHIXgGpZNdLnbExzbbax0t9IcvnJvuWBkoL+dy14BOVIeVxO4jM
X-Google-Smtp-Source: AGHT+IHd4OQHXmJkAD63CJiXsjXmuuT6X8jxrvRfP6/EEesBplsWLHPtSNkPNKSFD2Ms3CdfX+HeUw==
X-Received: by 2002:a05:6512:e9a:b0:52c:7f7f:dc1f with SMTP id 2adb3069b0e04-52e82744244mr6426928e87.61.1719963646474;
        Tue, 02 Jul 2024 16:40:46 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7478d33ee7sm364675466b.143.2024.07.02.16.40.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:40:44 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 2/3] modpost: .meminit.* is not in init section when CONFIG_MEMORY_HOTPLUG set
Date: Tue,  2 Jul 2024 23:40:07 +0000
Message-Id: <20240702234008.19101-2-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20240702234008.19101-1-richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

.meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
set, since we define MEM_KEEP()/MEM_DISCARD() according to
CONFIG_MEMORY_HOTPLUG.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Mike Rapoport (IBM) <rppt@kernel.org>
---
 scripts/mod/modpost.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f48d72d22dc2..81134403d4d7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -22,6 +22,7 @@
 #include <errno.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
+#include "../../include/generated/autoconf.h"
 
 static bool module_enabled;
 /* Are we using CONFIG_MODVERSIONS? */
@@ -775,9 +776,14 @@ static void check_section(const char *modname, struct elf_info *elf,
 
 
 
+#if defined(CONFIG_MEMORY_HOTPLUG)
+#define ALL_INIT_DATA_SECTIONS \
+	".init.setup", ".init.rodata", ".init.data"
+#else
 #define ALL_INIT_DATA_SECTIONS \
 	".init.setup", ".init.rodata", ".meminit.rodata", \
 	".init.data", ".meminit.data"
+#endif
 
 #define ALL_PCI_INIT_SECTIONS	\
 	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup_final", \
@@ -786,7 +792,11 @@ static void check_section(const char *modname, struct elf_info *elf,
 
 #define ALL_XXXINIT_SECTIONS ".meminit.*"
 
+#if defined(CONFIG_MEMORY_HOTPLUG)
+#define ALL_INIT_SECTIONS INIT_SECTIONS
+#else
 #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
+#endif
 #define ALL_EXIT_SECTIONS ".exit.*"
 
 #define DATA_SECTIONS ".data", ".data.rel"
-- 
2.34.1


