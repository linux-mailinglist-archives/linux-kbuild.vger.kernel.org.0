Return-Path: <linux-kbuild+bounces-4621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6595C9C3970
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5111F20FF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C113715ECDF;
	Mon, 11 Nov 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KeaIU0GH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6BE15AAC1;
	Mon, 11 Nov 2024 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312537; cv=none; b=t+wFMy6tMZnF8zBwmbnyxcwEaA9IRu7umfa2KgVtJshTkAsq1lK5sx8wnBe2QMOYNTzzLQWOe5P/5ecjYnvEkei1oC0Q4uHdEAdIJP4z4eoxBIpefIGB4O/yXBgFjx+RET2ac6klIcC/JKrspi/Aelo+TX87gXkD7avb17VInTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312537; c=relaxed/simple;
	bh=MlXbHuvt3wGllLux/V5NooK/PasQZbsIt3aVkig4UAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GK+m2rezUEV+9N3Rb+y2Q9wnOLF10gUZFREnHUISpBh/4vpyPLMzMuBNRspCDG5L1qS9SMKW0dYTQDTVmXN7whHjxOloVLvIqm27G5jO1vXP1kNhVtelUJ8M+Km6/z2V3kOAeiDbQBkhtShm+NRsp+FOpCs49LqSbu101i9Dsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KeaIU0GH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312536; x=1762848536;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=MlXbHuvt3wGllLux/V5NooK/PasQZbsIt3aVkig4UAk=;
  b=KeaIU0GHSPdwK3LUgc/jG9KeunVn7g+yd6GWhbmtXWPQBOt0KlGHKa59
   /sFEuS7vPQMs+P+AfpdZ0ijSWq9pXQNRPka5151yfFUQ1oa1cQ/mZZnsW
   TeFTngwp3XeVsMgNCIrRXHY9/NCRL5ZsZGyVcFk6HkvQ9jl5JodwCrowE
   SV1olK03HMf/quTdTanGPdqf3TgVgOg8GN3Yw8Lp4q+trW+gYYTNNNrJe
   jgvW3D2pVac0NO6rEOYETM6kXFw2P20+prC83xTN4K5yojrrNIZT4QdO8
   dMWpdMM+aGC8LJpWdh7Mfl45Vibc7NJpIQWK54OQZ4BGQD1rh444IflWF
   g==;
X-CSE-ConnectionGUID: M7iRoW1mTuKXlrGFfpsGug==
X-CSE-MsgGUID: qUiXvB0QRxeIb+l1A+MjUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723213"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
X-CSE-ConnectionGUID: pmj1l1XLT2yUK3UG+mS9MA==
X-CSE-MsgGUID: +x/rkvrsTsmI5sPF+DZ/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323645"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:43 -0800
Subject: [PATCH net-next v5 2/9] lib: packing: demote truncation error in
 pack() to a warning in __pack()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-2-80c07349e6b7@intel.com>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
In-Reply-To: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.14.1

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Most of the sanity checks in pack() and unpack() can be covered at
compile time. There is only one exception, and that is truncation of the
uval during a pack() operation.

We'd like the error-less __pack() to catch that condition as well. But
at the same time, it is currently the responsibility of consumer drivers
(currently just sja1105) to print anything at all when this error
occurs, and then discard the return code.

We can just print a loud warning in the library code and continue with
the truncated __pack() operation. In practice, having the warning is
very important, see commit 24deec6b9e4a ("net: dsa: sja1105: disallow
C45 transactions on the BASE-TX MDIO bus") where the bug was caught
exactly by noticing this print.

Add the first print to the packing library, and at the same time remove
the print for the same condition from the sja1105 driver, to avoid
double printing.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_static_config.c |  8 ++------
 lib/packing.c                                   | 26 ++++++++++---------------
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_static_config.c b/drivers/net/dsa/sja1105/sja1105_static_config.c
index baba204ad62f..3d790f8c6f4d 100644
--- a/drivers/net/dsa/sja1105/sja1105_static_config.c
+++ b/drivers/net/dsa/sja1105/sja1105_static_config.c
@@ -26,12 +26,8 @@ void sja1105_pack(void *buf, const u64 *val, int start, int end, size_t len)
 		pr_err("Start bit (%d) expected to be larger than end (%d)\n",
 		       start, end);
 	} else if (rc == -ERANGE) {
-		if ((start - end + 1) > 64)
-			pr_err("Field %d-%d too large for 64 bits!\n",
-			       start, end);
-		else
-			pr_err("Cannot store %llx inside bits %d-%d (would truncate)\n",
-			       *val, start, end);
+		pr_err("Field %d-%d too large for 64 bits!\n",
+		       start, end);
 	}
 	dump_stack();
 }
diff --git a/lib/packing.c b/lib/packing.c
index f237b8af99f5..09a2d195b943 100644
--- a/lib/packing.c
+++ b/lib/packing.c
@@ -59,8 +59,17 @@ static void __pack(void *pbuf, u64 uval, size_t startbit, size_t endbit,
 	 */
 	int plogical_first_u8 = startbit / BITS_PER_BYTE;
 	int plogical_last_u8 = endbit / BITS_PER_BYTE;
+	int value_width = startbit - endbit + 1;
 	int box;
 
+	/* Check if "uval" fits in "value_width" bits.
+	 * The test only works for value_width < 64, but in the latter case,
+	 * any 64-bit uval will surely fit.
+	 */
+	WARN(value_width < 64 && uval >= (1ull << value_width),
+	     "Cannot store 0x%llx inside bits %zu-%zu - will truncate\n",
+	     uval, startbit, endbit);
+
 	/* Iterate through an idealistic view of the pbuf as an u64 with
 	 * no quirks, u8 by u8 (aligned at u8 boundaries), from high to low
 	 * logical bit significance. "box" denotes the current logical u8.
@@ -143,9 +152,6 @@ static void __pack(void *pbuf, u64 uval, size_t startbit, size_t endbit,
 int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
 	 u8 quirks)
 {
-	/* width of the field to access in the pbuf */
-	u64 value_width;
-
 	/* startbit is expected to be larger than endbit, and both are
 	 * expected to be within the logically addressable range of the buffer.
 	 */
@@ -153,19 +159,7 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
 		/* Invalid function call */
 		return -EINVAL;
 
-	value_width = startbit - endbit + 1;
-	if (unlikely(value_width > 64))
-		return -ERANGE;
-
-	/* Check if "uval" fits in "value_width" bits.
-	 * If value_width is 64, the check will fail, but any
-	 * 64-bit uval will surely fit.
-	 */
-	if (value_width < 64 && uval >= (1ull << value_width))
-		/* Cannot store "uval" inside "value_width" bits.
-		 * Truncating "uval" is most certainly not desirable,
-		 * so simply erroring out is appropriate.
-		 */
+	if (unlikely(startbit - endbit >= 64))
 		return -ERANGE;
 
 	__pack(pbuf, uval, startbit, endbit, pbuflen, quirks);

-- 
2.47.0.265.g4ca455297942


