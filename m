Return-Path: <linux-kbuild+bounces-4147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BA9A0BD3
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 15:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BB981C22E0E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 13:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3715B13C;
	Wed, 16 Oct 2024 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9gJhE2c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94661208D7D;
	Wed, 16 Oct 2024 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086455; cv=fail; b=dGcGJlJIdl/sIeNL8AokWu1GsWFGYsn+0UhueI4hZrdvQoFJfmsJ8OwobVaAYwK8eXBuwTe+67gkOERD4VINqIM0j9EyiYNoJBeW1bGFJ3gckysbl/aF7cjniuJj7vd78fnPtLCD0/DqVyCFzt65KRZkhuL21/bSUA3HrlrwZVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086455; c=relaxed/simple;
	bh=rpCvK9ibzk1g/KvnWelLQLNhdg9QKcMc4Z5ehi5chww=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DZIj889I2owNDscXOqfk52A1sXKom1C0aFIe1z62a9WGGfgqmD8N4zXm+Y8aWp7o6DsdZiQSVETImdgxH90gfskx6dBLPBIYmBqM73wisr+y3Cc6WUaZrCreykYcLRpt8epihPIKOH48IrQBqK8ciyR4IcshmRgosAP7/kRYrsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9gJhE2c; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729086453; x=1760622453;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=rpCvK9ibzk1g/KvnWelLQLNhdg9QKcMc4Z5ehi5chww=;
  b=Y9gJhE2cnmLij5eVCa9sfoAu3OxbN/742AjlAoBh4NWB9OpEL4okR4z4
   SLJRQn2wjAZvri3kE1/MyhV32tnSb5Yz+Eu0h/11DJp8fKu0GItcN4W1V
   81BlCbUmXhKloTt+W4YUSx5slXrEiyr+HzLQw5ZwE9QfttxB6qacEKQcN
   Zy6de8ASBctNf5hDRwp4ArkjaW4AFAI7ySBnVj4BO9fhv7OgJWbdhCPG8
   et5pYbT531hL+Z/Um3w9vUNQ511bIHAtCCyH8ImRXHkueGYCaDWtXbpL9
   wYFvoxkb0qnKaUgJ7lGr3RdmiVQ4imIAInQa+tBU0Xuv4s+yIfAC6HrFL
   A==;
X-CSE-ConnectionGUID: w6KBf5gkQDG64a94pA6oaQ==
X-CSE-MsgGUID: pnh4Xln1Qz2mtIh9FE6MXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28682011"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28682011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:47:32 -0700
X-CSE-ConnectionGUID: HVGHE5imQDy+H8JQjlRyow==
X-CSE-MsgGUID: gtbdPEj3REi+AwMBmspVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="82193154"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 06:47:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 06:47:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 06:47:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 06:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy18uKe4pFF5+8rjypW2zkdHqnJVUczMczlzdbZ4w6jIn1liT3GUUyNxgnecubq60aR2LNDJzGaUxzTMw5ewTR6QveDKDkL1QJtC/C7wfqrT/lcoYKU/4WjeQZscZn/pwbk8tXXP9nvEwmySOPfURBRyX3jqiOrdhOKPFoqUHUQ6IPPS3P9xDGkf0lZyxWO4RdCLbr6YGXpviJLKoemmCnxWGMXjwSWZMo884qNEyP8esj4dTsXlao2F93fIt9qcVx+LwVY6aqXzatpZrzqFvA17lIZh+XWGDLMCZs7lNSceVFEe7e/38w1Av7btQksd5MQrPahyqPOt0IKkkyONtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+sb3NWiFXXpgBoAzpSdXUWMdg5cs1e5qZIKdBJ4GpY=;
 b=UeIwRj8dnAWteRAqTEfZknoJHKxO/0Kj9kUUArTC8KO0rUqOqYlMTjb4DKe7ESLqtG6BCw+PRCj4HlPqVcBKWkLCeGObzWsDUDUiGNcu/X15BKFuYPUl5HXibWya6D45cdMbskXNY+X7kXdCrX7s5z4X7p/vTNwmE7ZX/WsJQt4WwOmXlgen1hf0iTeaA38LNm+Ulnl3EAplVDULGhUGDRnTD4pKICcqgszPNgeYzEk2pUOKFUuzATGLb/AkCBn5RLo8yD1s3U9upnv11ZWfD/fiweX6qHO+XFzCvvDUGWxv4XsA8krhHZcIK7ahDQ1/bWwbGs1FHFj4lHYP5ADLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 13:47:28 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 13:47:28 +0000
Date: Wed, 16 Oct 2024 21:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, <masahiroy@kernel.org>,
	<nathan@kernel.org>, <nicolas@fjasle.eu>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Chris Packham
	<chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] kbuild: Restore the ability to build out of tree dtbs
