Return-Path: <linux-kbuild+bounces-4556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 436799C0F54
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F07331F22A49
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCFA217F40;
	Thu,  7 Nov 2024 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/CWhutj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056492178E6;
	Thu,  7 Nov 2024 19:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009045; cv=none; b=P8qfJHJs8WWz+OjURnKC+GRdkHjQN8G1utRdW07tV3gxSH4iBt9PzKMPfFjrssygepDL5YPrJmU3LJHdVt3jB3S/lZfgAVu4sFTUzYGfVK7C0M/OzGoRrgZOds1dpgMKoFG8tSdw4uzD4iCukZCyY5QTYAr554At1QqVJK2XRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009045; c=relaxed/simple;
	bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s858x6f5J4iHYnogwRTTALc0CaCUU/Cqu2WbOwuUUmxi66Y14Gmp1rXcSBiNbngISzjjWLj8pLRTriLexQGJz7xzqNXIlPn8qYICErbvF3lW7yOLkBq8OYfQ5552Y/Y8qbuF9e3UGf/Jzrh9e/mfjT7tM09btt7UE0WssDRpH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/CWhutj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009044; x=1762545044;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
  b=d/CWhutjzEfWFaYkWmzrUYF84iz3Alp9fMz/M9iZSjWKiRfU1/6mFPS2
   FfzXnAhenZLa2kiuaXrTaW/lVjkYeI6HOHTkKuk2QXZofDP6A0x8PK1zQ
   nRrYzjEEhDklUY4EuCEgxE8JjwRlY3GOTG2YDlS5BPUd/SVek96NGoSAj
   1RVrA+cVUXUHyTwl0ozDWj70Q1Cdj74NwwN+8qJDiWiiUSh2XMgqB97v3
   Mib68myudNzFCtRe9AwI1AvivQDcqT+tRWYTdkgaz+eouud7DTpUFPhL+
   EEbkn1KxXPirbEPE6uQlwipClBCj56Ep0rogMtPAGhyxxhTsXH7Vr3OU7
   g==;
X-CSE-ConnectionGUID: wyXdfqGvRpuSaFSXi6X+wg==
X-CSE-MsgGUID: ET8/EoF6SliEDcZOzbMacQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647676"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30647676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
X-CSE-ConnectionGUID: tVbbB3rKQV623VKovH52dQ==
X-CSE-MsgGUID: ZzlwOKB9Rh6QX/CIlvljBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="86009623"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 07 Nov 2024 11:50:35 -0800
Subject: [PATCH net-next v3 4/9] ice: remove int_q_state from ice_tlan_ctx
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-packing-pack-fields-and-ice-implementation-v3-4-27c566ac2436@intel.com>
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


