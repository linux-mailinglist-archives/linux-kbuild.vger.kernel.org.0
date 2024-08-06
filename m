Return-Path: <linux-kbuild+bounces-2830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A781D948B28
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 10:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6BE2817DB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 08:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C953C092;
	Tue,  6 Aug 2024 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjaxeQCh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA2166F17;
	Tue,  6 Aug 2024 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932506; cv=fail; b=tLYGW2cj9b+T9VnDQX/EhKWYrihO68xlKs+u/nsJgNGfr57gOOmB7j4xpjOUShcjc6K+Yfq8tW1z6dedP0ff9h+Ty6/j7DOgd8cHd2MiN/JyXfuQ6dczgY8y6JHoUJv1IjpJwk1sjHnawnkoo/bveAoyhtPzmKuZDVqiONUg+Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932506; c=relaxed/simple;
	bh=cw0LfI50fgQaXjKGn2ODJ1eZvHedbes9RXYPPYZUoSg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=J0mqKYUR1vREc6OL7zMoitrB4jfGfOY1r5F7uBwnajp/upesKSsfF7reCBR0+rzQD1jGqcS8jEnXe++1aMXyjcQ91tbvH6AiemkSkAWcs6kKgCkFnI+4xtTEhKkh295fqP586GjFWuAPHMQCV4cmRR0+ASGx/m05wTJ5VJwdsWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjaxeQCh; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722932503; x=1754468503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cw0LfI50fgQaXjKGn2ODJ1eZvHedbes9RXYPPYZUoSg=;
  b=CjaxeQChwZyfGsnb0XS2xdCHoxm2ZV+16fgbx6sSt232PefBNIg4GdyD
   3VFa7pX+JnuYhFaD62b+Y4ilvk618Rp5SBDd3fTELFMrMZzbTGBE6XNKq
   HNu1hStYQFYZyskWEjWTdYXhNBjxZ5kv6TNnj3SkoFGshDAkDqy4o3gky
   GE30kfbWDjxB3GpngdENVRPESCiuV9+OjHR/VxT822Md3qjOxgIPI6NkB
   oTlUkQn27itav/ax3OziAn9d48Z57yzynshS1YnidNeXxX9Yvz/5BDJ7m
   h9W5HD+fV2G6uYW++1QjR0cbUrUI9Int8rqOUi8hxBHQQWgk86j4SSesp
   g==;
X-CSE-ConnectionGUID: WzdaOS3rRSyxRyZCYuG7LA==
X-CSE-MsgGUID: BJc45ZkxSFOmiVQOItzBUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="46335154"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="46335154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 01:21:43 -0700
X-CSE-ConnectionGUID: bEA/bJ7nRVSYdwCTauCKmA==
X-CSE-MsgGUID: Go6xd0oYTvGg+HB1sFti8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="61403486"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 01:21:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 01:21:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 01:21:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 01:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvXdzOnm3bL/8NT6Vz3ZccSZBYHnuqB7hsUZj/JnvqIa7V3G92tX7PGvz1LzDgXK6/8w1IC0+vjJrvnO+ue9i1Cih3CufH/jj1EVxOH8qGYhuf6HKd569Zi/Tfo9amlkXJ5+qg2P9rwwdb4mBDtwqHYW1r2K1Mk7XAhCh4kSCuc1eGoQFnUKjrqFIhObLNw2n8H8fFrEX9rlMByKZfeRASuo88TYxL1/wF+NMmuGF5W3aZzMOYLaLBx7q9qv8i8AcFpM/5KT4Rq2Uissyw6Uzuwub6sfKaFzGaruzaNX31+8ZlrEF3nzLJq5t7p7o/vCGLz3fNbQPOS7Th1MI6CKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvyWXo9oqBAeQml1bRN6z47WIstbjyNt4zVSpMTdZfI=;
 b=AVkRszsgEPzn8dgXhThuJPMpbMmyBUULT7mRLFuSZ2ImdM7Qn78F0GOOFpGQYxoPD1k2+TUUVohgaIZXTcZ3cBGcSgJ2gGCI/UT6CizVsxnl9OTttlH19MR36N7g02TSODsBwcb4JWtCd24S/dg877/yMIvZDOiqfPxhedghA4Wf7OKtKp4bxIc0sMNaswpADca9WkW5TjaQuT8Od9WtEAZmmOsU7ArnvEE4c3kktDBJXtV80wr5CtpF6kvcDh9Xg93iwJT+JMVar5Z+46Bw+/uj9xLBe2UKfamzuGVB+WiyPX0rOuSUIbOLXJqWqSuw5Rjj/hL/pjeI8+U2FR+P8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 08:21:39 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 08:21:37 +0000