Message-ID: <Zw/D48L9VWeBR+pb@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e04a54-06b4-47a5-a136-08dcede912ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5g2/uRy7WdaylIwL/r1WnSd9o8V2KMPETKv5+JWJjZqVu3dcUwHQTA1j58xe?=
 =?us-ascii?Q?w2uRFhakivzsea+vDTEfCS+LEzmOfOHjqWKIOuaP+WZ7kIoTG7gr2YdHpMVC?=
 =?us-ascii?Q?dM/ly8hFPVhxRgT7PpnDmO4be9Qm7D2ro9BpDWNqMI0kLeDcpeXOna7JPljE?=
 =?us-ascii?Q?ZUDEPxS1TKOVhFkTqdYPzbIin2N7AxQML0zJyFxC8fiHvur84II3UaQUEYOd?=
 =?us-ascii?Q?UDnDSLJjMfiwMtjJcI9vOcWmG1QGjaZY9kwnxQ0+EuxQHJbMejnJb7ofsthe?=
 =?us-ascii?Q?iQ166QdR9ufUsbh8h5NHFw29TsEHgH9qhH+hFxeztJbGEgOpXrQHin2rMyEJ?=
 =?us-ascii?Q?lVWiRcYErXD4/aQflWNkIhzcWJ196zWGGID4HVfLy8iqd2I6ykc7OtNWOJ7T?=
 =?us-ascii?Q?Q9gh4tlvo3Ezq+tOpH+VUJ6e3VGtfsPTQRXFfzp6K2sDzarhZz/OjRsWjxL4?=
 =?us-ascii?Q?QXxaHFnZTBs22uJD3LSPf1cGvOZ1qFtl+4MR4kpK2R/qLanSOI+cm63qcyZ3?=
 =?us-ascii?Q?RsLHgzNXsuK3Z4dT9IeOKBmpA+uHXDl+Q1sZtbAB3/ScAUTSYY6N0PyoU0MP?=
 =?us-ascii?Q?z1Zx9yIU/6p4f6WiWz5ONL6Ww7VhEGEvAZ+GQUNtDhpw6YziCGjtYPcQWcvf?=
 =?us-ascii?Q?hIKXSxxPjfV/hp94kyVXaZdatz1t1iVSNz0/3wePNB+f7T9KNLRB+AFGT0+p?=
 =?us-ascii?Q?melLA4rQr/xT+lT7FiUV4He0YQF26OjZ3FcIHB3Da3lS4de/TP2CY1TDAZNm?=
 =?us-ascii?Q?9N/F6s0Pl3Q7YF1QtyETDVDCwN93iSzlvFrXQ47bDGppzhSu3kntFEG9KCtk?=
 =?us-ascii?Q?sQZ/qgYZgkZpIwb81XSV+JwoqejY0Wa4Y6P+exyvmCOxRj+CbV1yRWBSWx7F?=
 =?us-ascii?Q?G1CfjzAsSHfoEif+Pb8EfMDiby4eIZss+/23SMLMFatkgffMCkoCgXKHcoOK?=
 =?us-ascii?Q?3+ip/wILDWFRKPpT1FmE9vqiysQkNs91QxcoBBJCrFaFYuXzEWGFqCDoPXZD?=
 =?us-ascii?Q?2Debr2c/DkSPwD+u0BuAfSvfSBFjm+yOh/woLWkxqV7Hkfa2b4eKbvjbxRxu?=
 =?us-ascii?Q?dNinJI+Yx00svp3JO6EniLUatEbmClmDAnzPAnawBYW+klsJzQ+YOuurM/Tj?=
 =?us-ascii?Q?Yvamyu95JtNunyXzR595CK/WSFU8lO7qLBe3Ghk8AE2123EPBZBoEkEc8hen?=
 =?us-ascii?Q?BUBN47RMz8YnpwZjX7qWKatEdR5cnDwmwfLehw+S2fXuuUZGCrhpES8zIVs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7EakwKZZ0kiWmeb6Pd/JB01eCRrKrJBgPTu+OUICpLkhXcoU6+odBUwt1Tnm?=
 =?us-ascii?Q?d+u68GDNvwE+vzsm1tZOOPvWSp23tiUynwWGPct7TKamOygWglBnDccVsaYJ?=
 =?us-ascii?Q?eHHKRC0R/OaRkj6PVeFTVYYUeoOOUlhSsqS8kUOcX1EHnOJVdrJSrHgAwJMA?=
 =?us-ascii?Q?t37Fbzz0cOV9bC7JHRrKpLugA/gHnHe6XjzWquUmUduZlHLXvs7KGsGMdmAJ?=
 =?us-ascii?Q?oKl3OfQf5hn613tOFJR+P81mzZAnRgIQAzZFC1OvP6Rqqv21qwAELmU+4FbE?=
 =?us-ascii?Q?/ff9hy0cUrCPvXSM2td+ozMw3VovYDzELVY9pRvtUcmS1V8y9bAMNCInFC5s?=
 =?us-ascii?Q?5XwsvLiCVXBVI/sEQ9G1rdq0KHKVP1+X+hP6U4saGDFHh93ehDSF2q1lpSIM?=
 =?us-ascii?Q?RrPv/bxVEN7sp4zJmSms35omDO1yKexJ3NjZyLiOui/J6kMEx+QR0i4iDzU4?=
 =?us-ascii?Q?VZu5CtAJQjWc5EZa1l+Vp6igAjnEpy7Z8o0cbvqnrDP7xFQJT4g9zw8Q+2Fx?=
 =?us-ascii?Q?8DIYUdHCo/GU7Nnh0f+F0uMOqc9WMsxghHnBe0u+m7JKUq0tDhz2qSd/MzFv?=
 =?us-ascii?Q?xNxSPK5piRjf97rd3UZZphT/1++rn5VCfqU17B7K1+UsC1DPVIr+Wv8v3/tD?=
 =?us-ascii?Q?amHzm52uap8BZ+jp9gegs0hUYOs35vwTsL2ka88Oh01mhPoyG9DO9nvbZ0bi?=
 =?us-ascii?Q?DjLnBCpK/pR6Gvl5rJnJpGK982TCEMIoV8o4patzb+TF5TF9yFiyJ6d7M8fu?=
 =?us-ascii?Q?3qK8QfBQTXpzOWRNm6062JtZi0Pzd07N/DUyukLRi1Ht54e/0oc/seNK/JoM?=
 =?us-ascii?Q?MyXOJzcMbBN3i6c2ZWbkxu/8iBjZqHluSD5BLMS+6V7ppOv5bNyUNFFCpww/?=
 =?us-ascii?Q?elfccxpGQBfoJzbIxeUKH9rRomvbtQunuPobNRrNUxr9l1CvJ09gySbFd8z+?=
 =?us-ascii?Q?PPuy+3nIYVUTL6FNuJgsOy1dq9AcWl2kxIgJsyEaFRrKW/36t8WslKk4i2a0?=
 =?us-ascii?Q?1IpmytAhkXqC+9xwUNk5d4cH8LeJZcss/FKuQJBFsKX3IS09tyutAXwyKmVO?=
 =?us-ascii?Q?LQAK0bM/L1WTf0hvPjGht3U/no7sEF+UCoLOcapHZedBR2qRxNQqwMYyjAAg?=
 =?us-ascii?Q?3O0HptJojrITWsCs1AADazvTQMZeUWrn8D29PYpBxhdwXB+95fy+MRh4ysMx?=
 =?us-ascii?Q?FicNFKFOuls89UXzH9kIYZQ5RZzXcWX1WrqYbPQjORAqOUXLCTQ96b2VAm4L?=
 =?us-ascii?Q?1sUCox1RJXwtGolHHRbGUpcIAgLwR78VuEp4eYkszYZ3s88TSmxU7qaFmRqz?=
 =?us-ascii?Q?9bKYf4hYCV0eod3tL6/Bw6jynFwYejzBMmdMn2lpT2yQCxjZ6BL2YzSSEDVG?=
 =?us-ascii?Q?G1LuxU+bR8cDCHIhUUjkdohRfLZDdpUfGd462YHeWVCDApoIU2ia8gbT/W5z?=
 =?us-ascii?Q?cB4P+JgaNbRzoBJioFgwxCh/kIt/R3+m9rd5Nk0NByLTET483OAer+JpujHd?=
 =?us-ascii?Q?sKrghk2DcYucieKGyXA3JtXXovCBEo7tdRHhXky80a7nJ00gLHV2JltX91Vi?=
 =?us-ascii?Q?d5kqLXKszj/L+FrH3sfvUjp3GhIlIG1kOl5xhLC8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e04a54-06b4-47a5-a136-08dcede912ce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:47:28.2795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnXQkcUkZt9nTe85nHPbwahe+qdm1duJfUIylDur2lU3+2HhfbebXS0IhQD11an9jOYwebkMSoS4fN5tgLI+gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-OriginatorOrg: intel.com

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/kbuild-Restore-the-ability-to-build-out-of-tree-dtbs/20241016-053034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20241015212830.3899891-1-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH] kbuild: Restore the ability to build out of tree dtbs
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20241016/202410161857.7osnf6AX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161857.7osnf6AX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410161857.7osnf6AX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'arch/openrisc/boot/dts/or1ksim.dtb.o', needed by 'arch/openrisc/boot/dts/built-in.a'.
   make[5]: Target 'arch/openrisc/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


