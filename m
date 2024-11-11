Return-Path: <linux-kbuild+bounces-4620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1E9C396F
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 09:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2A31F211CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 08:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE0615E5DC;
	Mon, 11 Nov 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZCRVM4S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C615A85E;
	Mon, 11 Nov 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731312537; cv=none; b=Br/S9wvxQn/rs3+3zqGiSTVhXXSL4XczB5quzn4YfN+RnA8qxefxtLTTZ/aVgqd0Lha1iz1N3rMekHwCD29ITsnuz9LT8VAKp5amGyjytB6+qWsqQIkR6srsGOqW4lHGnbPBzCa1TNOrTxN1qOdOkuveFJvLiS3P3UU7PWNZfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731312537; c=relaxed/simple;
	bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBVeG3wD9hZqk3Iq8Ch+eK5TiQPOpJ5lepeKFRe4oFPCfDELviT1KZViVp+mzBl+g0lEE59HPhnaxCUqZ7m52gZjHCm7EpIDVWDhjoCPSn5vK1IZmYugxgpnX+nRJvyz9ixba7IG8I5PgQCe8/oUESmdCDTDXrlFTTD6zxHnwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZCRVM4S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731312536; x=1762848536;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
  b=MZCRVM4SEK9RVYv4p3Lyu1jN1DfoQ5td7Vs737gry08Q/9xMRBOghwMX
   DLSn7nCNuEqyc2U4ZU1CvPpZLaycMHeLmvRzLbNg2hcBi6gWlyfNhxrWN
   855ALUovhCp/Vm0rVDFqohWHL5UBIL4fkkGfmqSWx+idkHbKW5mEpky9J
   c3jSvRkP0PBIADiImZIrZZ0NaSmxy5iGJt4L1+YAotZoqC64Z4ec9ITDi
   XY9fUxZT536e7bXrzna1YkTODsSjmTWMFTf5uHvlgfSh/4K1t4H5EExdQ
   zM7oVJUP63nWYTLq7d48ZaxUcHjq0RiCsmp/EjK3ZOA/7midbEPoiA8Rt
   g==;
X-CSE-ConnectionGUID: zqWeihNhQwO2Jt+sp05zig==
X-CSE-MsgGUID: f6tQAyA3Tl+Hl8ntGOSSKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41723231"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41723231"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:54 -0800
X-CSE-ConnectionGUID: 8sE7QjK3TMeQP2m0/+C2OA==
X-CSE-MsgGUID: MPp1Ll9TSkCLxdleYrfQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91323655"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:08:54 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 11 Nov 2024 00:08:45 -0800
Subject: [PATCH net-next v5 4/9] ice: remove int_q_state from ice_tlan_ctx
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-packing-pack-fields-and-ice-implementation-v5-4-80c07349e6b7@intel.com>
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

The int_q_state field of the ice_tlan_ctx structure represents the internal
queue state. However, we never actually need to assign this or read this
during normal operation. In fact, trying to unpack it would not be possible
as it is larger than a u64. Remove this field from the ice_tlan_ctx
structure, and remove its packing field from the ice_tlan_ctx_info array.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h | 1 -
 drivers/net/ethernet/intel/ice/ice_common.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
index 611577ebc29d..0e8ed8c226e6 100644
--- a/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
+++ b/drivers/net/ethernet/intel/ice/ice_lan_tx_rx.h
@@ -590,7 +590,6 @@ struct ice_tlan_ctx {
 	u8 drop_ena;
 	u8 cache_prof_idx;
 	u8 pkt_shaper_prof_idx;
-	u8 int_q_state;	/* width not needed - internal - DO NOT WRITE!!! */
 };
 
 #endif /* _ICE_LAN_TX_RX_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index b22e71dc59d4..0f5a80269a7b 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1467,7 +1467,6 @@ const struct ice_ctx_ele ice_tlan_ctx_info[] = {
 	ICE_CTX_STORE(ice_tlan_ctx, drop_ena,			1,	165),
 	ICE_CTX_STORE(ice_tlan_ctx, cache_prof_idx,		2,	166),
 	ICE_CTX_STORE(ice_tlan_ctx, pkt_shaper_prof_idx,	3,	168),
-	ICE_CTX_STORE(ice_tlan_ctx, int_q_state,		122,	171),
 	{ 0 }
 };
 

-- 
2.47.0.265.g4ca455297942


