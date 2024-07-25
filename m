Return-Path: <linux-kbuild+bounces-2647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16193BCBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 08:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B26CDB20BFE
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 06:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AC04C84;
	Thu, 25 Jul 2024 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lltLBPg6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC212C8E1;
	Thu, 25 Jul 2024 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721890267; cv=fail; b=p5S84rWwF4CuKeHY2RpmYNb3AZiRpF/yc7p+yTObFULIMcaLYw0BnAsM7ZWazLSX6mc+SK2Wln1E5QTfufWLbQNPxam2JnzfKuCBpG3LlEgbUPw7GjNPlX9Amu7qpFWp1VRokiMZ6Gn+Xz9A5FIRh94OPplZL3fQnvaaNOK3vaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721890267; c=relaxed/simple;
	bh=GKjoBWhsW90sR+swxzoiiWozFR+NmTl5jF0T4z3anWQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f7x8wT5agiG7IFQ3gFrFW1YVQRGidPbGjDvvbVBV9HIR9o0vR6EFRnxa9r6QRaPk/wtrU3S1lvwZ67Er1jMW8mdkF/D2pKDnM6a0sTwqb0kZ7tVHYByoXvOLkIgugCiQ6EtsISlOC1Y/k7ADd2MPqwpDl0vfr0bLeUNlrGMi2Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lltLBPg6; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721890266; x=1753426266;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GKjoBWhsW90sR+swxzoiiWozFR+NmTl5jF0T4z3anWQ=;
  b=lltLBPg66M/GCcZDnQ1gjTQrPTs0y7Pfa5ooLBtuISbMY6docO7Q2BcK
   1nxDKJLOfQIqPFblYSqePp8w0oZn7iHjC6eQEYveg1lfBTVEJTOieiJov
   TNyCUOIPeQ22oz1/uI+eJ9GliQIXPpgycGdAyzdD9YHKOtdQR8Dvk2bvz
   vWVRdTETl0qXTAAEYT2njoqQrQAp5+zShNuFRpBK8R8HRh5pl/41i1wzV
   XfDotnBTGA+aUwbE06KP1LlXoLhK8GZ4Gai2Nhcg7Y7z0TBulYJBUo/ro
   DF6jQn3zk66CcMGarrin+DzFKhEgQvxpFiky+0nB5lZLUXItQQt34H0ls
   A==;
X-CSE-ConnectionGUID: yoCsrGJWSdKXZIx79xTF7w==
X-CSE-MsgGUID: N4GVt4d9SAqp/eGo1tJY6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30996466"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="30996466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 23:51:05 -0700
X-CSE-ConnectionGUID: VlWO5qyWQ92E7e+M4/vr/A==
X-CSE-MsgGUID: cwuAtA2cS0CeJ9f3j41uUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52852727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jul 2024 23:51:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 23:51:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 23:51:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 23:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp6gIcwjZC1LNh31GlwmfF0PqH2gjDt8RkT8a/gIR4yML0s2NNAbblXEl2Bu5sz2A/O4Qx8XK08CdB+336XLNFZjqQGGqYLRphoOA6PIiLu/m+wghFbIqr1Q5z1KffFo75jO568gba9hNVoG1InZ2ZZo4kQTIxIPZwRJ5FoVlkY0Fo4VejdKNVcjtsUUdrTu31jisFdTP2/GXMRCNCCZpM3ux6EAOc5WctDD+kmO+6NVP216qe1hpNXepizKENMcGLjBlEmw7SYIBLguhL40MInpooVh1Bpaato2IeyDrhjL4JItaOHwqqAt+5a8XMcRqATPMyqUAZryam10MK020g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0tsmzFgA2mXDNr5Dhoy+pqT4QTSE/Zq6HywA9mCQdw=;
 b=EthRTg041VXCr+fMr2oIL8CnNJ8QtAdxpA8qJ9LLo0hsRGSR6i7TTHOVLIoIws16VUEdA3GoEAIXgYp+dekuFqkJl+o7m3jlrUPxOsJHJYqS/E2ZzjR5VhinDhEPEGa4leZB3szVGNquLcSXvlHELg54pKK6VHcPZiJqFvwGhVV/d9o97INChlm8xW0r/2l9w8MdKJgU+l2JK9vzZtq5SLx+UlKoVURgumGP29PtiJmUstlMqTqVH0Od8VMo9PWT9IczajKHxNaxIaUYmxJBwqpPGSz3qe8+vyDkVT9QeG9CbcM+2CGQ4Kxzr2hicetX+FxvN9d15X5nOv8YYzLY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 06:50:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 06:50:56 +0000
