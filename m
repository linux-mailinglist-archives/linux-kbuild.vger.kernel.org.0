Return-Path: <linux-kbuild+bounces-6552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7868A82C80
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45D5A44027F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3018F26FD84;
	Wed,  9 Apr 2025 16:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNYIskB2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A914AD2D;
	Wed,  9 Apr 2025 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216380; cv=fail; b=q8J7HryEqdlJ6Zm5NgFOEYjBB8gd0OUiia7TY91XJ5kGnt9IEeTmJo1uxdbDMp54bmz84HrkAd4Qrfl/GsyS77NZT3S+RS2LLuhi0ASp5fgQy3QGnRPimCWEHRlShpeJE5iYm0rrLXjMK/fgh/YpYXAK6EXYTVFbCYYj35XuIQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216380; c=relaxed/simple;
	bh=STdeJqjzbCe13PSCVjDOFMTKsTHZSeowxlIx5wF2vAg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bpt2hRA+7WoAzozR+Q1SaVQ9+walkdW6XNXVzpcxrYcDM6Yq6ESxpPatmW6fJRXCUK9WGqd7AsW4TRCTcpd5XQ/HmkRWysRK3sB9iTNuFDB4CDC08+PyY00DZPyY1k603WIwFfrzvWlqjNDzFYWoAjU4TWAguUPnxN1iUaBSaTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNYIskB2; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744216375; x=1775752375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=STdeJqjzbCe13PSCVjDOFMTKsTHZSeowxlIx5wF2vAg=;
  b=eNYIskB2hwvX/7VZdfJPxDzGAFxbseN1kRMTahtpraNnpRPiD/QEoiR7
   jOt89YeAwinAgPoS01h0WepowRdtqNSGD4SU7WTIfQPd7TybYjnjet2HE
   rOxMrImfgwy/k0iYu0s1gonqZrm0XoH8bi0Smz467FLuLa+E8KpBHr39Q
   rjYbwLsSdznRXRPMX2vIfA8iXG5I12SyDAxcYmHNhoXRB7hBxphQaHVL1
   dkeOPmfgTl+5orr8fO+Ah94L41hi8UDU0X3lHXBoj10UWYvQWsoVYPQko
   4PvFQg5s5tnvGaRoMEkSeSmlPSUCGUZk+1fCAkgNlps6SsAdivOBPB3sL
   w==;
X-CSE-ConnectionGUID: hXlc9p5gSJGnLqN577jb5Q==
X-CSE-MsgGUID: VUpw+d3KQHyj+OXm474MSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49547260"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="49547260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:32:54 -0700
X-CSE-ConnectionGUID: ADpsfB5/TluXqCY9hIgIBA==
X-CSE-MsgGUID: gL6h66LtSVGfb1zuXita3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128553005"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:32:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 09:32:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 09:32:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 09:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlWJwCva2QFbNIZRD5L1pyy58wMWQp7dXvEwpfrSd73D5kLW3nmLFJZ2MqolM6qWSxRAfedUrffHSvLw4AJTikYLbIx2alpeN9V9D095pskYRoSqjp3mAtHvGfKbvojpM7ChhtSuQPJFwh+q6VIxCf0/1Ck6kTeQwHhg8LKRfFXegjrJfGXsdIzj2bZS7u0HdRoBLIkPMm71ACy+iPVCug+dRyk4fuP2vIleApfwgR1Qb948R1FjAY6TsfxE00xxAxfgOWQV1dY3lUYUlaixemxtHplw9mpWTTT9aGyMlhjl5/KSm3K8JznkVTFOKiMFH9CromTu6CYUCjoUPYZUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtzHBsXNGJ1tJglCQpiuBS8mTzA9oQ0vqYoeENoHiZU=;
 b=qLf/4IiIDM4MyHkStYbWFMB68XY1cc/gn41ay8VqN+lMSyFqHIoZwKgJT4lPnDDuV0bzaVEa1vYo8/N9tYv5JpW5HvaNq8xyYCNExXCa55Ih6jVIMFEEQqFuvMBbycYohv+Wug/Kdy2mqGoFZ2pLK1EM123k5DU8WkMbUyBTpIYKwsQaCoLolNeNE6rzpG3Nx8qg0inVglfpeVMlIbuTf9LMNpuDVj8udAQh0UCil6XG0Oo225P6cfQjWZduGg3l/ydAVQ80EZ+9mbtDXWqfc1DYQhPrdr6jTmtggYglrgyP4bBtWvDhl5N6nuQKXjfZpLNcFz7wiRomlw4qRxm2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 16:32:49 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 16:32:49 +0000
