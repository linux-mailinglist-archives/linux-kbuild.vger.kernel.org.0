Return-Path: <linux-kbuild+bounces-3146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC595ACBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 07:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE2371F22818
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 05:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9990B39FF2;
	Thu, 22 Aug 2024 05:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPXSStFC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8811D12E5;
	Thu, 22 Aug 2024 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724303134; cv=fail; b=RPZylL5fr3lmTQ2Nt3g3xNVLUTnK+efeH8pOguU1eks/4RZe7wnnb1BAFquaXiROTcLuJ3s2k4sn6wcP6gZWw4cIwWOlk0z0ZawtRdHOaJk5MEDUNJEpLYiPdij3C4FZ3foxr7GfWskrf0trLlxtJ5eFx2+xXtxYUeIYiIpY4Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724303134; c=relaxed/simple;
	bh=6l7eu1gAPBe4O/Q3Clks5XJKjAAzbBoZNgKVcw6gGUw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gLQSIfEha8OKYYbf0oc9+LASl3QfcMG6joVvvJ8AcDLJ6BkrogWYXNQaJtTvb+nvOUA/ItxVLyUsvl3pdeF85sNvaOCEyTWQ9eCQUTv/BH0jP8pxBrvt9cNboxa5aD/2JuOIgNqMD6Oa6bEeUNi0OvYX3lyKBzKVm31Dq2RTCfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPXSStFC; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724303133; x=1755839133;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6l7eu1gAPBe4O/Q3Clks5XJKjAAzbBoZNgKVcw6gGUw=;
  b=iPXSStFCe+E7fSGfszVkZYCC7a0euM+KR7tJcplGq6qZnvRghevEwkh7
   FkcYR/gjs4jAFYabUMFKBnImSblkJEhq+cETDluiorytLFBoQWYzTZxuu
   WPOdm4a1+vLKqCsUww/DaNYzTiMd5Wm+cX0zXn/dv0M0I6k2YQHW6AsZD
   td287lkSx4CCZFAI0N2I5vsYoU6hybdaAslKAl/8vcP25/ig2TO8dytuo
   jNcu/t+ut8+crNLGrEp1rikt4t28dTr/kjGsGW8OkXYQEBF0VHIf/cEao
   77Fn1WgQotF2MxlrJAcCRt3Hj5sfx4tvPhC6GGD8ghja7hmBVBRnLvTWX
   w==;
X-CSE-ConnectionGUID: 2qR1c1O6Qu+dmeXnCqMY7w==
X-CSE-MsgGUID: dzENqQBOTICRxoRKfTUdfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="34080160"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="34080160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 22:05:32 -0700
X-CSE-ConnectionGUID: kMGUaXjARguAK5Qgx4hS6g==
X-CSE-MsgGUID: 9xtq4eyFRk+oksSwBIdnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="92058414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Aug 2024 22:05:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 22:05:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 22:05:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 22:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MijJyqWamMYxVFhfrk3ZdAeUxL4sn+/JbgBZdFEHA4qHo1eY4FLRHIJcCLiVakq6yoj7OKG/Mf356QdzAd9kJUG6kGPi3IjOUWfsai5PmvEnvh0pN+auqsw347m+m2fzD2HVu8m69PuO4fQcPnFQKo/3F/bTvuYDJvjrZcpqrxe/APZ2z2d6Vv56X+CYWC0mRqkFrTehrdiPsnjASsziByioP6F5JPGKytfuzfImyKpGC5O5ZvV4BwHDUxsYiYigX4WQEpqHkRiwKPbkKwrNTR+VH9dYvQnCVVzxdHxu23geA/0HEwZ5/TIIVm4qJgYrWImqxdSaxaNYK8uPhKDp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjpsnYV6ecl0c0x8FbTcxbNSn7Sly5/qwL04zg4QNuY=;
 b=YkUCb0QtVTwDckI27Pgy6Iqw54pHCN6gDN799IylBuYWdtLvWrO5wi8/Elshu6eeDSnaF5racxVwTXFblHU8J2u0c8ld6aCqRYuVsU2yL/FzZH/Fmap4DlXvGzg9hr2bQvkR4i8iZVwpXDCqAAkuVSGo44flLA90p6osI3Z3WzNgc6bHi4P4244J0n2zlKlrudyXX2MjMy4/jwG7gl23C/iLoerEfbgpvWOyfvKhjJR91FXux7coBiSoTOwgIJT8sTG9JzNR/daUJlXEunBVFdTQlz6N841CHWPgZrKOif4s2yJ9BMlCzK8sAs7UgAWGHqOoZedLMyeRGQNz5/VJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 05:05:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 05:05:28 +0000
Date: Thu, 22 Aug 2024 00:05:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Michal Suchanek
	<msuchanek@suse.de>, <linux-modules@vger.kernel.org>, Takashi Iwai
	<tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal
 =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jiri Slaby <jslaby@suse.com>,
	"Jan Engelhardt" <jengelh@inai.de>, Nick Desaulniers
	<ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] kmod /usr support
