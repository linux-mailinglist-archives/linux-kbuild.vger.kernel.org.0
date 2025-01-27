Return-Path: <linux-kbuild+bounces-5555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A201A1D898
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 15:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99703163EA3
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 14:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07A6C8C7;
	Mon, 27 Jan 2025 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdt+pp4d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1C748D;
	Mon, 27 Jan 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988986; cv=fail; b=uR6pqHYy+GirSfERJxlYDkMs73ghrl2+FZfjgZnPw4jzfiW50PjFq6QlB5vBRKFow7beZnVmtNkbvqBvwIct+RGCSJXBS4khzm9eBf8th4GmKmzMskw8BMQD6Y3YuFCnAO0Myz9iFwBpKL2zHKxayHPL3ZBep3A5evN611oa6KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988986; c=relaxed/simple;
	bh=vNxEit6r/BsJkuKPN3GBijmj7vCLJp1MyrFRrzYr8q8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GHyzZkChuALTgGIT8UrELKXLmJlye5asGh1+jLYRW8JVt8MgoUnd091Y0FRscWJrHcscKl7d9nu9DcznX90Kp3a1ZTFMXbKZnSQMsRN+o4SjzU9wp9Hbvhd3lQYC6fQA4nkczesgK7HoszVw0AQ2Gja/vTIwekR15pwxD82cF5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdt+pp4d; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737988985; x=1769524985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNxEit6r/BsJkuKPN3GBijmj7vCLJp1MyrFRrzYr8q8=;
  b=Sdt+pp4d7GX1GL8Vk4buRzWH3fAmd0hmk5Wr9bCMhAMjCksgY8nUM8Pj
   r92QGxqNZcOcL8O8cz2NFndObMzl0PcqGFD5FTLhIZg/F2yY0X+hFNUUf
   MZGNFJw5CbzaUxhAVXqV3HpEufaj6Z2yCIpUZnLcFKeRj3hQxEYDcQ2s/
   seKOI//iTGuSXtg78D5vfYDXIXHKwtJavx6m847KwTUDYkPrpc5a074jb
   NgbfylnUPZ/wcaRtYH4ADXC4MFH+SJ4QRn8Ip+eWxVNE5AHkH6giUWVpF
   0rXDv8wHsqKxSattfQ9oP7hXowdKmH+Cp47EfBGS3pEBlYAwtvbNCWjzm
   A==;
X-CSE-ConnectionGUID: bG6LEJkHTzGsoH7i2zXLjA==
X-CSE-MsgGUID: g4vxCEfJRXSeFWX/uf+/Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55991696"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="55991696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:43:04 -0800
X-CSE-ConnectionGUID: 4uGzuOp6Tm6gVQMR0O7p4w==
X-CSE-MsgGUID: ex+fRKGwTYC6y4Y+E4k6lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108265141"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jan 2025 06:43:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 06:43:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 06:43:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 06:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOEYFV7ZIyBvIm2OgEN0GI+8356bZB/ArTmMRiV5UwtrSVZReenEL0p+pE4eerFqmsHHpQ7tHWD5qAytcN2DYXMxWXEW42+B7Q4tIO/IR7qGgBBGMnN+ybk6HxSeETj0vBs/HdL9xsRGtYgilDT/pAYZT2I4Z1OYJricraWX7x57T6uvmZjMLOOsQxSByD5lOtYNVxuCQQ9YgdTfHv/bTIM63GeRf0DEVZ8eiF+UC/6SXXWG+hLGyXo3h30tcbTyBmvqTH9BTCmcTDrKL1I6UCR7NbxrnFkT6BaTWNKO7NUWAAdTcRcfm3AsArgLitOC0f07N3rGaboWYl6Z4frjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQAwJiLXJ0mvmFCy+OehXIaQbwDl8c2B+f5v+qYt81w=;
 b=UvTQikwNFaI4Z+i0xpvqPX2323q9I0lIBaeDvEEz9TXPd+FkAhg4aOMOsR+ygEfZdsHFDGMhJEF5y842D9gB0/m9Azbm9Q2bdL3V7hbfKH3+MdnKPN7eP94wWFFiW6ChbEu48OxsWn3mPw4U+vGJQoQWbmuJRIJSIleEhmsDm9COJ2YOT+tbc9J8H4+hUhhlYc3+TB4GVAWC7w2za4Rtp82n4QpCaGwOTqyAvggfPd5RJt52LvDv7gxTBFjoqHPh27kpQ5T7UFbt8yZAKnfSdZ51R6CTzno1G81o+O6DUbr2HTZV8DzMeveitAkBe6O0t+f8FGNujrQqLtjUpMrtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 14:42:46 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 14:42:45 +0000
