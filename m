Return-Path: <linux-kbuild+bounces-4713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D560B9D1C3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9907F2825DD
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 00:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DDC1A28C;
	Tue, 19 Nov 2024 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQ0PHSPk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F3BE4F;
	Tue, 19 Nov 2024 00:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731975829; cv=none; b=rMDemAP2IHhSdslPUJbaSCQFOitZrP0xmi1/tGBGCwjLl85PhiMP77a4AGXI3lFDmaid39BVwLCe1DvHzwDWf14bDIbjN/2naWcAiw+qLZSzq4RX63i3QzTv9H+uJhD2WkVnUMh0h0bXB1gKL9hXWKTqpGukDHBsbdO6pc/RG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731975829; c=relaxed/simple;
	bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIqvrhwRIy6ogvVODHesskXds2TvyTyL/bLGuHQKfjw+xnBUKDPtuqzEsdlb9Du5nF760I1DB1RcyMCkIZ8eqTZhELOrZ8UzkwnAesEpDLaQVbhHscbt3VrpX0/fiigJffqUTtt0nsJ9zYACIBbcuYJQDvUs8wK7xemlS4Hfhe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQ0PHSPk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731975828; x=1763511828;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=smdCnKK5JCnXzm+UfTq+T7poKVvmdHV4Efr4cxIXJpQ=;
  b=LQ0PHSPknddywBZgBab128LHKnJ/aEaUQ6lEbiUgAJ6j7gttcmNshsdv
   3gymC2csRvT9EmnPwPLVamLwL1FnQZRpNtIAWeUBm9tgUvspSLdu4R6+D
   a3+RJxDtdstMSkh6pbH2IRinVZtPHpftiSrtc2UHXGpXvtobiWLuOwU6B
   N8MlTir0HMbxhn0GLhQr5M0WacpEaLk7iKBX00A6+Dnb8NBbfXKMWeCId
   aZ5Id+Wx2pXhYqAHpeKqxvZOHlfnUaE9bOO1+YHeX9hwxNxf3IlUDg8xT
   fLKCiTlAfZIuOAHNMFfDFq5EKX1O1FMO4TcyK6CMmmreJVCpTHvr9ZQUJ
   A==;
X-CSE-ConnectionGUID: z9Puza5hRheX92SYuOH7cw==
X-CSE-MsgGUID: MbQgghttQNeyeEYgfplWSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31892433"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31892433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:46 -0800
X-CSE-ConnectionGUID: T3hc4Td8RVymWFZ++6YHVg==
X-CSE-MsgGUID: U0VpSkoRS6yvWUDOx+Bu0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89162725"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 16:23:46 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 18 Nov 2024 16:23:41 -0800
Subject: [PATCH net-next RFC v6 4/9] ice: remove int_q_state from
 ice_tlan_ctx
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-packing-pack-fields-and-ice-implementation-v6-4-6af8b658a6c3@intel.com>
References: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
In-Reply-To: <20241118-packing-pack-fields-and-ice-implementation-v6-0-6af8b658a6c3@intel.com>
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


