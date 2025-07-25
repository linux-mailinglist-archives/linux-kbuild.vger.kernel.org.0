Return-Path: <linux-kbuild+bounces-8187-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D5B1237E
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 20:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2B716836F
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 18:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6766223D2BF;
	Fri, 25 Jul 2025 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYmRunnk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B091B22A4FC;
	Fri, 25 Jul 2025 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753466729; cv=fail; b=cn8jyVZ/gN7gq1/Pnl69cWqEbvlYC6VWbWGZh8UOzO5Ye2Ya2M8mJmaXCSMiJWE2nVeWWhgpKeKRlQ7vw0Qm7L6P+bGafMaEdfaakVvsvh45XYfIekpU0PJPbDcvx98zxi/A/Zoqjg7bf6xDaEYG1t57jwDP8xiXLWFG9kRT2Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753466729; c=relaxed/simple;
	bh=7szgIPVfvg/WFtkdVwL7fbXIv9OFB+1YPjYZHgI4i4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DrehBRTdl5hsssWqtGVFUmS32IcbT48nz9z5gmtsGW7KYIiavRjizgBscc6CgjhYbjUShppyGxQTZ7IfhYZj9tKouQudTVRJOPepfo+SeW5BPw4OHKlgHKMnUb7EpDW4b9Lo5xWzUHuBtM8sxoe6hCkMIdgv7+E4lY4k5K3/yRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYmRunnk; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753466728; x=1785002728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7szgIPVfvg/WFtkdVwL7fbXIv9OFB+1YPjYZHgI4i4g=;
  b=jYmRunnkC8lEZpfm6VPm81GuPs1wnYKkbbl/0ihBG8+E40AAutJ/r5i7
   p069qApA9HQv753NIGolkbTbrrt040Y1tVCHFOFTLGqopnqHT+TT2+CSQ
   wOiHjgDiK8YXXchnQ6p+gvRMMgJzWdNeSKZ6MnDrvU5xCGrhLTCfKzafm
   rwXwna88gjzsinrilntFYSYb9qqe7U5zrfyADpxb0NXHNZ3Rzjx0mN2rO
   fYAGO1f5ooygu3gR7a0Ir8R30VcW1O+US/TwfjMjodTZmKcfxbuTJVyM8
   DPTVC7fB696qHXQJkFeqFdr/F7ZHhLRrqSk6aR1ZxTfY1DAARPxSBU6hl
   A==;
