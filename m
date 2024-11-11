Return-Path: <linux-kbuild+bounces-4627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9B9C397E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31C51C20FCE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44BB16726E;
	Mon, 11 Nov 2024 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDYUVqc/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A516BE01;
	Mon, 11 Nov 2024 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312542; cv=none; b=qs8/ASU/UYWqjuno9Kgiaq7JB1laOVDaV7NhdRj+d30ruZMYxaM7oZv+Fx/XiaSzui0Uz5aQB49NU2i4zKM2nVRLqHv8aeMYxtPNKgDIUxsD9+WLe9PNUHTF77GNoFwMUPsDpDYWcs5dH+hqCB21ubnXiGlL94vrHYVrS8IpXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312542; c=relaxed/simple;
	bh=yF7B9MaMLwvmvh6JSMZtVrcTSqVkplWss/m6PiCoLmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhqf/8GlJjsFqr24Oq/UtcshnaGz+pv7rg6JHTXW9MYKX65PM7UdfHrLbfbwPzwGmsXoEtxPuAs6FyHX9QRdKEA65JwR2zFX7wQBmyOqLXNe86j7lz5k0OZT/udBiJjiFK/ovxAtSII7I177h0HfiZqsJja/XViDvMXcQroMvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDYUVqc/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312541; x=1762848541;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yF7B9MaMLwvmvh6JSMZtVrcTSqVkplWss/m6PiCoLmE=;
  b=XDYUVqc/3+bqqVygtPsoz4c7catlotyeGlzRx4D8AfXZdJcPQQoJtvA5
   zqtwYICH6ZIWd8tI/t4lVwSruNWeM/8tLmMNDArfhbgB6cwal0ExllOF2
   PVsRVdO5rYdcMmhZbsneiRHZoQ89Et9L8wUUyrrVdL6BIY/Dlo9qTfGpc
   S327mxYH0aKO+iPFwqvmvXwOGMo0X7IB97Pp/IM5E6lXnbyhBNnmVnygu
   6tRYWq8RrbB4E4uSXWddqGUBrqujx9+Lx8SomMYUibAeQXQhAxeqW+hA8
   7Qbwaytoj5i3BORcJWdBCVgEsB3Vx0qoTYbWf+cXzJ/Puffnj0A3bc03L
   g==;
X-CSE-ConnectionGUID: AcTTMYiVRei9N3V07uT4Gw==
X-CSE-MsgGUID: 0spcBbuRT+mliRiIRCrXZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723265"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:55 -0800
X-CSE-ConnectionGUID: X57C4U98Qm+X++/SyJcq3g==
X-CSE-MsgGUID: O9D/FIBTT0yckYtAXNa5MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323683"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:55 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:50 -0800
Subject: [PATCH net-next v5 9/9] ice: cleanup Rx queue context programming
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-9-80c07349e6b7@intel.com>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
In-Reply-To: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1

The ice_copy_rxq_ctx_to_hw() and ice_write_rxq_ctx() functions perform some
defensive checks which are typically frowned upon by kernel style
guidelines.

In particular, NULL checks on buffers which point to the stack are
discouraged, especially when the functions are static and only called once.
Checks of this sort only serve to hide potential programming error, as we
will not produce the normal crash dump on a NULL access.

In addition, ice_copy_rxq_ctx_to_hw() cannot fail in another way, so could
be made void.

Future support for VF Live Migration will need to introduce an inverse
function for reading Rx queue context from HW registers to unpack it, as
well as functions to pack and unpack Tx queue context from HW.

Rather than copying these style issues into the new functions, lets first
cleanup the existing code.

For the ice_copy_rxq_ctx_to_hw() function:

 * Move the Rx queue index check out of this function.
 * Convert the function to a void return.
 * Use a simple int variable instead of a u8 for the for loop index, and
   initialize it inside the for loop.
 * Update the function description to better align with kernel doc style.

For the ice_write_rxq_ctx() function:

 * Move the Rx queue index check into this function.
 * Update the function description with a Returns: to align with kernel doc
   style.

These changes align the existing write functions to current kernel
style, and will align with the style of the new functions added when we
implement live migration in a future series.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_common.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index e31d0ed55dff..da412fe5d1ff 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1358,32 +1358,23 @@ int ice_reset(struct ice_hw *hw, enum ice_reset_req req)
 }
 
 /**
- * ice_copy_rxq_ctx_to_hw
+ * ice_copy_rxq_ctx_to_hw - Copy packed Rx queue context to HW registers
  * @hw: pointer to the hardware structure
  * @rxq_ctx: pointer to the packed Rx queue context
  * @rxq_index: the index of the Rx queue
- *
- * Copies rxq context from dense structure to HW register space
  */
-static int ice_copy_rxq_ctx_to_hw(struct ice_hw *hw,
-				  const ice_rxq_ctx_buf_t *rxq_ctx,
-				  u32 rxq_index)
+static void ice_copy_rxq_ctx_to_hw(struct ice_hw *hw,
+				   const ice_rxq_ctx_buf_t *rxq_ctx,
+				   u32 rxq_index)
 {
-	u8 i;
-
-	if (rxq_index > QRX_CTRL_MAX_INDEX)
-		return -EINVAL;
-
 	/* Copy each dword separately to HW */
-	for (i = 0; i < ICE_RXQ_CTX_SIZE_DWORDS; i++) {
+	for (int i = 0; i < ICE_RXQ_CTX_SIZE_DWORDS; i++) {
 		u32 ctx = ((const u32 *)rxq_ctx)[i];
 
 		wr32(hw, QRX_CONTEXT(i, rxq_index), ctx);
 
 		ice_debug(hw, ICE_DBG_QCTX, "qrxdata[%d]: %08X\n", i, ctx);
 	}
-
-	return 0;
 }
 
 #define ICE_CTX_STORE(struct_name, struct_field, width, lsb) \
@@ -1432,23 +1423,26 @@ static void ice_pack_rxq_ctx(const struct ice_rlan_ctx *ctx,
 /**
  * ice_write_rxq_ctx - Write Rx Queue context to hardware
  * @hw: pointer to the hardware structure
- * @rlan_ctx: pointer to the rxq context
+ * @rlan_ctx: pointer to the unpacked Rx queue context
  * @rxq_index: the index of the Rx queue
  *
  * Pack the sparse Rx Queue context into dense hardware format and write it
  * into the HW register space.
+ *
+ * Return: 0 on success, or -EINVAL if the Rx queue index is invalid.
  */
 int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
 		      u32 rxq_index)
 {
 	ice_rxq_ctx_buf_t buf = {};
 
-	if (!rlan_ctx)
+	if (rxq_index > QRX_CTRL_MAX_INDEX)
 		return -EINVAL;
 
 	ice_pack_rxq_ctx(rlan_ctx, &buf);
+	ice_copy_rxq_ctx_to_hw(hw, &buf, rxq_index);
 
-	return ice_copy_rxq_ctx_to_hw(hw, &buf, rxq_index);
+	return 0;
 }
 
 /* LAN Tx Queue Context */

-- 
2.47.0.265.g4ca455297942