Date: Thu, 25 Jul 2024 01:50:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>, Jose Ignacio Tornos Martinez
	<jtornosm@redhat.com>, <UNGLinuxDriver@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <gregkh@linuxfoundation.org>, <kuba@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<mcgrof@kernel.org>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
	<woojung.huh@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>,
	<linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
References: <20240724145458.440023-1-jtornosm@redhat.com>
 <20240724161020.442958-1-jtornosm@redhat.com>
 <8a267e73-1acc-480f-a9b3-6c4517ba317a@lunn.ch>
 <v6uovbn7ld3vlym65twtcvximgudddgvvhsh6heicbprcs5ii3@nernzyc5vu3i>
 <32be761b-cebc-48e4-a36f-bbf90654df82@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32be761b-cebc-48e4-a36f-bbf90654df82@gmail.com>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ad2a32-f529-41d3-79dc-08dcac76225e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0FjYStFxwWQ+2UZY2e7M9T6ZAoGBLuU78HyKaaPbYnWv1BH2B1EJI6q4l7?=
 =?iso-8859-1?Q?FAKhJJ4bgn19OVfXkaCB+y0t/iuTUZ3JflswOX2PbrkghGT9R7kYaRdULJ?=
 =?iso-8859-1?Q?C15AI6kNDoSAHbMi+HbrQJ5+d7D+Qtipp6I6viI8oSl/u7P0TKEvz6y3uJ?=
 =?iso-8859-1?Q?KYZCCk/zB5PIu/Xur1LbpjaXzZEgS3fKDyu6ZLjC+zGH8WBRLJ6IUWXhes?=
 =?iso-8859-1?Q?3qe1t0uxV+TlTZWS2gqj5XrjR1N7zwmm4HZG5XSWyM8+KLuug/4zlZx5fa?=
 =?iso-8859-1?Q?H/FUIvmQiWehxq0ZNYyOYs27XoCHNfeycbHlkDCXX+QHtL/zcrYJwE/5qt?=
 =?iso-8859-1?Q?qJ2app0gesFDlueNTTQ5V2aOQm2oYWWivGgoaMWqzLkz+FmQN3UNMZfKhO?=
 =?iso-8859-1?Q?PsZVMuZA2Aq5K+F7WQwrRA4tsPpe6Jl99dvQIoqaGuKZeL7USY3mN6kNZc?=
 =?iso-8859-1?Q?u1YLcpf/M1aF3nlNsMWxlB7LwQey1VExQtI7MNhBa3Bzi0/pahRkWIZ7Hn?=
 =?iso-8859-1?Q?YQid+uqk84/ynq/KYMnCTYE95u1Ts0jzQc5aBf1ogAgkRl9fFiAPRI4W0P?=
 =?iso-8859-1?Q?gUNnm7MJItWnWTVJtvvb91No5QNCmPfatfDVVf7eH8rs4vh/HIniLpAt0p?=
 =?iso-8859-1?Q?9TNgJ0aTS78X1XxL4Lkgrfgbe/2RohWL0c0I10kY4VYAKIxwlvdohqUEt8?=
 =?iso-8859-1?Q?C8zuUcpTqqPHYQnAvfXbGOmMX1flnEsJxozyxjXQ8ZGeoGSd3WsKka4fPy?=
 =?iso-8859-1?Q?bgOauMFq0f7upVZxuadb9aXxfNLcT63u8wSfCkf8X+FXH/TLzJE1OiOB3Z?=
 =?iso-8859-1?Q?qtYZamYWDrT2ptMa7orPljWCTIQTGaZewaBzJ4kTAGZqQu3zR8UdU2FTzN?=
 =?iso-8859-1?Q?sT7IBWP9wld4UgCuAhuPcqAMsqMWWCkKGowYlbzeifQKJAao/9T+B9kL4V?=
 =?iso-8859-1?Q?WQLHThBSjDDLMw99rmwYKUZSJqXxOHjoky3lpB69iar23zQZJVENss+ngu?=
 =?iso-8859-1?Q?uJlXTeX6ErLQWFrX70+2JpA7NEtdLKnE2I8mYIYhTND87Ub/X3jpWKr7oS?=
 =?iso-8859-1?Q?DsJ7h6QpA/Rz4/sslcugNRYih8KUnbqlxo4P8ML/QoNCgK5N5BYcuGXI1d?=
 =?iso-8859-1?Q?H/Xx2KJ3evYTRqlJovcw9TfWOtGlR65cn6ak3Z4oQWUgDiYgliEmwJdIQR?=
 =?iso-8859-1?Q?j0rNbDVbff97FgENnrcX5DcY+uh27j/suTdHe0CytYb6qwYAelaGVQG71F?=
 =?iso-8859-1?Q?Jm3hCsk1+iDPIxM8ypASPql6o3axQVWm7QpuNAoMAiNGcgqZxX22nNxQIY?=
 =?iso-8859-1?Q?XGeidBNdUeshFyg2iiSrWkOAJOsY0LLjmEnNpBpJQdxmck3IXkXDF1a8jm?=
 =?iso-8859-1?Q?XLqqI+iKHH9qLFt742c3sjttWzQ2WRnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v/Ase0c0rJpGmf0I7LmTuofNR7Qo7vvIjJgfuK/Pz4/OUoMPfpxq+nqoh4?=
 =?iso-8859-1?Q?lCSDJN4rf1M/ntUntNz8Ez8R2qXnrPm0O3G9rb2waAIGScPPInGO20A2KD?=
 =?iso-8859-1?Q?syf3y368ppCqzebHAijzdMMyyD8JZ53HG3VW14M2lMwiduDOWIHBTK/lMD?=
 =?iso-8859-1?Q?80cJcLmWYQgx2lKkPpLfGHYoeEtBj3z/IxQ6mnfu/AYuhC5Qc8N6x7p3RS?=
 =?iso-8859-1?Q?FYRSuEh/YIdFYPYvXGi4KCgGIpuqUwGcrcShoI+ar70UoTXjyfnOUt7JWb?=
 =?iso-8859-1?Q?PkzeRXMnVsnxlXwaHObDePN+3sBgk0RMGLLMAb+kKtMyUqh6ijC4rz7QG5?=
 =?iso-8859-1?Q?CaMkD+yntWUO6cg+DtrQn4nBGO/JOrXuoN8uftfn9kl6ORlnL31xKy05Xd?=
 =?iso-8859-1?Q?dbiuz+a0mpr2yLT85O2qMOakHVEkH+3w3z0/ZRPT3xFvcVcQMZrkpfEvf/?=
 =?iso-8859-1?Q?FZ1OCAK/nQpMXeR9UsaQ6PIaeBdzE+/i3jZa6oUIoPGvuO6+p2v3Q3jh43?=
 =?iso-8859-1?Q?fDgWCWPfqnfzJrab5FmPdAvX5XvstUFH7nRGgi2NS7dF2I3hCyyVtDhhXi?=
 =?iso-8859-1?Q?n7Yv3Gs5Fgwh9SB/1j6HtoLAdjFJ3wzONFQyn7FEApG6yMRQB9cy0XGsnG?=
 =?iso-8859-1?Q?M64xUEnp1xfCPMaM/dj0dv6VG0pJUY/d+jDSuJgaB4bdi6JfaYWc0aKSRQ?=
 =?iso-8859-1?Q?mZUOLCBneIfkcSJ871Mn6j2pCRWx9DEFpgPUf1D2euXvIbUQB8UZdcpnqb?=
 =?iso-8859-1?Q?Ecd2pRR8dYpmTg2VQON8CpQxwlSbkMe9FUz0YHqxBV5BDCRHomE8GCzPQF?=
 =?iso-8859-1?Q?4Eog8ufJ+i6ni4yax5y+XDeV3KZuxfxurDsGoziopv0QeeXwdJtCkW5EDD?=
 =?iso-8859-1?Q?AYkIvMM/KsU6Bt+F0EnV9jpcOkvfnetcfYldmQnvZHKWiaKonnB0DMlbHd?=
 =?iso-8859-1?Q?OEPl1gxMIA7Q0Fgfrc+HGYh7urNLqXD1uuh8ZcvIBwuZNlZmbo6EQh1Z8b?=
 =?iso-8859-1?Q?P6MjKJdyfNj3w7Uxb0zv/ZBEEWIrtBKVAEVJXJKDEswtaPR8QNp7mmcRXU?=
 =?iso-8859-1?Q?YtXyFwA45IdkxtlXu2hg+dboHLb5JpVhmUBCmIjVBvjer6dJsF1mV8nYJG?=
 =?iso-8859-1?Q?KCLtLIdfelUinXtq7wPNanCIuXDuXWFAGZ5jP88bsHCyyYgY1R+zPSMGfN?=
 =?iso-8859-1?Q?hMFFkvVYxgcK9P+lmW80e5kzTOuyoeBpV88cZEXQ6OoiqjnNkOFfdOTGZp?=
 =?iso-8859-1?Q?/4sJoANQsIOCsw0SNma4v6cyQDPieKnZ10iWVgVn7McyqRWAdU1Alte8rB?=
 =?iso-8859-1?Q?jGIxRluB/9WZNK5YiQjySTy6BmJC/Gq0afBwHHBcuuObO9bzIESqZs9qmQ?=
 =?iso-8859-1?Q?t/sJaBu1qdvbm+g2ttzoWSsUF4Ng+p2yzvZj2QBprYQ1sQ+vn7vWvNb6Zb?=
 =?iso-8859-1?Q?Kq2A1Mrjq4ZkSUMeyLn/GatP9QNKkPpBFB3xfTauN69k8YD0c7Edrpgvza?=
 =?iso-8859-1?Q?n+UvfSkYCQq8rbGdl/URU8/99m0UzYoenniv0crKqK72hwyP0w00Fm5Lhe?=
 =?iso-8859-1?Q?DIDb9sZE1jBqifOxzaysmQ693epKyleB6HbEeVR/27vpbKM82gqb9E8pgT?=
 =?iso-8859-1?Q?4HZK1p0B684Mcv5cPb3K3xMPY1dBBdfNoFI5hmrHTJgTdtDfuV9cxcUA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ad2a32-f529-41d3-79dc-08dcac76225e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 06:50:56.3621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s47+nzixqSseD2JhstCvL5vPtBxNcCrR3L7XU0qgs3WG+L1uVFhGkZGUTb3MbaFE9HyT9grEPLyt0xQXBlGCu5qiLNvO1mgVYUlO7KSO0Eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-OriginatorOrg: intel.com

