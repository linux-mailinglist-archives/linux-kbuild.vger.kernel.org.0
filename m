Return-Path: <linux-kbuild+bounces-4619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0719C396C
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A3B1C209E5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DBA15B54A;
	Mon, 11 Nov 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcMNXKwf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAE4D8CB;
	Mon, 11 Nov 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312536; cv=none; b=Qyk70UmBL7ht1oSCtUl8QLAuK+2kLmo4L94uNl8bNPwoAv6w9Tw/VbmHIPUb/nTZ3KcxZ4yHww6RibnOzh8Ac5phnUIuMBv7DzEgrM8G6TS8EogXRZgXs4fmDQRP9wfT/eH8VnhBSmdxYv9sLYL6l+n1o0uteHAdiiZujidNso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312536; c=relaxed/simple;
	bh=W9Y0MqjXuPLa6EwQNVLtTEK4szUojyFWQZrhcx4lVXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dt4mDQUS0Yqq9/3omjPn/P81r03anMYvL6Pzi/TwrLYjwnXJYSGfrM25YyyWBCN7fClMDoghQZQsqWao5d0X1LD0wiem/pL/Iu3SQNzXko7s6gGTRNp7Dc8xihAzNXbAp6mfC0SS1ihecV/96GFdMtnq6m0sahzKXeC4Aa6+prw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcMNXKwf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312534; x=1762848534;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=W9Y0MqjXuPLa6EwQNVLtTEK4szUojyFWQZrhcx4lVXA=;
  b=mcMNXKwfHlRyYKyIfufbTfGpGkpwq0DW5fuWFXai+FSrJnZP2TKnpClE
   bqc69FjuT/P1bEMExBfqd0jKJg1YoTgrr9GsZpHm7UsYs2Uxr+JtZgtxZ
   lvXMQJZFab/Twugs5N64zuZqmLhLgmc9Z0T5nqvCB94WHQl1ziTm2gTU8
   vGE3JDEM8sOUUppOvhvAq0ubWgM+aZUP7gqxxU0cn49A8ZxzY6XJg1gTz
   Vf2jWSKMRTPfxO5NIJLHG09apC7nswPXPv4wafFVDVelfzIKog7fcRs/x
   EpIaI0MOIpvCEumGRpaw6XYM7cxL/t9z5xBaaCWKrlRwrIH0MATtQ1SQd
   g==;
X-CSE-ConnectionGUID: ThrCqa4YTc64Y2a/fcFsJA==
X-CSE-MsgGUID: xjR0auciSqy2QQwmBsCM2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723206"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
X-CSE-ConnectionGUID: laSuA/IzSYO3jJJlhlz1AQ==
X-CSE-MsgGUID: Kw1YNhZYSK67b0uOlAKdmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323641"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:53 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:42 -0800
Subject: [PATCH net-next v5 1/9] lib: packing: create __pack() and
 __unpack() variants without error checking
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-1-80c07349e6b7@intel.com>
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

A future variant of the API, which works on arrays of packed_field
structures, will make most of these checks redundant. The idea will be
that we want to perform sanity checks at compile time, not once
for every function call.

Introduce new variants of pack() and unpack(), which elide the sanity
checks, assuming that the input was pre-sanitized.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 lib/packing.c | 142 ++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 78 insertions(+), 64 deletions(-)

diff --git a/lib/packing.c b/lib/packing.c
index 793942745e34..f237b8af99f5 100644
--- a/lib/packing.c
+++ b/lib/packing.c
@@ -51,64 +51,20 @@ static size_t calculate_box_addr(size_t box, size_t len, u8 quirks)
 	return offset_of_group + offset_in_group;
 }
 
