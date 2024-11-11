Return-Path: <linux-kbuild+bounces-4623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC59C3975
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E8641F22212
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0B8166F3A;
	Mon, 11 Nov 2024 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJU7HKzT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D415ECD7;
	Mon, 11 Nov 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312539; cv=none; b=plQLfqcgDCIKkbVLIFfUEUtDoieyf/ou+znXmQZ6Exljuxdx1E1jeHN3wqkgztuBt1Uto57rfi+TzCVX3XIjIi6p8GOUseDDN+qFbiFwxPNXW/ISTLr4THIWEGJgBmy1epw79BT2iJKUp42pZivBBPbMU3UyPLtaJo8Zktmyzl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312539; c=relaxed/simple;
	bh=QA9ZP8kafnMku15pNiHjzijK09Tp4GBBZa/d6PkCG5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZCh4+wQZ5k0fX8iXoHHNW+xwQfY4WG16F0t6YLE8vWKu3SPONZJlReOaD/E0sBG48fk4xibWQco9WzQTfDugz8Zeg1Mo9xKfgZtML8LLExbWlIFHyCt5rBWpXyNVTm4D8xXHKvaKVYYOfkDLH/mArXLyp0ctM5f1crstnnJAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJU7HKzT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312538; x=1762848538;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QA9ZP8kafnMku15pNiHjzijK09Tp4GBBZa/d6PkCG5k=;
  b=HJU7HKzTS3IHywxiRp8xeKWnooj/CGvLQIRhazg8gFiQ2pzMb9F1voHL
   KLVeQpjRzCLFlWuSfH9EeCP7RxR2D4Mqntc0rWR1S4DPO9PdQrFGVf7e4
   bGgyXp4nZjlzebmMgquMONPN7Wt98O2IiU6KhMR2M9FoV3hYrj3a7f7t5
   YfrMKU8m7r0rkXjPiA8+SwueU3GbZmMAgp2XQY1yJ3HR9Trlk1mrQ9/rT
   5SlSbXK71V7GU/JAiHS1xnWNt7w3chq7d7BqQI7I0zhSMLKKOuJ2cg01V
   d4Ak1kvrzuZK+o39CcyUo0E5LKC7B51EhQkTg48aIgpImYylSuZlQNFF+
   Q==;
X-CSE-ConnectionGUID: qNelDprATkK8THVzOqjm5g==
X-CSE-MsgGUID: QJZQLp4CTNeTneZRAgk/dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723241"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723241"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:54 -0800
X-CSE-ConnectionGUID: ufsHtgzgQwW8m+TJWUT5Ug==
X-CSE-MsgGUID: 2KrhZWg5RTmvrD+7g+lQSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323661"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:54 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:46 -0800
Subject: [PATCH net-next v5 5/9] ice: use structures to keep track of queue
 context size
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-5-80c07349e6b7@intel.com>
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

The ice Tx and Rx queue context are currently stored as arrays of bytes
with defined size (ICE_RXQ_CTX_SZ and ICE_TXQ_CTX_SZ). The packed queue
context is often passed to other functions as a simple u8 * pointer, which
does not allow tracking the size. This makes the queue context API easy to
misuse, as you can pass an arbitrary u8 array or pointer.

Introduce wrapper typedefs which use a __packed structure that has the
proper fixed size for the Tx and Rx context buffers. This enables the
compiler to track the size of the value and ensures that passing the wrong
buffer size will be detected by the compiler.

The existing APIs do not benefit much from this change, however the
wrapping structures will be used to simplify the arguments of new packing
functions based on the recently introduced pack_fields API.

Co-developed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_adminq_cmd.h | 11 +++++++++--
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h  |  2 --
 drivers/net/ethernet/intel/ice/ice_base.c       |  2 +-
 drivers/net/ethernet/intel/ice/ice_common.c     | 24 +++++++++++-------------
 4 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
index 1f01f3501d6b..a0ec9c97c2d7 100644
--- a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
+++ b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
@@ -12,6 +12,13 @@
 #define ICE_AQC_TOPO_MAX_LEVEL_NUM	0x9
 #define ICE_AQ_SET_MAC_FRAME_SIZE_MAX	9728
 
+#define ICE_RXQ_CTX_SIZE_DWORDS		8
+#define ICE_RXQ_CTX_SZ			(ICE_RXQ_CTX_SIZE_DWORDS * sizeof(u32))
+#define ICE_TXQ_CTX_SZ			22
+
+typedef struct __packed { u8 buf[ICE_RXQ_CTX_SZ]; } ice_rxq_ctx_buf_t;
+typedef struct __packed { u8 buf[ICE_TXQ_CTX_SZ]; } ice_txq_ctx_buf_t;
+
 struct ice_aqc_generic {
 	__le32 param0;
 	__le32 param1;
@@ -2067,10 +2074,10 @@ struct ice_aqc_add_txqs_perq {
 	__le16 txq_id;
 	u8 rsvd[2];
 	__le32 q_teid;
-	u8 txq_ctx[22];
+	ice_txq_ctx_buf_t txq_ctx;
 	u8 rsvd2[2];
 	struct ice_aqc_txsched_elem info;
-};
+} __packed;
 
 /* The format of the command buffer for Add Tx LAN Queues (0x0C30)
  * is an array of the following structs. Please note that the length of
diff --git a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
index 0e8ed8c226e6..a76e5b0e7861 100644
--- a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
+++ b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
@@ -371,8 +371,6 @@ enum ice_rx_flex_desc_status_error_1_bits {
 	ICE_RX_FLEX_DESC_STATUS1_LAST /* this entry must be last!!! */
 };
 