On Wed, Jul 24, 2024 at 09:42:48PM GMT, Florian Fainelli wrote:
>
>
>On 7/24/2024 9:25 PM, Lucas De Marchi wrote:
>>On Thu, Jul 25, 2024 at 12:57:05AM GMT, Andrew Lunn wrote:
>>>>For the commented case, I have included only one phy because it 
>>>>is the hardware
>>>>that I have, but other phy devices (modules) are possible and 
>>>>they can be some.
>>>
>>>So this the whole whacker a mole problem. It works for you but fails
>>>for 99% of users. How is this helping us?
>>
>>no, this is the first instance that was found/added.
>>
>>if you declare a softdep what happens is that the dep is loaded first
>>(needed or not) and your module is loaded after that
>>
>>if you declare a weakdep, you are just instructing the tools that the
>>module may or may not be needed.  Any module today that does a
>>request_module("foo") could be a candidate to migrate from
>>MODULE_SOFTDEP("pre: foo") to the new weakdep, as long as it handles
>>properly the module being loaded ondemand as opposed to using
>>request_module() to just synchronize the module being loaded.
>>
>>>
>>>Maybe a better solution is to first build an initramfs with
>>>everything, plus the kitchen sink. Boot it, and then look at what has
>>>been loaded in order to get the rootfs mounted. Then update the
>>>initramfs with just what is needed? That should be pretty generic,
>>>with throw out networking ig NFS root is not used, just load JFFS2 and
>>>a NAND driver if it was used for the rootfs, etc.
>>
>>that works for development systems or if you are fine tuning it for each
>>system you have. It doesn't work for a generic distro with the kitchen
>>sink of modules and still trying to minimize the initrd without end user
>>intervention. So it works for 99% of users.
>
>OK, but 'config USB_LAN78XX' does have a number of 'select' meaning 
>those are hard functional dependencies, and so those should be more 
>than a hint that these modules are necessary. Why should we encode 
>that information twice: once in Kconfig and another time within the 