Date: Wed, 9 Apr 2025 18:32:36 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <hpa@zytor.com>, <hch@infradead.org>, <nick.desaulniers+lkml@gmail.com>,
	<kuan-ying.lee@canonical.com>, <masahiroy@kernel.org>,
	<samuel.holland@sifive.com>, <mingo@redhat.com>, <corbet@lwn.net>,
	<ryabinin.a.a@gmail.com>, <guoweikang.kernel@gmail.com>,
	<jpoimboe@kernel.org>, <ardb@kernel.org>, <vincenzo.frascino@arm.com>,
	<glider@google.com>, <kirill.shutemov@linux.intel.com>, <apopple@nvidia.com>,
	<samitolvanen@google.com>, <kaleshsingh@google.com>, <jgross@suse.com>,
	<andreyknvl@gmail.com>, <scott@os.amperecomputing.com>,
	<tony.luck@intel.com>, <dvyukov@google.com>, <pasha.tatashin@soleen.com>,
	<ziy@nvidia.com>, <broonie@kernel.org>, <gatlin.newhouse@gmail.com>,
	<jackmanb@google.com>, <wangkefeng.wang@huawei.com>,
	<thiago.bauermann@linaro.org>, <tglx@linutronix.de>, <kees@kernel.org>,
	<akpm@linux-foundation.org>, <jason.andryuk@amd.com>, <snovitoll@gmail.com>,
	<xin@zytor.com>, <jan.kiszka@siemens.com>, <bp@alien8.de>, <rppt@kernel.org>,
	<peterz@infradead.org>, <pankaj.gupta@amd.com>, <thuth@redhat.com>,
	<andriy.shevchenko@linux.intel.com>, <joel.granados@kernel.org>,
	<kbingham@kernel.org>, <nicolas@fjasle.eu>, <mark.rutland@arm.com>,
	<surenb@google.com>, <catalin.marinas@arm.com>, <morbo@google.com>,
	<justinstitt@google.com>, <ubizjak@gmail.com>, <jhubbard@nvidia.com>,
	<urezki@gmail.com>, <dave.hansen@linux.intel.com>, <bhe@redhat.com>,
	<luto@kernel.org>, <baohua@kernel.org>, <nathan@kernel.org>,
	<will@kernel.org>, <brgerst@gmail.com>, <llvm@lists.linux.dev>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>
Subject: Re: [PATCH v3 13/14] mm: Unpoison pcpu chunks with base address tag
Message-ID: <ynl7b325d5jo52n7cpy64v6bvqhzlbkphqsbs3jrgtji4v4yoz@cjpytwlwc6kt>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <61033ef5b70277039ceeb8f6173e8b3fbc271c08.1743772053.git.maciej.wieczor-retman@intel.com>
 <fb0d5f33-4636-4de0-82f4-93a9def63a26@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb0d5f33-4636-4de0-82f4-93a9def63a26@intel.com>
