Return-Path: <linux-kbuild+bounces-8498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678FB2993D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 07:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F087B167F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 05:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7152701BB;
	Mon, 18 Aug 2025 05:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKQz4QzX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69C26D4ED;
	Mon, 18 Aug 2025 05:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496654; cv=fail; b=rMDehtAUtTrI2aJkVpp79mR5ofAG4kb4JYfuUygC+GwrSwGDAC5l1F/yTE5PKGhPXnQ8f73QoGm/6R+OgJc5RsFJ4famT+A+yMKwTqtOJNyvICtuHdzbU9XKdbDcAbdVx2kUi6XcdtXmHgFtqDjQK74vJ782oXN76SYZhJXUHAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496654; c=relaxed/simple;
	bh=+XQi+TarrZW0ADo5g+r5IGgsWaUbY104+a0H0Lt9UGg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rr/kclqzEUIX3csuOKBnUhocuCL1n6pxt5AUjzJB3nyNGktO0uGO3RFeAFHykkQ3t49tpVhhgzVELVJ4sF5iUHhaaAu060gJmTvffN1wj0rcyKIJ5mvXArzAkbM7AJ2m/BdbG6trK1MaAch98depQY1XJd059JvQRXTi42UStWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKQz4QzX; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755496652; x=1787032652;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+XQi+TarrZW0ADo5g+r5IGgsWaUbY104+a0H0Lt9UGg=;
  b=iKQz4QzXOSmuvWh4A2rTQccDmnJ0TTc4rNIVE8m7gLNK+Xe6g1kEaxaT
   ML9Wf4RxPN3zbJtI5horPdsPT5p2S3Wt8L0bMe4J/oV8ADPHxJ0TqZVA5
   m0c781Y15bg9wmnuuJrUhs66j5w1ki8meJjKwgTpr5S2FFJxoz2Ta/diC
   Scu67fySzo+poadTnkWlxGtozp4wQX8HpZ8UNFa6g1ZSGFAAMRF4XlYIC
   Tu0Dpuyffqj93lEIJDlLyXiv0rscjsOgzeBkRMdPRZlo6TKh8KvI9iA6r
   VN245d8vDp2GDe94oySd20V6cPucSznFEY2fmtNlAdp9vz1Fp7itpyyZJ
   A==;
X-CSE-ConnectionGUID: y+sfox27RxODpkbkLX6QkA==
X-CSE-MsgGUID: cAbokYLqRUqF6lBFMPgQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75282710"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75282710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:57:30 -0700
X-CSE-ConnectionGUID: /ZSIT7KpQ0W1EXAcknh0kQ==
X-CSE-MsgGUID: heEV1Z6fSs22ztalyybHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166669949"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:57:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 22:57:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 22:57:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 22:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/RdhKucLW4EW/6PrtVG0vYugU06jNbgr4KRFWLoB2cZ4opd7cGR9x9Pv47hnXRc6Rp53lix66J4kfJp/AmnQTElrx5Y3hngh3MuN66lNgJJfboSUHGISJ1j+LXfMs1Yk4njNvcqHXM7slhZhrXHDzA+4UIMvYLFjvHDyFi9s7JcKkFJJHibWxmORO1Uv+a0I20skAIEGXV7F/qWW4IHa3Na8nUOOtLjjqyIFRPGGS9PE9BT8vk/QQ9sAV5oyOYanSmvIol6F9y+w7jzOWZn7suCquB0op01DNovld5sVedn6meBuJXMLP6+ph6qGNAjrVlG36rbgJJ6tG6CgrOc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REEKnY3wncogAIt7FK6ZHQqMPZbhrNvCqhekY94TJj4=;
 b=bITrOb9DFdo5dmcFgmLielZxqjIy6XGvTvBrb+F3OUQK/U7v9dD0rwIYiTih2tlDURtns3ruxXmwmDNJtmJWTq6YejVpR1pFRo2c8YPKjSlqpa7goScB5+vHWb5RJWfhBHhU+F4GgvkxeI3sygffni0VnF+BiZj0Yjf1df3AgFp3cPDJHxPPVfipKFgBfBS0+ljDEAQSUOtTJnPsGcDkf7HwpV+f3RnPRybfKIoD/37KbHHwEYzSCuaFS99LSfLnqgcBDYgwGWnYCcD4ynaEdveeDTnJ2V/uMOEIjkkB/VIKPxBdutEmW6cOsINpdqbEh5sjMdtwRxxu0M8Wy6kCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 05:57:25 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 05:57:25 +0000