Date: Mon, 27 Jan 2025 22:42:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Maurer <mmaurer@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-modules@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [modpost]  e8639b7ef0:
 WARNING:at_include/trace/events/printk.h:#printk_sprint
Message-ID: <202501272252.4f499056-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b64a18-77b9-409a-bf58-08dd3ee0dcc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I4QE4j6Xn6qB+SOjaqbaUzCTxp9IHxtRbOOE1pyGM9cVrTiEtMFlvhf+Q6Oh?=
 =?us-ascii?Q?z5/gPVMN213v0ZDF5Vgfcip5Ur0eIv2wh4tR4hvKfFodMwsiZ91LRhU5krMC?=
 =?us-ascii?Q?yWECy2UKEG8DTCHpUZxPjYBMLy/IOU1xpV7Zs5Vkv2CcdNWW4NDFlqHMiimq?=
 =?us-ascii?Q?5JN4zQjhyl0X5nG5J0GVN+MdtB4wDfnn1GvJSxNBJvfyTNr9MjHmS/kQTU8h?=
 =?us-ascii?Q?KL/kpKX8d8tfb0RCGaHjTo/kB3mSZo4YshY4S/Dwty4iLtzeD/kTXA7KugdN?=
 =?us-ascii?Q?UHa6vYv5cAPt8ysO5STYywNUpkvGtrSEJh9uZGrb2i7P3WiEexbi47ShKoXe?=
 =?us-ascii?Q?6MPQnNI1qHj3WnQmw3EVgFnbrXBU0cT7pROWSaAF142hJqaxC7jxzyHvT+U3?=
 =?us-ascii?Q?fnjS08/YsjDEMz0aQ1x91Y+EIgapbBN3Em0ivNlktCQOKWaHn+FRmGuoJ5Ss?=
 =?us-ascii?Q?SdYBEg2cHKN+tx6sCgNb+FBjj4KkRp8WC6mbXZ+5gfR83Bd0+gPvzB0nvCtL?=
 =?us-ascii?Q?ER57uZ769R1Qs/ZF1qgTKk7yjtyAN3LkMGafaOiSo3tWdEBCL3RHn9sRqZrL?=
 =?us-ascii?Q?AgAkPxGDESz7JbEdyOznzlH/bOBBqKOPA26JOzLs0QRP0jEf9koHa2NMweIH?=
 =?us-ascii?Q?Ni9VcmK+C6GtpfgiADQZmXRdX3k8xaKNCJY80SJ2TTUPouJJb1bCKZDYD/uD?=
 =?us-ascii?Q?zSUMdgicCiX3WJemlz0VIWgBwE7hOZ71bZ3ov2rH/5KId1aPTsnckbqZzNdZ?=
 =?us-ascii?Q?jLf2DuVtyuH8lY3tS43E1z/SwAmwKbwxNf6oTBTMh0PnZmsm92q4aQtRZeCS?=
 =?us-ascii?Q?cjhb5PIYxiY+E5HjwkL75HVCpe4ECtDPAqgrkmtq85+FwBfcuaEwBVdEQS17?=
 =?us-ascii?Q?lsOZl1Y8/Topzk7OY3kk0LvHt05U+N8XjgVcm/3luv/44rv9/wTkWyEBnvG8?=
 =?us-ascii?Q?6IdeJ1ZGlDettIjdzdXw1NbRPw9/9wn9DO9c1GTuAflOUMpmM6zuHzmlZjd8?=
 =?us-ascii?Q?QKb5pll6QmoMGENXFRORgzVeC7hB7gSyMvAWvFLbsTB/wrj6ulS+pk0ftMyK?=
 =?us-ascii?Q?6iqlF7/XScm2klesJsPrKgPV7q2nUzx7momcl5C1QNlundD0wssGOXwACoMh?=
 =?us-ascii?Q?Pe8DCukBb/Cbaw4QxMcHh4RlorjfDO0ZqqFp9U2kQrmkoEztlC4n28Kc+nuU?=
 =?us-ascii?Q?3R3UM2284zxWJd2UOmXoi/EaPptq1T4QY8yj4lVl+9HFhGFq7dyFHSLHr3yl?=
 =?us-ascii?Q?2qpt/mD32uP7qjJYU9Bc6b8pi4zWdeXmO+2BsYHk6EB2lQ4joAAk8C+TBU7B?=
 =?us-ascii?Q?DaKu+LXO9vyrEJE5NAVEr7AJg2Q9QSRE5ox3d70GH6EFmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hy1qrUH1f6wjXCrLtJDMQCYrND2aZsMw58+iHbVhLLCGpk7WsmnLL7ZTe/MA?=
 =?us-ascii?Q?oviNxE/6eTN1fzZ1EDti4Q5PfXJ6hyz5P84c4Jj5g8Iuac3ROFboMB14onsJ?=
 =?us-ascii?Q?JVqPCwQohK8KnVr9P7eIePcXh93Iblrfee6OEyS2dCJ4sv88Z/nqCcHavRF3?=
 =?us-ascii?Q?ba0Mf00Bp5VmBdPeI6+Kjc23gCbVgCBXZ6lU+a0a0rq6YTDB77+eO1gocgdz?=
 =?us-ascii?Q?2Hg9hojmWu1mZnJ1c6hkzydru530bYwhdlDqeZcMgRy7Uysk4x9E0F5v5QS2?=
 =?us-ascii?Q?x8aw8hQO8aqgDkmz7Hy9w6125xQE3vYmV2t0vjofBcG9K5FsqSVumjk20MRa?=
 =?us-ascii?Q?03GBo2Y1XP5qk8+ZGqhW5pBBcxUtFXeE+V0Ke8Mu3pGBMy770jucgO3O6Cle?=
 =?us-ascii?Q?HgqQm4UFE905clw1EH5ga/OGUKsQxPv2uWdZUuBTZnHkzNUU3oPaKOih1biU?=
 =?us-ascii?Q?klNwFikpXEpdo1HrOosFmH7ShK04aQpq3yhuKbM6rq42uhhQ6qV0exPK0kiP?=
 =?us-ascii?Q?g0FY/C0YmxDojqJDB6P2E4P+yjm0U1qqs+OH7l3Qymuxi4VEMzchicGHVnxX?=
 =?us-ascii?Q?NvIzmRdKXdZB/eTyfbV3ceIoRWYhZEfeRbF6wtscYUrGLgk6Q3GGzDJmSYbL?=
 =?us-ascii?Q?GVCpg4oY1j0LMt6V1CIYQ8D8CdhV41JEDMcKIq9VOHGw//E9ldfnWQwYU2FI?=
 =?us-ascii?Q?jV52Xlv22FZfKLi4rpNKfUhoMSf3IGZGB0YzFF1zxvrfP8BB4l7lSyhGXqH6?=
 =?us-ascii?Q?M5djgzv9Kpz1Aqw7keUBEHFwXUMYh8Xfp9RHmK7d56JTMr/4Lv+MQfYBi42y?=
 =?us-ascii?Q?JorPLdeAX6uBE+I9rIHZ38O9PJiDI0aVSzinCDhm9SU480mWzB9ZgyOPwt6n?=
 =?us-ascii?Q?Ov1aKLI5PcY279cri5iCcvlG9Q2mMWspgSUspEg5dWJIHjtluMKEfloE8VPw?=
 =?us-ascii?Q?vTvN+2L7QSYdlZ1yQjlYwEK5rWvnR9cqorQwaY1FD/RdnrAnKsJDAzB4WQvZ?=
 =?us-ascii?Q?lGKmKPnhgWEEOUMNS8e2V29lzpFIDbEjoMVvMLiOIP2VzSSMevpDQvK7/TDk?=
 =?us-ascii?Q?UwBgXHO0xKQPjtBI7kwqkB1rPU92sGwB+yk2L2g7KLI5mwPWwpL/CnElEw3N?=
 =?us-ascii?Q?WbLAXRhV90De2K2Ib38pPlu66yJGwPDLVs20yhZQIa98Gm4zXEnZ2RlxIcds?=
 =?us-ascii?Q?zifCqNMzaf5vgHBobSOgRae8d5LVK0+B1L0GIMNRR0dXVfD/XRYMYkKu2fBn?=
 =?us-ascii?Q?sPPGgB5hyJxFxZXU/qKuy3adiSRNRkQIGJfkcs5vEhU76UMfSW9wnLBZMZcx?=
 =?us-ascii?Q?jcxPnHNBida6rvyBNK1l0YDqXLBsVvUlCYcevnu01tLVkErld9m0iqu4DsXN?=
 =?us-ascii?Q?eF4iTbIRqdhv5uqsiPq+U/pPSQ4by217bXN+2n+NkJvMdxlBJovlWQiiXuc9?=
 =?us-ascii?Q?/NCCC/g4Uv3o0lMQr5boe5TezIRQFVebN0DLiaNdLsvJgBW35G7hGHbUMh3R?=
 =?us-ascii?Q?/WIBwyiE2gC8vZl3cYT5zro92nOlAz4VcIqFQXjvJexJAbeR4IZBm3V7k+Zw?=
 =?us-ascii?Q?swtoR88fwQui2rINf28vV8inqLyAv/nmjkvXnvJglSdrfFuxX4Ug4DJ3Cgct?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b64a18-77b9-409a-bf58-08dd3ee0dcc1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 14:42:45.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlTS/WSNhq5R1gi80sWgfR3J292e+0WDGZs3CkjQyrfpSCAWPFCfCDQpLSZB5YTLrupKGunEZh3+mYYEKLK15A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_include/trace/events/printk.h:#printk_sprint" on:

