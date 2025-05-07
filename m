Return-Path: <linux-kbuild+bounces-7000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCFAAE0C7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 15:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCA859A0190
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 13:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B64B2AE66;
	Wed,  7 May 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1ETEKHI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFC4B1E56
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 13:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624654; cv=none; b=OnQ4p2me6CNLWootO6ShIC7g7eC4Kt5nkPxypBDk2UtrQnRUvSOxMkfw3py2WDnjx/pHYl5gOChSLDr1dU6rZ7kvjRNPsjRNyYeHW5KhMLW4pFf5aGHdvr8WMw5V0hxffKhN6ha/sSvoFp4wqYQWgBEu/RwsFtr6YCuOS3KKzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624654; c=relaxed/simple;
	bh=GFJNcdBk5bf2L0Vt3Vbfq5iymsDl4I5onmf7LWk6zC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIXoYe7q64LDJU3swtpb/wUcW73aGoyf9wxyTDK8XNA2ds6zoLoCFMVTUrAFjJUL1UXHMuL6PswvgTUghMQ6hIltLfDrkGtzgfLVZ2NxMlPHqPTcMNqcqaHEDI6FGqMsh8aorXK/bcRw+RS+vTbfhyAp/MbWvXlz5O50Xyl2Iuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1ETEKHI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746624650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
	b=B1ETEKHI6OqEEbIDKg/EcDffPZFrIB3oK8Z1jAVo1Kbqej2gIg5MmK4STW1wF3aE5+PH+S
	EBnCQKCjoTL/7zBSBl2Rgu/xaiFuFF1/UIj8PJKjBdDwfElurkr4M7toPIP6UYGtsuZX2z
	9MvxsyNfDUmxS6qWmPb3BljV6biNU6g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-kpp1OgGdNp6pb1-lBgjOWQ-1; Wed, 07 May 2025 09:30:48 -0400
X-MC-Unique: kpp1OgGdNp6pb1-lBgjOWQ-1
X-Mimecast-MFC-AGG-ID: kpp1OgGdNp6pb1-lBgjOWQ_1746624647
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so38583445e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 06:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624647; x=1747229447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAnx4zdLWH9vKEKvll8glYQPHtlqprMuZdEbIAz4Nx8=;
        b=D8zFmqizTFq2vgDjv/idY0r01KLZ+2/QJn9erIj1TIeuoq6GYSI8uiYs4FLR4zth2v
         mI195UEnxOZtSvtmU9EQuyQPNbraJIiS4nxWyxKoKm+0kHbyxbmpyfJ/H1UmgXEbl54T
         PPBkuTsMzI/4upJsB2+H2TYs/Liz9o9dY7sFhb1PnalWtpplg6mmCSo0fUcoWE8Nsxw7
         CdDwXPzy7IB0Ks0wc05Dgsb4Auo3ozT3V7076e38YcDlhPJ2R+Nxo2ux/dRoatbUd1ue
         uYujgmBRdPG7iQv+RCyVUgg+VMf8GOWO/vcI9g6vtEfT7wGln0yr2I3VpVyrv63BpKVl
         vrjw==
X-Forwarded-Encrypted: i=1; AJvYcCXBOs4DA5Vz62Qoil7/ecbEUiW4q3nO8xUhosyyeKM4mi26thZeZwcF4hWIU9hHLVJhH0eD//A5Yb3xOWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdXO0LPNLikpuF9c1LLy4/jrmyuCixVjbMJlSvKAQPJntZlZJ
	Bhh5i0zhDHLbZT0k+xs7x/r/rl/fnffpxc/K4xrQycylcudKgyohbc7stW5hs7byasU2uRawyUj
	ZTjXkFAcB9zGP2hbr5fSRe82poLbnGhDk6yEIvAEIv9oH3qAvTPhF/0LlqzqRdQ==
X-Gm-Gg: ASbGncuLHv9O7urdV2N2yNdJjEGxiNKVpcegyC11iZMzUrUKB5bdyU0M4Fh+MxLy11f
	hdU8DbrU7ZYfPWSFYdBR6N3sIF+tC/SBkBXKiKBUtgkWW1aUXGfqP49JYIsj297fR1kUglwE3eg
	RohzBVFSG+Ha3u/PW+qIz5nVGananDTIbWimOZgEglztjIZV3zYuuZDZABowEAKZW8iDeQln5am
	RzDjX5G/O2FtouUF292e24B4fdF6zo5DFRF+LWNJmSbIRw+9xGWFRyVuoVfeM0rXm5QMXhsIFOr
	8wbvRL7+dJaLiaO1Rv7l+ND8k7GadznTj018nWHL8+WjqciweGOEdFLZ2g==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433706f8f.21.1746624647382;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+xkN4CteQe3W7JG964awZX/kgvVxlMBDW+iUZi+kxW1uqeTmzxYgAsX7awL9bnRSjkrOf1A==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b3f1:6edf with SMTP id ffacd0b85a97d-3a0b4a05cadmr2433678f8f.21.1746624647048;
        Wed, 07 May 2025 06:30:47 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm17111024f8f.38.2025.05.07.06.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:30:46 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Makefile.kcov: apply needed compiler option unconditionally in CFLAGS_KCOV
Date: Wed,  7 May 2025 15:30:43 +0200
Message-ID: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes the
config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
compiler option '-fsanitize-coverage=trace-pc' by now.

The commit however misses the important use of this config option in
Makefile.kcov to add '-fsanitize-coverage=trace-pc' to CFLAGS_KCOV.
Include the compiler option '-fsanitize-coverage=trace-pc' unconditionally
to CFLAGS_KCOV, as all compilers provide that option now.

Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 scripts/Makefile.kcov | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67de7942b3e7..01616472f43e 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
+kcov-flags-y					+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 
 export CFLAGS_KCOV := $(kcov-flags-y)
-- 
2.49.0


