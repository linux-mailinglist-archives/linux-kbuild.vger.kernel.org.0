Return-Path: <linux-kbuild+bounces-4571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD79C1786
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 09:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B368B226B6
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9DB1D5CF9;
	Fri,  8 Nov 2024 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBE6ZPb7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E5819408C;
	Fri,  8 Nov 2024 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053340; cv=none; b=bLRiTXXNUrvm634uhuplUc8w8MCHvJ+g3mMNKvsbdpR0q83kVziCBmhKNrqwrtAob9YRyBzReVS9EQkKMK/xGfLEJdDf7/ZvxVFksKS6GvoTb86/xUCWWkGyUw1q5fU9c3VFYhkKvfyy0C7TKfQx7iLGNQGaNklm7m+iKo1wrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053340; c=relaxed/simple;
	bh=T3jIkWFJUlMt29NS3MYHoJlUKl0iB7fjvJaj8MbCBns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdYRgrtdkx5c6wUqS8JJ2hdVWRPihYIws3wmv+NR+rx43HfXuEh/0iBgV6eLw3uI4VBNaOv8GH2CAEQ0EPI7U8xxk32KzlRctdI+LOekeMrhOZuXA/RuAPF1D2WLjWQdIyg/C4AB4NrnbNsoxy9mDf+iL7bVhW9sE32KQUj1DDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBE6ZPb7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731053339; x=1762589339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T3jIkWFJUlMt29NS3MYHoJlUKl0iB7fjvJaj8MbCBns=;
  b=lBE6ZPb7D8J8eCxV2YK8DLjsr4lOJ88yn3RJ74+ewl/PeplPinYSP8pG
   2sL+rYUevJbVPvEhth+REXez1CUi/eRAC8K2pNe+37Zzxr2WrcD8J/ouV
   IaABL/vboHjkYI3O79dZSuh0eTErahqzqLjBv1Ib0huvhT/2iG5TGByod
   EKt22XZr6FGyMbDZN7u95LzOT8WmQBnWnC1gw9KNSjRIXIjsulXCnBbj2
   BY3zib7CGzpoR8Dkxy54khMskTyTj/1YpLygc4bV7mA5ltY9aGlqZJrlM
   eJSXF96apJXUdjsM63Tnqut3/ybzX4vfVvT3nZMx7IcDP/ktQKLX2XAmd
   Q==;
X-CSE-ConnectionGUID: gs2UiGbAQSejRd65SUhtOA==
X-CSE-MsgGUID: +bByTc8xRjur2u7xXDZqCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31087552"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31087552"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:08:59 -0800
X-CSE-ConnectionGUID: 07jIiEzdROyquhSDBvdEkQ==
X-CSE-MsgGUID: JLxDaBXdQgiM1WIVLtthJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="86257292"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2024 00:08:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9K32-000rCE-33;
	Fri, 08 Nov 2024 08:08:52 +0000
Date: Fri, 8 Nov 2024 16:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	netdev <netdev@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v3 6/9] ice: use <linux/packing.h> for Tx and Rx
 queue context data
Message-ID: <202411081511.T7pLZhW4-lkp@intel.com>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-6-27c566ac2436@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-packing-pack-fields-and-ice-implementation-v3-6-27c566ac2436@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a84e8c05f58305dfa808bc5465c5175c29d7c9b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/lib-packing-create-__pack-and-__unpack-variants-without-error-checking/20241108-040154
base:   a84e8c05f58305dfa808bc5465c5175c29d7c9b6
patch link:    https://lore.kernel.org/r/20241107-packing-pack-fields-and-ice-implementation-v3-6-27c566ac2436%40intel.com
patch subject: [PATCH net-next v3 6/9] ice: use <linux/packing.h> for Tx and Rx queue context data
config: x86_64-randconfig-122-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081511.T7pLZhW4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081511.T7pLZhW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081511.T7pLZhW4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_common.c:1393:1: sparse: sparse: symbol '__ice_rlan_ctx_fields_buffer_sz' was not declared. Should it be static?
>> drivers/net/ethernet/intel/ice/ice_common.c:1393:1: sparse: sparse: symbol 'ice_rlan_ctx_fields' was not declared. Should it be static?
>> drivers/net/ethernet/intel/ice/ice_common.c:1460:1: sparse: sparse: symbol '__ice_tlan_ctx_fields_buffer_sz' was not declared. Should it be static?
>> drivers/net/ethernet/intel/ice/ice_common.c:1460:1: sparse: sparse: symbol 'ice_tlan_ctx_fields' was not declared. Should it be static?