commit: e8639b7ef0f871753b4262ec0eacd3da29eebcee ("modpost: Allow extended modversions without basic MODVERSIONS")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b183]

in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 300s
	group: group-03
	nr_groups: 5



config: x86_64-randconfig-071-20250125
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we found various random issues on this commit, but clean on parent.

fc7d5e3210ae083a e8639b7ef0f871753b4262ec0ea
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :200         29%          58:200   dmesg.RIP:lock_acquire
           :200         29%          58:200   dmesg.RIP:lock_acquired
           :200         29%          58:200   dmesg.RIP:lock_release
           :200         29%          58:200   dmesg.RIP:printk_sprint
           :200         29%          58:200   dmesg.WARNING:at_include/trace/events/lock.h:#lock_acquire
           :200         29%          58:200   dmesg.WARNING:at_include/trace/events/lock.h:#lock_acquired
           :200         29%          58:200   dmesg.WARNING:at_include/trace/events/lock.h:#lock_release
           :200         29%          58:200   dmesg.WARNING:at_include/trace/events/printk.h:#printk_sprint



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202501272252.4f499056-lkp@intel.com


[  279.276312][ T4440] ------------[ cut here ]------------
[  279.276316][ T4440] ------------[ cut here ]------------
[  279.276319][ T4440] RCU not watching for tracepoint
[ 279.276350][ T4440] WARNING: CPU: 1 PID: 4440 at include/trace/events/printk.h:33 printk_sprint (ld-temp.o:?) 
[  279.276360][ T4440] Modules linked in: intel_rapl_msr(F) intel_rapl_common(F) crc32_pclmul(F) intel_agp(F) parport_pc(F) intel_gtt(F) parport(F) agpgart(F) autofs4(F)
[  279.276374][ T4440] Unloaded tainted modules: intel_cstate(F):1
[  279.276378][ T4440] CPU: 1 UID: 65534 PID: 4440 Comm: trinity-c3 Tainted: GF       W       T  6.13.0-rc6-00039-ge8639b7ef0f8 #1
[  279.276383][ T4440] Tainted: [F]=FORCED_MODULE, [W]=WARN, [T]=RANDSTRUCT
[  279.276385][ T4440] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 279.276386][ T4440] RIP: 0010:printk_sprint (ld-temp.o:?) 
[ 279.276390][ T4440] Code: ed 75 a0 e9 4c ff ff ff 0f 0b eb af 41 ff cf 44 89 f8 e9 25 ff ff ff 48 c7 c7 da ce 8b 82 c6 05 2a 30 24 02 01 e8 9b c0 f2 ff <0f> 0b eb c4 e8 92 9e d4 ff a8 04 74 b2 eb b9 65 8b 05 21 9b f3 7e
All code
========
   0:	ed                   	in     (%dx),%eax
   1:	75 a0                	jne    0xffffffffffffffa3
   3:	e9 4c ff ff ff       	jmp    0xffffffffffffff54
   8:	0f 0b                	ud2
   a:	eb af                	jmp    0xffffffffffffffbb
   c:	41 ff cf             	dec    %r15d
   f:	44 89 f8             	mov    %r15d,%eax
  12:	e9 25 ff ff ff       	jmp    0xffffffffffffff3c
  17:	48 c7 c7 da ce 8b 82 	mov    $0xffffffff828bceda,%rdi
  1e:	c6 05 2a 30 24 02 01 	movb   $0x1,0x224302a(%rip)        # 0x224304f
  25:	e8 9b c0 f2 ff       	call   0xfffffffffff2c0c5
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	eb c4                	jmp    0xfffffffffffffff2
  2e:	e8 92 9e d4 ff       	call   0xffffffffffd49ec5
  33:	a8 04                	test   $0x4,%al
  35:	74 b2                	je     0xffffffffffffffe9
  37:	eb b9                	jmp    0xfffffffffffffff2
  39:	65 8b 05 21 9b f3 7e 	mov    %gs:0x7ef39b21(%rip),%eax        # 0x7ef39b61

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	eb c4                	jmp    0xffffffffffffffc8
   4:	e8 92 9e d4 ff       	call   0xffffffffffd49e9b
   9:	a8 04                	test   $0x4,%al
   b:	74 b2                	je     0xffffffffffffffbf
   d:	eb b9                	jmp    0xffffffffffffffc8
   f:	65 8b 05 21 9b f3 7e 	mov    %gs:0x7ef39b21(%rip),%eax        # 0x7ef39b37
