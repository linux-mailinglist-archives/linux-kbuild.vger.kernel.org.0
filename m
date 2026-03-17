Return-Path: <linux-kbuild+bounces-12025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH1BF1LTuWkqOQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12025-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 23:18:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C169A2B30A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 23:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A377304DEBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 22:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92E39281F;
	Tue, 17 Mar 2026 22:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc+cZaHh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02008377029;
	Tue, 17 Mar 2026 22:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785879; cv=none; b=oiWKy0JGViaqI70dx9590OJuY6FVi/CgSsXI52gGfvDE7JIkCV5HiUBTiqQ0lVfYXuRq8kUMfPqlJ0YvFJoRI1kHvTa/0pEY+d0sQVj7m/LOEg2+VQPdts0yEMeCcMTVW1GLgCq0ccpNNJXHw608P+6C6Sz3/qk7jnfQ0ap7hmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785879; c=relaxed/simple;
	bh=FNWIPBES0YKSmK+pgav9TGtnCBJV8EEE9Co9MfCjjrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuzcaUDRCJXSyImieGDMUSKBPP84ENhVeJvIvO7mN+kwg4SMmj1bDWZvVbvLUHa2g697IqbIKRxxDWkgrpkdRkvNfnIQsstoVa5aTuTylMk1RjgSpmfDk0pusA38B7O5DBcqgr8HMM6MzL3bpZZMrjVQ4j9rKsxgS0gyi9xBlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc+cZaHh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773785877; x=1805321877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FNWIPBES0YKSmK+pgav9TGtnCBJV8EEE9Co9MfCjjrI=;
  b=Lc+cZaHhqwABNw5JpP6esfp9Mjcm7LJ5jFm75MurN5IWP25k/CnGAGQK
   AdFv2uOPVMf0bq3AO0CsxGTrivfnnLryCQLf7OO+E7XufcuoMEPNGHVVO
   F1607CFW3D7aQ3DouMJhFyo7HGcUtVOE3AYHHNNgWd21up/gZCnPz9AVF
   RJ9nR981WrjqT9hBTI+oczTYLZCWPhzFYP6HEI0oTymrAxZo6Np5SVi8z
   ptD+sfnUDS+LRzFbBJLfaSBdyziwTVphBmFTacWCHLsL/QbIGSS/fqgm0
   2ZFT0e4AJ5LBEHWYeb9Wr95xvE2vric/pdCS9suNl4MQXPFOhAOwVaUD2
   A==;
X-CSE-ConnectionGUID: HNRMyHQCRPqoGLWYZNr5Sg==
X-CSE-MsgGUID: UmCsiPMTSu6lyGk1ha7KCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100293805"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="100293805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:17:56 -0700
X-CSE-ConnectionGUID: 00Dw8TaWSC+6yJmQpnHcEQ==
X-CSE-MsgGUID: fVwSoFFSRdiAqNVwH5HOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218493195"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 15:17:49 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2cjS-0000000026D-0zP9;
	Tue, 17 Mar 2026 22:17:46 +0000
Date: Wed, 18 Mar 2026 06:17:31 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v6 9/9] power: sequencing: pcie-m2: Create serdev device
 for WCN7850 bluetooth
Message-ID: <202603180609.ucspJefN-lkp@intel.com>
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
	TAGGED_FROM(0.00)[bounces-12025-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C169A2B30A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Manivannan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 559f264e403e4d58d56a17595c60a1de011c5e20]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/serdev-Convert-to_serdev_-helpers-to-macros-and-use-container_of_const/20260317-123910
base:   559f264e403e4d58d56a17595c60a1de011c5e20
patch link:    https://lore.kernel.org/r/20260317-pci-m2-e-v6-9-9c898f108d3d%40oss.qualcomm.com
patch subject: [PATCH v6 9/9] power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180609.ucspJefN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180609.ucspJefN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180609.ucspJefN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/sequencing/pwrseq-pcie-m2.c: In function 'pwrseq_pcie_m2_free_resources':
>> drivers/power/sequencing/pwrseq-pcie-m2.c:185:34: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
     185 |         bus_unregister_notifier(&pci_bus_type, &ctx->nb);
         |                                  ^~~~~~~~~~~~
         |                                  pci_pcie_type
   drivers/power/sequencing/pwrseq-pcie-m2.c:185:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/power/sequencing/pwrseq-pcie-m2.c: In function 'pwrseq_pcie_m2_register_notifier':
   drivers/power/sequencing/pwrseq-pcie-m2.c:340:54: error: 'pci_bus_type' undeclared (first use in this function); did you mean 'pci_pcie_type'?
     340 |                         ret = bus_register_notifier(&pci_bus_type, &ctx->nb);
         |                                                      ^~~~~~~~~~~~
         |                                                      pci_pcie_type


vim +185 drivers/power/sequencing/pwrseq-pcie-m2.c

   179	
   180	static void pwrseq_pcie_m2_free_resources(void *data)
   181	{
   182		struct pwrseq_pcie_m2_ctx *ctx = data;
   183	
   184		serdev_device_remove(ctx->serdev);
 > 185		bus_unregister_notifier(&pci_bus_type, &ctx->nb);
   186		of_changeset_revert(ctx->ocs);
   187		of_changeset_destroy(ctx->ocs);
   188		regulator_bulk_free(ctx->num_vregs, ctx->regs);
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