X-ClientProxiedBy: DU2PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::18) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 84eeee14-20f9-4415-1e5b-08dd77842ad5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WysBuKXcSJ4j/wHu82LVrzQY5So/lEaZ9XqAtoMDdC6SN4Ti3JpraQkzQG?=
 =?iso-8859-1?Q?eQL35SI+La15nydq5dZs0Exv22GKFsghdf4rxi6euEJMmIerKAsa15GQkl?=
 =?iso-8859-1?Q?x6Is3NP6qFgSu/eymwGb3+kWNbWFe4fDaCN0LIldmQircQ5qmc/+5S+WmU?=
 =?iso-8859-1?Q?xE77DlmXo5tjk0D2O7A4Z+u2ggez8gGXdu9i11DuG+d7G7RivNEw7vXs0p?=
 =?iso-8859-1?Q?8AFq56jfrwfUcj2prJOt5ZdOmRxj7okyLFR23QPIXDTicMP3fNyNzhpT5t?=
 =?iso-8859-1?Q?RhRvv9KoUQBJbE9BsGwgQYTZckePaQjK/tDAoxRg8mNkGJu2+RjSo9EXt1?=
 =?iso-8859-1?Q?fq9NKrfkn86ME4q5ndkwYGLmxprtDyxG6VapuEE7fdN4PuzyG3dYNp2/sK?=
 =?iso-8859-1?Q?r4mqDFrCaWIQZYdJbznf8GdqHRazgYGOHmLOk0WEmHY/06giX7lgCCSZOw?=
 =?iso-8859-1?Q?0A9LRsPcKoZ/rvXhAGiBuH62SrdYAORG4j8pgKhgOolgbKSPjDEDh+ganH?=
 =?iso-8859-1?Q?YWM5EmzNur0Nl+smvGrBC34j5r51JtNe25DOyVtyt9HQpv6uPRZOz514Pl?=
 =?iso-8859-1?Q?nT0zXHF3YuChye3kcfb5B65Bo73VZFYbjs01493RCN92thI3fY3moMoYHp?=
 =?iso-8859-1?Q?i2x+j85HhwjKM2X3arGOvrbrXmmoh2rDTpTunfMRgaAziKaciJSzFJ/bLH?=
 =?iso-8859-1?Q?9kxM4hxq+HUSxaTuTQw5RudzoTsEG0OjWUDdkYcWcx9E6lm0OKUJ/MPaf/?=
 =?iso-8859-1?Q?E+cmG9BfgCv0obUW63zhSe2fGASRXswPFKr8niKHV1fttgg1N5aVE4P5hz?=
 =?iso-8859-1?Q?PnllyEXgCZuVGiPdDpKSIphg2m95W+5skMZp6u9axImFElbNkcnRHEACDx?=
 =?iso-8859-1?Q?vMjwb46cUemU2W4BocSVDgNLlkIo/aFSuADaw+AXgwm9ZWYMVa5uIXNhBO?=
 =?iso-8859-1?Q?5Oe3cUc6y7VG1tR7ZdgcKx9K8Z5DHlX4VZjki0Vc90LnJKcffypSkSSl82?=
 =?iso-8859-1?Q?yrfYQ1w1WxixvUcoDZqy0g6fDf5K14XvcDBc6Pg4IfE4HuQ6E34to6o2db?=
 =?iso-8859-1?Q?JCln3xSmAzKQFash1utUWz6ApvCR/ttNwfcCR4J6u4qtGjzQRFKExgLJxQ?=
 =?iso-8859-1?Q?j7mjObSmHnQTp1en7d2dy2c1DCiC0JBZqPHTIEQdj4WqaukBt/0W//hlou?=
 =?iso-8859-1?Q?HGdm9ssAeJpLLnS8hBggcEe9u6uawd1bkpEjZfUl6W4HMAms+cM7grDrjD?=
 =?iso-8859-1?Q?5jgdGtS3MyO+VGcAZPTBtK4CqaNQfUORi8U5krnLMmKiyTAraMg/bp/+my?=
 =?iso-8859-1?Q?an7OFMvfBBm33pBHvF62iFIJ9CjGzAXjK5ya+Z5Bo7+wPB/MLT3XEElmRO?=
 =?iso-8859-1?Q?0uiUk6ljDazK7fOA8jwLsZyUQFIiup1Sv+1MbuQ3RCLJQ8mrkUfaSjJUr7?=
 =?iso-8859-1?Q?m7Ws9G/IoJuEnrO1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HPyoUfZ0QmmnOthKQGIgy8rpJliaiqBohg+V7vDEcsu1pywrdmR6Kg7q4M?=
 =?iso-8859-1?Q?DCJXQyuRZpLQyv8ihhF8y5CwRkgUBfYjz7own0/OXWqoHdhpdR6qMSzu+t?=
 =?iso-8859-1?Q?f/qXrWq7rKJWnS4SQwQmINsr9fUyo+G+ih/N75tcHch8ADBFrSJDKYjuNz?=
 =?iso-8859-1?Q?nhCDahqzix3HH4vpanbYQwL1s167ZrvrQQtJ6uR0YJcLpITS7PwqQcI5Jd?=
 =?iso-8859-1?Q?6DoAeTielj9M23FO0QMYx/grXZ0BaJnx63JauY7hdknQhN/rccoLXjQrYd?=
 =?iso-8859-1?Q?g5CZQuaXBV0xHqlx+5Xux7aqTOMTk5IwN6O6NtNeglKzJ5yGlxpBWXiz+U?=
 =?iso-8859-1?Q?x4MZ3w5SNonEqQoxuC0YMySxCpoAzDp3xLwSSl0J/+SujAfLi8G9YpaeyU?=
 =?iso-8859-1?Q?W02kkbfPP5MGhulWP7RwgLkUOLNT3HtMIgov69uwGJxwjkAvz7fjbRvpQy?=
 =?iso-8859-1?Q?JWxTsBPFfiw7ESCuqNUEuVvpAYL3E36rtVeI/fHsVoI9vA7XaxbyCUs6KN?=
 =?iso-8859-1?Q?dxwFgB1ixt2EWy6aQaQ1JBs2WlqjLvETs1g/WvLGVBXZUUet5Pmbrr43kr?=
 =?iso-8859-1?Q?9esKvyn1fq9CLYCSUxIR8FD1J+NRdmsZlArKJXKeEjkdgmJPnMnD5Gytqn?=
 =?iso-8859-1?Q?W0qdVlJceoek7n/kMVccNFn1eJNBHg00qvG6/Jq+LMhC9aG8Xx43RCFeYK?=
 =?iso-8859-1?Q?hnG9XbzYJ/zDpF+pBaVxkrVXFM3+WoiCjF6E1Ku8xiWt19p/HL45mqKL2D?=
 =?iso-8859-1?Q?somJWFyxTlKYagbzEeVhqyRTuYeobnVHpr9J49yYQgKLEbblqJmNA3zI+W?=
 =?iso-8859-1?Q?ys1g8FiMmUuW5hYCMvtMkQVcwsMjhfwndmqdqGOr2TaeXDYiJATBFDyKLJ?=
 =?iso-8859-1?Q?M2Yo9qgd4uhedazj8JxkCKqxh+zPg3jhkB6mHozRhwuQXUXWGrUZ/gk/7Z?=
 =?iso-8859-1?Q?SVKEKiqiIAFZzuh/+D1JDBNMsf3MYPOxgcmdp8yXEUJsOVwQRt5ZXPbRi3?=
 =?iso-8859-1?Q?txLSw22/jUV6CSsEvyzopapBXh/3A75/N8WT/QPFABNqG6wTp8knpKhD6R?=
 =?iso-8859-1?Q?Rm2FE1Mv/mYKjFpin5JOclbPzTG/NS1aqWfc15owJJlZYHtdB9IePO3Cww?=
 =?iso-8859-1?Q?2XXdrV0cvUgR53KY+/JF5ZynfkIHcq9QC9x0HCkw/1WwlWC0y2j0eGggnu?=
 =?iso-8859-1?Q?VVYUCojD1zpDM7F+Cjz9DOZ4Zzsj1HEwDTBQtBBpRHMlv3m94ZnOMM+j04?=
 =?iso-8859-1?Q?9OY2D/eHuM1NVPHT37bkVljrzZu0m28EIfJ3LpKlb4ugmXvLG+me0JMJLn?=
 =?iso-8859-1?Q?NrCZAUiTDuCO+5f2tVKwa2W9g780j1pua8MbAW27wZwJ86nUFYl7GaDUwh?=
 =?iso-8859-1?Q?pArLE9KN04dzRUU6u7GSO6BinhssLz2CGp51U7nZYg6RWsWC3fP9/uYO0O?=
 =?iso-8859-1?Q?TH65n+C8bPJECYttY5LCiDl/w4Tq7dgrptOvN0Pc3EJngp/0WocGeU01yv?=
 =?iso-8859-1?Q?rwbfxEfSfuCgA5kZUh9I7A9rvF1TgN+pMIb620b95FWGOgdHbfCd7t7t/V?=
 =?iso-8859-1?Q?10B1FrAvYhvYf796Oa5Le+x/Qb4fLuyenkte2wVJNzpynUc34AGIiN4yIB?=
 =?iso-8859-1?Q?TpHkh2Nf/wez/O7gvrjBGrvAVF0elbS4kRh9u4lp8G/SIwUH3x6FHV4ISc?=
 =?iso-8859-1?Q?QRJw+C4qxJP/vx85D78=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84eeee14-20f9-4415-1e5b-08dd77842ad5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:32:49.6985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b1qxWOBRtntjeG+o8L9+98R/bngJSFwLjMaRwGIDFiAH14Pn0cUNKqI1G95awaSa6Hnz1+f3zKKmIeDO/LX0q2TUpatEmCY/vJV+MEJMPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
