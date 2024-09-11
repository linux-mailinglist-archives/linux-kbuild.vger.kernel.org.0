Return-Path: <linux-kbuild+bounces-3508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7F974931
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 06:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40FA1F2683B
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 04:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20ED42AB1;
	Wed, 11 Sep 2024 04:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8gTZRfk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E518EB0;
	Wed, 11 Sep 2024 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726029397; cv=fail; b=cELGu2wVrXWVLbsYeYW3w7sxWIpxwGXVAA5Ta4vYZWwc/kIE1/7oGud7dncUKqcQmt8NnPHznjAf+VrnNrH8hgeT9sSXaDbKuShR7xWJA/y3I5MdoG3HR9CLbX55FZeg/9YWL1O5a/cGzKbYYtK6PN/oOODaWblwIsQMLGi8Or8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726029397; c=relaxed/simple;
	bh=ESKXTvKfNt3fLrmoomP0dAxoWVkvf/SRfZKmGrZNPVA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OCHZjiS+RoYtL8/dsE0ywv598aV/I6gEKiyzFi9tk5PcGSpcvDWX4kv8hO6lrdrk5diWoQxVj+CA76uuAsIP7m2N/vjYNVeg1Vk2IdGnvQhKn0286ev6v+JrU9+bWU3PR6obQ0BJlyDLnV+Dp+XwTXEqOjFU3ykKx+UoESk0vjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8gTZRfk; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726029396; x=1757565396;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ESKXTvKfNt3fLrmoomP0dAxoWVkvf/SRfZKmGrZNPVA=;
  b=l8gTZRfk8IGs56eZTl6Y6/4dErC2L8G1e/z/DnU3Gy/5G12ilO26myVQ
   /UYqfvbrDwGeAGD0XBPdpQ8VHPC3W2aPfPyvngh671W5ir59cYSiDETwv
   QHAo2usnrVbeHaBBJez9xV+UD0XT5rOr+f6/7mNIta0GPCvGKDGpby5hH
   xqGtD+q7One3DTiNmZ+IUOmt8BXknkJ+bUsyW3tPmzJyZa17vsJ8qD/xq
   M5FqFvRqcEimLe1DivL7jXgKzyx43FldopvexieK0ny3/Ovap9h0doQ1N
   opbdS8HJk/wOV0gSB0wSZcQUOCVDO3ZItnnYw9/KM9WAWeE0e1Nhae+4O
   g==;