vim +/__ice_rlan_ctx_fields_buffer_sz +1393 drivers/net/ethernet/intel/ice/ice_common.c

  1388	
  1389	#define ICE_CTX_STORE(struct_name, struct_field, width, lsb) \
  1390		PACKED_FIELD((lsb) + (width) - 1, (lsb), struct struct_name, struct_field)
  1391	
  1392	/* LAN Rx Queue Context */
> 1393	DECLARE_PACKED_FIELDS_S(ice_rlan_ctx_fields, ICE_RXQ_CTX_SZ) = {
  1394					 /* Field		Width	LSB */
  1395		ICE_CTX_STORE(ice_rlan_ctx, head,		13,	0),
  1396		ICE_CTX_STORE(ice_rlan_ctx, cpuid,		8,	13),
  1397		ICE_CTX_STORE(ice_rlan_ctx, base,		57,	32),
  1398		ICE_CTX_STORE(ice_rlan_ctx, qlen,		13,	89),
  1399		ICE_CTX_STORE(ice_rlan_ctx, dbuf,		7,	102),
  1400		ICE_CTX_STORE(ice_rlan_ctx, hbuf,		5,	109),
  1401		ICE_CTX_STORE(ice_rlan_ctx, dtype,		2,	114),
  1402		ICE_CTX_STORE(ice_rlan_ctx, dsize,		1,	116),
  1403		ICE_CTX_STORE(ice_rlan_ctx, crcstrip,		1,	117),
  1404		ICE_CTX_STORE(ice_rlan_ctx, l2tsel,		1,	119),
  1405		ICE_CTX_STORE(ice_rlan_ctx, hsplit_0,		4,	120),
  1406		ICE_CTX_STORE(ice_rlan_ctx, hsplit_1,		2,	124),
  1407		ICE_CTX_STORE(ice_rlan_ctx, showiv,		1,	127),
  1408		ICE_CTX_STORE(ice_rlan_ctx, rxmax,		14,	174),
  1409		ICE_CTX_STORE(ice_rlan_ctx, tphrdesc_ena,	1,	193),
  1410		ICE_CTX_STORE(ice_rlan_ctx, tphwdesc_ena,	1,	194),
  1411		ICE_CTX_STORE(ice_rlan_ctx, tphdata_ena,	1,	195),
  1412		ICE_CTX_STORE(ice_rlan_ctx, tphhead_ena,	1,	196),
  1413		ICE_CTX_STORE(ice_rlan_ctx, lrxqthresh,		3,	198),
  1414		ICE_CTX_STORE(ice_rlan_ctx, prefena,		1,	201),
  1415	};
  1416	
  1417	/**
  1418	 * ice_pack_rxq_ctx - Pack Rx queue context into a HW buffer
  1419	 * @ctx: the Rx queue context to pack
  1420	 * @buf: the HW buffer to pack into
  1421	 *
  1422	 * Pack the Rx queue context from the CPU-friendly unpacked buffer into its
  1423	 * bit-packed HW layout.
  1424	 */
  1425	static void ice_pack_rxq_ctx(const struct ice_rlan_ctx *ctx,
  1426				     ice_rxq_ctx_buf_t *buf)
  1427	{
  1428		BUILD_BUG_ON(sizeof(*buf) != ICE_RXQ_CTX_SZ);
  1429	
  1430		pack_fields(buf, sizeof(*buf), ctx, ice_rlan_ctx_fields,
  1431			    QUIRK_LITTLE_ENDIAN | QUIRK_LSW32_IS_FIRST);
  1432	}
  1433	
  1434	/**
  1435	 * ice_write_rxq_ctx
  1436	 * @hw: pointer to the hardware structure
  1437	 * @rlan_ctx: pointer to the rxq context
  1438	 * @rxq_index: the index of the Rx queue
  1439	 *
  1440	 * Converts rxq context from sparse to dense structure and then writes
  1441	 * it to HW register space and enables the hardware to prefetch descriptors
  1442	 * instead of only fetching them on demand
  1443	 */
  1444	int ice_write_rxq_ctx(struct ice_hw *hw, struct ice_rlan_ctx *rlan_ctx,
  1445			      u32 rxq_index)
  1446	{
  1447		ice_rxq_ctx_buf_t buf = {};
  1448	
  1449		if (!rlan_ctx)
  1450			return -EINVAL;
  1451	
  1452		rlan_ctx->prefena = 1;
  1453	
  1454		ice_pack_rxq_ctx(rlan_ctx, &buf);
  1455	
  1456		return ice_copy_rxq_ctx_to_hw(hw, &buf, rxq_index);
  1457	}
  1458	
  1459	/* LAN Tx Queue Context */