Date: Mon, 18 Aug 2025 07:57:08 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <nathan@kernel.org>, <arnd@arndb.de>, <broonie@kernel.org>,
	<Liam.Howlett@oracle.com>, <urezki@gmail.com>, <will@kernel.org>,
	<kaleshsingh@google.com>, <rppt@kernel.org>, <leitao@debian.org>,
	<coxu@redhat.com>, <surenb@google.com>, <akpm@linux-foundation.org>,
	<luto@kernel.org>, <jpoimboe@kernel.org>, <changyuanl@google.com>,
	<hpa@zytor.com>, <dvyukov@google.com>, <kas@kernel.org>, <corbet@lwn.net>,
	<vincenzo.frascino@arm.com>, <smostafa@google.com>,
	<nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
	<andreyknvl@gmail.com>, <alexander.shishkin@linux.intel.com>,
	<thiago.bauermann@linaro.org>, <catalin.marinas@arm.com>,
	<ryabinin.a.a@gmail.com>, <jan.kiszka@siemens.com>, <jbohac@suse.cz>,
	<dan.j.williams@intel.com>, <joel.granados@kernel.org>, <baohua@kernel.org>,
	<kevin.brodsky@arm.com>, <nicolas.schier@linux.dev>, <pcc@google.com>,
	<andriy.shevchenko@linux.intel.com>, <wei.liu@kernel.org>, <bp@alien8.de>,
	<xin@zytor.com>, <pankaj.gupta@amd.com>, <vbabka@suse.cz>,
	<glider@google.com>, <jgross@suse.com>, <kees@kernel.org>,
	<jhubbard@nvidia.com>, <joey.gouly@arm.com>, <ardb@kernel.org>,
	<thuth@redhat.com>, <pasha.tatashin@soleen.com>,
	<kristina.martsenko@arm.com>, <bigeasy@linutronix.de>,
	<lorenzo.stoakes@oracle.com>, <jason.andryuk@amd.com>, <david@redhat.com>,
	<graf@amazon.com>, <wangkefeng.wang@huawei.com>, <ziy@nvidia.com>,
	<mark.rutland@arm.com>, <dave.hansen@linux.intel.com>,
	<samuel.holland@sifive.com>, <kbingham@kernel.org>,
	<trintaeoitogc@gmail.com>, <scott@os.amperecomputing.com>,
	<justinstitt@google.com>, <kuan-ying.lee@canonical.com>, <maz@kernel.org>,
	<tglx@linutronix.de>, <samitolvanen@google.com>, <mhocko@suse.com>,
	<nunodasneves@linux.microsoft.com>, <brgerst@gmail.com>,
	<willy@infradead.org>, <ubizjak@gmail.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <sohil.mehta@intel.com>, <linux-mm@kvack.org>,
	<linux-kbuild@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <llvm@lists.linux.dev>, <kasan-dev@googlegroups.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 13/18] kasan: arm64: x86: Handle int3 for inline KASAN
 reports
Message-ID: <34sbzdtnh74bbkg6yopytxn553efynrjp3nylnx6hg4sgwsder@zff244djrxe2>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <9030d5a35eb5a3831319881cb8cb040aad65b7b6.1755004923.git.maciej.wieczor-retman@intel.com>
 <31bac00f-7903-46f7-a5a0-1e8f5fd8b9ab@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31bac00f-7903-46f7-a5a0-1e8f5fd8b9ab@arm.com>
