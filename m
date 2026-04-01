Return-Path: <linux-kbuild+bounces-12515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLqaKFwfzWnOaAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12515-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:36:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8F37B53A
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D740302DF6D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1314A426D17;
	Wed,  1 Apr 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NcWiwd7V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021116.outbound.protection.outlook.com [52.101.100.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AFD423A8E;
	Wed,  1 Apr 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050099; cv=fail; b=PGLak+YyPti4ygS7U6y9vpPGDn86vpKAf4q3iEL3WM0XO0AE+BCQgsqY91pV1O5HyY1DqiSRybqMiZOS5JoiPmksXHY2JwzyeYDtAvVOSnB8BuLP+piwe5AfxWD75oakzBZISODJQdDoVmyzxiyaxp9tLoFzUmbazyrLDSsS8aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050099; c=relaxed/simple;
	bh=IVj1D4hRgDh4mIY6YBKxRqvaLnHFqooMzSAy2Wd4tHE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PV5VTUXUOoyYZ4jTjsvosM5zsDruVl/lcbetnl7286l5OMh4HMh6zZiQWYuAwCXsT05GDTF4a/70v/EovsNIEwK1KSzqC0xs9p0+bsAR5KvJif3U4JWUHMQtdMO94LZiHv1e9OVY6tWr7MsymCYBAzUQARnJiljxFK/fIDtyQlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NcWiwd7V; arc=fail smtp.client-ip=52.101.100.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONAMzrYdTF5D1mj99HKr6E5VWiTeq5eJkeNOHm1RfHuZ+OhDTcTk3TCkWCkd7oZTKDluRRdtv7pYJQiup4kcpzdloUG/0K99jR1UuQhmU6VFy6+ztWofq7Vrs8/fOHrDGGw6SnhToDJR2wu1dI9GrYAiuFPztm18K0HXkotOdV63Jo48zueZju7L1LXbcAJTzBTenpWusEOCpO14/2KQAY0Pd2CJtj3YuHFQwUyIVFuwdqHMZZGDQamP4toq2u7MipI/hd6gkfGu0QoMXYX5pAkUO/OrLGdyatOtpuXpItn9Qo8IKMYWpfMVxMm5eaPk98OW8lBB5yczKZUYDnu1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD5QxgfQNuk28UyZBunkjD2cuPT3HwKYLpY8sumN+QU=;
 b=gYrmmxUsoIBlbxn126wOnqJes0NnKE0iJCUqfbYYIXcyieo9BU8cMlZJ6Gvrz/px/Gi7JHtGXYXKHiAtkd3mc/QLxjM4Rexw5kMKcs0NlF2Yem1ZCM1J4EfLev4eH3mJWBrvUe/46AUEyIN9bwvlePxmql1nh/5PpBhLaZ4L9ct+6TdTh1ZzKv6r46WKoFHVxW3pf8oHmfq9EcEm0XUtr2G8IdyRLqoj2UzsiqGhA/jVhnggad144YR95je1mzJ95E4DVoQwv6QiXaAle/toOBZtGLNZ72AHwgO6fIv6Q8aaIHpEdTi7bwsZQ9g6E/UgbvrckLfXyFE8Zus1ILbmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD5QxgfQNuk28UyZBunkjD2cuPT3HwKYLpY8sumN+QU=;
 b=NcWiwd7VAVl74dMjp/EemsevBNIMM4qz7iS1Cy37qfVXkPkwCJH63jPRRetxlI6bx4a4hh6ZP7CiLwfB+n/7sTMkG0oJszGuycXyoLu3BsWuMXGQD12Jj7PJ4iWE0bNceG5Oc6nY7v4O1dsx/bgHLcmNEvccM/ZBNmBRwOy7l8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6837.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:34b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:28:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:28:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:28:12 +0100
Message-Id: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to
 1.85.0 (Debian Trixie)
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-2-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-2-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0520.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: c7052c31-f176-4839-abee-08de8ff286bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3IV4a9u4tY+Sm6e3Bc9NS2Cl1vDT3wtenBA97zbBmC16TLVc/WCSZkRWAqLj+Aodz/iKqnpwFIdTv9R9pUkB/n4RRrz8yjWa3tolZ7+GGa6XB5jpciz7GJtd/Z3lxR9DkbPMOALT5/lvyRM4IKMAdDUywq+kyG4ncrOCRa2zh/ZgLWFsm3CGyWJssSUrdzJCd6EJhhSUFVwdItTGXs7kfKmRRSrTHkmxKFH2pOWEUakGkku1aLBHhBxKhg53f3Yn+rAUrhHWaYm7Dt4OWBv4iKPMojW0uBMewHWi+X7HaDe152Mdq4GyVh0c21bjZKkcWV+J88t12UJiONsd83U4f0TbyoKNcTocNRlfJI1kRlKF1UkFEzRAtgoSifpYzgOWUbYQKzTMMHs3Qak9UEOZCONWriVp29dU6Q2Se9xKuy9wmBmuXzzUfuqxeFsgCo19P5Jd8gbEg88W1sVx+HSOMGToQCMvKD/uSu1pxosQUnilMKE3GXBceVe1n2sv3/b3GFue9zevHi/002RmeChr4NbRAnPXfeZM7g30/9XI7cNan77wyxbI2d5Kvrcj+eKAj0r4tMV7+syoy/5I/a9ICFMPxKbEyc6W8rqVy6hvU2XGkUiRJxn+icqtUW6dZzt/srt6Py3QJbmPG0vxhTyPsUW420UGhBnqTc6Ki9zsaohPFzNcpxd6GrLLW+WslWhLUJbdpEMpoKriaTbWVmuh8d2eg9JYzk3GJFVqCEIuC5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXJyczc5MmFhVzFyaFhlYVNYMlFDa1p3WlNaRStHT0lrVllEUVlVZHlXNDNI?=
 =?utf-8?B?V1hhWWRxdSt6Y3ZZemFGTGNsamdqeDlRSk5BeURzZFUxTFp3Vi8wdnlBOE1U?=
 =?utf-8?B?WFlFdk9wQXowdUNRTTBybGowV3hsemhYc1orWFl4WXlVWWxFTmR4dG0rbUNY?=
 =?utf-8?B?bG5LWFN2VEFIQlZnNEFodWRUM2NvVHNlL1BZYk5OejJ0TnVrWlZSUmx4aDdO?=
 =?utf-8?B?OHVSUVZiSVZIaXdXUUlJcVVwc1ZOY1hMeWI0RUNPTVdQTVdxNDVrVVlBb2o5?=
 =?utf-8?B?TFRUWWdCSmFRdDRJSEZJN0xBMExlL1Jkd2Jwd2tNb0F4MEJOdll5SHUxT243?=
 =?utf-8?B?NnJTblhxdnFuVWs1c3NRRmlBakM3TStIUWZaR2prT3BQNDZBR0o5blBjNU0y?=
 =?utf-8?B?aS84RGd2cXdVMmFuRVpBeU9VSjhWcGU0ZFFOSTVtckE4eGFLM05NczVpNXpY?=
 =?utf-8?B?bTFhZkwveTJsVFp3ZlVPaUoyWHZQOW5tSzd2Z0Z2QjI2dllGUGRLeTJvSXFo?=
 =?utf-8?B?Wkp4MjNGOWl1RFRMajd3c1dVUkd5SU1GWHFseWJIU1BkMVFTNksvQ0U1Y2pk?=
 =?utf-8?B?QldzQXUzdnZqOHQrbUtyRUg2R1pXOGl2dVZVd1NWcjZWdEFZRThTUjR5UXdD?=
 =?utf-8?B?UmE2REl2akxhb0I1UHBFdUI3dkhWa2JHNVc5QlZJQ21ZaFZ4UEZsK0JOSjJm?=
 =?utf-8?B?ZE1aaEllN1d5QmlZSEFzeUtiUXRqV0dxbjhzMVFKc242QVR3MTB1bmQ0QXBK?=
 =?utf-8?B?aHFzSTdkRDllbG1aWWgvZlluSDN3RTlFYTcrNXNvRWhrSTJhYlFRNjVLVDFu?=
 =?utf-8?B?ZC9QVnJaTDBiVjZlK3g3dW9pMXJRVU8rWXlKR0lPRjJrNnlzeVREVWFqK2lK?=
 =?utf-8?B?LzNQVThBMUNURWVJQWNQbFFzTlBRbWxNNy8zVFRwaVNaVnd0Wms0UGpaY1VC?=
 =?utf-8?B?aUhFMlNVdVM3WnVWcVZaN3RyZ0JqMENkQzRGWG0ybjVIVHp6a0psblRzbzhR?=
 =?utf-8?B?M21kUDJidHJlRkxud0dGdU5Ic3F4YTg2YUhNNkN2dVlQK0VOYU1zbXF2VVpG?=
 =?utf-8?B?UnJUUjBPblNJT0JxRm8xM095OXEwcFZHR1h2RFZ6M0xna0dKN041OUpXUk9P?=
 =?utf-8?B?aVh2bWVIc3B5SW8xR1lnQkhhK1VuNGtuNjYxYzVMZWlacTIrQmlJUktuRDcz?=
 =?utf-8?B?MGx2OG9FRksraFNyelpjVkNBWU5KRnlpajA1b1lBbUdQWEQyaE5ZbDJ3c0ZY?=
 =?utf-8?B?UGwwcHhHbFBYaVJ4WENBWUZYM2dVOEdqaTR4OU80RStoU3gzaDhMaTJoQ0pj?=
 =?utf-8?B?eHpBQjBkZXhtTWpralQ0bGpaTE5CZy81Q0VnOHpZRmR2Yi9rOGNnSDJlT3FQ?=
 =?utf-8?B?ZXhURmQySkZyMVRkRFJRZC9DSTJUVHFoZk96ai9rWG9WSmRKVnRndCtyclhU?=
 =?utf-8?B?NWk5eUdrYW9HeXd3QU1vTHNuRHdIaG9FZDdJTVNnWXlhL3luR1RaRmpRZVRC?=
 =?utf-8?B?N1ArOHFaMHZLRjJOcEF1cm4yN3pZcVZGcGFMQ1p4TVZHOU5DZ2FKS0VVY3FC?=
 =?utf-8?B?Tlhxb2tTWmxXTFRwc0VoL2grY0M1YTJVWmwxb3h4QUo4SDVKTW00cHg3anZX?=
 =?utf-8?B?NWh0c1M5Z09rNGRzY3VybHZ6ajFqTEdqM2RERldtVTNUSXhwYVR1aGcwMmVR?=
 =?utf-8?B?L2ZSS2U5WmdvM0lSdDhEQUxTTDBLQWkxTlVBai82eWFwWlYyL25NTEI5ekpG?=
 =?utf-8?B?K2xLMnR0eWVRQ1l6UWlGSmJtQlhLYW1BUG92c0JmNi94c0ZIaG5CU2NxelV6?=
 =?utf-8?B?TnZ6YktxWnhZR0xtaTFTQTFhY2RtY2syWkdqZ1daRW40V1NJSXR5N3ZGNHBw?=
 =?utf-8?B?SGFOeXY1L2Q3UEpIMHpmMlZkdXFRdm1SRkJhRWR1Tm9XYlZjUTd6YjNYTjJ1?=
 =?utf-8?B?NmZhVndodzE5Tks3VWNXWlJRWGpTV0tDMDdTWCtNbjZFYlQ4bGh6TTdPcFhl?=
 =?utf-8?B?Vy8wR21GUTFmSDMzWURxOXE0SUowRUtCT0FnWVZWR2RCdGR1RDRqbzlYVzd3?=
 =?utf-8?B?d0w3ajJGUUhNbW9FVjdLTktqSjJOT3RWajZaR016NU15SnNlYzBlNHVRK2V3?=
 =?utf-8?B?bjh2aW52MHdWeTZBRjhGYzNPNEJ6d2tGbyttT01laFJnZTBiWmZyUjM0dlF5?=
 =?utf-8?B?SFJRUFlJT3crZVVDbFB2Z3k4SDliUU90eW9ZanQ5bmRqVitFTXAyRkZLUzRk?=
 =?utf-8?B?V24zcStldG5yT2JISnh1VGRVWjhiMHp3Y1c3MW1pdTdRVFRmeWtsQmowTnI3?=
 =?utf-8?B?Q1Y5RnBkeWIzRjZFSGZTaUlYaE5KTjNSU2JQaWZUeStJdGNUMUVzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c7052c31-f176-4839-abee-08de8ff286bd
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:28:13.9409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NH7Z09LyQ6eDsKc5pS2JBl++0iejE+oFHhupkoHi53BqIVHONGa0erT2BaLIi2lK/vgqE9FxUiOuwrlo+W2JCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6837
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12515-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,launchpad.net:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:url,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 5CA8F37B53A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
>
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
>
> Debian Trixie's release happened on 2025-08-09 [4], which means that a
> fair amount of time has passed since its release for kernel developers
> to upgrade.
>
> Thus bump the minimum to the new version.
>
> Then, in later commits, clean up most of the workarounds and other bits
> that this upgrade of the minimum allows us.
>
> pin-init was left as-is since the patches come from upstream. And the
> vendored crates are unmodified, since we do not want to change those.
>
> Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
> Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
> tests can also be updated, but there are no suitable ones to simplify.
>
> Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
> provide versioned packages with a Rust 1.85.1 toolchain even back to
> Ubuntu 22.04 LTS [6].
>
> Link: https://lwn.net/Articles/1050174/ [1]
> Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.h=
tml#desktops-and-well-known-packages [2]
> Link: https://packages.debian.org/trixie/rustc [3]
> Link: https://www.debian.org/releases/trixie/ [4]
> Link: https://packages.ubuntu.com/search?suite=3Dall&searchon=3Dnames&key=
words=3Drustc [5]
> Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/process/changes.rst | 2 +-
>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 6b373e193548..474594bd4831 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst

This diff fails to apply on linux-next, due to conflict with ece7e57afd51
("docs: changes.rst and ver_linux: sort the lists").

Best,
Gary

> @@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>  GNU C                  8.1              gcc --version
>  Clang/LLVM (optional)  15.0.0           clang --version
> -Rust (optional)        1.78.0           rustc --version
> +Rust (optional)        1.85.0           rustc --version
>  bindgen (optional)     0.65.1           bindgen --version
>  GNU make               4.0              make --version
>  bash                   4.2              bash --version
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 99b5575c1ef7..a270ec761f64 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -31,7 +31,7 @@ llvm)
>  	fi
>  	;;
>  rustc)
> -	echo 1.78.0
> +	echo 1.85.0
>  	;;
>  bindgen)
>  	echo 0.65.1