Message-ID: <yvwczlqf4sgfsde26iwwrywscpaianh2pnhtr6pasobt2seco7@ahtu42or7i2l>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de>
 <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
 <20240821175843.GA2531464@thelio-3990X>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240821175843.GA2531464@thelio-3990X>
X-ClientProxiedBy: MW4PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:303:b6::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a99c8d3-8537-4e4c-14ee-08dcc2680a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9H4Wg4lyiAKzaMyoNL8JQX8WsGqp0tAakm/j+f5UGtNUMmACDpNk8g5DXRXa?=
 =?us-ascii?Q?Ke55Bl7RMinkA3Pv0m0iMSgRFFtZpdHorVwKL32RtN+gYiCGFLMOIq6cULa7?=
 =?us-ascii?Q?Sa5Kk4X8qSG1cXjqRVZU77qOLUok7tnw71Z0Z70ULqwy2a5s9vJTFS1BaM5A?=
 =?us-ascii?Q?guurDaDgEQzo07Nje6Zt1VedG8T43sUTllyf32DbVQXgiK/rzUWBvcUWeVFM?=
 =?us-ascii?Q?V1bc+qpRuUJDuEHUaHOZEVprEsQDJ9lL48ZY/ETzrnTg4rzrVQ/sgqknr4A8?=
 =?us-ascii?Q?ERjxAVk56fvJEwF118LoE6JnxbkjMm7eokCPB2GhJ9J2SLKIuiL+tSJtfKkg?=
 =?us-ascii?Q?XvJWGa1iBZBQKn2D2hojAIHjP5lVn8CbmGJLdagiAYmNqRkBWYftRlFAtklX?=
 =?us-ascii?Q?6bFOxDq9n3yvp7Swh6OouYuUBgMm5TmD5Lg5vZKW3J+dtz69dmGdzDqWkqe0?=
 =?us-ascii?Q?Jm1IcaqjD9ws8OcPkL/1TaTHwaVwgerlLxg3VrzB1/hGahxBktA98Nnlx2E9?=
 =?us-ascii?Q?v7joX71GMeZX7wubf5ypsrsf72ANMY9Qe+r+oEmsM77cvoUdR5MNUUrq55T/?=
 =?us-ascii?Q?pPMt++j5vzwjZqbqhfwjoz57hIQAGBIkbLkq/cKvukG4DgGtHOdU6wUM2Raw?=
 =?us-ascii?Q?OHTJV4Bu0qsHth6xIBmGB65T3PdGIQ5RRljbcj+JO79Ior77/NZnuifWDtxf?=
 =?us-ascii?Q?LUdWjUFzqZ4SxjwAqYMJkcuhLQFLI+YkfP2zSEQEIR8cnzBg/PCfnfHoZBjk?=
 =?us-ascii?Q?wbNNMa5w48/cP79B2IQYUVsh0MqRchcbaWwRwEcPkImvkBDmh6alHu2MvrSz?=
 =?us-ascii?Q?kvwDJj5l/RJjuvyBIyCGc4vCCms1y2XAj67J0IqixEJiacIzIMdKMJ5Wgyqw?=
 =?us-ascii?Q?FkZi50WqCAZTcf4NpO5bP/MNcO9ANTQnDzOfdDN/UT2DWcMFULpr6XRWhtWY?=
 =?us-ascii?Q?IqwwzezM8UKA8gjOu4HBe2U+VFcUc/MUvCDA0uB+RtlqDySRhd9sHqQTaquJ?=
 =?us-ascii?Q?YbGWvvz4ruoXzNwV8/ABUp6Z/eaRewtdm21RPGxzspMJ+QevaLOXr2eWNZBv?=
 =?us-ascii?Q?iyAsQYPYvGf4lzC/GUOf+7p8cOVLdGPa3Yfmd7BdVx675iM8ZMOriHTCyLby?=
 =?us-ascii?Q?s2nAugZmqs+1VTG+Iu8W7B2qCAcFr5tc2qkSzV4LDUfCiN14J1QDCAK2bR/m?=
 =?us-ascii?Q?+2lqrIobdtT13yK/5VielKQs4hXx4uDfXn0i/+NmDjsUCBTEXTI1RuH53yXo?=
 =?us-ascii?Q?EuYbqaFMGJueMJnuAuwkv1LqzevqCbh9ZgsMTt8LMhJ+pxQALPgoZDSbMkAk?=
 =?us-ascii?Q?gleiSX6f5oGf+Rdy6gRlvmo1XmcJ5ag1MFi8L5IZxvb6/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uCMZJDNarP0ZKczfen8jWASug8ggsm+pNKfgcJ3dMadGG9KcLCiSgqWBObGH?=
 =?us-ascii?Q?ZlEE7sfhdILFxw5cidsUfJb4VahO0f2+9J9A0JkXDEwrzKu/lmsIcPsQUos2?=
 =?us-ascii?Q?tZ844ZIJXY9m9aZpwuaZK2bZr4yMt+EDH40/8KvW8YSYvJ2x/svfCCEnK9+S?=
 =?us-ascii?Q?CL6ouL7gqTnnWJ3YE0avE/0XkCQ6puQuylrhKdXxm+mXHeVwRmQIH9BKmgrW?=
 =?us-ascii?Q?Yxc9BGry2yMaCGyiUrj7QppXHUY5PjomXEtFT2ecS2TOEKVKe84g4tPVrjhC?=
 =?us-ascii?Q?W0Lmt7qPY98g1vLu+8is3XF6na5CRvF5URJp9MMSB0YDuP1MxVG66Uo+ctqz?=
 =?us-ascii?Q?7NOWMuwxX/W6pDYg9ohBE2EfLXrl6l/1/FKF5jRVYvknsIVPYdffa8pK0/fG?=
 =?us-ascii?Q?lOt5mgIA4sHd2EC+PpVjR6TKJhQqO8SPAN5BdG8tdmjdBLMJqz5N5KigRv47?=
 =?us-ascii?Q?4qJ6UaG7TKFVTpj9Q0aFnDOLSbF5jxWx6+yZI3ifJ9nxw4sKLL7Ti4rNHWaB?=
 =?us-ascii?Q?ZKHch6b83VRvwF5PeujH0OUeN9B2QEdO/XJ/EiZcIezfAjqz8WatCQIlV04m?=
 =?us-ascii?Q?XKg/jVVhgsanJzSvy82yVkaHv4axhgHvP5P3i4yKYvv/s+wvbvarA6ToqZ0X?=
 =?us-ascii?Q?NCWhjxiUGvQ5G6WWomIVwaxm2IoBCkahP7bkdHIA0KWVQJZZGP2fKP9AO/TG?=
 =?us-ascii?Q?/r2wO1ykYGrfHuhVhGvrHnOX2vugkt+GMSlbClqxqkv02F/Uzn2ADK0+KtZT?=
 =?us-ascii?Q?TXIo+xjmCTDnxZ97uSY+X1ipYOa4smgGn3iHsX+eDNtnv+GYHIWu9mDybMzE?=
 =?us-ascii?Q?oPPQVfnP0TW9UTy3z1qD06GH8MghknMWzXNbAM7JNRdAzifyso1gxPAnuDAz?=
 =?us-ascii?Q?PhlPww9Cib17H8qv0Cob1+JmvyLbEROTW3yL/88IZDieu4UFmnNpsiApGGWs?=
 =?us-ascii?Q?BwGqRw9524bi2SviaVvqomr47Pm8qWbQ+Nfp9tyC7RE+2AiSbYo4fLJdKknN?=
 =?us-ascii?Q?mbrOJ/2NMOD8TBglHKw/vKxtHAiAYJqM9G/cwXA77rCXPptM9bOFJjFBKR55?=
 =?us-ascii?Q?VXDoVJhuXcQS5nRSU556PnIF+cvXLGT9atohPxSWqtDjOru6qpmBmW3xqhow?=
 =?us-ascii?Q?kSRxQG9bNw7ZtGoZV3s3U+uOWySCAsqZjAsE2Uuu97TwAmD7dv9wflToHsDz?=
 =?us-ascii?Q?fWA4h+a1KvHFFZy7yAJ85mmIswbbJhpBCgpJDPqsZ6fweCbAoUNOSobZ6BLw?=
 =?us-ascii?Q?Ax57/B/L0g9Xp1dpkMXpKz66J6/+OqM2MjVuLdbgoR0eXaahemKnPp/tVKDb?=
 =?us-ascii?Q?HrDOy0xLTzCK8LjLojHaAnV+mOElp+i2NNpr0uIzJovCwoW3P/VyzRhX3uJ7?=
 =?us-ascii?Q?mIBtPEikNsgFh5ePXw32X3eM1RwdaZogotKv3iMjGdzJO0fqaMv/UYqXD9lU?=
 =?us-ascii?Q?U+cT/XCt/SxPosXy7ZYJEg1iDSlWNmhGnyP5DZSla4J2jYq2Wz0P23ocS2GD?=
 =?us-ascii?Q?4Dso8QzE0CHy0v7LudTaPGJUC/HnKnnDHORXz8HjSR1gcpx41wBZpoQOpzcl?=
 =?us-ascii?Q?ARshWaUirOARWbjDSzL+T82+U8sOasH/LxsyJJ6ldUKeZK0K4QE+PYZX7SfO?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a99c8d3-8537-4e4c-14ee-08dcc2680a55
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 05:05:28.6513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjO7e6ePnj8p91fsuJH1Sk/PH6zgN4Uk/7gE7Zye14u9SA9FJwETURNTlPou2L2jgalUv+Yq3P4ioqFES2F0CsRUR0DV6+Tp2X7J6etdcPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
X-OriginatorOrg: intel.com

On Wed, Aug 21, 2024 at 10:58:43AM GMT, Nathan Chancellor wrote:
>Did this conversation go anywhere? After the upgrade to kmod 33 in Arch

no, it stalled,  thanks for reminding me. I will follow up on it.

Lucas De Marchi

