Return-Path: <linux-kbuild+bounces-2794-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD3D9469BF
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 14:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 979DE281B62
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 12:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF7A139CFE;
	Sat,  3 Aug 2024 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5Y2XW+l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1701E4A1;
	Sat,  3 Aug 2024 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722689541; cv=none; b=nG1LGgzTfhh4cjwNxwcS9Hm9M0vntkDk0wRFi7OShNl99dFaJzdZqIC5DsIqvN+N5DujSPi9usUNgXYpNjEempGEtsL8a9wK/5TgezfdHK2eDsuy4d7ZWRGxeARDSTRbguj5f6fsR4X8Q4Qj6bb3ssERNZs2KBbmhtVj+2t5P8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722689541; c=relaxed/simple;
	bh=evCFPKOrDCigmhW1vYvJqSVUa2zKQNSdruxUR0QCB4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTuYCt320r1RD1TNadvi/nAdBjbbZXHul3HW1//tJoguZdN4RvRGtNSFoZJW2fqZY7qESXA35/5lxTHIvK5JZa+GI1tQhEW09cjawooYF36zohtcEww5k6+xihaRNcqaNd+OfDKeeadW3eoO9W+zIwZdrw7W5PG5KO/fr7ahZ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5Y2XW+l; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5d8060662a1so321993eaf.2;
        Sat, 03 Aug 2024 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722689539; x=1723294339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpycHmXmZ7JGxEw0FNaQDwVQNzxnwclNumLSNksnwRg=;
        b=h5Y2XW+l5UjayHGBif7VBoJ9oMLkrIbHwEnk7uXiDVk+NG/fKrRZsd6FI7rbNTaRgw
         Of46juAGQZPSbQHo+S1+CzQx/37P7F2pWJ1v0rymTgzym9bknGeECZdNVZ4a/V4vJHRK
         0r0E0gDQ+jkM2CwpBikF+SlsJFA52NBW58t0l8qTr5l1dGWcFi5IZ6ieQpYEATIMo2wR
         WIyF/B18PMNihZCv0RbW0F4yfFlpWyVM7Yv86U+n89Bj0eppivvYaWg/a3PP/eJOqrfZ
         L0upL+QXDve9a5Yw8Q52hhU9Kwz3mw4PxoRFMjlpeL2AyCmEqJnI6bIA7HzMoS+LSzmY
         Km3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722689539; x=1723294339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpycHmXmZ7JGxEw0FNaQDwVQNzxnwclNumLSNksnwRg=;
        b=qxoDSXv9+63gsi8LCke8sXZq8ZZjkYXpvLAj63VJBDW3+14lbj9wRcTovFyjyOGck7
         S92k7rsAe1KwWdvSOYer62eochKB74a42ujVKmNtHWidFl+FRNos81Q4ygVswJUZBrqm
         GIAKS/UOvzKAlFHn3mGhYqxMlRKS6hg7j8YLr3y48VojXTI1sgirQ8MxOaE84Sq/hwpr
         D+gcHtsVLTA50pmJsgFC5kJoZOknwG/XWebRggvHKGynz+fJLSw+uKR4R798HdvhwERQ
         hZVH2uMC5lTDYEi4ikTwWYzyOy7itNj/igGzRQnD+b1W5xl7vG9fc6mZcr77jOvOQ4Dz
         8bOw==
X-Forwarded-Encrypted: i=1; AJvYcCWXscxb/WXfmSmTt3HnjQ6MZ1BTT8vOxNUSwZ6vQlYBdAhZ2wIKR59NQBYCrc4W1e0ZL4d+wy4f1BwtVJgs31s8u0Y3ypQp04v+Gdws
X-Gm-Message-State: AOJu0Yw1Y+nGj91Gb7U69IAce5s1UHy8OMi09OEKryxymu4jCEKHoIXr
	akzu2jkOGG95f3ycigfVrcaP39InDM8n4mcSN/5j+Hw5uRl8Ic4U
X-Google-Smtp-Source: AGHT+IEtZvpQNWOXMpHnaz+niE5MY6JrlY6u8+AczwqNrkA5Uk1SewCkf56o0JObu8SrF/mq+DWpcw==
X-Received: by 2002:a05:6870:46a8:b0:268:90ca:de2 with SMTP id 586e51a60fabf-26891a83f76mr6743562fac.5.1722689538798;
        Sat, 03 Aug 2024 05:52:18 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed2de19sm2692868b3a.216.2024.08.03.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 05:52:17 -0700 (PDT)
From: Alexandre Courbot <gnurou@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] Makefile: add $(srctree) to dependency of compile_commands.json target
Date: Sat,  3 Aug 2024 21:51:53 +0900
Message-ID: <20240803125153.216030-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to build the compile_commands.json target from an external
module's directory, the following error is displayed:

	make[1]: *** No rule to make target 'scripts/clang-tools/gen_compile_commands.py',
	needed by 'compile_commands.json'. Stop.

This appears to be because gen_compile_commands.py is looked up using
relative path, which doesn't exist from the module's source tree.
Prefixing the dependency with $(srctree) fixes the problem.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8ad55d6e7b60..52d7dfe4212a 100644
--- a/Makefile
+++ b/Makefile
@@ -1980,7 +1980,7 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
-$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
+$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
 	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
 	$(call if_changed,gen_compile_commands)
-- 
2.46.0


