Return-Path: <linux-kbuild+bounces-1857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219A8C5E14
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 01:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28E571C20C26
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 23:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C42182C91;
	Tue, 14 May 2024 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvdQyjGr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2748A17F387;
	Tue, 14 May 2024 23:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715728872; cv=none; b=eHkNXekmYnk7H29g26S6pbNJq5++8aAiTK66iaEe4d4fTDsEYuDkudMmkwBC/xgl80rNjE4k1e/Q2D3t6MEbI/Yw9elJkKyAXd2RfysPGVhvY5J6ksX5BtHvVZNj4LgP3AQ01tCNw7uUD/m7QG2zjYdQ66DmEWjpl1jTlxZwMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715728872; c=relaxed/simple;
	bh=7ihOx+On7qsF0uZkTX25uGxvJYCn3RsNXw8vIycZavc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p43EX39B1qrwtDwKICcLvKrVrQGwdc4Evw2TAP2isbY78OQ01iwmfkUVR+3MrbcUtsTUbxXQObB2rPk7RGdXhDRBTih8n/weSlTtbfrSADR5oaNXvG2N0UjJhzWP2xHEeRVCZ15ZMDlYl+CId1PlLbQip5+GLSbidKO2RHksuKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvdQyjGr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715728869; x=1747264869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ihOx+On7qsF0uZkTX25uGxvJYCn3RsNXw8vIycZavc=;
  b=bvdQyjGryFum0sxEGc1ifL3thtW0cNMSDb23qArgZEgzDPmt4EZiIfVO
   nkBfbZMyNypiU7dtIzwEd8qOubCJEwwFqr/QEWh4j6O0qFjsm/sUihcM0
   NAPSfFB1aVd9Q+z+ZDudjOBeUrto97bs+6dx+zdzuSAa3RK0J/7wuDsfS
   AUBY3M3M3yLYLJXlHiJCjU8MnX/ARpgT89dHJBYQUt0Y5NjhmnjdKMElM
   ONXQ8mTWvrF8vK7GqL6IyfWXT3JsjBlh33zP/V+ZbKB0Yiz1fBwmBNay5
   jJRKre9+yPq48mn5+8wBY3/NdCu4oZrgU9mPbPNbguQ/3JbRn/GjXdufw
   w==;
X-CSE-ConnectionGUID: y485MLvmR8maDZuZ1PCBkQ==
X-CSE-MsgGUID: tU5zb4iWThq8PBgZq0Bt7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11526376"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11526376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 16:21:08 -0700
X-CSE-ConnectionGUID: KhLRM4W4TCOb1kIPWv0D5A==
X-CSE-MsgGUID: HBAD6ENmTqa8dAv9OWk/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="68305472"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2024 16:21:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s71SA-000C6H-1N;
	Tue, 14 May 2024 23:21:02 +0000
Date: Wed, 15 May 2024 07:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jiri Olsa <olsajiri@gmail.com>,
	Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v2 2/6] trace: add CONFIG_BUILTIN_MODULE_RANGES option
Message-ID: <202405150623.lmS5sVhM-lkp@intel.com>
References: <20240511224035.27775-3-kris.van.hees@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511224035.27775-3-kris.van.hees@oracle.com>

Hi Kris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dd5a440a31fae6e459c0d6271dddd62825505361]

url:    https://github.com/intel-lab-lkp/linux/commits/Kris-Van-Hees/kbuild-add-modules-builtin-objs/20240512-065954
base:   dd5a440a31fae6e459c0d6271dddd62825505361
patch link:    https://lore.kernel.org/r/20240511224035.27775-3-kris.van.hees%40oracle.com
patch subject: [PATCH v2 2/6] trace: add CONFIG_BUILTIN_MODULE_RANGES option
config: arc-kismet-CONFIG_VMLINUX_MAP-CONFIG_BUILTIN_MODULE_RANGES-0-0 (https://download.01.org/0day-ci/archive/20240515/202405150623.lmS5sVhM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240515/202405150623.lmS5sVhM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405150623.lmS5sVhM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VMLINUX_MAP when selected by BUILTIN_MODULE_RANGES
   WARNING: unmet direct dependencies detected for VMLINUX_MAP
     Depends on [n]: EXPERT [=n]
     Selected by [y]:
     - BUILTIN_MODULE_RANGES [=y] && FTRACE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

