Return-Path: <linux-kbuild+bounces-4559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D99569C0F5A
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FAF9286296
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A4D218320;
	Thu,  7 Nov 2024 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe4yHHCG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3E217F4C;
	Thu,  7 Nov 2024 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009048; cv=none; b=VSzfrl39tw9SGFOShEu07ZjkGDiV0Nb84ajBFAvQEdG34POKiGWwZ7mfH1EsyBHZaI+47UXFXQzyt2EYXqWpVHPKe1tzNaYTS4tdz/E/mrA4lSto9ICxFwXNekNOvSVS5iwtGBxGZtBhPyEFHoB+gFUW2rVTA6f/+/T89nQmGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009048; c=relaxed/simple;
	bh=LdoeboTt1iJZ8l27Xbcv/vUqueDpoEQkChBB6rU81hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+Ra+0aRK1PWEI6NNqeQEhMsWwIogJoXuXp67lwd8EEUkASUSPsP6LC6oW7xK2Gpu2auPM+T069fGaNOOds0E8FfawYZtqcf0ujHrcJyL2ixeVXU5FmZdmAGqMinRFcGN5pOW3nFwI37YGGrPVCSe6rE2mMf2LMC+fKEsUgca0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe4yHHCG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009046; x=1762545046;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LdoeboTt1iJZ8l27Xbcv/vUqueDpoEQkChBB6rU81hQ=;
  b=Xe4yHHCGW3oEUWApn44xB02oV7WZIicCTexoIXd6FPeY3wTflMnAHm8t
   JBBhTGdFPTDzi4vaql1FY/DTmcZbzBAVSmQ9XHWOXdursTIP6Ploz0VKo
   zj/lNySywYD5IYE1DWnAeHfsn0ZWVkAKRsuKBZEtAhI+zSpn9WCR5TgFi
   u94S4t0hJk7nkEJ6NTxzstJQOXnzX4fhEKFf6Uu+Cv6Bvp2aFtHer/eCC
   2NZEBA/29TbkDO+yjq7z5Z7WAmluAUsen690A8ZlNffE4WUCrB32mHK1W
   J2IC12SZszLfPsP++rtg9JQl7bswGjhUZyz933KSzoBhr6cQF/NVgqQFf
   Q==;
X-CSE-ConnectionGUID: C8cVfJWVSyWfDR65IAac3A==
X-CSE-MsgGUID: haWTMqGCRXWBIdFGgLVzMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647710"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30647710"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
X-CSE-ConnectionGUID: 7JUCOMIDSm+emmRc282s4w==
X-CSE-MsgGUID: NpvSROC9RB2E7GeP5bgy6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="86009632"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 07 Nov 2024 11:50:38 -0800
Subject: [PATCH net-next v3 7/9] ice: reduce size of queue context fields
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-packing-pack-fields-and-ice-implementation-v3-7-27c566ac2436@intel.com>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
In-Reply-To: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1

The ice_rlan_ctx and ice_tlan_ctx structures have some fields which are
intentionally sized larger necessary relative to the packed sizes the data
must fit into. This was done because the original ice_set_ctx() function
and its helpers did not correctly handle packing when the packed bits
straddled a byte. This is no longer the case with the use of the
<linux/packing.h> implementation.

Save some bytes in these structures by sizing the variables to the number
of bytes the actual bitpacked fields fit into.

There are a couple of gaps left in the structure, which is a result of the
fields being in the order they appear in the packed bit layout, but where
alignment forces some extra gaps. We could fix this, saving ~8 bytes from
each structure. However, these structures are not used heavily, and the
resulting savings is minimal:

$ bloat-o-meter ice-before-reorder.ko ice-after-reorder.ko
add/remove: 0/0 grow/shrink: 1/1 up/down: 26/-70 (-44)
Function                                     old     new   delta
ice_vsi_cfg_txq                             1873    1899     +26
ice_setup_rx_ctx.constprop                  1529    1459     -70
Total: Before=1459555, After=1459511, chg -0.00%

