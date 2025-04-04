Return-Path: <linux-kbuild+bounces-6422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91BA7BD8B
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACAC17BEAA
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0491EDA34;
	Fri,  4 Apr 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVs/QSzm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8661E8351;
	Fri,  4 Apr 2025 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772670; cv=none; b=oernxWYX+G+UqM4meuIMKxdTquiDLw0bI3Qc+CbXX//01Tcp0wnGRZNOIxNAAteUTRmzlIEkF1PpInNGaCgV/BeDK+hrb4iixozQj3eYrE1CrPeE6j1Wcj6Xrm9M+ggz/GG5ToSJPXT8LQZBgOmGE7ZkxQzFtL76/AudoILDIfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772670; c=relaxed/simple;
	bh=kLMkp6bZDxIMJX1kOLifwD1KQicNBp9kwQEWVdEeDAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMbnaczVf0RUk+tVZLEeU13PLNBYKwvXDaPdFzn+L6VDBDxCoCZ8rZyPG3IkvuZUNi3G26g1uAAheHvK3tLf8Xm2k0LFHWKPcDWk2j/biKp2G7ZWiiM9vMtsazOmwptKeoKVUHNQlA7k4F+nnH/8gWVeYxRZLpuxXGfwx+zti5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVs/QSzm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772669; x=1775308669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kLMkp6bZDxIMJX1kOLifwD1KQicNBp9kwQEWVdEeDAs=;
  b=EVs/QSzm9D4YytQD6hZqACYqVwQ77DWRo/IbVOZ2jX+q2RwteuDnQqgW
   E2LP9ZYq/UdHXSDVat2/8gj2HoTwYErxo89HHUB3QuNpe84cCpwXebiYs
   GlXsg0zzfL371Am4hn8qLW/xfnxWGvAzeFa27RrMZUlZbNRfSwWPnsKYL
   iG6fvSthuNuwRqXTKwB2nlNaAjXtNgX+kFf3KWnvomTo/Ittxt36RfP6e
   Oudc/AIdeGyW2mECy1gwSLZ9z8B95jKNK2aWE68vQnA4DdIEx8mbf9hpw
   4owKTyT3L75yoUxdQ9o/9MUGFCVx75gVfg8dnXO6pFL1S7eOY/AC2ZWjq
   Q==;
X-CSE-ConnectionGUID: r4wNFFKPR0WgpG5NeGoCBQ==
X-CSE-MsgGUID: UjMCsYedQ3OwoHye5ld1ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55402023"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55402023"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:48 -0700
X-CSE-ConnectionGUID: /KZBOILGRPaVrrMli4Itpg==
X-CSE-MsgGUID: T+1IKqSwRheE1ok0gd7jhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128157374"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:33 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: hpa@zytor.com,
	hch@infradead.org,
	nick.desaulniers+lkml@gmail.com,
	kuan-ying.lee@canonical.com,
	masahiroy@kernel.org,
	samuel.holland@sifive.com,
	mingo@redhat.com,
	corbet@lwn.net,
	ryabinin.a.a@gmail.com,
	guoweikang.kernel@gmail.com,
	jpoimboe@kernel.org,
	ardb@kernel.org,
	vincenzo.frascino@arm.com,
	glider@google.com,
	kirill.shutemov@linux.intel.com,
	apopple@nvidia.com,
	samitolvanen@google.com,
	maciej.wieczor-retman@intel.com,
	kaleshsingh@google.com,
	jgross@suse.com,
	andreyknvl@gmail.com,
	scott@os.amperecomputing.com,
	tony.luck@intel.com,
	dvyukov@google.com,
	pasha.tatashin@soleen.com,
	ziy@nvidia.com,
	broonie@kernel.org,
	gatlin.newhouse@gmail.com,
	jackmanb@google.com,
	wangkefeng.wang@huawei.com,
	thiago.bauermann@linaro.org,
	tglx@linutronix.de,
	kees@kernel.org,
	akpm@linux-foundation.org,
	jason.andryuk@amd.com,
	snovitoll@gmail.com,
	xin@zytor.com,
	jan.kiszka@siemens.com,
	bp@alien8.de,
	rppt@kernel.org,
	peterz@infradead.org,
	pankaj.gupta@amd.com,
	thuth@redhat.com,
	andriy.shevchenko@linux.intel.com,
	joel.granados@kernel.org,
	kbingham@kernel.org,
	nicolas@fjasle.eu,
	mark.rutland@arm.com,
	surenb@google.com,
	catalin.marinas@arm.com,
	morbo@google.com,
	justinstitt@google.com,
	ubizjak@gmail.com,
	jhubbard@nvidia.com,
	urezki@gmail.com,
	dave.hansen@linux.intel.com,
	bhe@redhat.com,
	luto@kernel.org,
	baohua@kernel.org,
	nathan@kernel.org,
	will@kernel.org,
	brgerst@gmail.com
Cc: llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	x86@kernel.org
Subject: [PATCH v3 12/14] kasan: Fix inline mode for x86 tag-based mode
Date: Fri,  4 Apr 2025 15:14:16 +0200
Message-ID: <9a8862c380805ac6c2fc137e8edb1d2e70ee2812.1743772053.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
inline or outline mode in tag-based KASAN. If zeroed, it means the
instrumentation implementation will be copied into each relevant
location along with appropriate constants during compilation. If set to
one, all function instrumentation will be done with function calls
instead.

The default hwasan-instrument-with-calls value for the x86 architecture
in the compiler is "1", which is not true for other architectures.
Because of this enabling inline mode in software tag-based KASAN doesn't
work on x86 as the kernel script doesn't zero out the parameter.

Explicitly zero out hwasan-instrument-with-calls when enabling inline
mode in tag-based KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Add this patch to the series.

 scripts/Makefile.kasan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 693dbbebebba..2c7be96727ac 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -76,8 +76,11 @@ CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
 		   -Zsanitizer-recover=kernel-hwaddress
 
+# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it to 0
+# when inline mode is enabled.
 ifdef CONFIG_KASAN_INLINE
 	kasan_params += hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
+	kasan_params += hwasan-instrument-with-calls=0
 else
 	kasan_params += hwasan-instrument-with-calls=1
 endif
-- 
2.49.0


