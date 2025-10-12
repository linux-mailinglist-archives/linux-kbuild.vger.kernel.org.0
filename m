Return-Path: <linux-kbuild+bounces-9099-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125CBCFE97
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Oct 2025 04:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0F573BCFFC
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Oct 2025 02:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D0073451;
	Sun, 12 Oct 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdrZJlGY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9E1A2630;
	Sun, 12 Oct 2025 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235257; cv=fail; b=rqOxNYwtmNue16m/TtpWG7Mje4uc66Iw7pyubmEpaYgP9oJsVAZwUx7yhapzwg2++SJIjALUaQzoLm5kkovRXN8uZTR0a9IZC+hZL/atENkGYeuqywX9XUEy9ZPWnAKDVAC8YJMmcQtrvIP5rIJMOsC/3ZPCuWgsFJ7tt2zAVoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235257; c=relaxed/simple;
	bh=VrKTHJ8o/CRNG13HUlixDTPeSq64DoLsyHgxvmFXtGc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t0vHUPMRbaLsa4zjs3z6dbqwhy4ZwFUsALV7/klpWmKLEcZqYn3ZJyk2UIWY5HUjgNVe7Zpt9Xd7ujhDGY4wG1hzSxGJ1EbKAhG0wAyNtMwKwJgyAh+5JQLs9WtZLrCs0oQQTJHWJ4bVz5mE9d7yrvm7rk3oP1Lpeq0cOJVqc5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdrZJlGY; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760235256; x=1791771256;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=VrKTHJ8o/CRNG13HUlixDTPeSq64DoLsyHgxvmFXtGc=;
  b=HdrZJlGYyaSAsu9awRRdXHf9jCLyAk3Cp+wrYQGmGm6Q1eoF08TX/B1H
   6aeJhsSSDE3FZuuu1Q/3/F7g5H4SJzAdd/8dwyOmNVjAPUW8Ja7JJM0+1
   8f55LqcQNWHEEukCL+JMBRdVbb27mvDs6mjhUBIgCcknrasKQ5lVc4NXF
   TdHlKBjIGmHeI1YgEVZxw8kH/JHnVjJdbjXJS6VKDZngbz+VM0TjIzwbo
   6/rc2vUM6HI6nzdH14OJvBKwsNu3EQA7ATy1yxyrmXNwZzpWVP5O5cjrr
   jI/+5z4BealRtbsXXRAhrd6R3kJyaZYKLhodlTpmHn/4sKQh0NgxVDcO3
   g==;
X-CSE-ConnectionGUID: ixuI5qncSouXiW8fsZIrqQ==
X-CSE-MsgGUID: dGCJy4ykTvOY8oqgfcYhmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="72666446"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="72666446"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 19:14:16 -0700
X-CSE-ConnectionGUID: AYRGlBRFT2eJlxeByHN5lg==
X-CSE-MsgGUID: H2BHDYi7QdiHV7aher7e8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="181240788"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 19:14:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 19:14:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 19:14:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 19:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccBg2+HJnd45VCI1X24WBFP8Dn1u00D7nC9TzIaDn2zcr31I2HGXusYWCUjs2JxalwpiDxyHs6D01TqqR7RDDp6m0Cub2td7w+oY0AqGPCbl/SQHylPgkBhj+7xpAxV7DCTu1CxIIV2TFxXzelupS/IODwapJpzFPPZmRObK2unQXXbdnz7plRKTEr1+D9LqOOGIX/IAfWcJ+aIUDWrSZa8PqhrtTLVth7tO+h9y3hagAri9ej1UuI4oIb13T2xdvfrUUvqYOM9+UrqhDFyE7mP8CDdXzLKhEbXUFdM/aIvF+7ROWl/TCecwXgSBpnDXY3M0ADGGijWH9Ta5zMX5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGBel2hCjF1ZawHai/6r4uXCahVRyHqD7JgFny28E9A=;
 b=btBlZoKQ21nFcwXifzUw88PBMfxZMBf/8RZ96aAqE7jEmbRTb3yNsN1xygEn/0SkF2I27DMlbLfBZezMTuPaQ5lgAetBScbcVPg4ftLn5W+YhZaS/l/AMlHqzAklZnfqCC28IV+BDqfyKNoM2rxQl1lrSdJ6lDPiTDUB7/17vzlICRaKQmLuRuTwdU0GyIm31+ESlLS5n9ojxgapCTAqImuTYPa0qMxIxTGTJPCMlR75GAujr8RjXYRigxOkaWExa2gYJnJgp81FhagVbTWB8rB7h4zdYO4u6S0NaI3jCHiYtE5Q2ey8JyutsvKhK40EIBMk6VgHvjhWIrOjsSjC1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sun, 12 Oct
 2025 02:14:12 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 02:14:12 +0000
