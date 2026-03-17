Return-Path: <linux-kbuild+bounces-12026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAIGJvHVuWnEOQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12026-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 23:30:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 439262B319D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 23:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C16F7309E827
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 22:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBE23A1E7E;
	Tue, 17 Mar 2026 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JY1yqQr+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232A3A0EAB;
	Tue, 17 Mar 2026 22:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786602; cv=none; b=Z3PQaW2wP9YkzRqIjD6/7Z+KkU4aMtyEbIUIc2BFKXo/UIjoEjmLPvXPCh2SUpr1OV1XBkmg3hZg1Dx6NG870W1kPyIchYE28PS4dZii13x/HjG6gUg2b20zN9cpBRLXVoWT/M0DQDRLZ8DmAimQLugteaTERkmYrxbMVx/erjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786602; c=relaxed/simple;
	bh=CnhOIHlyblpvsOEV8hoOhLwkcqHdhWN6Zqa9wOHKLVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttk4OkjuDstsdpX4sur4YEsJFUsjLqAvipeJjo3qj1vspdvGGBd5Tt5MRWVzkfRsp0LqQlX0CykCldVSH8l8jTIK+Sb2AU+iXCkDlssKtsiHuQrNJAjh+2B8/1NDQ476aLnY4k8NRpCdV6bZ199o+JbbWY3semllLkscE2ysp2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JY1yqQr+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773786599; x=1805322599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnhOIHlyblpvsOEV8hoOhLwkcqHdhWN6Zqa9wOHKLVY=;
  b=JY1yqQr+sUgDkRTFF8vFrVj8cMMY8iYlONhuAHSg5Ph1X/V3dH0S/IqO
   3tTL1HFwA3e3eE85vY8rpSr+0QDE2ky94EjKWW/k0EnWAbalwpMFz2Red
   Xvxyvf6/0mfsjnzpU8O70dIPF6J8IP/zle8+WBwWsQpcBFFaVV92+LQfH
   CsohSEff041ElvhloexLASZ9iFf5uPykQNVHLf4y6Ypf7OTwfzPj+foAW
   L0o4DbtXe7E4KszqULZDkxBXMxvSy381+2nAgczznXTfjYwKDVV2PHMXO
   fYmpCTUqBJ1CdCgx18cJWCxCC5ti1hhDthCJAwIExeUBPYzj2xvhgiDgl
   w==;
X-CSE-ConnectionGUID: YiB/3BzwRDyaFIGr4n0wWA==
X-CSE-MsgGUID: owHFRbL0SjS6JQBJ32Vixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74809296"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74809296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:29:59 -0700
X-CSE-ConnectionGUID: BEMfbMsJRnKCt++S2U62cA==
X-CSE-MsgGUID: pRhFVNvwQ+Se5X5qKLOxnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221486241"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2026 15:29:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cv5-0000000026z-0bPZ;
	Tue, 17 Mar 2026 22:29:47 +0000
Date: Wed, 18 Mar 2026 06:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 9/9] power: sequencing: pcie-m2: Create serdev device
 for WCN7850 bluetooth
Message-ID: <202603180601.E8FFoQ4J-lkp@intel.com>
References: <20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12026-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,manivannan.sadhasivam.oss.qualcomm.com,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 439262B319D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Manivannan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 559f264e403e4d58d56a17595c60a1de011c5e20]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/serdev-Convert-to_serdev_-helpers-to-macros-and-use-container_of_const/20260317-123910
base:   559f264e403e4d58d56a17595c60a1de011c5e20
patch link:    https://lore.kernel.org/r/20260317-pci-m2-e-v6-9-9c898f108d3d%40oss.qualcomm.com
patch subject: [PATCH v6 9/9] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
config: um-randconfig-002-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180601.E8FFoQ4J-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180601.E8FFoQ4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180601.E8FFoQ4J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:17:
>> include/linux/of.h:1652:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1652 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1627:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1627 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1658:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1658 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1627:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1627 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1664:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1664 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/of.h:1670:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1670 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/of.h:1676:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1676 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.
   make[3]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1 shuffle=497447418
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2 shuffle=497447418
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=497447418
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=497447418
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
   Depends on [n]: OF [=n]
   Selected by [y]:
   - POWER_SEQUENCING_PCIE_M2 [=y] && POWER_SEQUENCING [=y] && (PCI [=n] && OF [=n] || COMPILE_TEST [=y])


vim +1652 include/linux/of.h

2e8fff668dc14e Rob Herring       2023-03-29  1633  
201c910bd6898d Pantelis Antoniou 2014-07-04  1634  #ifdef CONFIG_OF_DYNAMIC
f6892d193fb9d6 Grant Likely      2014-11-21  1635  extern int of_reconfig_notifier_register(struct notifier_block *);
f6892d193fb9d6 Grant Likely      2014-11-21  1636  extern int of_reconfig_notifier_unregister(struct notifier_block *);
f5242e5a883bf1 Grant Likely      2014-11-24  1637  extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
f5242e5a883bf1 Grant Likely      2014-11-24  1638  extern int of_reconfig_get_state_change(unsigned long action,
f5242e5a883bf1 Grant Likely      2014-11-24  1639  					struct of_reconfig_data *arg);
f6892d193fb9d6 Grant Likely      2014-11-21  1640  
201c910bd6898d Pantelis Antoniou 2014-07-04  1641  extern void of_changeset_init(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1642  extern void of_changeset_destroy(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1643  extern int of_changeset_apply(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1644  extern int of_changeset_revert(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1645  extern int of_changeset_action(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1646  		unsigned long action, struct device_node *np,
201c910bd6898d Pantelis Antoniou 2014-07-04  1647  		struct property *prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1648  
201c910bd6898d Pantelis Antoniou 2014-07-04  1649  static inline int of_changeset_attach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1650  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1651  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1652  	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1653  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1654  
201c910bd6898d Pantelis Antoniou 2014-07-04  1655  static inline int of_changeset_detach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1656  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1657  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1658  	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1659  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1660  
201c910bd6898d Pantelis Antoniou 2014-07-04  1661  static inline int of_changeset_add_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1662  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1663  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1664  	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1665  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1666  
201c910bd6898d Pantelis Antoniou 2014-07-04  1667  static inline int of_changeset_remove_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1668  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1669  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1670  	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1671  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1672  
201c910bd6898d Pantelis Antoniou 2014-07-04  1673  static inline int of_changeset_update_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1674  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1675  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1676  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1677  }
b544fc2b8606d7 Lizhi Hou         2023-08-15  1678  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