Date: Tue, 6 Aug 2024 16:21:28 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [kconfig]  f79dc03fe6: segfault_at_ip_sp_error
Message-ID: <202408061634.fe6be94-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: 613d5756-1e04-422e-544c-08dcb5f0ca6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnldVwR84OycRderWrz9iayFcNH482Jflg4JclYeqKHsETQBCoHdP/MHCwKO?=
 =?us-ascii?Q?pGxGqlfmAsublvakOxmA8M+8PYL8cOINwILqytz4EV7wtYxOjc1lPk+Aqx0Y?=
 =?us-ascii?Q?mWrdyc+O9GXh3s0KFRTrEEZFfp01L7s2FECOFYpWwZPcTTit+Deet/81QyeH?=
 =?us-ascii?Q?GG6SmV6QA685S3/9h/HFvcpZBSdIqPK6H3U5aeT7HZ0qsWAnUf+zJCXmd2i/?=
 =?us-ascii?Q?gjd70fFNX5vgV42pEeMnZHz7nxH+sV1iQ7HkTDDzinCei8f7OB+Sm1m8bJeQ?=
 =?us-ascii?Q?Z8+H9B7ntf7ODkJjKP/qxDtKNNNgmtialKNRzgwAmNnijpCqKn1tCp2rtZqP?=
 =?us-ascii?Q?Z5HoDEZbPRfwlmryyfU6ACkMr7sKn9D4mDZ5Hw3HYnLveZdpoMUSiG6wY2qI?=
 =?us-ascii?Q?K8k0yqg/IXyZOujljtxKCBJ5BF8gyArnFxaTrTL5xmk89xeEVarwsYhv50On?=
 =?us-ascii?Q?GtEDgrSmNiFRGD7qFNo52Jzv0MnueomBNYW3TCdONbMmYZNbpayaO6x9p8nX?=
 =?us-ascii?Q?uZf1n7mjOrO/YkpNLycvty3JKUQuv4E9tC3xZK83IHTNVbsoNYnzHQ5t2PPH?=
 =?us-ascii?Q?x2VSnPmfRc+0u7YqlqOqjC7AItXIO79C7NODG0pgT42OyExDVBc08rFkM1vX?=
 =?us-ascii?Q?GAUqnDca9ZNeol+jObg3PdM0EEWHzKj1diZuKOplN0tlks7mrnaSWOwc/0/M?=
 =?us-ascii?Q?keoSiMvwf8LElqTcGwtU74+UwIH+wP9nsJovYDHdA+8I1dza3qT/Ndx0TLBl?=
 =?us-ascii?Q?HR3Ue5hRZ/GcOeo91YFbGuyYRP3lu0vbFm+IF7fYdqqRHVQINEVluMl79iL2?=
 =?us-ascii?Q?8MN9f2GJdycuncbY9eRLl8CB3gGP4BjKf9+wQ7WoJcStb79qQpbH0/b0xDit?=
 =?us-ascii?Q?RTEDHzylWeG3HOP+7Wz2FMcinHIdDKRZQDSZq58z+aYWOsBgYjf3AwNVnzdP?=
 =?us-ascii?Q?rZlkSYsOsGlB0BJonwsxonpkIlbLGyV52RE0aO7sB42Mb5jpmweO9IlBO6A0?=
 =?us-ascii?Q?cite1QZ2CJs/Ie/LaVhEhN94l0PGB03jfK8IJIOUq8/f9ofX7Mm4z/9cF1Lm?=
 =?us-ascii?Q?tbyLgGdFIu9AH8trhfUBBaARq2H8n9m8j9gUHrWDn3YChJ+MmwZCsnRSJN/u?=
 =?us-ascii?Q?yFDs284k8nDSNsEJSQUjWP8cxr3kI7R6F32MzcuWzrIqL25cu3d/TnvgIQbu?=
 =?us-ascii?Q?8XkWabg8BbgSWMrFT/xMyFtTWBkdzu75gx6iyjOqjSAdvKfKKW5oShghoGQT?=
 =?us-ascii?Q?tFHjVwkE3YwL2xmu47EOmxs/NlSrLk3xA/x6FzLFcE3+JWaydAuKWAOkX1fZ?=
 =?us-ascii?Q?G1rVG6OcbRvinp860mr34O4w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3pZKWY5XUYAsS7+qEJkrNtTnXJnQubqaT5HS6jrF7MpsNbVs2CJqYv4VvJal?=
 =?us-ascii?Q?LroHv3BeDXFbhAQjn/fY32sWQ8A1MUPlmhH1rufKLl/cIAuGkIGw9VNGCdEE?=
 =?us-ascii?Q?0YWyfLlNk5attKdRNaFhvFK1nP8dn1CRrnM9/YcefYVGPT1jLZk4UvW58YkQ?=
 =?us-ascii?Q?/doVpcyhWHtGZ5cqbTzTcCf1PBvd9fk3/PkDYmez2Qh8K0ioM6scOxxfIoY5?=
 =?us-ascii?Q?jmFX7+a7uPxdydeyv8lgxwtAVJFD/lFyoR2oF0JVwpsr77RuQc41DrcNh8t1?=
 =?us-ascii?Q?E2fYhFG9aMUp5mnZK4RkEW3RMEE4K22yS+k6q0afoXfx1BRvFBlD/jKBHNCB?=
 =?us-ascii?Q?FGYPD7K6LDYBc0nl44oQlwnjHcR1Ncr8ya4y2pphEBuL+bdQtmqmv6rE0n2H?=
 =?us-ascii?Q?Zw1eBdd48FY+3TKYI8P3isamxpG63YNABouW0kXSu6uD0W2UnoC2dNV6YIpd?=
 =?us-ascii?Q?pTKRcAQbKEGxKheQ3PiIGd2czh9zHz0mV4Z7saz4OqKgLae84YzYL983tI4j?=
 =?us-ascii?Q?yhFPkR54qf0Dun9dvdu1/y4ZXEvs5oGpsTax21wl3VfCzfyuEEqloWtfxEAZ?=
 =?us-ascii?Q?7KC8GM8uPRz/zVJVkpdQgpp+sM8/ZqEGJVPFy6p2cODGIJrhjyXEwkiYnyWq?=
 =?us-ascii?Q?Ps3bzRjBbsYJ99NfaMVjL8hc3PfIsc0KYxbK1JfeFuabuaHotYDJpH/g3ZFc?=
 =?us-ascii?Q?A7uM6gCRGyzKcd4I1m2SXioSPMQ6654GxzHhirki58StvQ1iqBhzUw8DetBr?=
 =?us-ascii?Q?63QwXjsp1NXY5zHr0h5uUoB+LZVLp5+mIU6Ig/Qjaws4L1dn+hxL+hS7cxLa?=
 =?us-ascii?Q?tPLiVLadFmADzWkSmbvCJ8H+RovuvkEEMjo2abDdm8ZqxV3WZcpPHQzNYKmZ?=
 =?us-ascii?Q?syyO3SZWc3iGN47geLEFL+2w6E+psFjJy8QnuRj6mN1aSfmRBsa3cABgn75C?=
 =?us-ascii?Q?ZqtUvqhqtb6sFLq8Q1FyDs5kiS9WWsqflneZPkVa/nw7BMjtzVChq1NvWiT0?=
 =?us-ascii?Q?FsPa2Le8c4Hv1+sCQ3jJ5oXHIrs60pGd+G7clKn/+pLpd/ONsPWolU4hv1EF?=
 =?us-ascii?Q?h/9KHlk7Zk31JQjaPCaHChzo/BV9vFkWkwi7rBd8ocPoLbObK/rbNc9Fd71F?=
 =?us-ascii?Q?RdwXOS8rcHGp3z6ri/0EqC5njDMp/di/ScJZTy+sTCqUSUXaSDUnPZIYUCa8?=
 =?us-ascii?Q?7FUrZehCnTUBRPJyL+LWwDQq9uND18a9aOIZbjXEYaYeLX7Az3whZ1mANDid?=
 =?us-ascii?Q?nNUHr1NzhMa0kZpzWptNqcHQVzBeiBzk9AwegzqjgQ5EtIcaQjmISdWlcwVz?=
 =?us-ascii?Q?Xzx+G5Y/x/KMcHmAyYIFczRTUXflISH7SHUeXzWolrE29K6E50ePLq6jQM4l?=
 =?us-ascii?Q?IxvMIjDVezahraEnOJdR73e4+mZmoRNJb93p9mN7VFzC3TFRcE5tjNZT2OGg?=
 =?us-ascii?Q?IW4lgvVcOOdJlclodDWXW/Qy+OKrqw+bOAJDC674zeouq2rJtojOqJ5mOnqN?=
 =?us-ascii?Q?2v93YfmvbuNhcHO6NQkpcaVRosicSZKYTsTdMslPW+TmDui4RYntozscQOo3?=
 =?us-ascii?Q?v9OAfSWaN300iXSLepLBwaaMsevv4tiXdgFPiGQ3DDB9AdWYJ/8mSrzUK0ZQ?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613d5756-1e04-422e-544c-08dcb5f0ca6c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 08:21:37.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdzAlT6xjTXbtg7Wu1JRv9SzR4vBT9aQKBYu0TxrnZYu+u9U5PUNXBkQZsoxaUsatXFLlzNq5hrbbRwjX13LgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
