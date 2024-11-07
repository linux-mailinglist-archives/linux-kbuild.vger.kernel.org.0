Return-Path: <linux-kbuild+bounces-4561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAC59C0F5E
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 20:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0431F23458
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 19:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6C3218597;
	Thu,  7 Nov 2024 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKv4xX5h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C2218328;
	Thu,  7 Nov 2024 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731009048; cv=none; b=GFdxeNaXIIyMjDE+zMAgvsCDuuegY5se0k0WK2YDUSCSE0db6/tIpbQZLRodF0lvfM6LbPt6Yoapa+cLCRTUeiUeayt21U66T9nZyOMglDaUiDKW5mcN+ZAb0+Q1iQxIJ72ETd/fHDFqcrdK96BWDDppGYMJPo0y2xn08XI1qFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731009048; c=relaxed/simple;
	bh=f9uCiziVnI4wuB4h/bDy/aSeGrsD+WydAKIvXQYTXX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctBx8fzU58TgJnq/htswHY04Jp9SrvS0L+rOUK5D+WhtGolYI+EujoKhKz0QjoUh6hNBWrdXk6erkUBRGM4ssVJJIlq8GSw7Gl6Vi2SEYXyn1O814bQk5FLCMUJquqrsif0Psf0wbv12zZrbuP29G6j4COACjcjtoK7RVWXA8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKv4xX5h; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731009047; x=1762545047;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f9uCiziVnI4wuB4h/bDy/aSeGrsD+WydAKIvXQYTXX4=;
  b=CKv4xX5htJNqR0COogXjOK693Udr0PvimfQZsArptq4Sfhg1nDfsnDmh
   NpuUr84yZNZpL+z4XyzjsYzt429QS/nHN4QizbH+V8S+tszybzqIG6XZB
   I+H5u9D9ucrblhW46DSSoR2dfYr0PYs18KNoIECzRimjG2kmr+nFkLfx2
   HdVkO30lQvaYT61Q3XGselEqS8J9n1nKKWfZAMXdFZepTUWKHcFwIYxwr
   HEThdnCstsT/pj/XkWAgYI6302rTwqKOOlqv8lT25hjNqHUm7GonkbyPl
   /f0rYB4oEinqo/KAq3pKVRsyf75VYX7DUrCLT19+Q2uj22gmvOKltvDSM
   Q==;
X-CSE-ConnectionGUID: rVf8LmUDTgOLI2aiPK8Ykg==
X-CSE-MsgGUID: Dnu44LSySAqnV4WGF6dyYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30647726"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30647726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:43 -0800
X-CSE-ConnectionGUID: Ub2p5orPTD2WvqsSHePrEg==
X-CSE-MsgGUID: WUnJVBA9S5qGg2T+iDE6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="86009635"
Received: from jekeller-desk.jf.intel.com ([10.166.241.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 11:50:42 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Thu, 07 Nov 2024 11:50:39 -0800
Subject: [PATCH net-next v3 8/9] ice: move prefetch enable to
 ice_setup_rx_ctx
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-packing-pack-fields-and-ice-implementation-v3-8-27c566ac2436@intel.com>
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

The ice_write_rxq_ctx() function is responsible for programming the Rx
Queue context into hardware. It receives the configuration in unpacked form
via the ice_rlan_ctx structure.

This function unconditionally modifies the context to set the prefetch
enable bit. This was done by commit c31a5c25bb19 ("ice: Always set prefena
when configuring an Rx queue"). Setting this bit makes sense, since
prefetching descriptors is almost always the preferred behavior.

However, the ice_write_rxq_ctx() function is not the place that actually
defines the queue context. We initialize the Rx Queue context in
ice_setup_rx_ctx(). It is surprising to have the Rx queue context changed
by a function who's responsibility is to program the given context to
hardware.

Following the principle of least surprise, move the setting of the prefetch
enable bit out of ice_write_rxq_ctx() and into the ice_setup_rx_ctx().

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_base.c   | 3 +++
 drivers/net/ethernet/intel/ice/ice_common.c | 9 +++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_base.c b/drivers/net/ethernet/intel/ice/ice_base.c
index 0a325dec804e..f1fbba19e4e4 100644
--- a/drivers/net/ethernet/intel/ice/ice_base.c
+++ b/drivers/net/ethernet/intel/ice/ice_base.c
@@ -453,6 +453,9 @@ static int ice_setup_rx_ctx(struct ice_rx_ring *ring)
 	/* Rx queue threshold in units of 64 */
 	rlan_ctx.lrxqthresh = 1;
 
+	/* Enable descriptor prefetch */
+	rlan_ctx.prefena = 1;
+
 	/* PF acts as uplink for switchdev; set flex descriptor with src_vsi
 	 * metadata and flags to allow redirecting to PR netdev
 	 */
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 8d32a751868e..c6a6dbc0e80b 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -1432,14 +1432,13 @@ static void ice_pack_rxq_ctx(const struct ice_rlan_ctx *ctx,
 }
 
 /**
- * ice_write_rxq_ctx
+ * ice_write_rxq_ctx - Write Rx Queue context to hardware
  * @hw: pointer to the hardware structure
  * @rlan_ctx: pointer to the rxq context
  * @rxq_index: the index of the Rx queue
  *
- * Converts rxq context from sparse to dense structure and then writes
- * it to HW register space and enables the hardware to prefetch descriptors
- * instead of only fetching them on demand
+ * Pack the sparse Rx Queue context into dense hardware format and write it
+ * into the HW register space.
  */
 int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
 		      u32 rxq_index)
@@ -1449,8 +1448,6 @@ int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
 	if (!rlan_ctx)
 		return -EINVAL;
 
-	rlan_ctx->prefena = 1;
-
 	ice_pack_rxq_ctx(rlan_ctx, &buf);
 
 	return ice_copy_rxq_ctx_to_hw(hw, &buf, rxq_index);

-- 
2.47.0.265.g4ca455297942


