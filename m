Return-Path: <linux-kbuild+bounces-579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A382FD3A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jan 2024 23:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32AE71C27FF8
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jan 2024 22:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130592561A;
	Tue, 16 Jan 2024 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1BeuXi4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B92561F;
	Tue, 16 Jan 2024 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705444561; cv=fail; b=eA7qGENKv1/6uN3ez8jGlGeBHvyqSbeY5QlNt7SG1/iRNQ5NtmGHVS5jYkJ4uHi1SSiKCFMkYWXa/TXNb18dughb2u3WGbyCbxTIERRrwfbXGcMMsD3u54Bf7QYFary3+/qOn58cx0NWhsdWLa1D+UP0JjAE4Ct8+eLmQ5yVIQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705444561; c=relaxed/simple;
	bh=iKmCCzVHk4yF60gXzQiAVEa3gaEw16VUaL6xGtmHQ9A=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Received:Received:
	 ARC-Message-Signature:ARC-Authentication-Results:Received:Received:
	 Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	b=ICl+00juPEceAdWtfOcOTCg2/5OiS15rA1WOT2816lcyajghN4x24jKkdUeGI8L3/c62Pj1d+2hXmt+7aogQmAbelRyrlMyHl/5cAjiLDTFAcKAE4TjGIhUhgHWgp9GNKNug7iMW9Tugd2dEIuFFeqyEjivBugarnLI/XzatjcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1BeuXi4; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705444559; x=1736980559;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=iKmCCzVHk4yF60gXzQiAVEa3gaEw16VUaL6xGtmHQ9A=;
  b=c1BeuXi45yuhEISMGmdjkbFHuV8l7usNfgeqCWd9Eay1Sm4Hq/unRe0m
   S7WNww6CogGDdWU4Asa++dXC7sl88XWeyZEFzldMx4dNGpRJtAnZY4DXo
   gb7m9LXKuW/SB8+geqiNh7DCiG/Z4wOyTCphzIIA6Nikxt86etuONVtPm
   rWOn/2qnbZ3a/4L46mCVDAqu3Y0fx46OMKCeCljSan5Hzp7M11W64n39i
   GreVoD+upGtr5/ARWPdCAo5kdPYpi/EdGfUk34Lg7Jrumo2++hTct95FH
   ftm9r3S3XRmdtOvQJGyJUjiAfqTGmLT1Oagc607Mme/VKHFsxAovmpxaw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21486163"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21486163"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 14:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854497724"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="854497724"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jan 2024 14:35:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:35:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:35:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:35:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpGn2nkyhQ2ddDzWrfQi9SuisXY6dOCRyCwxMfYBBls+AkI8H4S34wDTYaQNN1OjW31sxPWLnZsDkEIWeS4qaxjDntzWr0nM/58Md4Ngu1tJ3iJK5bJViT8qqGHAnhSXQunr7DYSqedxJx5nbIS7VnB0C3oJ4ZIyYMdQ3bPSC1iQ74tHnaazfj/Zaq63FGKp8iYW5NtZ9bhyBq/X/lvaRWd4GYiKXR6hcEgf/UBOwv2HkJGHOv9tV0IDUspCbCwKbCtls0zwWZTyf4DIKjki1QXPJG/5Z9lilSNC2QsIUrEbNEAVl1yfy/51sTkpZt4wLs0rqO1Pffpy60GGBp0X5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKmCCzVHk4yF60gXzQiAVEa3gaEw16VUaL6xGtmHQ9A=;
 b=XwiKz0/7+Kv24KjOYPfxTbnEfwL7gUg9Gy2d/lV85H5gZGfsDWeuQBiu5jZ3HI1jpnVCHGhxDsFGkLOeIzKgulAAanucSpqMoVV1/I3SbRnH6v6NaI3rsuA3bOjA7xXx+JoYkfDTYobE3la179wtfnsQB3LTzxiUfT6YSK1BWs8VcxH8oXHI2t2GuXh39VFEeONyP1bbDLevKfLjNe9Mmg4YRtKyfidajwl9+HxLNfu3rkLTlTSPvUl+On3u5CCd0Mda8YJD2ILTryROSGUVD8l09HdnA1gME8l7IhkM7uEpVEkpcx1xaVdvBCVfJwhCibrk2Ij9Bt86F33rtRp9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 22:35:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 22:35:55 +0000