X-OriginatorOrg: intel.com


hi, Masahiro Yamada,

the config for this test is a random config, by this commit, the config has
below diff with parent:

--- /pkg/linux/i386-randconfig-r032-20230623/gcc-12/ee29e6204c32dce013ac6d1078d98dce5607ce86/.config    2024-08-05 12:56:30.744686432 +0800
+++ /pkg/linux/i386-randconfig-r032-20230623/gcc-12/f79dc03fe68c79d388908182e68d702f7f1786bc/.config    2024-08-05 12:56:37.620536644 +0800
@@ -770,14 +770,14 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_SIG=y
 # CONFIG_MODULE_SIG_FORCE is not set
 CONFIG_MODULE_SIG_ALL=y
-CONFIG_MODULE_SIG_SHA1=y
+# CONFIG_MODULE_SIG_SHA1 is not set
 # CONFIG_MODULE_SIG_SHA256 is not set
 # CONFIG_MODULE_SIG_SHA384 is not set
 # CONFIG_MODULE_SIG_SHA512 is not set
-# CONFIG_MODULE_SIG_SHA3_256 is not set
+CONFIG_MODULE_SIG_SHA3_256=y
 # CONFIG_MODULE_SIG_SHA3_384 is not set
 # CONFIG_MODULE_SIG_SHA3_512 is not set