X-ClientProxiedBy: DB8PR06CA0010.eurprd06.prod.outlook.com
 (2603:10a6:10:100::23) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f05154-100f-46b6-fa36-08ddde1c1afc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Vy/fXl1E+gv+35Gi8jBzq+0ev/tEEHSUbDU7Y7D0SdTKreT/crZhkIDg0o?=
 =?iso-8859-1?Q?KBwwjhRarOho5M5E/Bw14p3vSJwdvOjvKmFCQClUmvmZn6UIrhPKk0Rfvs?=
 =?iso-8859-1?Q?uVLDwUNGMfS0oAw3LvuNANzXajUfmW5HzuSCVe2ZDvpgN2A7JA/H+dS7Kf?=
 =?iso-8859-1?Q?EnEAaXMOu0F6sHSpZPF2ZMVDVBnoF+wSp5JC9Q/n90WVfDazmA7nKgMqph?=
 =?iso-8859-1?Q?X2g0b9XjUOLnTs9NligskIfR6Y5FcLdA/Zj56bFlSWtLDo+67z2gKnc+L3?=
 =?iso-8859-1?Q?eOPB2bn15XUB6MicK6sErFRJZOCCCq/30wL1zZ4Vt3FTje3wyLr8e0WfEo?=
 =?iso-8859-1?Q?21fSJl2IvBd3jYjSNIFoB1ChjcHzAAwz8X3sNuDvn3Cy11Wx5/zE5UPg5Z?=
 =?iso-8859-1?Q?lsikxqJE2e+pzUFTWu+aO9VH7CjWnXYdYVngpmFHkrZbBDqf+Z5JHlRcgD?=
 =?iso-8859-1?Q?hBYz+TxtYR1QybLSB4jyQdNYNN6jWTUXpg9x2KOu3UMCIrcp8O7bKGpgqs?=
 =?iso-8859-1?Q?X2jsNSv5E/Tl9IWbzhLycBz/NUrX10HR3h+03DKVLsL7wlHCavDrmXUSk5?=
 =?iso-8859-1?Q?3tNLlpC13C/y5MfXtOuDCmw9I1cQYIwN2XDdzkfYKuwsBxpchtjfpFgLIW?=
 =?iso-8859-1?Q?hFgC8nutq+JIb8wSaQME8l8+lmbPRW6vDmLSZmkyVBHK93688Eb1cwmCVc?=
 =?iso-8859-1?Q?DxR3qEGOFuXC4cwK+x75Gdt18bpixcIdzcEcWVOUMmMIRN3rA7lFzSTWBX?=
 =?iso-8859-1?Q?VY8gXXvGoiw2Lt2mJeQdwooGTadynLFSVCSCF6FdVfJMZfIfYXCzz462l/?=
 =?iso-8859-1?Q?X2UJk/Hk05O4GQbkcnxSFHzaw+g3Ujbq43KE177kbzSusDtlDm+AkG4U0W?=
 =?iso-8859-1?Q?zdkJywT+WPS9AWCtMDX6BspnDrbYdH+HGHkM2XlV6gyFklcq6M4TnAptJ0?=
 =?iso-8859-1?Q?b3WcjGjip9zRjy4urvLXA7Wx+o9ohlELRUpruFz2Q3Mz9iUFA2Y3300X6L?=
 =?iso-8859-1?Q?Nf0JmTOdNCalDPv3kZMPXNMgPSmUNJfAkpAA9ogdVHh9MosnmtMJw1eVAn?=
 =?iso-8859-1?Q?mjd4eq3pAIQJAvF++6265MxdQJHiBc+5QmWToMd/o+XfPD5ConryxyY7jY?=
 =?iso-8859-1?Q?I+NusqCXc0iqjYr0CZhGUrYMkGeAmraeP+F24sU851smH07N6q+cCLjgCB?=
 =?iso-8859-1?Q?DIwI6jcEtsoxBwo7ElciDZfPOoA4XTflkt17DCNe211/+iMLNGOPjHkr+3?=
 =?iso-8859-1?Q?t+v9381xE5xW63279/B58P/3AQsB/6sYKc2E5+LYCR43su8yWO9Us3RVtv?=
 =?iso-8859-1?Q?/NWk/vavVmm1P8a8cMm0EYK3KEG5d9fDr59VwBC+asXBWmaysbr35DbjVM?=
 =?iso-8859-1?Q?h+lR6k6PbjZbs4mW8Vnye+dAsgumW2c4YX/iX6lLI5dYb9/5WtHM192weA?=
 =?iso-8859-1?Q?mDKEh9rfG3ENmllTpJd88W0ZoJf4FsnWwCFWU+3Pc6ZOX6IHrFcuaTkBpk?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?K/aC4J0lU1qsULrTt/WnycbmoHFa31V0VfYyBSs1clclbc6MNIXWRy0fv6?=
 =?iso-8859-1?Q?W1CXCRJmLSizwCBxzKNaTVtidGBIQMvM5pZQ5HNexEnigR6DZlGjxwOdT6?=
 =?iso-8859-1?Q?gEKzHOWzzt+2nwl9jOYtIfxcGjb7DoB3wX1G4B2ogKmILEOfebjyyQb0ew?=
 =?iso-8859-1?Q?YAd82B341wlBJcsTdbs7r1TvLV3at1p40wyx+WYNFLdAXL+J4lzJy9WHiK?=
 =?iso-8859-1?Q?ZfAsfFFs4ohwn2YDoMOLq5HyZPIZVfcLMt+fN5bmKGNX8pqvfGReJ1SRyj?=
 =?iso-8859-1?Q?yXMcETuGPtdOuuhaNvJocP8IkWcpYfvFVkVTPhsuHzjNEU6HWSmCLCrZ1S?=
 =?iso-8859-1?Q?df5/UxAD1guXjjUzg8f56SV3cjh4tKmPiHWJLRfETic1rDr40IQf37wq1R?=
 =?iso-8859-1?Q?o6/lyL/J1hODSSnSclE6pEwbHvy3JAJuPvZkpA9Yeg0/CQvpZ55rJNCcXd?=
 =?iso-8859-1?Q?7ohrt/LsawpvjmawUmotQ+bOAr/yfsQ5HIckYPq+lbp4cI4mn96j5GWYwo?=
 =?iso-8859-1?Q?jt3xfvMaHTWD+vZ/Of4AVsk8RbffrMgECK3EavGx8dQYTgathpZbfp/U+R?=
 =?iso-8859-1?Q?M50rwyyHkvNP8lB21DJv1FKI73B+W//xosj0bQV1QkWO1JGxSWuJ4rDloD?=
 =?iso-8859-1?Q?cy/eJdWtJVI15wFl8yYFxdm4yUmf7ZNEmbYntXGF7sk6jWLiGnzLd6qpEx?=
 =?iso-8859-1?Q?dxhwDQHobXjsLwizGZitNAS9ZbZFj6uv6tl18BYdXGp5ZE8BCi4aiZAwYz?=
 =?iso-8859-1?Q?eLRopp9DwM7mDocrhi+dWIdQh77F+7HaL8fGcV7f7Dw3aSQk87Qy+k/j/9?=
 =?iso-8859-1?Q?eOYV1d+2FmdMY3cgRxcJOwODVRWER5FTcSWpk5gFtyXY7v02uLH4F8o0G2?=
 =?iso-8859-1?Q?1l7KRYbFTa4Y9+3WIu7fZjwg3TBXAZ2Jw1Tz0vg6uXQKJ9SuqN2f4ukLiw?=
 =?iso-8859-1?Q?zJbnQyrO4T+zftHKv+YopGGrAnyivo/0ExUoRhb9mP/ifMG0q0rLF8ruXq?=
 =?iso-8859-1?Q?iynFTG1aWoPkTmhn5lLTYi2tgBdycUjUYO4LhAm3ie7OE5jp7Tk8EoVGva?=
 =?iso-8859-1?Q?evuFy89R/7bR4xk/GrBpVjmRevxfQJRO90Af9aKWGQdQfxoJoG9v3ZewkH?=
 =?iso-8859-1?Q?W7aHp/evJfWC5sOGzHFpe4Vi18xO2UdI9x3nvCYWUmIhyAK4jBlk9Kt1NK?=
 =?iso-8859-1?Q?FCaWgICxepan2Q1whOn/jK4cOYIrfIcCxr8vINkWWC5xorovHFZoKTmCrQ?=
 =?iso-8859-1?Q?1tWHvhm8JcdDwFSlom6Rffjoif+EjCZvAvMam6zbaQrHC0PsDghqhZyRlQ?=
 =?iso-8859-1?Q?PzOeh3ZLvvGfRgu6bFGzsbP1IWmw5alUoqzKggFmaE7OTUALqd3hTD95MF?=
 =?iso-8859-1?Q?sBTgRgwOFxK153roSHTgNSL/SdEZxRZlrXzuJC0TmEspjNzSHzvTyQHMVK?=
 =?iso-8859-1?Q?P+z/DLSfo1a6NwYbl+WQR4VpIyfsdG4H15onZPHdcHYE5U7wAhb7sJN9dm?=
 =?iso-8859-1?Q?ui2tsG0+Ni6J5UdIUM2l8HMeO+NsrHvTLj+9j+Rs/jh5KUHSJmFV7DYeWD?=
 =?iso-8859-1?Q?XagP1EjSuVnqxKxw+iJ7mdrqI8juQ0Nj0zdjdkdALjZnPSIfxEHnQ4ukDM?=
 =?iso-8859-1?Q?xyRwfYUuHKiZ8Bo99rR17crrXYlXHpzDB0VwYSKZrK1+CKaUALlUJaGMcB?=
 =?iso-8859-1?Q?d8jtSVF/L+MzKf7BbK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f05154-100f-46b6-fa36-08ddde1c1afc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 05:57:25.2364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XukfN+azwwDdb80j4Mzek4aVpZYKO4tmy6xsMls4swnjKVPuJ/vozxokAnZIbleeydtcNMnV0Dr5Gc3RlmDg4HytkFfD7KsueKA8z/+47g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-OriginatorOrg: intel.com