Thus, the fields are left in the same order as the packed bit layout,
despite the gaps this causes.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
index 31d4a445d640..1479b45738af 100644
--- a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
+++ b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
@@ -375,23 +375,17 @@ enum ice_rx_flex_desc_status_error_1_bits {
 #define ICE_TX_DRBELL_Q_CTX_SIZE_DWORDS	5
 #define GLTCLAN_CQ_CNTX(i, CQ)		(GLTCLAN_CQ_CNTX0(CQ) + ((i) * 0x0800))
 
-/* RLAN Rx queue context data
- *
- * The sizes of the variables may be larger than needed due to crossing byte
- * boundaries. If we do not have the width of the variable set to the correct
- * size then we could end up shifting bits off the top of the variable when the
- * variable is at the top of a byte and crosses over into the next byte.
- */
+/* RLAN Rx queue context data */
 struct ice_rlan_ctx {
 	u16 head;
-	u16 cpuid; /* bigger than needed, see above for reason */
+	u8 cpuid;
 #define ICE_RLAN_BASE_S 7
 	u64 base;
 	u16 qlen;
 #define ICE_RLAN_CTX_DBUF_S 7
-	u16 dbuf; /* bigger than needed, see above for reason */
+	u8 dbuf;
 #define ICE_RLAN_CTX_HBUF_S 6
-	u16 hbuf; /* bigger than needed, see above for reason */
+	u8 hbuf;
 	u8 dtype;
 	u8 dsize;
 	u8 crcstrip;
@@ -399,12 +393,12 @@ struct ice_rlan_ctx {
 	u8 hsplit_0;
 	u8 hsplit_1;
 	u8 showiv;
-	u32 rxmax; /* bigger than needed, see above for reason */
+	u16 rxmax;
 	u8 tphrdesc_ena;
 	u8 tphwdesc_ena;
 	u8 tphdata_ena;
 	u8 tphhead_ena;
-	u16 lrxqthresh; /* bigger than needed, see above for reason */
+	u8 lrxqthresh;
 	u8 prefena;	/* NOTE: normally must be set to 1 at init */
 };
 
@@ -535,18 +529,12 @@ enum ice_tx_ctx_desc_eipt_offload {
 #define ICE_LAN_TXQ_MAX_QGRPS	127
 #define ICE_LAN_TXQ_MAX_QDIS	1023
 
-/* Tx queue context data
- *
- * The sizes of the variables may be larger than needed due to crossing byte
- * boundaries. If we do not have the width of the variable set to the correct
- * size then we could end up shifting bits off the top of the variable when the
- * variable is at the top of a byte and crosses over into the next byte.
- */
+/* Tx queue context data */
 struct ice_tlan_ctx {
 #define ICE_TLAN_CTX_BASE_S	7
 	u64 base;		/* base is defined in 128-byte units */
 	u8 port_num;
-	u16 cgd_num;		/* bigger than needed, see above for reason */
+	u8 cgd_num;
 	u8 pf_num;
 	u16 vmvf_num;
 	u8 vmvf_type;
@@ -557,7 +545,7 @@ struct ice_tlan_ctx {
 	u8 tsyn_ena;
 	u8 internal_usage_flag;
 	u8 alt_vlan;
-	u16 cpuid;		/* bigger than needed, see above for reason */
+	u8 cpuid;
 	u8 wb_mode;
 	u8 tphrd_desc;
 	u8 tphrd;
@@ -566,7 +554,7 @@ struct ice_tlan_ctx {
 	u16 qnum_in_func;
 	u8 itr_notification_mode;
 	u8 adjust_prof_id;
-	u32 qlen;		/* bigger than needed, see above for reason */
+	u16 qlen;
 	u8 quanta_prof_idx;
 	u8 tso_ena;
 	u16 tso_qnum;

-- 
2.47.0.265.g4ca455297942