-CONFIG_MODULE_SIG_HASH="sha1"
+CONFIG_MODULE_SIG_HASH="sha3-256"
 CONFIG_MODULE_COMPRESS_NONE=y
 # CONFIG_MODULE_COMPRESS_GZIP is not set
 # CONFIG_MODULE_COMPRESS_XZ is not set
@@ -6201,7 +6201,6 @@ CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y
 #
 CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
 CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
-# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
 CONFIG_SYSTEM_TRUSTED_KEYRING=y
 CONFIG_SYSTEM_TRUSTED_KEYS=""
 CONFIG_SYSTEM_EXTRA_CERTIFICATE=y


we are not sure if these are expected?

we are not sure either if the issue in below report is caused by this config
diff. just report what we observed in our tests FYI.


Hello,

kernel test robot noticed "segfault_at_ip_sp_error" on:

commit: f79dc03fe68c79d388908182e68d702f7f1786bc ("kconfig: refactor choice value calculation")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed]
[test failed on linux-next/master d6dbc9f56c3a70e915625b6f1887882c23dc5c91]

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: srcud



compiler: gcc-12
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------+------------+------------+
|                         | ee29e6204c | f79dc03fe6 |
+-------------------------+------------+------------+
| segfault_at_ip_sp_error | 0          | 30         |
+-------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408061634.fe6be94-oliver.sang@intel.com