selecting a config currently has nothing to do with how module
dependency is calculated. You can select whatever in kconfig for
whatever reason. And a selecting a kconfig is often used to select
things other than modules.

"hard" dependencies are calculated by depmod based purely on the symbols
the module uses. So if module A calls (a exported) symbol from module
B, there is a "hard" dependency. modules.dep will have a line like

kernel/drivers/gpu/drm/xe/xe.ko.zst: kernel/drivers/gpu/drm/drm_gpuvm.ko.zst kernel/drivers/gpu/drm/drm_exec.ko.zst kernel/drivers/gpu/drm/scheduler/gpu-sched.ko.zst kernel/drivers/gpu/drm/drm_buddy.ko.zst kernel/drivers/gpu/drm/drm_suballoc_helper.ko.zst kernel/drivers/gpu/drm/drm_ttm_helper.ko.zst kernel/drivers/gpu/drm/ttm/ttm.ko.zst kernel/drivers/gpu/drm/display/drm_display_helper.ko.zst kernel/drivers/media/cec/core/cec.ko.zst kernel/drivers/media/rc/rc-core.ko.zst kernel/drivers/i2c/algos/i2c-algo-bit.ko.zst kernel/drivers/acpi/video.ko.zst kernel/drivers/platform/x86/wmi.ko.zst

