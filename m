Return-Path: <linux-kbuild+bounces-2289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54A91C951
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Jun 2024 00:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29FC32857C3
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 22:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9E87F490;
	Fri, 28 Jun 2024 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgSO5RXG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D9374F6;
	Fri, 28 Jun 2024 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719615281; cv=fail; b=Qvwd+VbN9sLIYztEt0CM6HkjgbFKSBp6yCM4sseP7dHNFjT4R9OVuYOkuLn7xq68rleUnFYZBRcj1AnxYikkCKm1Ns9Ge7sPTCq/zpMDV42sRx1zFwX9Jd5x4lIwPo+CcJV1SIn8YVCdW0LhK8LiptuGt3t3/H+Ksxs7gtr1nv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719615281; c=relaxed/simple;
	bh=w8lFn9Ud9AQ3nQ2pEQmfc53h+JEng9n34hegXAwmpNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SIszCoqb1ute45lqWsG4TXHtc/W4q+WdNcnTRhFs01WdNaH6bwqC4q3V3cRwCg0iGPSS6pqjQ9zHP+g3B5paRFxZZQYJhLIYg26dBgayayP50xLxinpj63uyeq+bvIMsbfYrmo/dRxGLRGzQb+vPs3pgMZtJSNoNJKAHRsnZiGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgSO5RXG; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719615280; x=1751151280;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w8lFn9Ud9AQ3nQ2pEQmfc53h+JEng9n34hegXAwmpNQ=;
  b=YgSO5RXGE7MnJIq8ZNSTAz8nnhUaJTdI/Ku31U7lzn9QXjWYoLqp9skq
   xPLXuCaKixu6aT3OcMV2PySRKeJHlkVELCOU/lc8RIl/XSVwP79q4JsLk
   If5MAximNVQCqAUhDjCxSaZ0lD1wYjSNvI3SuVLuer3+QSNkufOrlIIEo
   7Gy/l38tj6B4gQtQS7r+SRKnrcY8DETkf1UzLCvGWR1gigmmyqmeSBTsM
   br/jemYlvgs2MsQbx7ItoRRpbzINqcQp11N80/TGeYwo0turnP0dj8+NI
   IfwwB6blGw8IZ2PiFJYj8HDx9kh4lQS7GddDcQW/J14O7RDi7KVluKhvZ
   A==;
X-CSE-ConnectionGUID: LkyQTJgET/eXYZHQirpBZw==
X-CSE-MsgGUID: vZ1IbufFS3SsnByx2IJZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16692739"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16692739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 15:54:39 -0700
X-CSE-ConnectionGUID: ubb0YI3oTq+N8NphnXTz8A==
X-CSE-MsgGUID: O8Rvm9lnQYeUNFjM3IPgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="75600991"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 15:54:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 15:54:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 15:54:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 15:54:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2YuEji9BpjOFGVEY4G58V90beWbhsvJFhBqZ2vVjPHKAsPqG0aN5WLn60yyRax+FrzGNkpEsikHWlARRD1C+QeaGJwbBEYE+gJb+z+caedIh2g4PoTbqPe1macKyCY6sYxQYhmKrtvbQWpXcQzUC9/V1kbjsVmkxC/UxdpN+fIGiJN00qa3fkEng/w70rvr+dd5WSVo3pS0VX/vHv3ONeiDEOVFtvh+6v8R5WuVHtXivSBLi6Kc4QigCbqgC28XojOynOUvSQoZJMbgTFtSMucliHOkpc1nuJnvVV/e9LnrGiGxsHtTu5q6olHpne9tcqgcAAvuhiTU5PFpT4yUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8lFn9Ud9AQ3nQ2pEQmfc53h+JEng9n34hegXAwmpNQ=;
 b=D0bGfliQMRTHb4IM+Q5Z6Wi6D78NMxgX6unkASGB/TVqB2BUcmgBGddE7FAJLBZVNR4gHqK/aPH6EylE+lO50jy3F14s+BwpJCbaC6KpRztFG4P5h83ihK08e8Hi7zuaLSy4qM/TzUEXWaYmTlwUuIkjqbYaBtQ+yyUB3bhwDxaJuSk/I0vF5+TlYf3R615zMsLjXA/UYf1t9frmEEtiBj6WkGx1aX+M6VJiZgzX+oIj1WgNeV2B56lqyp9zLGKAFTnuKIEkd0hvmyK1xNCRVqR6FSVGdUnqe6VuNldyIYhasXrg9AtlKZSdVGHA18IBzFuaWNSVCn1Dg4UrC62R1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 22:54:34 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 22:54:34 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