X-CSE-ConnectionGUID: +wjVhrqwTzyAy0KEHTTY5w==
X-CSE-MsgGUID: EzcZAlxtSJCmSZxD3+G8bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="58427473"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58427473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 11:05:27 -0700
X-CSE-ConnectionGUID: DFS9EpNYQHiN0E2NnxDRxg==
X-CSE-MsgGUID: XRMBWPlwQNGPCXc38QizJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160658367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 11:05:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 11:05:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 11:05:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 11:05:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8PJbXrIw0ENgiL2Vm1psj36KqlVsOBfsmeqZm4oYdvWfMjIoHoXu5yOF1N2BiU5fgMcgdC0PsljJQZsSBjXvV1Cpzt81VXAGsFJxQ+AVBFr9XL/sP9p8YxiyD7bjYwjLNTi+wY05PoPFPMLVx/LH1y+OK20kVlZHzajqbh5cYx6wW4OkypzQgJCp5/RytAsJiU/83q4pJbUyswTPEbUPsc0XW6yP2DFhQWkxAjj1eZPANPFr9VWJyCMTKzFP1x9/OemqKwQursQ+Gm25SXPyTBE1djc53T/i7daAA2FjLCTZHf8JGh01ASAS0wjXMG2sfOZbupHnxrREAMA/IiClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7szgIPVfvg/WFtkdVwL7fbXIv9OFB+1YPjYZHgI4i4g=;
 b=mXDjVWFc9oO4LT/xkIUKlbd3pF4IgeKX+noW0f3sggCp25hEK2DsBHbVdBEP5cdrXO5MUXU9SCFWFeF45DkNVs6ppAlll2PVLtjcr2S81gRuk35DZ8zF3wD2Jv96ZmLRff7mG9GOoaAe2zbSzCFT7w29jPefxVNdr7DkDdxmU3KFcSalt/98qrb8NGIvuuudmILTbLoKIhtbphOvDMYgVXatxZl98J8p1xPgCcEBPdqKx1Cc8Qh18l8f/HWbDWvVO/OznCC+3CRVkLbV4xQWptGHYxvdNWNmJ3KRawpgbXOC0FkWk302nNPOhR7OUZMf5uUvjuHIIMth/4fXNkS/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ1PR11MB6179.namprd11.prod.outlook.com (2603:10b6:a03:45a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 18:05:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 18:05:22 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>
CC: "nathan@kernel.org" <nathan@kernel.org>, "kito.cheng@sifive.com"
	<kito.cheng@sifive.com>, "jeffreyalaw@gmail.com" <jeffreyalaw@gmail.com>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "mhocko@suse.com"
	<mhocko@suse.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>,
	"david@redhat.com" <david@redhat.com>, "masahiroy@kernel.org"
	<masahiroy@kernel.org>, "samitolvanen@google.com" <samitolvanen@google.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "nicolas.schier@linux.dev"
	<nicolas.schier@linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "andrew@sifive.com" <andrew@sifive.com>,
	"monk.chiang@sifive.com" <monk.chiang@sifive.com>, "justinstitt@google.com"
	<justinstitt@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"morbo@google.com" <morbo@google.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "nick.desaulniers+lkml@gmail.com"
	<nick.desaulniers+lkml@gmail.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "ved@rivosinc.com"
	<ved@rivosinc.com>, "heinrich.schuchardt@canonical.com"
	<heinrich.schuchardt@canonical.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "fweimer@redhat.com" <fweimer@redhat.com>,
	"surenb@google.com" <surenb@google.com>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Topic: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Index: AQHb/PPxu9eTHUKFUke14vTmf1bCHLRDEvUAgAADzoCAAAy0gA==
Date: Fri, 25 Jul 2025 18:05:22 +0000
Message-ID: <a19c1338f2fa4cb19a4f8b7552ff54ded20b403a.camel@intel.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
	 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
	 <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
	 <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
In-Reply-To: <aIO8uSqiplnyyNOd@debug.ba.rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SJ1PR11MB6179:EE_
x-ms-office365-filtering-correlation-id: 2158e288-5e95-479a-4ec7-08ddcba5d305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QTNlSkttUkFGcGpHa1RqQUtycVZiQ055U2xUN3hzeE1ycHUvMTNKb3lZV3FQ?=
 =?utf-8?B?TzRPRFAzMDBVTEIwbkdON1BYK2dQUXBHZ2hqUGpHTEhPcmJLb1E0M1hiZXBL?=
 =?utf-8?B?cWpxOUJ5VXlQUlNYeTFNeEhlRkVHRWsyZUMrR0RPVCtNNS9jSUJtT09URnlJ?=
 =?utf-8?B?ZUlDTEFpaFQ0VWlQVTFRRjcrb1RvandaQ1MwUWJKVWF5NEYwMDZ1b0hBRHlN?=
 =?utf-8?B?K3ZXbTcwRE50T3krR1ZodnpXMjdRczZwUWhHbU5iYTZpNi9qNXNtamZLNmRN?=
 =?utf-8?B?WXl2MmhGR2JYRjhKYklGQ0tOb0ZtY1h3dVFWVDlXUDUvcVd4bXdQcTZXQSsy?=
 =?utf-8?B?T003UDU1ZVIvTFpjOXUrb0NVZXcySStKTjRNSzRmQnZoZzBtQUwvQ0N3UkJH?=
 =?utf-8?B?NzlocTU5bCtCbG1EUllmRGFiMXZZN3RRWDdoTUhPYVNiTEZjVkxld3l5UFpX?=
 =?utf-8?B?QVprcHdPTGhWQkRpclRlNE91STZKaXFlbkFiWTQrUTM5bHRpL2tWMkQ1cXpr?=
 =?utf-8?B?L0FHeWU2K0prN2s0VUpWK0JLL016YkJpWDk4bkZGZ094WGpwWFc3ZmJCQjN2?=
 =?utf-8?B?NHUyOS8xQWdtTzhwVjRqNlRUMkhFN25nR1ZlT3J2M2o4SUMwZVJVNmpPTmYx?=
 =?utf-8?B?UVlxQ2pkd1VZV2w3TmoxS041ZEJseUpiVXhMU0QrR3puZnMxdThZNGs4UXc2?=
 =?utf-8?B?Wkl6bTlwMGx3Mlh3aW1nMVh3NXlsMThhd1lVOXYvQ3dzQVRTZjZ0MStubEhZ?=
 =?utf-8?B?bmFBT0ZYOXhVR2dmajNidlBMWU1DSkVHb3o0MTBHR0ZUZzFDdTFFM08xTHgx?=
 =?utf-8?B?bXlyWkNSZ2IwaVhJY2lPdlFjN3FKWDhJNzNjMUV5ampuS2hzT0FZd0lUMlVU?=
 =?utf-8?B?Zk9NTUJBMUJjMXlXcmVQejF6cjgxQWxnS2FHQnNMZVl1TUZrbFVDYjF6WVZm?=
 =?utf-8?B?K2g1MzNwOTlJU0NWMVc2djdjcHlDemNHcWQyYk9jQXBHS1NaazhoZ3ZJRHBC?=
 =?utf-8?B?TlUxZmhJQWF2R0lHM3lqYlo1ZVF1cDcxcEY3bGFmYmVvbTJEK09ob0tnY0VL?=
 =?utf-8?B?V0VEeDBPcFBselFJZnNOQ2IvRW44WlJQOXVFajRXdnh0NlNNM0IwRkVTVlNO?=
 =?utf-8?B?Y2FZSG1ETzY4K0Z0ZFpyMlRickM3anBrZTRKZ1VtVE9Xc1BvV2c1VHNGQWtE?=
 =?utf-8?B?NlZMRDlwMWR2WXdxMzM2LzcxbENKVlVMMzJPZ0VOWksrMmdtR1l1ZjNGOENP?=
 =?utf-8?B?eTFEd1ZXTVVYZGxmM3A2MDBpNG9QU1IwTWVvQUJHdklCZ3lNL3lUZitMNjlD?=
 =?utf-8?B?QStjK2ZyZTVBQUFRK3YwdGZsRFp5V21wV2JFZFpSQ1JuN3hnQi9rR3M5Z3lo?=
 =?utf-8?B?WVEyc0hkSm5WOVBQOThYK3JZL1N1Rkh3eWJlRDBpaEtXdCt3SWRUNXpHUjZU?=
 =?utf-8?B?U2d2eWVITkkwalVXbll1NHBSRVVhQTJ5YkNxbWxwNzh4U3hhcnNPalhIbTl1?=
 =?utf-8?B?ODhpbWZIOFBjTWFJZW1xNWFPZ01VMXV3aWcrcUs1UE5vYjAvT3JSQWtsRkE0?=
 =?utf-8?B?cDZjWjZaTTFTMDUxUWJoa3pRM3cxbVJrbDM0bGg0eitKZVltcVkyVWVHRGx5?=
 =?utf-8?B?V05IN0xrQ2xTYnFnSVVUdVBUcnZCU3NyVTkxcFVqaGtIc3ZGUDhXbWRlNVhw?=
 =?utf-8?B?RjZEbU9XMXNEazBWWEpoWlNMdGovV05oOWowTGhxMmhGSmh2VUVMaFlPSmVn?=
 =?utf-8?B?eGQrTURIaDRkVkV1VldEUnV3clBUTTNxcVFpQ3NEc2YzaDZ5cUJZNEk4bGdL?=
 =?utf-8?B?RGJLM0s3ZWNNSUlIMTQwYXFCSTRpTHoyMFZCVUlCd0puYmJnTEM3UmFXTFlG?=
 =?utf-8?B?NFFZNzJCclQ5U1BQVlF3eTJFSStNbndNbzh0VzBwZTdDSXlXcUVsMXdtdHE1?=
 =?utf-8?B?UnNwZm8vRkF0eTBiSWR5VmpDMXBIU3psZDNZSHNaYm1laGE3ZExVdWNhVUVT?=
 =?utf-8?Q?xrReYUxhyoEfI0ZjfoWnzOh25bi27k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dllGVy9Jb0EwbWhqVnA2M2pDZ1N0NWtSSDlDUit2QUdSYy9mYU5MeCtXeU1Q?=
 =?utf-8?B?V2NRWnRqZWcwUUZYaThsekk3bm1IMi9pOEx0WEMwTWw2Z1hJMFhZUk9rRHJX?=
 =?utf-8?B?YlRJUTdCK2VKbVJzTFIzK2trYUIvajRIc0lRUVk5alNMZUxvOXd4bXZrWUl4?=
 =?utf-8?B?aHNTa2FYc2YrcnBybVBrMDBBVUtPLzlNY3VqOUR6M2lWY1lnV3BsZ3FsZDdX?=
 =?utf-8?B?S1p3L2lYZHUwYStJTkpJL2hhemZwN08xSy9wbDJPeXRaUnBjeGdpSzVwaUFK?=
 =?utf-8?B?eTBuREw3V0U4WWpqY0Q4UjZibWtSL084Rk9NUDZ1ekdCMkpHOXZpQ2c2R2Y1?=
 =?utf-8?B?aHpVWHdHc1cxWG9tQU5NZEdONmZ0VUoxcndvajh0aUJNaEhTTWUvZTlSWXRn?=
 =?utf-8?B?Zy9KbDJ4RUZOSDMzVWU1UXBHY1hQRFNPSVlFRTRLNTBwNzZ1Rk9QTFdNK1Fn?=
 =?utf-8?B?QUxmTytubFRRQUpGSUJUTnNvRVN4TDhXS3BxakRGZ2dERFV5amhBdWh2WlhU?=
 =?utf-8?B?WVJ1QU94aDl6N1NnVlhoVEdUS1I3UGJYV1RHUzVXSTFqR1Q1elVQdGhlNm5I?=
 =?utf-8?B?L3NnVGJXbkZXclQxMkxyY0lwTkpxUUM5K25HV2ZUTGFNZUJxZnBKaXZkeGZT?=
 =?utf-8?B?RlF3akxabi83QmFWUncxWE96a3Z2NEw3ckxUSUlqeGhsM2pwWVZsR201TXVF?=
 =?utf-8?B?UmJoR3lGcEJGc2RKeDRRa3RMNHoweEYyblpBbzd2dzZIT2dOaXZvSzhNcVVl?=
 =?utf-8?B?eVdWV3MrMElOZVRsWXI3NlpWMlUxWi8zSE1BNlM4QTMzSThmcnJWSnV0bVQv?=
 =?utf-8?B?YUQ5cjlIb25SOXl1WFEwYW5MWWtVM2tpQ0dxRUxSN0NwQ2JyalJPdVA3dlU3?=
 =?utf-8?B?QmNPUURFeFdWSENwb3pQeUpxWDZGa1g4U25PMHB2Zk1yUDlHemQ2Nkt0dG1Y?=
 =?utf-8?B?bVlQUEdZZmZSQm9JNUF6ZUpxcDYzVXlHNzBnZlZmOGExbXFwQW8rcHNpem1a?=
 =?utf-8?B?ejh1MmZ0aC9DVnZCVzJyMTUzWVFmOForTFVsYkdNaXJrUjJpN3VTdENzZ3BQ?=
 =?utf-8?B?QmxDZVc5VlhvR2hhbmY3bXFlT2dmVkdlSWRaanZVMmNCYzBtRmVXZTZ1YTV4?=
 =?utf-8?B?TVRteEJMeis5RHRiMjJWeVhMQlgzQzVZM2tUV1U4djBEY3NVeldWNTlIeHd3?=
 =?utf-8?B?dW0ranZTdXc2TnBjaGp2YldlWnQrditJRUJJNGluVC9MakZBaGFlRDJXYy9C?=
 =?utf-8?B?Y1N3THNpUDY5RXJ0TVJpUVVuUEhWN1FCenJoK3hxbEE4aGhHV2h6TzQyMGhV?=
 =?utf-8?B?YUZicXp3WTNHdGwwTVNmYjFNanBuc0taenc4dGp0Q2dBTDROQWFlVDEwZzc4?=
 =?utf-8?B?RDFoN3RoS0hFMUo2VDJJVkNucjBPcXFyZjNHWU45OXlzeXRpSmZWOFhqMVE2?=
 =?utf-8?B?TThvR2Y2Z3pWbXdzRFhmSGRzUmNQUUZBVmJudkxzSVMwSGtKVFJDRW4rZEt1?=
 =?utf-8?B?dmdnaVRYSFhMZFgrUUJJWmtGZnh0czRXeFV2emg1K2tiN0ZnbVdWa1d5WXpM?=
 =?utf-8?B?Qll2RTJ0K0EyLzV5b09UVE9uV2RvRVV4VVVHSEJrSEoyN0dMVWpPRnJFbHNP?=
 =?utf-8?B?MmFCNUZTRXRkaENzN0J5dzBBZHVBTUVleFg2VXZPZXI5ZXJYVXhuQ3UvaHlJ?=
 =?utf-8?B?REVENWUzaXBCZ2JmaHF2K2RPM0VsWUlpU1h6Q2xhbHAvaWRSVytIKytYMDlq?=
 =?utf-8?B?RkNVb3M4Q1FmNmMreGlBTkZTcWJLbkFkZFh3OUR1SGZMSEJrL2ZuRVQydW90?=
 =?utf-8?B?anF6cDlaL1hjcDZXaGxoSVZ3ZFVza0dJeVNXK2NLZDB0aTYyVTY3b2Vua1Zp?=
 =?utf-8?B?NDBkdnUrV0pNNDJxWHZKV0VZaUNkZ0RodHRzamYxUVhkRFlxaWFqUmg4bWdR?=
 =?utf-8?B?VXY1NExOS1B3N0lidGVQMjAzNXBzTGRQTDl5OEoydTBKcHpsK29KRGVYZFIx?=
 =?utf-8?B?RE4wSkhCdXk0Sm5yUm10NVBtUGJuM2V6WlR5TVF5ZktnOURpZXFERzNDaHgw?=
 =?utf-8?B?eGFhUUpneGwyaDMwRlpnRHFJNmJCMEtiZ2srVC9YY0czYk5aRW8waDVyM3hK?=
 =?utf-8?B?cW02TFVRN2VzUm5FNFlPVk9tc2lTMXQ3eUJDbDRpMkdFTGtyeTdIc1ZPTXk1?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41DD0C0521326F4A815E267A85C01AD0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2158e288-5e95-479a-4ec7-08ddcba5d305
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 18:05:22.6392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQDqdeK/djJby7huoEnpFEXRYn58b/Upswd7p5KsIIRx+mcWvhxpYemiAXpCokrdJmcHr/Lpw0yK87WiJ4xYhwzOkbD4TcaJliluDxdHKGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6179
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA3LTI1IGF0IDEwOjE5IC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6DQo+
ID4gVGhpcyBkb2Vzbid0IHVwZGF0ZSB0aGUgZGlyZWN0IG1hcCBhbGlhcyBJIHRoaW5rLiBEbyB5
b3Ugd2FudCB0byBwcm90ZWN0IGl0Pw0KPiANCj4gWWVzIGFueSBhbHRlcm5hdGUgYWRkcmVzcyBt
YXBwaW5nIHdoaWNoIGlzIHdyaXRlYWJsZSBpcyBhIHByb2JsZW0gYW5kIGRpbHV0ZXMNCj4gdGhl
IG1lY2hhbmlzbS4gSG93IGRvIEkgZ28gYWJvdXQgdXBkYXRpbmcgZGlyZWN0IG1hcCA/IChJIHBy
ZXR0eSBuZXcgdG8gbGludXgNCj4ga2VybmVsIGFuZCBoYXZlIGxpbWl0ZWQgdW5kZXJzdGFuZGlu
ZyBvbiB3aGljaCBrZXJuZWwgYXBpJ3MgdG8gdXNlIGhlcmUgdG8NCj4gdW5tYXANCj4gZGlyZWN0
IG1hcCkNCg0KSGVyZSBpcyBzb21lIGluZm8gb24gaG93IGl0IHdvcmtzOg0KDQpzZXRfbWVtb3J5
X2ZvbygpIHZhcmlhbnRzIHNob3VsZCAoSSBkaWRuJ3QgY2hlY2sgcmlzY3YgaW1wbGVtZW50YXRp
b24sIGJ1dCBvbg0KeDg2KSB1cGRhdGUgdGhlIHRhcmdldCBhZGRyZXNzZXMgcGFzc2VkIGluICph
bmQqIHRoZSBkaXJlY3QgbWFwIGFsaWFzLiBBbmQgZmx1c2gNCnRoZSBUTEIuDQoNCnZtYWxsb2Nf
bm9kZV9yYW5nZSgpIHdpbGwganVzdCBzZXQgdGhlIHBlcm1pc3Npb24gb24gdGhlIHZtYWxsb2Mg
YWxpYXMgYW5kIG5vdA0KdG91Y2ggdGhlIGRpcmVjdCBtYXAgYWxpYXMuDQoNCnZmcmVlKCkgd29y
a3MgYnkgdHJ5aW5nIHRvIGJhdGNoIHRoZSBmbHVzaGluZyBmb3IgdW5tYXAgb3BlcmF0aW9ucyB0
byBhdm9pZA0KZmx1c2hpbmcgdGhlIFRMQiB0b28gbXVjaC4gV2hlbiBtZW1vcnkgaXMgdW5tYXBw
ZWQgaW4gdXNlcnNwYWNlLCBpdCB3aWxsIG9ubHkNCmZsdXNoIG9uIHRoZSBDUFUncyB3aXRoIHRo
YXQgTU0gKHByb2Nlc3MgYWRkcmVzcyBzcGFjZSkuIEJ1dCBmb3Iga2VybmVsIG1lbW9yeQ0KdGhl
IG1hcHBpbmdzIGFyZSBzaGFyZWQgYmV0d2VlbiBhbGwgQ1BVcy4gU28sIGxpa2Ugb24gYSBiaWcg
c2VydmVyIG9yIHNvbWV0aGluZywNCml0IHJlcXVpcmVzIHdheSBtb3JlIHdvcmsgYW5kIGRpc3Rh
bmNlIElQSXMsIGV0Yy4gU28gdm1hbGxvYyB3aWxsIHRyeSB0byBiZQ0KZWZmaWNpZW50IGFuZCBr
ZWVwIHphcHBlZCBtYXBwaW5ncyB1bmZsdXNoZWQgdW50aWwgaXQgaGFzIGVub3VnaCB0byBjbGVh
biB0aGVtDQp1cCBpbiBidWxrLiBJbiB0aGUgbWVhbnRpbWUgaXQgd29uJ3QgcmV1c2UgdGhhdCB2
bWFsbG9jIGFkZHJlc3Mgc3BhY2UuDQoNCkJ1dCB0aGlzIG1lYW5zIHRoZXJlIGNhbiBhbHNvIGJl
IG90aGVyIHZtYWxsb2MgYWxpYXNlcyBzdGlsbCBpbiB0aGUgVExCIGZvciBhbnkNCnBhZ2UgdGhh
dCBnZXRzIGFsbG9jYXRlZCBmcm9tIHRoZSBwYWdlIGFsbG9jYXRvci4gSWYgeW91IHdhbnQgdG8g
YmUgZnVsbHkgc3VyZQ0KdGhlcmUgYXJlIG5vIHdyaXRhYmxlIGFsaWFzZXMsIHlvdSBuZWVkIHRv
IGNhbGwgdm1fdW5tYXBfYWxpYXNlcygpIGVhY2ggdGltZSB5b3UNCmNoYW5nZSBrZXJuZWwgcGVy
bWlzc2lvbnMsIHdoaWNoIHdpbGwgZG8gdGhlIHZtYWxsb2MgVExCIGZsdXNoIGltbWVkaWF0ZWx5
LiBNYW55DQpzZXRfbWVtb3J5KCkgaW1wbGVtZW50YXRpb25zIGNhbGwgdGhpcyBhdXRvbWF0aWNh
bGx5LCBidXQgaXQgbG9va3MgbGlrZSBub3QNCnJpc2N2Lg0KDQoNClNvIGRvaW5nIHNvbWV0aGlu
ZyBsaWtlIHZtYWxsb2MoKSwgc2V0X21lbW9yeV9zaGFkb3dfc3RhY2soKSBvbiBhbGxvYyBhbmQN
CnNldF9tZW1vcnlfcncoKSwgdmZyZWUoKSBvbiBmcmVlIGlzIGRvaW5nIHRoZSBleHBlbnNpdmUg
Zmx1c2ggKGRlcGVuZHMgb24gdGhlDQpkZXZpY2UgaG93IGV4cGVuc2l2ZSkgaW4gYSBwcmV2aW91
c2x5IGZhc3QgcGF0aC4gSWdub3JpbmcgdGhlIGRpcmVjdCBtYXAgYWxpYXMNCmlzIGZhc3Rlci4g
QSBtaWRkbGUgZ3JvdW5kIHdvdWxkIGJlIHRvIGRvIHRoZSBhbGxvY2F0aW9uL2NvbnZlcnNpb24g
YW5kIGZyZWVpbmcNCm9mIGEgYnVuY2ggb2Ygc3RhY2tzIGF0IG9uY2UsIGFuZCByZWN5Y2xlIHRo
ZW0uDQoNCg0KWW91IGNvdWxkIG1ha2UgaXQgdGlkeSBmaXJzdCBhbmQgdGhlbiBvcHRpbWl6ZSBp
dCBsYXRlciwgb3IgbWFrZSBpdCBmYXN0ZXIgZmlyc3QNCmFuZCBtYXhpbWFsbHkgc2VjdXJlIGxh
dGVyLiBPciB0cnkgdG8gZG8gaXQgYWxsIGF0IG9uY2UuIEJ1dCB0aGVyZSBoYXZlIGxvbmcNCmJl
ZW4gZGlzY3Vzc2lvbnMgb24gYmF0Y2hpbmcgdHlwZSBrZXJuZWwgbWVtb3J5IHBlcm1pc3Npb24g
c29sdXRpb25zLiBTbyBpdA0Kd291bGQgY291bGQgYmUgYSB3aG9sZSBwcm9qZWN0IGl0c2VsZi4N
Cg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gwqAgb3V0Og0KPiA+ID4gQEAgLTU5LDcgKzcyLDcg
QEAgdm9pZCAqc2NzX2FsbG9jKGludCBub2RlKQ0KPiA+ID4gwqDCoAlpZiAoIXMpDQo+ID4gPiDC
oMKgCQlyZXR1cm4gTlVMTDsNCj4gPiA+IA0KPiA+ID4gLQkqX19zY3NfbWFnaWMocykgPSBTQ1Nf
RU5EX01BR0lDOw0KPiA+ID4gKwlfX3Njc19zdG9yZV9tYWdpYyhfX3Njc19tYWdpYyhzKSwgU0NT
X0VORF9NQUdJQyk7DQo+ID4gPiANCj4gPiA+IMKgwqAJLyoNCj4gPiA+IMKgwqAJICogUG9pc29u
IHRoZSBhbGxvY2F0aW9uIHRvIGNhdGNoIHVuaW50ZW50aW9uYWwgYWNjZXNzZXMgdG8NCj4gPiA+
IEBAIC04Nyw2ICsxMDAsMTYgQEAgdm9pZCBzY3NfZnJlZSh2b2lkICpzKQ0KPiA+ID4gwqDCoAkJ
CXJldHVybjsNCj4gPiA+IA0KPiA+ID4gwqDCoAlrYXNhbl91bnBvaXNvbl92bWFsbG9jKHMsIFND
U19TSVpFLCBLQVNBTl9WTUFMTE9DX1BST1RfTk9STUFMKTsNCj4gPiA+ICsJLyoNCj4gPiA+ICsJ
ICogSGFyZHdhcmUgcHJvdGVjdGVkIHNoYWRvdyBzdGFjayBpcyBub3Qgd3JpdGVhYmxlIGJ5IHJl
Z3VsYXINCj4gPiA+IHN0b3Jlcw0KPiA+ID4gKwkgKiBUaHVzIGFkZGluZyB0aGlzIGJhY2sgdG8g
ZnJlZSBsaXN0IHdpbGwgcmFpc2UgZmF1bHRzIGJ5DQo+ID4gPiB2bWFsbG9jDQo+ID4gPiArCSAq
IEl0IG5lZWRzIHRvIGJlIHdyaXRlYWJsZSBhZ2Fpbi4gSXQncyBnb29kIHNhbml0eSBhcyB3ZWxs
DQo+ID4gPiBiZWNhdXNlDQo+ID4gPiArCSAqIHRoZW4gaXQgY2FuJ3QgYmUgaW5hZHZlcnRlbnRs
eSBhY2Nlc3NlcyBhbmQgaWYgZG9uZSwgaXQgd2lsbA0KPiA+ID4gZmF1bHQuDQo+ID4gPiArCSAq
Lw0KPiA+ID4gKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfS0VSTkVMX1NIQURPV19TVEFDSw0KPiA+
ID4gKwlzZXRfbWVtb3J5X3J3KCh1bnNpZ25lZCBsb25nKXMsIChTQ1NfU0laRS9QQUdFX1NJWkUp
KTsNCj4gPiANCj4gPiBBYm92ZSB5b3UgZG9uJ3QgdXBkYXRlIHRoZSBkaXJlY3QgbWFwIHBlcm1p
c3Npb25zLiBTbyBJIGRvbid0IHRoaW5rIHlvdSBuZWVkDQo+ID4gdGhpcy4gdm1hbGxvYyBzaG91
bGQgZmx1c2ggdGhlIHBlcm1pc3Npb25lZCBtYXBwaW5nIGJlZm9yZSByZS11c2luZyBpdCB3aXRo
DQo+ID4gdGhlDQo+ID4gbGF6eSBjbGVhbnVwIHNjaGVtZS4NCj4gDQo+IElmIEkgZGlkbid0IGRv
IHRoaXMsIEkgd2FzIGdldHRpbmcgYSBwYWdlIGZhdWx0IG9uIHRoaXMgdm1hbGxvYyBhZGRyZXNz
LiBJdA0KPiBkaXJlY3RseQ0KPiB1c2VzIGZpcnN0IDggYnl0ZXMgdG8gYWRkIGl0IGludG8gc29t
ZSBsaXN0IGFuZCB0aGF0IHdhcyB0aGUgbG9jYXRpb24gb2YNCj4gZmF1bHQuDQoNCkFoIHJpZ2h0
ISBCZWNhdXNlIGl0IGlzIHVzaW5nIHRoZSB2ZnJlZSBhdG9taWMgdmFyaWFudC4NCg0KWW91IGNv
dWxkIGNyZWF0ZSB5b3VyIG93biBXUSBpbiBTQ1MgYW5kIGNhbGwgdmZyZWUoKSBpbiBub24tYXRv
bWljIGNvbnRleHQuIElmDQp5b3Ugd2FudCB0byBhdm9pZCB0aHIgc2V0X21lbW9yeV9ydygpIG9u
IGZyZWUsIGluIHRoZSBpZ25vcmluZyB0aGUgZGlyZWN0IG1hcA0KY2FzZS4NCg==

