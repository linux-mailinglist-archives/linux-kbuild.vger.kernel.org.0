Return-Path: <linux-kbuild+bounces-4591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F99C2939
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 02:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9695F28495F
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 01:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7077D405;
	Sat,  9 Nov 2024 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJOAlGZ6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAAE57CAC;
	Sat,  9 Nov 2024 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731115842; cv=none; b=j+g4zmuBMpdkEVoFcfVCBpTUvfYj/FR2FRupEPGrmZw2ViV9dRkusAiQfJZUWAnB1jFUchZXV0x6Bp2Ex+NQUwLCC3u1akp54c8pYGnGPkxcPUsJskMxwWqLBN7G8blcvB0amalJ9tOnKLY7w5T5QWvJ4UXcpi0ysxL2ENCmMiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731115842; c=relaxed/simple;
	bh=yF7B9MaMLwvmvh6JSMZtVrcTSqVkplWss/m6PiCoLmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZI4VUJOVp3dDKPRoNH5i1WchyJztvZoXVJYgT3FUQSRI+wks9Oy3gFz7MoH1YW5xAe07VpSBlFoOYs0lKFGHpM7rXBxs57cWlpkDLkRt0gRS5hvzeL0lOGVbjPjFATMrVWGoJGYJeap+yKFZMjpT1SKX34xYfQ48SoxJ/A2pK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJOAlGZ6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731115841; x=1762651841;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yF7B9MaMLwvmvh6JSMZtVrcTSqVkplWss/m6PiCoLmE=;
  b=LJOAlGZ6OvDDGPWR6Y15dVLLQWH03zbErrbuNLiyVh+u3u0YDcmn8SDO
   ZT/fhxROTJAOyhQw/UkSpU7ZAH9ImETHSsT5JIFMeJ29EWmMqlLrtwMIB
   x7xNRmAt8qqyfEm3CapiLaMz2NCaS9m9OHO+bEhRN8/mD56tnxWOGLgj/
   CoSe4g4dwZFklrL6XqwKsOZEGXVvqxlqGAJjAjFzYwyiuQJOV4xxVXFlE
   dVshSfbr2scqg8X5NucUuvLGbl7V5rQSM9Za7cHBGYlt/NQs5vRdB1NQ0
   vd0bk2Q1c1q6u/v4upiBlU+d+Yc5ELdXkcNDbHME0ttUu3lnsKx7OzcmW
   g==;
X-CSE-ConnectionGUID: x75BgEymTIivXQYTW07dGw==
X-CSE-MsgGUID: GpjR93v+ToiYvjfrdpAMyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18637350"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="18637350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:30:34 -0800
X-CSE-ConnectionGUID: ihOsaF8mTD6jCSwDiYl8IQ==
X-CSE-MsgGUID: vYapMpTeSC6T85CYUF3N3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90646195"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:30:33 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Fri, 08 Nov 2024 17:30:22 -0800
Subject: [PATCH net-next v4 9/9] ice: cleanup Rx queue context programming
 functions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-packing-pack-fields-and-ice-implementation-v4-9-81a9f42c30e5@intel.com>
References: <20241108-packing-pack-fields-and-ice-implementation-v4-0-81a9f42c30e5@intel.com>
In-Reply-To: <20241108-packing-pack-fields-and-ice-implementation-v4-0-81a9f42c30e5@intel.com>
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