X-OriginatorOrg: intel.com

On 2025-04-04 at 11:08:12 -0700, Dave Hansen wrote:
>On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
>> The problem presented here is related to NUMA systems and tag-based
>> KASAN mode. Getting to it can be explained in the following points:
>> 
>> 	1. A new chunk is created with pcpu_create_chunk() and
>> 	   vm_structs are allocated. On systems with one NUMA node only
>> 	   one is allocated, but with more NUMA nodes at least a second
>> 	   one will be allocated too.
>> 
>> 	2. chunk->base_addr is assigned the modified value of
>> 	   vms[0]->addr and thus inherits the tag of this allocated
>> 	   structure.
>> 
>> 	3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
>> 	   executed which calculates per cpu pointers that correspond to
>> 	   the vms structure addresses. The calculations are based on
>> 	   adding an offset from a table to chunk->base_addr.
>> 
>> Here the problem presents itself since for addresses based on vms[1] and
>> up, the tag will be different than the ones based on vms[0] (base_addr).
>> The tag mismatch happens and an error is reported.
>> 
>> Unpoison all the vms[]->addr with the same tag to resolve the mismatch.
>
>I think there's a bit too much superfluous information in there. For
>instance, it's not important to talk about how or why there can be more
>than one chunk, just say there _can_ be more than one.
>
>	1. There can be more than one chunk
>	2. The chunks are virtually contiguous
>	3. Since they are virtually contiguous, the chunks are all
>	   addressed from a single base address
>	4. The base address has a tag
>	5. The base address points at the first chunk and thus inherits
>	   the tag of the first chunk
>	6. The subsequent chunks will be accessed with the tag from the
>	   first chunk
>	7. Thus, the subsequent chunks need to have their tag set to
>	   match that of the first chunk.
>
>Right?