that means the xe module uses symbols from (some of) these modules and
these modules uses symbols from the other ones in this line. This is the
expanded dependency chain.

On the other hand, there are certain situations in which you don't use
a symbol directly from the other module, but having it around provides
additional functionality by other means (apparently the situation here
in this patch). It's common to record that dependency with
MODULE_SOFTDEP("pre: ...")

$ grep lan78xx /lib/modules/$(uname -r)/modules.dep
kernel/drivers/net/usb/lan78xx.ko.zst:

So you don't use any symbol from other modules (the above doesn't list
things that are builtin in my kernel config)...

$ grep -e 'CONFIG_USB_LAN78XX[= ]' \
	-e 'CONFIG_MII[= ]' \
	-e 'CONFIG_PHYLIB[= ]' \
	-e 'CONFIG_MICROCHIP_PHY[= ]' \
	-e 'CONFIG_FIXED_PHY[= ]' \
	-e 'CONFIG_CRC32[= ]' \
	/boot/config-$(uname -r)
CONFIG_MII=m
CONFIG_PHYLIB=y
CONFIG_FIXED_PHY=y
CONFIG_MICROCHIP_PHY=m
CONFIG_USB_LAN78XX=m
CONFIG_CRC32=y

>module .c file itself? Cannot we have better tooling to help build an 
>initramfs which does include everything that has been selected?

if you are saying that the build system should automatically convert
this:

	config USB_LAN78XX
		tristate "Microchip LAN78XX Based USB Ethernet Adapters"
		select MII
		select PHYLIB
		select MICROCHIP_PHY
		select FIXED_PHY
		select CRC32

into (for my config):

	MODULE_WEAKDEP("mii");
	MODULE_WEAKDEP("microchip");

then humn... why is CONFIG_MICREL (being added in this patch) not there?
It seems even if we automatically derive that information it wouldn't
fix the problem Jose is trying to solve.

Note that the MODULE_WEAKDEP() should be added only if that's selecting
a module and if if there isn't already a hard dependency. Then I think
there would be quite some work to do. It was not how MODULE_SOFTDEP()
was handled in the past. Cc'ing Masahiro and linux-kbuild to know if
they have an idea how feasible that would be to add in modpost.

Lucas De Marchi

>-- 
>Florian

