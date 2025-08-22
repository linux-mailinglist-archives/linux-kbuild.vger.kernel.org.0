Return-Path: <linux-kbuild+bounces-8565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33812B3109A
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Aug 2025 09:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5E041CE4DD4
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Aug 2025 07:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327C2E8B88;
	Fri, 22 Aug 2025 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VscEH+NL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7FA2E7BB1;
	Fri, 22 Aug 2025 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848261; cv=fail; b=gv1yYMt1hL+Iq7VLPdpLGcf1wjAOxjHsNoBytjW6nU6aQCOpCAmrHvFeHrxPfTKxi7Lxp+1PunOo7Wcfnq5fni/SWgGgt7Qqg7yezzZseqhmizmUkjCkPLMw33U1s99XVQP72f42Jjv25zgkiUgVXrHk9ZBd46O847Gij2YQ/MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848261; c=relaxed/simple;
	bh=VBZL8iw1bUGbARUiIj8InOPAbBfoL3zRxkL4uldaWQ4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WoqYVj1C+RHyfWv0kkS3AHIizhc1dCGTYHhfoq7JgkehFu93JCL6WN/szT7E0N+MrIfCrLYYDN22EWm6D30QR0LA+LpXSbZl12kTYXqr0V3LsKPTCys1QmjOeu3L5gqb9tZpu3zQz/xHwXcw3LbIyfdnAwQKthnq2It8ky2XfEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VscEH+NL; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755848258; x=1787384258;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VBZL8iw1bUGbARUiIj8InOPAbBfoL3zRxkL4uldaWQ4=;
  b=VscEH+NLIgN47ONzKAUYqb5G5TLLjtR1lC0u7BCaYwVnifVD/02pb2d1
   a6aDr+n9BXMA77NhEl1+NUVSpXhh5NiplEcOlD5+qjYzsC5hvlyb68m9J
   9uTAVyzsjYvF5McYvs0kA80DKKmBit3xTo/6Wtx+umh6J/1m8NL/7zlew
   jRE5icPQ3EOUxeAOhpj66WdSpw9SKgUefAnwmqCVpItlA44JL6nkCPiZ+
   6kyO6Q614I5hV5H3NELg15JXDJ/bJO3DEiUMbsoRiu5eg+5U0iG1KI2J4
   GIfsj0IUsQ7kXql7AS+sLw9U1Ki6jU21Ca6Vf/8Z/zTN8lZoyTCi0cw1l
   Q==;