-#define ICE_RXQ_CTX_SIZE_DWORDS		8
-#define ICE_RXQ_CTX_SZ			(ICE_RXQ_CTX_SIZE_DWORDS * sizeof(u32))
 #define ICE_TX_CMPLTNQ_CTX_SIZE_DWORDS	22
 #define ICE_TX_DRBELL_Q_CTX_SIZE_DWORDS	5
 #define GLTCLAN_CQ_CNTX(i, CQ)		(GLTCLAN_CQ_CNTX0(CQ) + ((i) * 0x0800))
diff --git a/drivers/net/ethernet/intel/ice/ice_base.c b/drivers/net/ethernet/intel/ice/ice_base.c
index 3a8e156d7d86..260942877968 100644
--- a/drivers/net/ethernet/intel/ice/ice_base.c
+++ b/drivers/net/ethernet/intel/ice/ice_base.c
@@ -909,7 +909,7 @@ ice_vsi_cfg_txq(struct ice_vsi *vsi, struct ice_tx_ring *ring,
 	ice_setup_tx_ctx(ring, &tlan_ctx, pf_q);
 	/* copy context contents into the qg_buf */
 	qg_buf->txqs[0].txq_id = cpu_to_le16(pf_q);
-	ice_set_ctx(hw, (u8 *)&tlan_ctx, qg_buf->txqs[0].txq_ctx,
+	ice_set_ctx(hw, (u8 *)&tlan_ctx, (u8 *)&qg_buf->txqs[0].txq_ctx,
 		    ice_tlan_ctx_info);
 
 	/* init queue specific tail reg. It is referred as
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 0f5a80269a7b..48d95cb49864 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1359,29 +1359,27 @@ int ice_reset(struct ice_hw *hw, enum ice_reset_req req)
 /**
  * ice_copy_rxq_ctx_to_hw
  * @hw: pointer to the hardware structure
- * @ice_rxq_ctx: pointer to the rxq context
+ * @rxq_ctx: pointer to the packed Rx queue context
  * @rxq_index: the index of the Rx queue
  *
  * Copies rxq context from dense structure to HW register space
  */
-static int
-ice_copy_rxq_ctx_to_hw(struct ice_hw *hw, u8 *ice_rxq_ctx, u32 rxq_index)
+static int ice_copy_rxq_ctx_to_hw(struct ice_hw *hw,
+				  const ice_rxq_ctx_buf_t *rxq_ctx,
+				  u32 rxq_index)
 {
 	u8 i;
 
-	if (!ice_rxq_ctx)
-		return -EINVAL;
-
 	if (rxq_index > QRX_CTRL_MAX_INDEX)
 		return -EINVAL;
 
 	/* Copy each dword separately to HW */
 	for (i = 0; i < ICE_RXQ_CTX_SIZE_DWORDS; i++) {
-		wr32(hw, QRX_CONTEXT(i, rxq_index),
-		     *((u32 *)(ice_rxq_ctx + (i * sizeof(u32)))));
+		u32 ctx = ((const u32 *)rxq_ctx)[i];
 
-		ice_debug(hw, ICE_DBG_QCTX, "qrxdata[%d]: %08X\n", i,
-			  *((u32 *)(ice_rxq_ctx + (i * sizeof(u32)))));
+		wr32(hw, QRX_CONTEXT(i, rxq_index), ctx);
+
+		ice_debug(hw, ICE_DBG_QCTX, "qrxdata[%d]: %08X\n", i, ctx);
 	}
 
 	return 0;
@@ -1426,15 +1424,15 @@ static const struct ice_ctx_ele ice_rlan_ctx_info[] = {
 int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
 		      u32 rxq_index)
 {
-	u8 ctx_buf[ICE_RXQ_CTX_SZ] = { 0 };
+	ice_rxq_ctx_buf_t buf = {};
 
 	if (!rlan_ctx)
 		return -EINVAL;
 
 	rlan_ctx->prefena = 1;
 
-	ice_set_ctx(hw, (u8 *)rlan_ctx, ctx_buf, ice_rlan_ctx_info);
-	return ice_copy_rxq_ctx_to_hw(hw, ctx_buf, rxq_index);
+	ice_set_ctx(hw, (u8 *)rlan_ctx, (u8 *)&buf, ice_rlan_ctx_info);
+	return ice_copy_rxq_ctx_to_hw(hw, &buf, rxq_index);
 }
 
 /* LAN Tx Queue Context */

-- 
2.47.0.265.g4ca455297942