Date: Tue, 16 Jan 2024 16:35:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Dimitri John Ledkov <dimitri.ledkov@canonical.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, <linux-modules@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>
Subject: Re: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3
 module signing options
Message-ID: <p22vxc3uchm35sq3rgwcakydrvdiq7vlkql3s7dj73n7iracwe@dh3qgcpb53sh>
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
 <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
 <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
 <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f11ba0e-bf98-412e-3743-08dc16e3802e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nylnz0BrTPE9QbdOs8lcdBgNx0Hmxxtj56vESoR1thr6CJb3gxfFnk7kS6eWfIZiDdBRHwIYk957mRzNL1pYbYBGdqEx/UpmlCAlSRH5gRenbqDRgMfRvgJyXtCLvbVNNw70rat/kAkByyrI1We49uMFnXlF2GS1Xc7B0mJt0fcxgy42/8ncbwMqiiBB3lKM+qRHPbRN7OV5/OPmBpE+nV9df66BqsITywkXnV5mWd/qWBaudR7Mf/FNK3y6Ujf3fWc0WLMm8LS5ZJoG5XPTuZqa3Y1jETU5gtbXXndKrQ1Ocdg+575yV2gRsqp1uzRGQBSLXvli5LVQLw/DOBpFCGro/BBbfeZWSqYov4GR6efLB7t7HmGeRLe1dmzleFjnyaeIfFDnEw0F58EDOXI70XCziFB4kh+bGD4klXq9MhAxcdCiKaWwuQZ1TsPMMdthwSr52lVMrn94DN9JB4/iqMIz22aWIeNpu+EAMYwbVyajyrUVKMU44qTxIkigLIfCh0VSDSSNwAGIb/NyXwRv5A4A/63rdSduZFTdHQ7vRl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(86362001)(82960400001)(6486002)(8676002)(6666004)(5660300002)(4326008)(8936002)(9686003)(26005)(38100700002)(66946007)(66556008)(2906002)(66476007)(33716001)(54906003)(6916009)(41300700001)(316002)(966005)(6506007)(6512007)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BT4NCIGqkxNXilnEkQ2TjPg8ZXL3JXLRJKx837KMrySrN+6aDpDR3WoPHrm0?=
 =?us-ascii?Q?JHAOgP82sIcIHy7XSNiEHP/k+sRGlztRqF/grcdGr6Z5E3KRpPxsNnWqmxTm?=
 =?us-ascii?Q?eOg5XzJs9TCXhKeOfRi3dVPPtQoJgf1OsFS36RB0Jhf/sZcA/haLSsMevDmi?=
 =?us-ascii?Q?GO7hP4fX7Ks6egp58l2zWpdOERTLbNF2Yhj3PRAPehegvqb8FoVd36ACoB6w?=
 =?us-ascii?Q?ZvYBKriS+XK9i0ariStSgUCKNIuLpYrgvKj/VhgQtYRRKh+JrGe8nCPyRePJ?=
 =?us-ascii?Q?Iut7KEF5iYB73kqx/Xya+k5fcTxe3twzyfvNRwNVXCrVF2bdAN4Cdu7svDci?=
 =?us-ascii?Q?OvNkFt33hFezmfxOxE0GbLTy7mKi+deVPjp4aIGcxzIUGnUeGeomE2b5kkFZ?=
 =?us-ascii?Q?vrSMIN0Jwc/Yl799OeYvKzU845Em8Hw1GWews/GSYzc2bCB97iPOVbxciPHJ?=
 =?us-ascii?Q?pttEKLeXz0MDsFyaQpTlC3SnRki4ES81V5LjbuNwGz6WtwPOWa8tolbkJXzL?=
 =?us-ascii?Q?M1HccbWxnHBnzmCoLPBOppY3NfmGv2cwO7OpofJDAgpfDBsqh+6NRXy2UGsd?=
 =?us-ascii?Q?78up+T505SWiLgI9vC7CZlLpCC2qP5uXHDOVOQZ5OKz+c58k5/oJNEaGzej1?=
 =?us-ascii?Q?rmm8jaHlN5NAlq2uGq70xAvS1BRFadAWBHx3Fy44A867xzyZPVLj5Jsecqgf?=
 =?us-ascii?Q?PsUM2da9CPbCKbiAJwgwqPhIcO/YBgURLbj2j+Oa/1XdSjalduVqCo1xI2v4?=
 =?us-ascii?Q?VCjYBTok9ww5Pez9Q/cUb8q3tgza3z5VSC48f1hvAVPHiJNS8kt8pgTd/Z5d?=
 =?us-ascii?Q?q17KvgnYKzvepeGarwi3ij6GJSqOXPPrdHKVAcsbRXpJJ/XJdif0wm3Ogfki?=
 =?us-ascii?Q?zmQClwbaEaWqqsxkGjlhubNkNpOEorVNknQoeKSezX5BDIS2xTqdWCuxZYwD?=
 =?us-ascii?Q?Hx2uQ0hjc7fXtLK8R/Abt2YAUVQbqtv3ChvtWw25cRAvkH9GFUfvPQKasCl3?=
 =?us-ascii?Q?5V1nfcUACtpqLz7YfyRVoh9/DASCeQtzTQCOX6hNa3zkqA2fZMtl3dN3AhI/?=
 =?us-ascii?Q?SGUm5us1zfUiI9navQ8CxBZIigZZftaN4pjS4jMvuac2HpdWJl4Wz2WHau2+?=
 =?us-ascii?Q?oiORLQIXuzcXddjopv62P1LSDhDkFVrnkBXVSano+jXkd7RRoDcaOfRHm5b/?=
 =?us-ascii?Q?3g5yJKxBSH60OWPyyoWDlSEROWcttZmqiZqW/x14/4XCH8BCJQhMx/ekDvlu?=
 =?us-ascii?Q?oLgjXNPvTh0EAXYVknJoNjeVpb2jYbeKcgiO9k4tw8f/t61Ya3/AvVt1Sgqg?=
 =?us-ascii?Q?WRlQlX2wxXdUZJ5nAYjEuSDxmWxCiQvoHFjYC8dzBpiKRCiOH2ahoFe9zooQ?=
 =?us-ascii?Q?+fN/k/cJjyfsbirQDc7byc+m1BlSlvYLcvk18RMcMNttad8J8XZWZ1dg3V38?=
 =?us-ascii?Q?pmoJB6JPdn7EnffduiUg33bBzWxkQJUIbkNjgvvK/KY21kvwgiWgzGXJJXK3?=
 =?us-ascii?Q?Qvh10etbRnFU8498068hNTogNuY2PjODfhRDjDtlAAf0+1zQl4eFPpgkugn8?=
 =?us-ascii?Q?c9i9uzc8YxNfm/69fJLQ4YPCFjsk3EjWIIWw59OmFoS0ZvzuuThBWX+pym8V?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f11ba0e-bf98-412e-3743-08dc16e3802e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:35:54.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tiAWxlgp2nXZf4x6yCZxdvH+YYgWR6sQ3Lv2ykCQ2Bpjfwqj5+CTFeNcX2lSDajesjb8WII5VqqYK5b18Fd4nliMdqWkUKwjdR4qpNbJds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