On 2025-08-13 at 15:49:15 +0100, Ada Couprie Diaz wrote:
>Hi,
>
>On 12/08/2025 14:23, Maciej Wieczor-Retman wrote:
>> [...]
>> 
>> Make part of that hook - which decides whether to die or recover from a
>> tag mismatch - arch independent to avoid duplicating a long comment on
>> both x86 and arm64 architectures.
>> 
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> [...]
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index f528b6041f6a..b9bdabc14ad1 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -1068,22 +1068,7 @@ int kasan_brk_handler(struct pt_regs *regs, unsigned long esr)
>>   	kasan_report(addr, size, write, pc);
>> -	/*
>> -	 * The instrumentation allows to control whether we can proceed after
>> -	 * a crash was detected. This is done by passing the -recover flag to
>> -	 * the compiler. Disabling recovery allows to generate more compact
>> -	 * code.
>> -	 *
>> -	 * Unfortunately disabling recovery doesn't work for the kernel right
>> -	 * now. KASAN reporting is disabled in some contexts (for example when
>> -	 * the allocator accesses slab object metadata; this is controlled by
>> -	 * current->kasan_depth). All these accesses are detected by the tool,
>> -	 * even though the reports for them are not printed.
>> -	 *
>> -	 * This is something that might be fixed at some point in the future.
>> -	 */
>> -	if (!recover)
>> -		die("Oops - KASAN", regs, esr);
>> +	kasan_inline_recover(recover, "Oops - KASAN", regs, esr);
>It seems that `die` is missing as the last argument, otherwise
>CONFIG_KASAN_SW_TAGS will not build on arm64.
>With the fix, it builds fully without further issues.
>
>Thanks,
>Ada

Oh right, thank you!

-- 
Kind regards
Maciej Wieczór-Retman