-/**
- * pack - Pack u64 number into bitfield of buffer.
- *
- * @pbuf: Pointer to a buffer holding the packed value.
- * @uval: CPU-readable unpacked value to pack.
- * @startbit: The index (in logical notation, compensated for quirks) where
- *	      the packed value starts within pbuf. Must be larger than, or
- *	      equal to, endbit.
- * @endbit: The index (in logical notation, compensated for quirks) where
- *	    the packed value ends within pbuf. Must be smaller than, or equal
- *	    to, startbit.
- * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
- * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
- *	    QUIRK_MSB_ON_THE_RIGHT.
- *
- * Return: 0 on success, EINVAL or ERANGE if called incorrectly. Assuming
- *	   correct usage, return code may be discarded. The @pbuf memory will
- *	   be modified on success.
- */
-int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
-	 u8 quirks)
+static void __pack(void *pbuf, u64 uval, size_t startbit, size_t endbit,
+		   size_t pbuflen, u8 quirks)
 {
 	/* Logical byte indices corresponding to the
 	 * start and end of the field.
 	 */
-	int plogical_first_u8, plogical_last_u8, box;
-	/* width of the field to access in the pbuf */
-	u64 value_width;
-
-	/* startbit is expected to be larger than endbit, and both are
-	 * expected to be within the logically addressable range of the buffer.
-	 */
-	if (unlikely(startbit < endbit || startbit >= BITS_PER_BYTE * pbuflen))
-		/* Invalid function call */
-		return -EINVAL;
-
-	value_width = startbit - endbit + 1;
-	if (unlikely(value_width > 64))
-		return -ERANGE;
-
-	/* Check if "uval" fits in "value_width" bits.
-	 * If value_width is 64, the check will fail, but any
-	 * 64-bit uval will surely fit.
-	 */
-	if (unlikely(value_width < 64 && uval >= (1ull << value_width)))
-		/* Cannot store "uval" inside "value_width" bits.
-		 * Truncating "uval" is most certainly not desirable,
-		 * so simply erroring out is appropriate.
-		 */
-		return -ERANGE;
+	int plogical_first_u8 = startbit / BITS_PER_BYTE;
+	int plogical_last_u8 = endbit / BITS_PER_BYTE;
+	int box;
 
 	/* Iterate through an idealistic view of the pbuf as an u64 with
 	 * no quirks, u8 by u8 (aligned at u8 boundaries), from high to low
 	 * logical bit significance. "box" denotes the current logical u8.
 	 */
-	plogical_first_u8 = startbit / BITS_PER_BYTE;
-	plogical_last_u8  = endbit / BITS_PER_BYTE;
-
 	for (box = plogical_first_u8; box >= plogical_last_u8; box--) {
 		/* Bit indices into the currently accessed 8-bit box */
 		size_t box_start_bit, box_end_bit, box_addr;
@@ -163,15 +119,13 @@ int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
 		((u8 *)pbuf)[box_addr] &= ~box_mask;
 		((u8 *)pbuf)[box_addr] |= pval;
 	}
-	return 0;
 }
-EXPORT_SYMBOL(pack);
 
 /**
- * unpack - Unpack u64 number from packed buffer.
+ * pack - Pack u64 number into bitfield of buffer.
  *
  * @pbuf: Pointer to a buffer holding the packed value.
- * @uval: Pointer to an u64 holding the unpacked value.
+ * @uval: CPU-readable unpacked value to pack.
  * @startbit: The index (in logical notation, compensated for quirks) where
  *	      the packed value starts within pbuf. Must be larger than, or
  *	      equal to, endbit.
@@ -183,16 +137,12 @@ EXPORT_SYMBOL(pack);
  *	    QUIRK_MSB_ON_THE_RIGHT.
  *
  * Return: 0 on success, EINVAL or ERANGE if called incorrectly. Assuming
- *	   correct usage, return code may be discarded. The @uval will be
- *	   modified on success.
+ *	   correct usage, return code may be discarded. The @pbuf memory will
+ *	   be modified on success.
  */