X-CSE-ConnectionGUID: W+p4R3d6Qk+JDaTOjaBg0w==
X-CSE-MsgGUID: H4Dh4PH0RYqlQIelc3TCsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25003979"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="25003979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 21:24:09 -0700
X-CSE-ConnectionGUID: TJQ25N0wR0uXPPLoJcPt9g==
X-CSE-MsgGUID: pdao56avSXi1Pegwo/3T2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="72037824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 21:24:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 21:24:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 21:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 21:24:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 21:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAGiceC/j7WdT0kJuYhmNmFF4P80FjOwGX2xay/5RAv6g7JhwmcAjSeE0khNS38XNJpB01qy1RmPSSd61/rPPHlkd1ZXzdJVnnMQRautWoR88wOsW/Hp1PNCUaOYKuyrUpZf24vnHtSJKpPG8Z2lMtRwqd3MyII/U14HhxlY2QYQiTp3r2Ou4lWxHU1e0k6lP7bTUeIrs7oT9Z1nRl8oIroaI6ggnmDtdTMBxw8Irce71F0S3KQSr7Cl6EBJxzu2XtpRYJP+ipq91Fc3QnTVyCq8beM/7CXlVEbuWBkbTzTlE1gSZ7KyOz5PmSQJdjqXO73DfuACzzKKQNLFYWk3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DD6kzfyzSB+EnkFcd1GaujYEPJIHLedDhLeyhxLb9Uc=;
 b=anYPhJbiOk18REJ3gzqOgqXJJkBeInCayceJi+V7FB9GnyVtN0/hABNoLOSVWOsW+s6LphjcanllRdth5SIH0df/Fa4FSlQJiAt4EV0Ga68/A9eppzOD62LMGMkIgIKl4EaSTsy2N7gmFnIsFKYevrITURGDMWwfNuNomPqSd715jPSGPuGka7mqmhYe9VS2oyUmYbjCuHk2rrG6DAVEaFy7muPTBdaUPWYAY5UVze0ZiYAIT5xRz+vb2ke95OkFuDkrC2BjBjNU99KwGsRWlXu56mKGn1uQ21UcJJ024ggD66NdXXjVorC5WbLx3OUedewOzPWlxBjaTO8TJcKPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6963.namprd11.prod.outlook.com (2603:10b6:930:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 04:24:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 04:24:00 +0000
Date: Tue, 10 Sep 2024 23:23:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jing Leng <3090101217@zju.edu.cn>
CC: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
	<michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "Linux
 Kbuild mailing list" <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, Jing Leng <jleng@ambarella.com>
Subject: Re: External modules with O=... (was: Re: [PATCH] kbuild: Fix
 include path in scripts/Makefile.modpost)
Message-ID: <mesi5e46iumhgdbvzl2gfwdamtv34baydb5d4pmud4fu7n4dto@fewx4uzbtjl6>
References: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
 <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
 <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b65a747-283e-46e0-8aa5-08dcd2198f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YvoxtnzcnI18X9+zGVOs3PQvwXQpJFOSr2qPPl/UUpwN+f1aDz2a7QT83yCG?=
 =?us-ascii?Q?RC9EQLrNadi2K7UcJIW7HE0fcbrOODlFEBMIrCGDmQErbnekDZodRBG28sqz?=
 =?us-ascii?Q?sskkGItcD8LpP+vbvaReov4pcMunzxb3IWhrlJlvL0yatPAc0RPXVtLMNOSv?=
 =?us-ascii?Q?dy/iBAMw5QcRCTcKyomgaur1D4zJhmX+vBlWC9gSF3IM5qfO3/P+4/s4OfB9?=
 =?us-ascii?Q?nkCMqv/Mu5SGo6rQ6Que/ZD0GwLC4cJYJQv35eBEhQJYmAVcpDu6iZzT+TUI?=
 =?us-ascii?Q?3eUZ2q+nOaoQJwUoRnQDZvjoG/NHM3fwve302RCZzRGiVxAL3oh+Nn6Bl8hQ?=
 =?us-ascii?Q?4d+b1LNqRFynwxVTVfHulGRGmxBUkGjdKOLf79ZrrrxhJ8SaUp9MEu2NLtv+?=
 =?us-ascii?Q?DZmupZjTfhF8zeoThaA2apIUnFvcgNQ4r4ORv3DdYRxz8hMaoMOHn6whLCmx?=
 =?us-ascii?Q?UFgb+s9wNBsR3Mv+VJlCVWvussX6B4gC2ijgBdp1xHUgbMm56hirDhIpqJ4f?=
 =?us-ascii?Q?tRQNNSrMExIt3EKghY7F5tpa+yJGdt03B7WNdHZHj9B6eFD7rC5+/zrw+0vK?=
 =?us-ascii?Q?CbBp8dDz/KTvlW4sp0xTsE+MwhYZqVPFGwLLuKRoJIG/Co67C1pQHXryYlPY?=
 =?us-ascii?Q?ZfgLZiuqYxf37nFx/b5EVz8GhVmJ2d9lcizDcG8QtGw+zYBOfkwLmIJr8WHh?=
 =?us-ascii?Q?XGiVd2CgGp4mcVI+wwCxrhb3HcIGLTlUsujtr47hz9Q2p2jFkZ6nAKWsRI+p?=
 =?us-ascii?Q?92lNRgPvO3AeEJHFf8wjRgytpQesigZ9yWyUH9Powr4wLS2DixzaUJcSjLPF?=
 =?us-ascii?Q?dd0wdGvnlJFMS5lZSEU3+6ZfXMx2bI5wf4egNU7vLT5mGzyEBBszm3EsAw6/?=
 =?us-ascii?Q?Hg4tmTZoM0PqKzfVlJloR6vRyog6sWQOz9A5fh+cUc+LUKlz1b2hHz3JPuD9?=
 =?us-ascii?Q?u9zZ8BVL0QyWOyaSmZJ9/WvbQpWwUH8epib8Y/YXM3mG/2FaHWwZgJTDEVht?=
 =?us-ascii?Q?g8QbCUP+Z8Rl8n+fTnFQHa/zxVaMewUURs9YOeuPGAb/Aanox0PPZ6ly2YtN?=
 =?us-ascii?Q?CZYgDOPJ2+vdS0mVeHffKfgZhUwZaKCFSlQyLba/SuVe8EqYVk5Bd84hPW+g?=
 =?us-ascii?Q?83qLywmPOjbNkawCt/No4M0/nWzh/naXbLznJMv3ge9x2+voA3pIFueWkQkD?=
 =?us-ascii?Q?Ir/JpBDggeWF6OdgOwxA3nxq+aFNz1Qh55ZUN9j/Iznff2b9bX5fEbo0JM9u?=
 =?us-ascii?Q?vq8fVigLsw+Vgc0G9sYqVWzvtYKtPQnsW0dnSdwHTQ13zBNvadytpdRD+TuZ?=
 =?us-ascii?Q?EGUU1glTfF4edgpYYRqAtJuw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9/qqEat/YdbFtoGijPwBJtazTyYcx3azZc+BbFH5Fcfq/WIEfbVnTuhFOr/?=
 =?us-ascii?Q?kp1uB9Z0FYDMez5SRyNS6Dffe0Z9uab4n6rusSlQJhNeiA1V4pNqUNY/BpMg?=
 =?us-ascii?Q?FI26IlLep9XBRieqkTF0M2a5bHS4ruUDN1LGWwSVLi2yVronzzI9fYgjRtOg?=
 =?us-ascii?Q?UZ+d3Ww0eRcigv44rgQzW+hBZwHMBWG162617bGUKEFeIpesmmLh+w8bMSTq?=
 =?us-ascii?Q?LbpQBQcIoB116k1PC4H2rzRPuMsH2vK/s5GviElHKiydJMD1mIvx+UPw9N40?=
 =?us-ascii?Q?ya6GlBImOcooodOhz6pnZ37qcFiExw/JZpZOBqT0cuqCR44/NgVb0z5nqWwc?=
 =?us-ascii?Q?eEP5lv+x74qPvJtrSmeBjblbyNf4YQySC0hVbcvpzvsEKwrAzviQq08hKojx?=
 =?us-ascii?Q?VGjN3AAOOHaQEk19JiK+WWcPpOcGv5+zrG9Ayfnu6sfDczQcSpjiuw+9hk+Q?=
 =?us-ascii?Q?Ssile981r09CAWnTffFLdH+3j7KMqxaXRui0AJNpT2glpChcEhazzjTY5rDF?=
 =?us-ascii?Q?kY/txycgSyP5iKpbVBSIqBwwxEZDJt1DGINujwqPBfUfxdzeXt7e2ynu4SHy?=
 =?us-ascii?Q?aElFCmZUAHqVrevZ4cwiD0NTxQVw/4pTG5iGCvT2JdUUzNiOwefPiCvR7aQX?=
 =?us-ascii?Q?YXHE/CYHEUDjJNsk+tL6Oy4MVQs0wRkEj2NWnNMRaHGUCOGYEXIXRhrPS3f2?=
 =?us-ascii?Q?/BvfWtpi0Gnk9HhMZ6faYC4X6KC6+nlOpZHRjo17olvcBtl4COkCON8L1hll?=
 =?us-ascii?Q?iOqCGSOQf62ixzp98lgb/5/A/UTzg6W3ASB/8ilZXyNe0aEljtmVK/gJmG4j?=
 =?us-ascii?Q?C7X+9+N2+JHxPds0YvW4kwCyS4TDlQEVJcHW1/w01llL531iZGmN+yHw/aPD?=
 =?us-ascii?Q?ofdhoDgPrZG2fhFGEoYvx2ZPM4mvnl4UYGq1Cl9cjb07dvaGGRiP4aohko7g?=
 =?us-ascii?Q?r6O6vj4O6ytsgrM52+MqaC4L5G/HLyc/TeGkZ++tfEf3jA5eO3R+W0sYZll2?=
 =?us-ascii?Q?4CmZ9Vmxic8QP9SfL2ffLF119bPL4pTHrTUgWoIKy75QvZA+aDxnQV9HP6b9?=
 =?us-ascii?Q?SR+F97553NcCbrNYcN9D3zA5WvIaZYxqyjT4A7Id7JR+5gi8agZziccIkOZA?=
 =?us-ascii?Q?/zocdUVO3x5Xb+MitdXlTrZiWHkK5zdbUAlJB/iOjth0IlCEUwCD2UH9I/3i?=
 =?us-ascii?Q?MHnzsfVg2/gwaNMWSBLIsheStLsh7N1u7MMTWoSsK9p/8xJkJIr5ijhASJZW?=
 =?us-ascii?Q?E2K+fYiU3Td7pEw4r5Y6tEC/rmn2Yz+DM+drm+s6Gl268L8yEnQYDbZBGZKY?=
 =?us-ascii?Q?PiN8FP4j3NLbE2xjB2uH8pi/SK6/qq8vW2rgPrpHX3Ivedjc1msm9UZjeLkG?=
 =?us-ascii?Q?HvPKOtd3OQZIISSTqAkktVJx6q96PySJZhXIhbBW1HFncfhUC/ktH1DtdGJY?=
 =?us-ascii?Q?0I+5mJtSrswazE7QJuoWv/E5TWxCVWTYcjIbWmVNwvsZinAGvYnFK44pcHFP?=
 =?us-ascii?Q?ojfWwXI/ftMQ7+7COEyGoGtdaBzKRmHBO38W0zE4KX21suhoqf3tQ4sg2X0X?=
 =?us-ascii?Q?eNKOxqUijwGcZAI/GorZjrXFsb9SLAxCJK8vkbb19Rb+R2e+ksVmiLRX4X+B?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b65a747-283e-46e0-8aa5-08dcd2198f90
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 04:24:00.6311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqi32+FvvkyGmbXYOs1degd//P/uUsUlJEJeDYouB1HHJ+hk0UkzfcbiOqhkk2Za12rPmt+bR7bHgmyZotlFIPV6mgwYNFwr/dzvN7SAnxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6963
X-OriginatorOrg: intel.com

On Tue, Sep 10, 2024 at 09:43:14PM GMT, Lucas De Marchi wrote:
>On Wed, Sep 11, 2024 at 09:10:09AM GMT, Jing Leng wrote:
>>>-----Original Messages-----
>>>From: "Lucas De Marchi" <lucas.demarchi@intel.com>
>>>Send time:Tuesday, 09/10/2024 22:00:29
>>>To: "Masahiro Yamada" <masahiroy@kernel.org>
>>>Cc: 3090101217@zju.edu.cn, "Michal Marek" <michal.lkml@markovi.net>, "Nick
>>> Desaulniers" <ndesaulniers@google.com>, "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Jing Leng" <jleng@ambarella.com>
>>>Subject: External modules with O=... (was: Re: [PATCH] kbuild: Fix include path in scripts/Makefile.modpost)
>>>
>>>Hi, I was pointed to this thread since I'm trying something similar
>>>in kmod's testsuite. See below.
>>>
>>>On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
>>>>On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
>>>>>
>>>>> From: Jing Leng <jleng@ambarella.com>
>>>>>
>>>>> When building an external module, if users don't need to separate the
>>>>> compilation output and source code, they run the following command:
>>>>> "make -C $(LINUX_SRC_DIR) M=$(PWD)". At this point, "$(KBUILD_EXTMOD)"
>>>>> and "$(src)" are the same.
>>>>>
>>>>> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
>>>>> O=$(KERNEL_OUT_DIR) M=$(OUT_DIR) src=$(PWD)". Before running the
>>>>> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" to
>>>>> prevent compilation failure.
>>>>>
>>>>> So the kernel should change the included path to avoid the copy operation.
>>>>>
>>>>> Signed-off-by: Jing Leng <jleng@ambarella.com>
>>>>> ---
>>>>>  scripts/Makefile.modpost | 3 +--
>>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>>>>> index 48585c4d04ad..0273bf7375e2 100644
>>>>> --- a/scripts/Makefile.modpost
>>>>> +++ b/scripts/Makefile.modpost
>>>>> @@ -87,8 +87,7 @@ obj := $(KBUILD_EXTMOD)
>>>>>  src := $(obj)
>>>>>
>>>>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>>>>> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>>>>> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>>>>> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
>>>>>
>>>>>  # modpost option for external modules
>>>>>  MODPOST += -e
>>>>> --
>>>>> 2.17.1
>>>>>
>>>>
>>>>
>>>>I do not think "M=$(OUT_DIR) src=$(PWD)" is the official way,
>>>>but this patch is a clean up.
>>>
>>>I tried what is in this patch and also tried to find an official way in
>>>the docs.
>>>
>>>In kmod's testsuite we build dummy kernel modules to exercise the API.
>>>https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsuite/module-playground
>>>
>>>This works:
>>>	make -C /lib/modules/$(uname -r)/build M=$PWD
>>>
>>>This doesn't:
>>>	make -C /lib/modules/$(uname -r)/build M=$PWD O=/tmp/kmod_test_modules
>>>
>>>I also tried the variants above with setting src, but all of them give
>>>me errors - I used 6.10 and 6.11-rc7 for these tests.
>>>
>>>Is there a way to do this?
>>>
>>>thanks
>>>Lucas De Marchi
>>>
>>>>
>>>>Applied to linux-kbuild. Thanks.
>>>>
>>>>
>>>>--
>>>>Best Regards
>>>>Masahiro Yamada
>>
>>Hi Masahiro,
>
>I guess you meant Lucas :)
>
>>
>>I think your intention is to separate the source code from the compiled output.
>>The correct command should be:
>>   make -C /lib/modules/$(uname -r)/build src=$PWD M=/tmp/kmod_test_modules
>
>oh, looks like this works. Apparently my mistake was trying to set O=
>like I normally do for in-tree modules.