CC: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org"
	<conor@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Topic: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Index: AQHayLVfl2uFd7lKFEy9THA08Pzt97HccBAAgAFBeQCAABlUgA==
Date: Fri, 28 Jun 2024 22:54:34 +0000
Message-ID: <2ada559c1a4517ed879bb662689815b4357674ac.camel@intel.com>
References: <20240427145502.2804311-1-masahiroy@kernel.org>
	 <20240427145502.2804311-5-masahiroy@kernel.org>
	 <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
	 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
	 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
	 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
	 <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
In-Reply-To: <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA1PR11MB8197:EE_
x-ms-office365-filtering-correlation-id: c5a15e7f-8be7-4dad-d85c-08dc97c5475b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTBVTlFabGNmR3JPWWdpVit5VlhtdzlJRXFKd1p4ZmpyUk5WN0g5S3o5WUFk?=
 =?utf-8?B?ZjQzYkxobmdIUGhYNnM4UjRSelRXbXJTY0NXTVJva2laWm1BUzNPNVZDVHZY?=
 =?utf-8?B?YmtwNHVyVGRTYm8rRkpyczkvaGp2WEpGTnVpNWFRdDFNeFZyelNndUQ4SDgv?=
 =?utf-8?B?L1p4SnZ5UXRQWlhGdlY3THZnWnhwR1hXcmVLd3N5WVI1Z2xpNUtDcUluWXoz?=
 =?utf-8?B?QnZOMG9LSlRKUG42TStUU09GVkxlZVM1cUwzTmJTeXQ4aWg0OWRPWXBTc2M0?=
 =?utf-8?B?OU1oS3pGOWt6QU5ZeWFZV05ERTNIeEV0Ykl0UHFrcEVzdWtwVjBxRmZrY29Q?=
 =?utf-8?B?bmRDZGQ0cmlGZzFlZW1HaVlRU1FWUnpIV1pkalNMcU5GQzZ4by9UNWJidjBz?=
 =?utf-8?B?aDZzTjlGRFhPRUFzTTNHd1JmZWVnQjVBUWppcDNWTFFwRjNoNVVxMHFpNHF0?=
 =?utf-8?B?R1RqU3VpM2xMNExQVW5SbHd1VjRyclpYcXJYTnkwaVZ4NUxoQ1dEc1FwdUcw?=
 =?utf-8?B?Vnh3Q2lXcTZEdVdtSldGVWdpanJDOU05MmZYUEZiWVB1dWd6NGc3SlY0RnhZ?=
 =?utf-8?B?bTREQWQrSkpnbFlhTklDZG8vbmx6cUo1aXd5ekpNQmVaRzhYWGJiTjNPSEZL?=
 =?utf-8?B?cHJUMk5tek5nUGx1NWV5OFRGUVpvQW1keWx4K2YwTnFBVUx3bUxIVFVPUTNM?=
 =?utf-8?B?bEFsd3JUWDRYbXN1QzNnL2xaREp4Umc5TGk0UUVaVmVmSG8wZHNDb0lVSlpl?=
 =?utf-8?B?a3hzeUJBK1I3VTFyTFAwRHRLa0tRYVRzMmZIUkFHTVlxRFNMOUtJdEYxY1NW?=
 =?utf-8?B?ZXYxbXJxblQyUjI3YUo2b2t3UVduMEJ5VUIzbTIrVnhTYVhSY3ErTVNKQTM5?=
 =?utf-8?B?RGNxQXorTmkraXVyL292UjZHVEg2N0J4clFqT2RjU0hid3lUZ1FPdGZoYWpp?=
 =?utf-8?B?MmErZU9FRlpUeXZjaHlNTVh4am4vd0IxdEJDTm0wUTBOdnAwSjNsaTFrQTVD?=
 =?utf-8?B?cDRaY3RvL3BSRkk5RGQ1ZEV2WldyQmNwV1M5MmpqNTJLbDlTQVJWN0FuNTVH?=
 =?utf-8?B?Zm5BNHRqdWpid010Qm5xWnIrWkhFSWpoK1Q2ZnFBTGpQc21aTmQzcTBLaXVu?=
 =?utf-8?B?eUw5VURaWU5HUWVZNk5RSDN3MTA3MDArZUxjbk9lOG85d25INDFiK3FiOTVH?=
 =?utf-8?B?MGJOOHhkN2JRTThBWUJDSXlLL1Z0RExzYkNYYys3R2pwYStFU3VNUXpkTUdY?=
 =?utf-8?B?c0crcXZkMXdBYVVHd3grYk95b0Y3U2wrcHRiS2UxRU4vRlZKTnJKWWI4N3Ri?=
 =?utf-8?B?TTIwZTc1RS9UbGlIZG1Tcm03bldpYTFWdWpjVnFNU1ovMUVod25xVFdYMVNm?=
 =?utf-8?B?ZHR0WmdGeEkzUW05akwrWlBxckl1TEczZlNGZS9vdUIzVTFKWUdoTkVJb2E1?=
 =?utf-8?B?TDhKLzRSRHBMNEt4N09iUXlCdDdZZXNSbXAzRmRuMm5IcDNTTUVQcVlsNGZ2?=
 =?utf-8?B?Szc0UjdkL3dQc0dFNnZRWXg2dXV0UkRsNlF0bHVXemZ2K3Zhdzc0ekR0Nmh6?=
 =?utf-8?B?SzdUNUhwZnFoV09rc0dXcFJEUStKdzFLR0x5TlV2WGdiR3pWZzZDSm9EQ05W?=
 =?utf-8?B?dW9NZ3cvT3E5R01va2hDQXVDd3JuMjNTemVSWDJ4dllYS3BYaXFUUUhmL2pt?=
 =?utf-8?B?MVNIdEFLUHVwUURNS0tnbnBEL2FpZHl4WkluWWFtU3JFMjVZc2IxVGR0Q09S?=
 =?utf-8?B?YVBhazExNmNkaE9EWjNXemRPN0xMOVpFREVTdCtXd0xOSHJpSDJ6Z3BFZERv?=
 =?utf-8?B?cHJqQy9KQjRUYm02UDNHRGNLUS82RlZQSlV2RHMyL2tlU2VSaE52U1h3ODVS?=
 =?utf-8?B?Q3I5NHlqUzgxMnhpcFRoc2haSVd2RVY4UW5WbVhmZ2xLV3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3pWd2FhZTFaZkNkWEhRRUh2STNIZ1ZJRVBhZGt3ZjZYRnR3TUVUWnVEcWhD?=
 =?utf-8?B?NFR1UENGeFRPcmlRK0xtdHNJQ1N2UGhkYlptVjBQSVZVWFI3ZlNPck82RXQz?=
 =?utf-8?B?ZXhzMEhRYkFzL29lbkxFV09McWp5VExRMDdUUlFGeHZFcGZMT0psbnhPUXlE?=
 =?utf-8?B?Y3pXOGJ3ZVlKaVJxQWZ6S1hScVdPR2x4ZWlta0F5RGlKK0grVjlzbi9QL1Y1?=
 =?utf-8?B?dFpoeWpPRjhkQW05Q255MTh2WDh0aXUvKzZRbHBud1NtaGU2OEp6cGROSzlv?=
 =?utf-8?B?VjNld2pBaDBwY1RaVmMrTW54b2ZMS0d3d3lKRktrQzJ6ckYyREQxYXhSUGJD?=
 =?utf-8?B?NHRaQ2RhSFpJcG8vMUxDd2dDQnJla2V1YjRYYzZicjFSQkRFR1lBeTdpVGdq?=
 =?utf-8?B?R3FZZExxaGtjSGpCbWJrMFB4MHZsQm50R01hYjVxQ3p1TXRkd2NtMXVmbWcv?=
 =?utf-8?B?Y1QwM3lmRmVuOG5NMXF5aTJtdE0yN3dEV3U4eERKQlg4RENPeFI4MFRmLzQr?=
 =?utf-8?B?Wi9GWGNFbWU1RmtIK0R0cUFFM0JoOFBKUVlHYURhbG5aUnlSei92TjNBbkt6?=
 =?utf-8?B?Mm5xSW9YWUFxV0lqOEdCN1hOMDhrYjVGSjNVRlFGVkZuL3pTMjl0Vnhwd1pS?=
 =?utf-8?B?bVVud3dRZlJyNnNGYmJkNWdzT3ZFUHJBZVJ0cUVudHhzQUF0d0VPamF2azRs?=
 =?utf-8?B?cGtTd0pBTDNvakhwekF4aEVsWlZoRDd4ekRCWE5WVzYrZDJsbUsvTjJNd2Uw?=
 =?utf-8?B?YVIxeGRmeTdieUVMSmlxbnJCbkdJNDJxY0dwZWMxczFrR09RUnlKSkZYS1RL?=
 =?utf-8?B?SWZaeE1wdEJFVjhpTkpPOE94aUlNS2FobHh3dDR1SEJJY1M1L0I4ZnFUOWhM?=
 =?utf-8?B?ckZ6TWNtZm5TVWJwdzJROXBXdXV5LytJdUEweU1uQ05IUlM5eSs3NG9nb3FB?=
 =?utf-8?B?b0l6aTJmMWhVMCtBVlcwcHhDZFE2REE2ZTJXVWI1M1hZa2tDcTU0ZnVtVytj?=
 =?utf-8?B?VWprSnhoSC8rYXBFSlpwVXNQSWpUaFJOMXBIcGFmK2RlWGRmckFSaFVqNUY5?=
 =?utf-8?B?YkpxQ3R5RWRJaW03Z3pzM3ArZldjVUdyL2pRSGx0Sk0ydGFycHYvbG1qeklZ?=
 =?utf-8?B?SVlkZjkxQW5UV1dhSFgzYWwrTGI3dG5aZkg3U0lQUFpzQ0pVcFhhU25YRWZI?=
 =?utf-8?B?R09sUDVGOFZlTkYycFdPbVo4ejZRa3QrbmtYQ0tKcERNOExPbG83NXVVL21q?=
 =?utf-8?B?YzlkZU9oVkVGZlhjVklqSHNMck1aWEtsa3MwWWpZcWxKN0pLdUw0MUFTay9z?=
 =?utf-8?B?cGs2ZVM2emdQUk9VcUdRSDg1Tzlza1lGL0FIWnYzaXJWWXRWbW1QenNqcjZr?=
 =?utf-8?B?WmlRQ1ZDcE9aMGErUXNFaE9idWtiYXpiUDZFQWVvTytsS05ocTZaa1h1VGo3?=
 =?utf-8?B?MFl5SXZYbkdYZGprNDExNlFTSlNUYkdORkZBSThaY21PeGorM3hWNi9NWjRt?=
 =?utf-8?B?bm00V05odS9RTDJRV1l1NWZ3TVFjUC9jWWg2YmttUE9CRGNyN2ZGV2pPN0Qy?=
 =?utf-8?B?OWUyMDI5RnRXaFlxK2NEUVZsNC80U3NnU2NGcnBmTHNqK3h6eDVWN2ZBNjRR?=
 =?utf-8?B?aFFzUXNrMmpBaEF1TDhvV1AvUUhsY2xsRzUrNDFWWjJuTlhheWVVSGcwTXNq?=
 =?utf-8?B?aStiY3hLbTF0Y2RWdVpkTnZ1WWg1clhRcXZmOE1WU1daMmRNTzNIQ0VnT1Z0?=
 =?utf-8?B?SDgwbDVPSE5vYklvYk8xa0F5YWZYQmprUi9UeXl4c3ZDcURpWDRrR2RCd00x?=
 =?utf-8?B?VFF1eXE2MHEwY0NVQS9STlRFbnFTSU5wSkxYdDJGUFk2K3dDUTg3eU95NEJp?=
 =?utf-8?B?TnFhSzE0TlpmU1dvbzJwMUh4QXhZKzdwd2lka2xPZDlxVElVZXJYZzZrWlJY?=
 =?utf-8?B?SkFpRm00M0U4OFJkQjl2TjNjQ09tNVY1MlRDaWhOQTZwOFhjM2NzVWNIbEgx?=
 =?utf-8?B?WGY0K3NIWGVlWEpBWXFqN3laSHMzaFduaFlBRnBaaGFJNnAvSFhLb3c2NXBp?=
 =?utf-8?B?NGxUOWRnNkZzY2VDajBobXVtcVkvbXI4Q1FWZXhYd1RmSHVubyt3MXFwUUh6?=
 =?utf-8?B?TWhMajNtSTlJMysyNm9CcUdqeC9HbFJvcnAraFUwekE2VmhPRWhzUEwyU0FJ?=
 =?utf-8?Q?VnXRUzbkGusEakAgOlN0Jok=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22F35DCF54F7FE46BBAF8DEB2CCEB02C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a15e7f-8be7-4dad-d85c-08dc97c5475b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 22:54:34.1048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VaJmASL+R7Q1ltM8Lf3Ib7GQ4XclHK833YUrC0e0qyCyLSxGsquNbUTgY0BeZOk6ZB7c+yOSrYL45Yz5JfkCicc7GkKMeMrcLvJqlV+k2ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI0LTA2LTI4IGF0IDE0OjIzIC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDI0LTA2LTI4IGF0IDExOjEzICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3Jv
