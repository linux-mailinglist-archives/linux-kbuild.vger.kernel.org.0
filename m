Return-Path: <linux-kbuild+bounces-4585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256E9C292D
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 02:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 248701C22E6F
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 01:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408F333DF;
	Sat,  9 Nov 2024 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6gt9zfx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5401CA94;
	Sat,  9 Nov 2024 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731115839; cv=none; b=BF68Af+CquZLVa8VEeAl8W6xAeoHVPr6XRjhSMvyTh1p2jLcqPSYpAyHVa22TY+TFLG32WQsRXFBcDBJpPqs7sHMr6vFvceGvcSLwytxuEAImRM+1kO01QognN9dGCkRgL6gdiUzYIcAWdF+ZQH6cOC0HGY3eimF1dEkVQ50odY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731115839; c=relaxed/simple;
	bh=LdoeboTt1iJZ8l27Xbcv/vUqueDpoEQkChBB6rU81hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXprBGZ8L7/Q27Bh9bVkG8BjdrtYbFdoendmDDBpmpnLpvjj4yjrs0QWU0BJBH4Bzy2Qqqm2ZZ6lOvFYeiZC8HOo4XuB68A6axdERWgLKoCGPjV8FTvT3PepDOsuL/c2Hb66ESFLokz3tqG0cPsFDa+fFfUKfhYf6DLav4VgHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6gt9zfx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731115837; x=1762651837;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=LdoeboTt1iJZ8l27Xbcv/vUqueDpoEQkChBB6rU81hQ=;
  b=V6gt9zfx66AGwW0Xdf5+F7rdyx4g7jgGk04M3BrjUA9fw1FOKAKuwtNs
   9jQcWztKwHd8tk9XnSZpRy2wM/EU/Qzt5XAAAmtVwDuWX9ZnUTDCYZIrG
   OQZyF8rQkUKCEfbETDuOO+7yvtMuuT69uk/pzXfGoRljNaAb/A0J6EMmV
   O7deT//NPoLWPDiMJJJX0+9XRJmgpzw7MRLcYzrb/J8enUBPXVTntzt7I
   KG0PXa7Ax1xw3C78uEJ7PgCRpOwkhzM7cAraz1sqnU4YIPmvEPfTa553E
   KFuy5V6fGMOO76WdlYfqhkiVFnHAfqklDNXyJD08i6WoUEAhz6R/sFxHu
   w==;
X-CSE-ConnectionGUID: zI19LgOJT3idKQuqx0/xlA==
X-CSE-MsgGUID: j9BuSuVXRyGts+26Ez7uFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18637327"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="18637327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:30:33 -0800
X-CSE-ConnectionGUID: kirmoctdSX2FepERQQDF+w==
X-CSE-MsgGUID: j2bmX+eFQv6rhRrOjBE6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="90646189"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 17:30:33 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Fri, 08 Nov 2024 17:30:20 -0800
Subject: [PATCH net-next v4 7/9] ice: reduce size of queue context fields
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-packing-pack-fields-and-ice-implementation-v4-7-81a9f42c30e5@intel.com>
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