X-CSE-ConnectionGUID: IspQEmezQdGYld63TN3Ufg==
X-CSE-MsgGUID: WydHh5qjS3y/skTcNzuosA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68754000"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="68754000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 00:37:37 -0700
X-CSE-ConnectionGUID: y7Afnbg/TQyEwbE5aEULWw==
X-CSE-MsgGUID: 29lKMSLrQ+29tgpcM90nAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199601040"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 00:37:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 00:37:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 00:37:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 00:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzTFYJ9ulWv2lAT5WnpefIgayPn9LzcXRpn8iLDhwoAwdsMBwCIKTJpQJ7E/NSCGspmwwbEofiefu3T8YyKOLxBvWDnmYZeeoFIUtYHurst/ZfA9xXgrbNmoFMvCZlPjL7pWek7rsW1AgiR4NDkEfzrpeGqHW/nGsYodURTx0cZlXoyC9Z8XD3sN+UU4NRFMd6oxRCQm0Vo1wWR4zLYm4+DV9+0ERAKKv/N4LV5BXIv9STiqMsEG36aFeIcnV0X5ROh2xEjhdtsFNv6+5K9wht6AUMp1RH96hgz2Y4g9WUZ+XyecOhZj5mkQw2vZTb6Bq0Kw/MvTNOMBJ1x7nvgn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bJoOdvjf1XG//lsQT7QvvRu+gIxqRz97YA9T9vz4eg=;
 b=rsrkjkXXr/ifKn+aKa6039N05ThiSg0HFv9KWUC3BD6U9dr/jOd96bPsSTyJEPty5O/xtXfgqrGJsvQ41u3cWyYOElwqun28C/OnkEcT2iWM8LJ/DZ5a0XUebyccrgXB+ARQKrtjoMOdMRJKS8ALF3erpHkNYbnsY0eYGCRmwgpDucbFVwCUrIeZDwEjk/HSjp6soslhejNnA4cHLqIYfimd5eOQWCD69VSFBEflSjrorsUDfKyo/jARmxMR1kfwlgcl08j1nmlTUKgIE7A9M0Q/9dpLNUgaLQhy3ojqbPa4pBw6QB02ei+x8mIl7sni0FQJaZdklhoZELuPHjJsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by IA0PR11MB7883.namprd11.prod.outlook.com (2603:10b6:208:3de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 07:37:22 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:37:22 +0000
Date: Fri, 22 Aug 2025 09:36:40 +0200
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
Subject: Re: [PATCH v4 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <rbppxnzk5qcb3xn3gexennv3erveqdndxljytqe7bsbnfa4hd4@6zvjav6iuzhi>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <9eb211ee-94bf-431b-981c-e305c8ea5e0b@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eb211ee-94bf-431b-981c-e305c8ea5e0b@arm.com>
X-ClientProxiedBy: DU2PR04CA0332.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::20) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|IA0PR11MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3ab166-5da9-416a-3fbb-08dde14ebb1a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ay17XSIT2h83PR4a8XDzyBjVuKYBkP59XBJuMpZ5VRGBpBjF2H+NvItLNY?=
 =?iso-8859-1?Q?q/ABt0r2YK3ZERa9qVnmU1sdiq7Ra7Pc/faQQkvLwMY9sMrmd9rB2n2tRa?=
 =?iso-8859-1?Q?oFqbs4P91fweqU0LuVyeJjTr9abFRKWib8fIGf6z6K2ExAQVfVGEHAvMui?=
 =?iso-8859-1?Q?6BemfFKqGUJtkRwU0yHLnOjH3hnVE7I6SA4pCJaCDJa2xpjzUvBmyJGyem?=
 =?iso-8859-1?Q?cTYZpI46+mzCYiLrVSFD8cY95vCUXES/CySkKO1XHJHcH2YLsYKz+6fZoP?=
 =?iso-8859-1?Q?rs6ROVRIHf8PY18alrkLu6H2TkcGLPe70ksUiSimOyTvzqEqG3d9nngaWQ?=
 =?iso-8859-1?Q?kpqbbRI20+QEnh5gT3RySVntYn+O4cAbL72xcJ8KqwfzISVRFH5GEruT/U?=
 =?iso-8859-1?Q?QLMd3VKEqIJeqMAAf9tsi1UkvCw7ItNpRWC453ERX7q4KafRVl/6UFPtvN?=
 =?iso-8859-1?Q?6cPvx5nbsE7Y5pf7saYZnlHxybqM4bU8mD11oGXKXJe44YOIZxfXOktwY7?=
 =?iso-8859-1?Q?36BzdV46KPzicVZKJ39BP5DNNz8QRgVxa1NfdFJSg+POsVqiy8AcmdNHoL?=
 =?iso-8859-1?Q?rd9JsvdboN0oF+0CO61Z5UqAPgyhmkoCrX/r0LJje+JFFqbf701/RaSKYK?=
 =?iso-8859-1?Q?9x7CGug+TZO+nLkAuJgtgB+HxcgQW02ElXaVTRbbAAAP99rWOPlSDzb7ke?=
 =?iso-8859-1?Q?wPZqADRR+7v/DjPZ0OA/kqOE3xHAw29oyBF1v0TNBmTrh7rmXhdcRjtI2+?=
 =?iso-8859-1?Q?sSMMONiGEYt+OCPs/8/id2Sc3X7ZcKvUwlCn0jsYXL7oQmGa5UPxV7q7Ui?=
 =?iso-8859-1?Q?Vq7xK1bLWNQXX9wEOW/l7W1yjlHR8oWI0xwe2Z+4s/Pj9QLb/BRTRNYaP3?=
 =?iso-8859-1?Q?vB0VMiqnpJ0ERzLUN9AzasfdTK4n/ZRY+xuMmfPPDbaBSbMIIiFfAKgjvn?=
 =?iso-8859-1?Q?F31kOF3ljaDfiTiwjoBt5BUDFjxFQltJJJ/rw0Dn/G/EpMXNPc+UxQ3q3M?=
 =?iso-8859-1?Q?895WK/FB8SuGyLxebKvt68URx29tE02x3gEAhZ9O03zxGEJml7sT+YHoCF?=
 =?iso-8859-1?Q?EulLSyO2Ot9cRWmzGT//VrOicgDS/Ia1nwuxAG2B/OTo2qbQAIj1ZkhwJy?=
 =?iso-8859-1?Q?W9+byXpy7VOtzmFKtfOVvCM7m255Wfvp3SJNa2g2mXMhtKHrEwP78RuszG?=
 =?iso-8859-1?Q?p689zoXC/ySzelI4iVIUd+eXrQHwO/6bJ2iepsRvDL6udv1/tOPy1oubUG?=
 =?iso-8859-1?Q?XC+o+Pg/Ig2ETBbKP10A8CEe32MMEGc93YK1E3AMxZJCw2mYYAIvFhIM8N?=
 =?iso-8859-1?Q?SRTQt1KQHC2vSKTG9CRPX70IKj6g3iNnWVNBH3IZFP29M3daYuoszbmF3Q?=
 =?iso-8859-1?Q?WXNYDlPUqlUimX76qhnEVgIdW9MDQwdkWV90N5wjVilohnrxXkzPsT8GBy?=
 =?iso-8859-1?Q?QWMfTb5LS8f/nXj4AJpiqOo9b7EHDLjCAOROmBZR06jj0MSvNhDm6VBCH8?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aadM5Hr6K4uVjoaXZVYwNdBeUZQUtyOtgtGco8l9OOS+6vVg8/q5w4YaRQ?=
 =?iso-8859-1?Q?JAHaPjHEUlHzlIi+N5xxOIkpD5cAbIFz7MxadxzWtaOpcg2yLOifDplSgt?=
 =?iso-8859-1?Q?R3UMhw2s4hQPlag0gNrMz2GU957AaEjjJityNnv7coYWDf5fboWbXP73C0?=
 =?iso-8859-1?Q?PXy4quV+V10k70LQXXLVR9RgVILgJg5Y/VedzjNLwFtcvOzSVN5sRzR/y2?=
 =?iso-8859-1?Q?KSi7b7aks3F4TYOgmduX4P2S/1S6/1kFwnIB1YZ9u/WpuWEVUxkhQ2Egn2?=
 =?iso-8859-1?Q?JyMk+ZpVCOCL2fJ4Q99sB31z0g4RMRCQ8fnyTPx+syEAEWFHxgW6f6r/X6?=
 =?iso-8859-1?Q?PyXPP3sttDzS4aaCy9TNuP8UJPRw66KLQucxDmwGuM92Ez0RTplFnI8/DK?=
 =?iso-8859-1?Q?z+UfzKA9wl1ZMhfqwTgGvK3Va7JOjRnfEfeMUMQr6CwWxgLNbIGGPBUO2M?=
 =?iso-8859-1?Q?xnvbJeudtiGN5jjvVjUvCzU43EfHF46ax3xUkegDu7Dp3TAOvr6F42S3HO?=
 =?iso-8859-1?Q?LiOOUwOKp+YK42OXbIRhEKJD4UO4y565Ku+yC+14WtSoFk5iBUNizmzOSs?=
 =?iso-8859-1?Q?QMhjChh4KtmFeUjKqPgWd3DEclZXGUxN1ynZCMJGfHlb84sr0R8XteadYA?=
 =?iso-8859-1?Q?8ChqiHCi4CCkfrfTeHR8CzrdS7KwUX68T9oA0aLFcoyNwOhFrbM6q96Siv?=
 =?iso-8859-1?Q?Pu0spuEJ0Lgax5Cn5oolLwsZd/C3N2KErHLQjsqQOIl2JnrDsY7LCnX553?=
 =?iso-8859-1?Q?q3LEJe/IDfaDIwa/L7CCvdoTLt7byO598Mcv7q+u8vr145eK6O6oRHgrBU?=
 =?iso-8859-1?Q?BWZlGQoh91vTwQmf61q9hx2PG1+8aVOZ8aXywNApJupr4EAf378w631mqK?=
 =?iso-8859-1?Q?xnSlzrRI4NZQRC/5ZJdLyIrDf9EK/W/eLIFdiBa5CxHUwYmjHWSIA380q/?=
 =?iso-8859-1?Q?6PvcrOrntEPBjsfU1UivwSbjl+bHYiBb7Sb0dnw0jNQwkLvQCTN6oqPr0m?=
 =?iso-8859-1?Q?pTwA/sTW10CM8lzPchde4PyRskt57qYmadFKiAn64S1HZPJLA3miU0aRdH?=
 =?iso-8859-1?Q?Qt8oJWiSGlZG6HccQHGDNgJrGrcbJni741zGjMgqw3AsR5c/3ZEX6HlVyO?=
 =?iso-8859-1?Q?nQ7f/OC0zCy1Znv4OjxKe9/z+v3HPK+XsR7DDfdu/DT3Yt/OvisixQClc0?=
 =?iso-8859-1?Q?kbksQnCn6O6oFYIgBotAQuQvKoz+nycXBRQQtbdzBbfknsXhJUVPfQq+F+?=
 =?iso-8859-1?Q?pdCJVYmHNinK35g3SqHmiubGDO+QWT+oGubwqXNJTPQJFXkJjKaXfIU3kK?=
 =?iso-8859-1?Q?nXjokRtJDg6WFH3luzZMvMkvsmBOAWiWbZpU+4zFAP8BA8kLbafvDIe7If?=
 =?iso-8859-1?Q?+fZE0Ox72rbYic9gvUkL1ePCvRc8p3IbyMD8HIF6r9B/ZgBH6AdzEfs+nD?=
 =?iso-8859-1?Q?DjbvgvH7/HcclI4OR1G56JYxv3t4v6wb+K9LDBo77zGdzD9qqnDjPcM3Ke?=
 =?iso-8859-1?Q?5cdz/4VZB/J7CXpTCyN2tZ+r3Y+QiozRP+w6Fgez7K+vkNpNXuSo7Rvdnz?=
 =?iso-8859-1?Q?wqQ1bqdn8FmbqbI3g7p9WCLN22NvHWxmoOOHeMvFjHzMhjC+fvPbUt//im?=
 =?iso-8859-1?Q?kJ7fScgkGIPHccqFz/KhUdMInDynLbXlVTtAEbkyoSKlzpRUV99q9ajGPj?=
 =?iso-8859-1?Q?4oRLhgYptuS9cRRU4z8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3ab166-5da9-416a-3fbb-08dde14ebb1a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:37:22.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2PHruk0+sGWnrT8wj8Bk+0LUtAsKyYCW98VXBw/B90hGbhe0vfgPNE/nADSA4GO3/tLX75QmMfWCEJUXy8lNojlRr3G4IGi6+x9DnuVwGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7883
X-OriginatorOrg: intel.com

Hello, and thanks for testing the series!

On 2025-08-21 at 13:30:28 +0100, Ada Couprie Diaz wrote:
>Hi,
>
>On 12/08/2025 14:23, Maciej Wieczor-Retman wrote:
>> [...]
>> ======= Testing
>> Checked all the kunits for both software tags and generic KASAN after
>> making changes.
>> 
>> In generic mode the results were:
>> 
>> kasan: pass:59 fail:0 skip:13 total:72
>> Totals: pass:59 fail:0 skip:13 total:72
>> ok 1 kasan
>> 
>> and for software tags:
>> 
>> kasan: pass:63 fail:0 skip:9 total:72
>> Totals: pass:63 fail:0 skip:9 total:72
>> ok 1 kasan
>I tested the series on arm64 and after fixing the build issues mentioned
>I was able to boot without issues and did not observe any regressions
>in the KASAN KUnit tests with either generic or software tags.
>
>So this is Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com> (For arm64)

Thank you! I'll try to send the fixed series on monday/tuesday.

>I will note that the tests `kmalloc_memmove_negative_size` and
>`kmalloc_memmove_invalid_size` seem to be able to corrupt memory
>and lead to kernel crashes if `memmove()` is not properly instrumented,
>which I discovered while investigating [0].

What do you mean by 'properly instrumented'? Is it the intrinsic prefix thing
for gcc that you mentioned?

>> [...]
>> ======= Compilation
>> Clang was used to compile the series (make LLVM=1) since gcc doesn't
>> seem to have support for KASAN tag-based compiler instrumentation on
>> x86.
>
>Interestingly, while investigating [0], this comment slipped by me and
>I managed to compile your series for x86 with software tags using GCC,
>though it is a bit hacky.
>You need to update the CC_HAS_KASAN_SW_TAGS to pass `-mlam=u48`
>or `-mlam=u57`, as it is disabled by default, and pass `-march=arrowlake`
>for compilation (the support for software tags depends on the arch).
>You could then test with GCC (though the issue in [0] also applies to x86).

Thanks! I'll try it out :)

>
>Best,
>Ada

-- 
Kind regards
Maciej Wieczór-Retman