[  279.276393][ T4440] RSP: 0018:ffffc90000c0f9f8 EFLAGS: 00010086
[  279.276395][ T4440] RAX: 0000000080000006 RBX: ffffffff84b5ce40 RCX: ffff88842fc00000
[  279.276397][ T4440] RDX: ffff88842fc00000 RSI: 0000000000000027 RDI: ffff88842fddcb88
[  279.276399][ T4440] RBP: 0000000000000024 R08: aaaaaaaaaaaaaaaa R09: 3fffffffffffffff
[  279.276401][ T4440] R10: 00000000ffffffff R11: 00000000ffff86b8 R12: 0000000000000082
[  279.276402][ T4440] R13: ffff88842fddcb81 R14: 0000000000000024 R15: 0000000000000028
[  279.276404][ T4440] FS:  0000000000000000(0000) GS:ffff88842fc00000(0063) knlGS:00000000f7f5a280
[  279.276407][ T4440] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[  279.276408][ T4440] CR2: 00000000f72cf000 CR3: 00000001b4b14000 CR4: 00000000000406b0
[  279.276413][ T4440] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  279.276414][ T4440] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  279.276416][ T4440] Call Trace:
[  279.276418][ T4440]  <TASK>
[ 279.276420][ T4440] ? __warn (ld-temp.o:?) 
[ 279.276424][ T4440] ? printk_sprint (ld-temp.o:?) 
[ 279.276427][ T4440] ? report_bug (ld-temp.o:?) 
[ 279.276430][ T4440] ? printk_sprint (ld-temp.o:?) 
[ 279.276434][ T4440] ? handle_bug (ld-temp.o:?) 
[ 279.276437][ T4440] ? exc_invalid_op (ld-temp.o:?) 
[ 279.276440][ T4440] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 279.276444][ T4440] ? printk_sprint (ld-temp.o:?) 
[ 279.276447][ T4440] ? printk_sprint (ld-temp.o:?) 
[ 279.276450][ T4440] vprintk_store (ld-temp.o:?) 
[ 279.276456][ T4440] vprintk_emit (ld-temp.o:?) 
[ 279.276460][ T4440] _printk (ld-temp.o:?) 
[ 279.276463][ T4440] handle_overflow (ld-temp.o:?) 
[ 279.276468][ T4440] ct_kernel_exit (ld-temp.o:?) 
[ 279.276473][ T4440] __ct_user_enter (ld-temp.o:?) 
[ 279.276476][ T4440] syscall_exit_to_user_mode (ld-temp.o:?) 
[ 279.276479][ T4440] __do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276482][ T4440] ? __task_pid_nr_ns (ld-temp.o:?) 
[ 279.276487][ T4440] ? __task_pid_nr_ns (ld-temp.o:?) 
[ 279.276489][ T4440] ? __task_pid_nr_ns (ld-temp.o:?) 
[ 279.276493][ T4440] ? __task_pid_nr_ns (ld-temp.o:?) 
[ 279.276496][ T4440] ? __task_pid_nr_ns (ld-temp.o:?) 
[ 279.276499][ T4440] ? __ct_user_enter (ld-temp.o:?) 
[ 279.276502][ T4440] ? vtime_user_enter (ld-temp.o:?) 
[ 279.276505][ T4440] ? ct_kernel_exit (ld-temp.o:?) 
[ 279.276508][ T4440] ? __ct_user_enter (ld-temp.o:?) 
[ 279.276512][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?) 
[ 279.276515][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276518][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276520][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?) 
[ 279.276523][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276526][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?) 
[ 279.276529][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276531][ T4440] ? vtime_user_enter (ld-temp.o:?) 
[ 279.276533][ T4440] ? ct_kernel_exit (ld-temp.o:?) 
[ 279.276536][ T4440] do_fast_syscall_32 (ld-temp.o:?) 
[ 279.276538][ T4440] entry_SYSENTER_compat_after_hwframe (arch/x86/entry/entry_64_compat.S:127) 
[  279.276542][ T4440] RIP: 0023:0xf7f5f539
[ 279.276544][ T4440] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 cc 90 90 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
All code
========
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
	...
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:*	89 e5                	mov    %esp,%ebp		<-- trapping instruction
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
  2a:	5d                   	pop    %rbp
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	cc                   	int3
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  39:	00 00 00 
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)
  3e:	44                   	rex.R
	...

Code starting with the faulting instruction
===========================================
   0:	5d                   	pop    %rbp
   1:	5a                   	pop    %rdx
   2:	59                   	pop    %rcx
   3:	c3                   	ret
   4:	cc                   	int3
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   f:	00 00 00 
  12:	0f                   	.byte 0xf
  13:	1f                   	(bad)
  14:	44                   	rex.R


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250127/202501272252.4f499056-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