They don't seem to be virtuall contiguous. At least from testing on a live
system, QEMU and Simics I never saw any be contiguous. And I double checked
today too. But your version is nice, I'll just drop 2 and 3 and I think it still
will make sense, right?

>
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index 54481f8c30c5..bd033b2ba383 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -613,6 +613,13 @@ static __always_inline void kasan_poison_vmalloc(const void *start,
>>  		__kasan_poison_vmalloc(start, size);
>>  }
>>  
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms);
>> +static __always_inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +	if (kasan_enabled())
>> +		__kasan_unpoison_vmap_areas(vms, nr_vms);
>> +}
>> +
>>  #else /* CONFIG_KASAN_VMALLOC */
>>  
>>  static inline void kasan_populate_early_vm_area_shadow(void *start,
>> @@ -637,6 +644,9 @@ static inline void *kasan_unpoison_vmalloc(const void *start,
>>  static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
>>  { }
>>  
>> +static inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{ }
>> +
>>  #endif /* CONFIG_KASAN_VMALLOC */
>>  
>>  #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index 88d1c9dcb507..9496f256bc0f 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -582,6 +582,17 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
>>  	kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
>>  }
>>  
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +	int area;
>> +
>> +	for (area = 0 ; area < nr_vms ; area++) {
>> +		kasan_poison(vms[area]->addr, vms[area]->size,
>> +			     arch_kasan_get_tag(vms[0]->addr), false);
>> +		arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vms[0]->addr));
>> +	}
>> +}
>
>-ENOCOMMENTS

Right, I'll add a description why that's needed.

>
>>  #else /* CONFIG_KASAN_VMALLOC */
>>  
>>  int kasan_alloc_module_shadow(void *addr, size_t size, gfp_t gfp_mask)
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 61981ee1c9d2..fbd56bf8aeb2 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -4783,8 +4783,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>>  	 * non-VM_ALLOC mappings, see __kasan_unpoison_vmalloc().
>>  	 */
>>  	for (area = 0; area < nr_vms; area++)
>> -		vms[area]->addr = kasan_unpoison_vmalloc(vms[area]->addr,
>> -				vms[area]->size, KASAN_VMALLOC_PROT_NORMAL);
>> +		kasan_unpoison_vmap_areas(vms, nr_vms);
>>  
>>  	kfree(vas);
>>  	return vms;
>
>So, the right way to do this is refactor, first, then add your changes
>after. This really wants to be two patches.

Sure, I'll try splitting it.

-- 
Kind regards
Maciej Wieczór-Retman