> 1460	DECLARE_PACKED_FIELDS_S(ice_tlan_ctx_fields, ICE_TXQ_CTX_SZ) = {
  1461					    /* Field			Width	LSB */
  1462		ICE_CTX_STORE(ice_tlan_ctx, base,			57,	0),
  1463		ICE_CTX_STORE(ice_tlan_ctx, port_num,			3,	57),
  1464		ICE_CTX_STORE(ice_tlan_ctx, cgd_num,			5,	60),
  1465		ICE_CTX_STORE(ice_tlan_ctx, pf_num,			3,	65),
  1466		ICE_CTX_STORE(ice_tlan_ctx, vmvf_num,			10,	68),
  1467		ICE_CTX_STORE(ice_tlan_ctx, vmvf_type,			2,	78),
  1468		ICE_CTX_STORE(ice_tlan_ctx, src_vsi,			10,	80),
  1469		ICE_CTX_STORE(ice_tlan_ctx, tsyn_ena,			1,	90),
  1470		ICE_CTX_STORE(ice_tlan_ctx, internal_usage_flag,	1,	91),
  1471		ICE_CTX_STORE(ice_tlan_ctx, alt_vlan,			1,	92),
  1472		ICE_CTX_STORE(ice_tlan_ctx, cpuid,			8,	93),
  1473		ICE_CTX_STORE(ice_tlan_ctx, wb_mode,			1,	101),
  1474		ICE_CTX_STORE(ice_tlan_ctx, tphrd_desc,			1,	102),
  1475		ICE_CTX_STORE(ice_tlan_ctx, tphrd,			1,	103),
  1476		ICE_CTX_STORE(ice_tlan_ctx, tphwr_desc,			1,	104),
  1477		ICE_CTX_STORE(ice_tlan_ctx, cmpq_id,			9,	105),
  1478		ICE_CTX_STORE(ice_tlan_ctx, qnum_in_func,		14,	114),
  1479		ICE_CTX_STORE(ice_tlan_ctx, itr_notification_mode,	1,	128),
  1480		ICE_CTX_STORE(ice_tlan_ctx, adjust_prof_id,		6,	129),
  1481		ICE_CTX_STORE(ice_tlan_ctx, qlen,			13,	135),
  1482		ICE_CTX_STORE(ice_tlan_ctx, quanta_prof_idx,		4,	148),
  1483		ICE_CTX_STORE(ice_tlan_ctx, tso_ena,			1,	152),
  1484		ICE_CTX_STORE(ice_tlan_ctx, tso_qnum,			11,	153),
  1485		ICE_CTX_STORE(ice_tlan_ctx, legacy_int,			1,	164),
  1486		ICE_CTX_STORE(ice_tlan_ctx, drop_ena,			1,	165),
  1487		ICE_CTX_STORE(ice_tlan_ctx, cache_prof_idx,		2,	166),
  1488		ICE_CTX_STORE(ice_tlan_ctx, pkt_shaper_prof_idx,	3,	168),
  1489	};
  1490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