spoke too early... It worked because I was in another machine pointing
to a 6.8 kernel. It seems like something broke between 6.9 and 6.10.

Running a quick bisect, it's pointing to this commit:
9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")

Error like below:

$ make -j$(nproc) -C ~/p/linux-dim/src MddPWD/build srcx=$PWD
make: Entering directory '/home/ldmartin/p/linux-dim/src'
make[2]: *** No rule to make target '/home/ldmartin/p/kmod/testsuite/module-playground/build/mod-simple.o', needed by '/home/ldmartin/p/kmod/testsuite/module-playground/build/'.  Stop.
make[1]: *** [/home/ldmartin/p/linux-dim/src/Makefile:1922: /home/ldmartin/p/kmod/testsuite/module-playground/build] Error 2
make: *** [Makefile:240: __sub-make] Error 2
make: Leaving directory '/home/ldmartin/p/linux-dim/src'

Lucas De Marchi

>
>Thanks
>Lucas De Marchi
>
>>
>>You also can refer to:
>>   https://github.com/lengjingzju/cbuild-ng/blob/main/scripts/core/inc.mod.mk
>>1. The complete command is as follows:
>>   make -C <Linux kernel source code directory> O=<Linux kernel compilation output directory> src=<Current driver module source code directory> M=<Current driver module compilation output directory>
>>2. If the <Linux kernel source code directory> and the <Linux kernel compilation output directory> are the same, <O=xxx> can be omitted:
>>   make -C <Linux kernel source code directory> src=<Current driver module source code directory> M=<Current driver module compilation output directory>
>>2. If the <Current driver module source code directory> and the <Current driver module compilation output directory> are the same, <src=xxx> can be omitted:
>>   make -C <Linux kernel source code directory> O=<Linux kernel compilation output directory> M=<Current driver module source code directory>
>>
>>Best Regards!
>>Jing Leng

