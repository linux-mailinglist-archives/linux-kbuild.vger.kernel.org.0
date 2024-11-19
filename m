Return-Path: <linux-kbuild+bounces-4712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF329D1C3A
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0AD5B22881
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B22179A7;
	Tue, 19 Nov 2024 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0VZOh8V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9917BA3;
	Tue, 19 Nov 2024 00:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975829; cv=none; b=cGGsg7gn89sOl/P0CzvJZzl/Hd7oSMDSi8I1rfitK0vcR5BCVyPAZtEDztgaExgIhZoo0TbS2e6K8EK7BLaUkvCnewyJ9fis7wTp97VfyYneozq7GDh8NBQpBCuCNnTm2eVAHg8CKi4RCk4RB/jydnoS90uJxdqVDQgKBENB7Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975829; c=relaxed/simple;
	bh=W9Y0MqjXuPLa6EwQNVLtTEK4szUojyFWQZrhcx4lVXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1t746K65CTXQbanvrXRGgZ/jRc3l0HRtD9Jtruf3dWDaNpVR3uyN/b/jlA+pJCtTw9PpkxLJtLIfW/CDPEW481llNDT0ZxU9Jyg12QskmDSSylecC+yZFdKbXRfESznBG9/lz2o9zIXVl/eeETnqGzWZPoFFtlCGEE+5/eKr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0VZOh8V; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975827; x=1763511827;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=W9Y0MqjXuPLa6EwQNVLtTEK4szUojyFWQZrhcx4lVXA=;
  b=F0VZOh8VresKrILmQDhrkbkPs2vhUK/Fs3JQNqvIY+5TvGgmyuuwCyQ4
   qrijDaX3O+nUlBO7UUXh/ZpBcGMEthFNXjgSb+zF1aT53G16uaghfJeNh
   tv+qeYnjFzsC/GK5xR1qDvRwIUFGY2pBzMQIUeSW3gJ50R6pJ4pr289js
   zSwCbYBcrWNSpomWwX2J+CCCwDT3uy0oXTse8+kmyM+pcTRx6AGYAcy0y
   h/bXbmv1Nf3I21nO1KgrrGAReumnJHM5HwLzKpwGIUiu1x8YtLkG37TeO
   Jg1nSXfXa9tpngqGHCxU3t5g3k2fIfYWeNapN36lxPmKiMv5lC6FXZAfd
   g==;
X-CSE-ConnectionGUID: 6niEZGEgSEKPUHaXvXYySA==
X-CSE-MsgGUID: 97C1N2jHTGe8WyIhTWTzZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31892419"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31892419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:45 -0800
X-CSE-ConnectionGUID: Y2E0TXOqSbOzOeX7MMc5Bg==
X-CSE-MsgGUID: 8O3YmawiQUC13eLdFqb+UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89162716"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:45 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 18 Nov 2024 16:23:38 -0800
Subject: [PATCH net-next RFC v6 1/9] lib: packing: create __pack() and
 __unpack() variants without error checking
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-packing-pack-fields-and-ice-implementation-v6-1-6af8b658a6c3@intel.com>
References: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
In-Reply-To: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
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