X-OriginatorOrg: intel.com

On Mon, Jan 15, 2024 at 02:25:45PM +0000, Russell King (Oracle) wrote:
>On Mon, Jan 15, 2024 at 01:09:25PM +0000, Dimitri John Ledkov wrote:
>> On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
>> <linux@armlinux.org.uk> wrote:
>> >
>> > Ping?
>> >
>>
>> The intent is good.
>> The implementation is incomplete.
>>
>> Please respond or address review feedback emailed previously. See
>> https://lore.kernel.org/all/CADWks+Z5iZ=P_OAanA-PiePFbMpwtRe3_dF8wRTak8YAi87zvQ@mail.gmail.com/#t
>
>> Did you test that things are successful wtih kmod 29, 30, 31?
>
>No I didn't. See my comment below the "---" line:
>
>"I don't know what the minimum requirement is for SHA3 to work, so I
>have chosen a minimum of version 29 for the purposes of this patch."
>
>> The code to correctly support sha3 in kmod was committed after 31 was
>> tagged, and there is no newer tag yet hence the revision that has the
>> correct code is v31-6-g510c8b7f74.
>
>Thanks for the information.
>
>> If such check is desired, kmod 32 should be tagged and check should
>> check for 32.
>
>"If such a check is desired" ? You mean you prefer systems to segfault
>during the installation step when the build system doesn't have a new
>enough kmod?

I don't think we should check the version number at all to workaround
bugs like that. It'd better we let distros to port the fix. If we need
a 29.1, 30.1, 31.1 kmod releases to make this common for distros,
I can help make that happen.

Lucas De Marchi