Date: Sun, 12 Oct 2025 10:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: <xur@google.com>, Alexey Gladkov <legion@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, Bill Wendling
	<morbo@google.com>, Han Shen <shenhan@google.com>, Ingo Molnar
	<mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt
	<justinstitt@google.com>, Kees Cook <kees@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Nicolas Schier
	<nicolas.schier@linux.dev>, Peter Zijlstra <peterz@infradead.org>, "Tamir
 Duberstein" <tamird@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas
 =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Yabin Cui
	<yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rong Xu
	<xur@google.com>
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <aOsO5gO+5/OkZXVn@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010210134.2066321-2-xur@google.com>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 52c4acf0-ae48-41e3-ef21-08de093508c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HixAtG2oDbQZRnj4yI8so0TguuuxQm8pE5xTFRSz1IEX4xuisVJWK2TeoVD1?=
 =?us-ascii?Q?YjMrQpc7BxLLlgaYzWBlto4Tr4ttvI0WShFdAkHOIAFhU4hf4zBXWcqSQcmN?=
 =?us-ascii?Q?d9El4OvfKvr1k3suIuW5GvmQWI6wzibgRVBPcEeDffabjdmiXLhXot+dTcSs?=
 =?us-ascii?Q?R3t/XWM/9q20vqirmkRKBZEohSYxMLwNeCAgQf63WRyZm0hK6aPJoXBN8TC+?=
 =?us-ascii?Q?vPQrsRYS5Wm16eLLcn17i/pFCkaVWWStUt5Pmb8CI0yRyWIFSF3HPLVfRU2l?=
 =?us-ascii?Q?o9QB11rXRY+l2ZJyc1xMrnwPI7nMGmhFxoYu0mZwZDc7ubUE59VK8t7VEjez?=
 =?us-ascii?Q?VQJF/SxM2xUfaBF5P04hSDjG3tYAVCZPLKXfPnYj2fC78p8Pq0bpzEDEGuRD?=
 =?us-ascii?Q?/O/cE8SP5JnjxIBRH69UV8gBB9ZNHAUNwvx5Y2TFaIBHTvl99cKLeScqTYiE?=
 =?us-ascii?Q?mJ2mFqGn2n59WVk9x9MCW/se8Yscyo+x9N1SGOZ/S//7WlGn9KEUkkreIKj9?=
 =?us-ascii?Q?Hu0EYf7ZaCIyC5BsP6axK4RhvxmkyI2m303pmcfH8ojDO0O0M0GrCqEvivX1?=
 =?us-ascii?Q?6T1AOK9eraUHZ+xhQP2U6s85d7+miS+Xf7A5NrJMfujA2yiE6/JYVv30DLcs?=
 =?us-ascii?Q?FXDbUbdVFPJRrordppDMX0EiRVOofsyIgQKxyky6dR2Uu28if8XiTGMa1TnH?=
 =?us-ascii?Q?Bg6DbwASKR1UXP1qb0M3XslNs9F9CIuBQ+JbpzeppmioVJa0iX6Lfg9WTwjV?=
 =?us-ascii?Q?Pf0E4I4p7WzJ6v8jtgLGi/3Sow5ZVW1Fci0U/Qyz4+ZbQymuY0N0ovVCZlUs?=
 =?us-ascii?Q?kiILgsnazQ2pLwld/aa6X/6NAOpwLR1sDYViXC9BkfLhA6LB73iGtkRzDKQa?=
 =?us-ascii?Q?PTH5skOIrjbIzArvBk8k6cBxZBf5h+20SzWoZTnrM/tEPq7KFSabwz3GHjhF?=
 =?us-ascii?Q?Ip8QRvm0D5tHp/MDalWPzG60JY7dqrtvlMHY2dBJYm1OGFML1ILj4dMAvaDC?=
 =?us-ascii?Q?KoOic2E2gY/BVtawA272f8Ad47L6+RvC0nLX3VT/T43vQIKd6JTuAjymCBw1?=
 =?us-ascii?Q?I0mJExRN0EYA5tK4vKMjRaIQ5QUA8NdMDR8W7jV5YbVct/NPVlgFTtU22y+P?=
 =?us-ascii?Q?Ty5gT7oagISUAdoM39Ep/5PGEFrjP5BpoxNJingT7rm5BBQMaw3AsagEIE7G?=
 =?us-ascii?Q?0l9ZhOZ44NP/Cgh4x+tLs7aJCR6EflJxPaY34HYpQTf08ocYf+Avb2BgzURW?=
 =?us-ascii?Q?3yPxgGe3grbZE4wQ+w5I4ZE5+ExLS6E0r33wbVqxloW8hYfianaaWplIh8Gi?=
 =?us-ascii?Q?dZrOSYriMgGrrJNHRj3g3E8DXxX0TcfAhO6u3ZOfgexEXQEgqLcxnJonG6O8?=
 =?us-ascii?Q?iqoClBSaNqedLJMnOrEOoe8ytniVzo9ehXg3GgoSxPib/Z2FFX3FQl4l0dHU?=
 =?us-ascii?Q?kGL2c1KPRUll/UD7D2gjyrmvcLhKrlAb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eRCb32yQtCJYfCz+wRevT5RwLqhY0V9bIvg8rbHNIt9tRDL6bnFUTpViD/y?=
 =?us-ascii?Q?3KOEChXYBHhDWTqQWwGk30hgJAD49qc1O9ByHH3pEoGOYxFA7GgxkwUR9454?=
 =?us-ascii?Q?7/xk1+rulTeURs7Lb5myzObUpAj+W9QQC/bnD//z5C6HCzETqczWlRr9jPA4?=
 =?us-ascii?Q?bay7WNs3v/zjpWD0jrvlPW/jJI3iydxP9twMAEZd7+Ll6MzhwHjlfozWJpCp?=
 =?us-ascii?Q?PXZLjoNWscnQqizYGR6ciCeWbKhHxeTyCMOp8RRGuHJL/klWX9rQO40HtjTy?=
 =?us-ascii?Q?uIqVSZyO7ZJly8BG3Y76Ey3Dewvj8tnffp+TNax+vbEnoT7s3uWN3iKqcIZq?=
 =?us-ascii?Q?ZbnImiZjquGiVcg+TD5ZWAS5XIyuZ73knde7rjK+HXT3PwjzqLcSlbxOgHSN?=
 =?us-ascii?Q?QLYjHLTo8hTdkeV1FDrKvJbTX2Lb6mbgxPJqukmtY299zVIIYPeYBxpPogIp?=
 =?us-ascii?Q?UAD/PriqcroRzMq/hC1Gu0akWANTvjKbMLuMOcPRuXPXPy85pr3PnfZBDsHK?=
 =?us-ascii?Q?2R1XeF6xlguIvK2ijHZD57Ovo8HpZVEHP59Ve+tEfSiC4OWsZ833SBYd1HEz?=
 =?us-ascii?Q?46duCv82SaGb6sFmHlDDZuRVU3BVHlErvVl77RjQOd5fQYxX4f3Ee1cG+h4f?=
 =?us-ascii?Q?H2/xP73cDQKtkBzOkVh0WqY2djHJQuVe1R7xtLfJ0Xipk8gZw5ss8DFuVTrB?=
 =?us-ascii?Q?k82zKHGBnovU+VsdVzX14RWRPTWLZrBr4ZozgfEGDJbfxCBg7ErjYIBpDPlG?=
 =?us-ascii?Q?0eXcumOwQGecu+PkEfrG5Ubr/TusT542a90TfI9h79QRa6m1UYDeDQugV98E?=
 =?us-ascii?Q?0OoQph2ObcLeGPYWDb2ZMBY8wAPIKNVKWiYigD2XtT3A+DxgWbviFzvbe1TH?=
 =?us-ascii?Q?7aIzFUde3dIY108fWc5TN9YcXwNc2r2mjbdPDS2t+Li32grfkptekNmrj8FD?=
 =?us-ascii?Q?n0b4wEi0jdJYwgBcS7E8+C3RJil2I7usYZ6nYqu+vti4I7Eiv3THH0XuohHi?=
 =?us-ascii?Q?Lsuc60nA03SlT13bvSz3DwFfT3HljOtWTJwqphU0hKd13a7MnItDstF5WK9u?=
 =?us-ascii?Q?fVACzINIGaceDjYOEkBZ54Q9f8Vyedk+LQgfOX+IPOPRip2YBkeDQODXafLW?=
 =?us-ascii?Q?9DmG0WgFIaZ+WKVSoyEAUrDQF15CtxdsHxNPqRydnnvGNoItIrpLcVQOszQj?=
 =?us-ascii?Q?I/fn0lZ74A1XQwddfbdThrqUbMr4ZasSk3ReTT09dESq0rohFZpxW/qAr7ir?=
 =?us-ascii?Q?57eG1zk0ox+xk515PPTmVChebm809iKg0UM1irr1FXaTbKNlmiFHgga7ksbw?=
 =?us-ascii?Q?ku37SGU8+9ig4RUtPtcyaAYOt3Kr+dNs9QvA6TuNok0poFeb0juLR2hXf6E5?=
 =?us-ascii?Q?X6aOjbQa4z/v2nM9EnDxTbaYeZafGXjYi0BipzBFvcXcXOYZnL55YuzsubwF?=
 =?us-ascii?Q?3o9oEYDZ11JwyEyForPLZuTKhAC7+Akwrfcr9KZRRAbKpAvjj4YsvyOcLraF?=
 =?us-ascii?Q?rbET4dr9GZqRDiL+KoN3VRN7In6QZH9PcjK+vai/WucgvTDOuGewVVFsnPtM?=
 =?us-ascii?Q?cikvJGvGt+gDHwYdN8i57OhlaiavO7M1G1Vx/Yih?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c4acf0-ae48-41e3-ef21-08de093508c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 02:14:12.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95xJtHX1IHXUr13MTfmxRbYZK8phDQl0ssuBb0wQZ28cGwN97d+JdDNzb5haWRmV1qlcUFqdzltVWdo1NnLSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/kspp]
[also build test ERROR on linus/master kees/for-next/pstore v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40google.com
patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251012/202510120709.Wx3q4Ppg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120709.Wx3q4Ppg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510120709.Wx3q4Ppg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: -r and -pie may not be used together

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