dGU6DQo+ID4gVGhlcmUgYXJlIHR3byBzb2x1dGlvbnMsIGRlcGVuZGluZyBvbiB3aGF0IHlvdSB3
YW50IHRvIGFjaGlldmUuDQo+ID4gDQo+ID4gVGhlIG9mZmljaWFsIHdheSBpcyB0byBwYXNzIHRo
ZSBhYnNvbHV0ZSBwYXRoIHRvIE09DQo+ID4gKG9yIHJlbGF0aXZlIHBhdGggdG8gLi4vbGludXgt
dGRtLWt2bS1vdXQpDQo+ID4gDQo+ID4gVGhlIG90aGVyIHVub2ZmaWNpYWwgd2F5IGlzIHRvIHBh
c3MgVlBBVEguDQo+ID4gVGhlIGV4dGVybmFsIG1vZHVsZSBidWlsZCBkb2VzIG5vdCBvZmZpY2lh
bGx5IHN1cHBvcnQNCj4gPiB0aGUgc2VwYXJhdGUgb3V0cHV0IGRpcmVjdG9yeSwgYnV0IHlvdSBj
YW4gc3RpbGwNCj4gPiBkbyBpdCBpbiB0aGlzIGNhc2UuDQo+ID4gDQo+ID4gWzFdIHdpbGwgd29y
ayBsaWtlIGJlZm9yZS4NCj4gDQo+IFRoZSBhYnNvbHV0ZSBwYXRoIHdvcmtlZCwgYnV0IHdoeSBu
b3QgbWFrZSBpdCB1c2UgdGhlIHJlbGF0aXZlIHBhdGggYnkgZGVmYXVsdA0KPiBpbiB0aGlzIGNh
c2U/ICJhcmNoL3g4Ni9rdm0vIiBzaG91bGRuJ3QgYmUgY29uZnVzZWQgd2l0aCBhbiBhYnNvbHV0
ZSBwYXRoLi4uDQoNCkFyZ2gsIEkgbWlzc2VkIHRoYXQgbWFrZSBBUkNIPXg4Nl82NCBPPS4uL2xp
bnV4LXRkeC1rdm0tb3V0LyAtajM2IE09JChyZWFscGF0aA0KYXJjaC94ODYva3ZtKSB3aWxsIG91
dHB1dCB0aGUgdGhlIHNvdXJjZSB0cmVlIGluc3RlYWQgb2YgdGhlIG91dHB1dCBkaXJlY3Rvcnku
DQoNClNvIHRoZXJlIGlzIG5vIG9mZmljaWFsIHdheSB0byBidWlsZCBqdXN0IGEgbW9kdWxlIHRv
IHRoZSBvdXRwdXQgZGlyZWN0b3J5PyBBbmQNCml0IGp1c3QgYWNjaWRlbnRhbGx5IHdvcmtlZCBh
bGwgdGhlc2UgeWVhcnM/IElNTyBpdCdzIGEgbmljZSBmZWF0dXJlIHRvIGhhdmUuDQpJJ3ZlIGVz
cGVjaWFsbHkgZm91bmQgaXQgdXNlZnVsIHdoZW4gZG9pbmcgdmlydHVhbGl6YXRpb24gZGV2ZWxv
cG1lbnQgd2hlcmUgeW91DQpuZWVkIHRvIGJ1aWxkL3Rlc3QgZ3Vlc3QgYW5kIGhvc3Qga2VybmVs
cyBhcyB0aGUgc2FtZSB0aW1lLg0KDQpPciB3YXMgaXQganVzdCBub3cgZGVsZWdhdGVkIHRvIHVu
b2ZmaWNpYWwgc3VwcG9ydCBhZnRlciB0aGlzIHBhdGNoPw0K