[  OK  ] Started OpenBSD Secure Shell server.
LKP: ttyS0: 263: Kernel tests: Boot OK!
LKP: ttyS0: 263: HOSTNAME vm-snb-i386, MAC 52:54:00:12:34:56, kernel 6.10.0-rc7-00022-gf79dc03fe68c 1
[   12.271477][   T23] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
LKP: ttyS0: 263:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-meta-59/rcutorture-300s-default-srcud-debian-11.1-i386-20220923.cgz-i386-randconfig-r032-20230623-f79dc03fe68c-20240805-47158-x4nrel-3.yaml
[   15.209351][  T483] depmod[483]: segfault at 0 ip b7abe4f6 sp bfb00aa4 error 4 in libc-2.31.so[8c4f6,b7a4b000+155000] likely on CPU 0 (core 0, socket 0)
[ 15.210249][ T483] Code: 5b 5e 29 f8 5f c3 66 90 66 90 66 90 66 90 66 90 66 90 66 90 56 57 8b 7c 24 0c 31 c0 89 f9 83 e1 3f 66 0f ef c0 83 f9 30 77 17 <f3> 0f 6f 0f 66 0f 74 c1 66 0f d7 d0 85 d2 75 73 89 f8 83 e0 f0 eb
All code
========
   0:	5b                   	pop    %rbx
   1:	5e                   	pop    %rsi
   2:	29 f8                	sub    %edi,%eax
   4:	5f                   	pop    %rdi
   5:	c3                   	retq   
   6:	66 90                	xchg   %ax,%ax
   8:	66 90                	xchg   %ax,%ax
   a:	66 90                	xchg   %ax,%ax
   c:	66 90                	xchg   %ax,%ax
   e:	66 90                	xchg   %ax,%ax
  10:	66 90                	xchg   %ax,%ax
  12:	66 90                	xchg   %ax,%ax
  14:	56                   	push   %rsi
  15:	57                   	push   %rdi
  16:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  1a:	31 c0                	xor    %eax,%eax
  1c:	89 f9                	mov    %edi,%ecx
  1e:	83 e1 3f             	and    $0x3f,%ecx
  21:	66 0f ef c0          	pxor   %xmm0,%xmm0
  25:	83 f9 30             	cmp    $0x30,%ecx
  28:	77 17                	ja     0x41
  2a:*	f3 0f 6f 0f          	movdqu (%rdi),%xmm1		<-- trapping instruction
  2e:	66 0f 74 c1          	pcmpeqb %xmm1,%xmm0
  32:	66 0f d7 d0          	pmovmskb %xmm0,%edx
  36:	85 d2                	test   %edx,%edx
  38:	75 73                	jne    0xad
  3a:	89 f8                	mov    %edi,%eax
  3c:	83 e0 f0             	and    $0xfffffff0,%eax
  3f:	eb                   	.byte 0xeb

Code starting with the faulting instruction
===========================================
   0:	f3 0f 6f 0f          	movdqu (%rdi),%xmm1
   4:	66 0f 74 c1          	pcmpeqb %xmm1,%xmm0
   8:	66 0f d7 d0          	pmovmskb %xmm0,%edx
   c:	85 d2                	test   %edx,%edx
   e:	75 73                	jne    0x83
  10:	89 f8                	mov    %edi,%eax
  12:	83 e0 f0             	and    $0xfffffff0,%eax
  15:	eb                   	.byte 0xeb
[   15.251290][  T487] torture module --- srcud:  disable_onoff_at_boot=0 ftrace_dump_at_shutdown=0 verbose_sleep_frequency=0 verbose_sleep_duration=1 random_shuffle=0
[   15.255881][  T487] srcud-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0
[   15.258765][  T487] srcud:  Start-test grace-period state: g0 f0x0
[   15.259257][  T487] rcu_torture_write_types: Testing expedited GPs.
[   15.259713][  T487] rcu_torture_write_types: Testing asynchronous GPs.


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240806/202408061634.fe6be94-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