-int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
-	   size_t pbuflen, u8 quirks)
+int pack(void *pbuf, u64 uval, size_t startbit, size_t endbit, size_t pbuflen,
+	 u8 quirks)
 {
-	/* Logical byte indices corresponding to the
-	 * start and end of the field.
-	 */
-	int plogical_first_u8, plogical_last_u8, box;
 	/* width of the field to access in the pbuf */
 	u64 value_width;
 
@@ -207,6 +157,33 @@ int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
 	if (unlikely(value_width > 64))
 		return -ERANGE;
 
+	/* Check if "uval" fits in "value_width" bits.
+	 * If value_width is 64, the check will fail, but any
+	 * 64-bit uval will surely fit.
+	 */
+	if (value_width < 64 && uval >= (1ull << value_width))
+		/* Cannot store "uval" inside "value_width" bits.
+		 * Truncating "uval" is most certainly not desirable,
+		 * so simply erroring out is appropriate.
+		 */
+		return -ERANGE;
+
+	__pack(pbuf, uval, startbit, endbit, pbuflen, quirks);
+
+	return 0;
+}
+EXPORT_SYMBOL(pack);
+
+static void __unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
+		     size_t pbuflen, u8 quirks)
+{
+	/* Logical byte indices corresponding to the
+	 * start and end of the field.
+	 */
+	int plogical_first_u8 = startbit / BITS_PER_BYTE;
+	int plogical_last_u8 = endbit / BITS_PER_BYTE;
+	int box;
+
 	/* Initialize parameter */
 	*uval = 0;
 
@@ -214,9 +191,6 @@ int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
 	 * no quirks, u8 by u8 (aligned at u8 boundaries), from high to low
 	 * logical bit significance. "box" denotes the current logical u8.
 	 */
-	plogical_first_u8 = startbit / BITS_PER_BYTE;
-	plogical_last_u8  = endbit / BITS_PER_BYTE;
-
 	for (box = plogical_first_u8; box >= plogical_last_u8; box--) {
 		/* Bit indices into the currently accessed 8-bit box */
 		size_t box_start_bit, box_end_bit, box_addr;
@@ -271,6 +245,46 @@ int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
 		*uval &= ~proj_mask;
 		*uval |= pval;
 	}
+}
+
+/**
+ * unpack - Unpack u64 number from packed buffer.
+ *
+ * @pbuf: Pointer to a buffer holding the packed value.
+ * @uval: Pointer to an u64 holding the unpacked value.
+ * @startbit: The index (in logical notation, compensated for quirks) where
+ *	      the packed value starts within pbuf. Must be larger than, or
+ *	      equal to, endbit.
+ * @endbit: The index (in logical notation, compensated for quirks) where
+ *	    the packed value ends within pbuf. Must be smaller than, or equal
+ *	    to, startbit.
+ * @pbuflen: The length in bytes of the packed buffer pointed to by @pbuf.
+ * @quirks: A bit mask of QUIRK_LITTLE_ENDIAN, QUIRK_LSW32_IS_FIRST and
+ *	    QUIRK_MSB_ON_THE_RIGHT.
+ *
+ * Return: 0 on success, EINVAL or ERANGE if called incorrectly. Assuming
+ *	   correct usage, return code may be discarded. The @uval will be
+ *	   modified on success.
+ */
+int unpack(const void *pbuf, u64 *uval, size_t startbit, size_t endbit,
+	   size_t pbuflen, u8 quirks)
+{
+	/* width of the field to access in the pbuf */
+	u64 value_width;
+
+	/* startbit is expected to be larger than endbit, and both are
+	 * expected to be within the logically addressable range of the buffer.
+	 */
+	if (startbit < endbit || startbit >= BITS_PER_BYTE * pbuflen)
+		/* Invalid function call */
+		return -EINVAL;
+
+	value_width = startbit - endbit + 1;
+	if (value_width > 64)
+		return -ERANGE;
+
+	__unpack(pbuf, uval, startbit, endbit, pbuflen, quirks);
+
 	return 0;
 }
 EXPORT_SYMBOL(unpack);

-- 
2.47.0.265.g4ca455297942


