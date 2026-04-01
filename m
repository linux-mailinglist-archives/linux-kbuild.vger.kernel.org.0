Return-Path: <linux-kbuild+bounces-12512-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJugMIAdzWnOaAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12512-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:28:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53437B3B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1863004065
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A16332918;
	Wed,  1 Apr 2026 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="arNkMOxx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020116.outbound.protection.outlook.com [52.101.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA5317176;
	Wed,  1 Apr 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049354; cv=fail; b=p4m3eahNh6rm4t8yrgOzri+o/e+WQ9LGc11oYOjmwGmHCQEbTErrkVwHex5kOraawEITHdw4QIUxRwx4N5iljc2FvfcVg7bSeppbv0qmcfy4nO/QruIIuIwxtFIbLkyzrZJtoq5ONmnHWz7fdugVM+BuXpAjuxyuN+iu5L85p7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049354; c=relaxed/simple;
	bh=rCz9V5whRh1GCt4VtKh0N7eqENSBwvAZdCUz0FtzIQk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=q+pdrx3+KqlV6Kv2Vc/Z+iWECoCtbWkKDoFr7kTwO63bnefz0lc9mUcA496hle3tcKn3GHP6lYDUpJUG4cdXczmHruFzGVjQoIvZ0XorHsImEHL5annzfOECxW1WQwhrT7Jg5BN831SHOvtTdKbnkRygh9PJX/JOYEDbd7Pwmgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=arNkMOxx; arc=fail smtp.client-ip=52.101.196.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLKQ7kn7q2e3TynTC7AHPRA9Bhbdh3Id2vHR5JPYQlekmn4COz0CBdTswyQc5fl3ppK4opF+GRVnRAL083yuzlcy0L8WZpj4Zx1ayjI7wxK3MehioZ3CcvN/3JaczmgJwtqrIYPXqBZZmg+ZhWhBvhvdWpkixfcq2no8LJLmP5x9nG6xXfUoaEgB88RYDWJ8P8Cv7/9AkuaA1xOhoeufKSpHER8pyPFrinuCAgReWEYNqSofHfvnRaRl6v/f06dVOYdKjPZg4a7HWfG9u1NXIodtVuV1jMa9W/YzYxTP2q521uVOW9b8gmWhyAZMat1fstXY+sNJZ1te+mjFJGoqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsZkZf1XDbf5wuXxn2qNrjibmLSMeO1vvLnvsqvDcUI=;
 b=lJ6VpF1KfMYw0nOUe0CmY8p8OZf+3Ia6EqBEWhyRnSd9iv4yGARpbS0EmNwyaRSKw3OxM++nFG0bklEFuX6afpSN41wujXh8SxFDGI5ClkLIqD0ynWdn9vDrA3n5JT5mUOBlg1AB5KydJ3Kbi5bNbt0V1kKw8yhe5MAwFyCE86wbjpzORJlvC7XgFvs0Aw4wTsTlHZaIE5YZCe1+3MvYuPLSKGCaLTPsQlHJQe886K5t7rysxsk75Z8CJsjWWNIGrHW9DkhJvwlYdbWLWwJKVwWA2E/OSF/yX2LV/nSylVkpWV/tOCtvTB7H2CXtpyPLRsbM28U2OW3nUufF1OXahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsZkZf1XDbf5wuXxn2qNrjibmLSMeO1vvLnvsqvDcUI=;
 b=arNkMOxxKcKRdV32usyNTTp0aU70b7vEkMrXXzjx83CHXQ2+yRpQm7JZ8P6mu2EaXhYzU5VQdCQA5ACLgnkjw6AuQbevuiC26+VcFZ29yur12pb68YYc3v/U2ODfIhxi8cV2vJ22aQxRoetCgVDsWaOq21IxjSU3r86/x2Ef+RI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB9164.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:49f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:15:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:15:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:15:48 +0100
Message-Id: <DHHUH9HNFQ5J.3MDYNT5MTO2FC@garyguo.net>
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
Subject: Re: [PATCH 02/33] rust: bump Clippy's MSRV and clean
 `incompatible_msrv` allows
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
 <20260401114540.30108-3-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-3-ojeda@kernel.org>
X-ClientProxiedBy: LO6P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3fe9ff-766d-4383-fd8b-08de8ff0cb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/izQBz2lNs9AfErixq3hHBCeP1y2Mh9T8HmExEp/FqA1rBkNxOSw1yO/zqCc7xCJWWi5qvZ9Vya8OQ28nxjmNgytvQVij/IVVi5qfbF5oZtX6rCn6M9mf7byJl1CkBgJdSF0j1uZ+WbRTmlmxv8GLD/VEyiGSVnD4t8j6rEOG35rrDxP/WBip3/oqJrj0zvAta2vjHrLppr9JTkRxqXZM9UzDT/G74+i/wIn9sSD9BdFguQnOeyzMhBsCUmQ2SJUZPqt6YREeqleQrFdVNgEF3XKNqaGFBgMEdZdizAcJxTUSNEDR+CH9QZZh0tOOMMHXV/Tn3O7RDbXiUM8F7TqYKL2BS8LLYXWiT2UHeJWuELHCD3H1YC86Wgi5GuW7H0Bm54Odzw5h5BawmcU3aAOPCWqLO+ZlsWesSXPagOquzVmuLAQ9Qrv4spZ/0+uLAtn3FIP3nxqHm+SeCN9vcAVL3Hv/6wXT/C8UeZiNxb76JAkTgjAcdvdfcohhkCUqmEi4gMuAje1MlpsPJafqF7wf//i8Lx54RKzcFJWB23h7K8tivaKoWVkDZsxIPWITwE1cX3bi4VsVKolrAcptq52PITn6bLw9o40kqmwDqcG9bJYzuZKGy8k9CEEyGKBCW5vL9tUevYZ38WvQI79x66ENVVhImwHW8WnBo2zAy0sirJVgIIN9Gtk8BnqYYhDHsa8ezGcvtnGTjBljLzWhNW2Dp0Mt1/hJcyr+ShxIq/daz8mIm2xSJpLXoyTtvxngAWhovtYaGd6aJDIVZNpQnvnLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHFMbkVrcUdqWlJDeFkzQXc3bUxGRnJtUE1TSzJXQmZWN0RJQXFKT3RMQkhF?=
 =?utf-8?B?VzM1UUNGaDE4bU5nU01LVUxZN3RzeHlEOTFlbE1HeFcvZnNZck0zNXJqR1pt?=
 =?utf-8?B?c3dKMUZwa1pTeE9JK1NyQmY1dTdtQ3ZYTmZPYlFWZGtKaU0wRElWL1MzTmZy?=
 =?utf-8?B?L2htTCtaRGpGZGJBc2g5OWtzYTJ4UzlydXV3WWoxT0pFVnJXNVo0b2xmOERt?=
 =?utf-8?B?ejJIcElIbzRiOExRaUJHOGU4elBidlRVRjJFSVl6R2pCL2dReEJJVllhalZB?=
 =?utf-8?B?Mm5NMjd6d0c0MDVBemJTRGdTMXJuK2lraDZKbGRQTjRyMUt2NThSREZ5RDRx?=
 =?utf-8?B?TDhwTEU1ZkkrL09wa000SEpxZ3ZxR0txaHdQbURreXNOSmlZR0hzd2wvSGVx?=
 =?utf-8?B?dGI1Nm9kOTBIeUtxV1AzcFFyT0JldE01NEFHRlY5RW1oak1ZQzZ6TUlLUGZr?=
 =?utf-8?B?SE1jOEU1dWlGUW5BWnNSK0ljU0RWenVseklUR1NMV09IOEgzSmxpcEhpUFdD?=
 =?utf-8?B?UmlUYUJvUjIwMUk1TmFHN0tiYndEc1ZwTG9HY0MvdGRWRjVJNmo2S2NCeC83?=
 =?utf-8?B?NmdLQkh4S1lDUnZpTzBjTmFQZ1hDK2dQek9hcHpsWGtiZnZSM1pnWThSbWk2?=
 =?utf-8?B?bU9LaFdaaU9XRkFYSUVMazBwa25yOHFDRndtWjRvWWI5UWNSVXd5YlV3WkFr?=
 =?utf-8?B?TXhlQVg3V2laQUVjK3F1aHNJamRyaDlaUnZSWTFDQ0VmUzVUY3lHNFNOaXFB?=
 =?utf-8?B?NEZkdXVWMm5HaUU2RkhxNElocXBnbWhyYUZ6a2NhYkNrVVdGWkc0N0VIbEUx?=
 =?utf-8?B?R05YaXl4MVE2TnVBWHN3cnBJT2VUN2ZJbUlXeDJJZllXc1NhNzBjT0R2akts?=
 =?utf-8?B?aXR3OU1PSU5SMkYvWGU3Q0ZkNGVWZ3I0YjFvQVVCUGFsRVRXVEIxd3Fzc1Zn?=
 =?utf-8?B?RHpYdHd3dVpYYUFFMC90eFZTWk5NZFlLSVJDWVFNMjFoR0V1SFliYW5jMENZ?=
 =?utf-8?B?VjA0RHZmVGZoU3NoS0svM2pMVklYNnZEVTZ2VGk0ZktSRWd0OFdvcnRzcmpt?=
 =?utf-8?B?YUhRdlZkdFNpYWRVYnJxTFhmWTJoK2hpSnRzdjBXQ25UMmRXTzMrZFMwT0p1?=
 =?utf-8?B?Z3NGRmdMQjMwMEhxSERYN2NmbmJkSjQvd2lCR2wrdk9ZNGE2bXd1VW1NcW95?=
 =?utf-8?B?SFVrdXNvWFE4TGlpZ3gzOW5tNFk5RW1jN1lpaTUxQkVFVkRGU0N4dzZaYndq?=
 =?utf-8?B?U0g4VTVNWXVnUWgvK2hCMUwrQVFZKzNjZWg0QVNlU05BUEc1UmgvZ0RFdUF1?=
 =?utf-8?B?ejJhL3gybW93amtMTGdaRjhiWDZhL0x3L1BWbHBOenFINHcwUFlVR3d6NTUw?=
 =?utf-8?B?dEM2NEJIK2pvZ2lJNFFvZHh0c3M4ZUhJZ29mdUVKWmNYWlJwT0JaVmFqN2FU?=
 =?utf-8?B?dUZXYTlnNFB2M0M1NFg0Rk4zUFBlMGdtRVBvRko3dUFkK3ZjRFA0S3R2S01G?=
 =?utf-8?B?RlBoU0ZmLzNHeGZabEplMlNHMVBuNEtwN3ZSR281eUhuSStPU0tiR0QyZks5?=
 =?utf-8?B?MlFjN29xMWtUMzJhRU1Ia3BtQnVRTmxSOEgybFZ3TWpLZVZIdjRlSWNvbWli?=
 =?utf-8?B?UHozSXhiZDRrYmFnQWtFU3g1V3hWUzk4THRON1I4aDQ0NDlXOXROQjJMV1VG?=
 =?utf-8?B?cytKWE93WXlTL1M4cE5uSTNOYVVQeCtpTE1ncHNNR3FFNTBQdTB0c04zaENs?=
 =?utf-8?B?MXBBWFJmUXNXZFFPZGFKYjJ3dWt1ZEVzb0xsNXdpa3o4OHN3MGVKUG83b1V0?=
 =?utf-8?B?Y0RCc0tzSi8vNUpKcHNLOHJhR2lGSUJ0SUQ5c0FHc042YktMcy9Eb3ZuZlUw?=
 =?utf-8?B?WWdyRE1aYm0zTHNTMkxCdWQ0SmJKOTdmWnE2VWw5K3FTWTRDWnVxSktNc3g0?=
 =?utf-8?B?eXl1cG1lM2Z1MHBuNXg4U1pxVHM0V2xBcVMrMWdmaGtiam5IZDlYRFFaQldn?=
 =?utf-8?B?a1lKK2JOZUo4bUJzK0lVcmwvNmZXd1FtQUgzK1ZGZFhtQ0Q4czg4aVRsNlBL?=
 =?utf-8?B?TmVWZTNkWDZvdVdUUUlTa3JUb3pVT21CZkRTWFhoclNmME53UDdjZk43dGNu?=
 =?utf-8?B?U0xoTzZWWmVCY20wUUJTUlNiOHRsYUtxMzBEZnEzc1Z0WUMxa0RjVi9XbzFj?=
 =?utf-8?B?ZUk3NnNSbGRBekIwcCtEUmM5cnBmdnk5NUxvOGVyazV5cnNGRDFiK0JZaGVo?=
 =?utf-8?B?MHFaTVZuQ2M5bzVzbU9tWVlRN2t6SkF0Tk82WmY2bkdYOXdVa3c4UWRkNmZW?=
 =?utf-8?B?d1YwZmR1M05tN0l0clJRbkhXcit1QnJ1KzlHWDBJSTh5c2doNXFwUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3fe9ff-766d-4383-fd8b-08de8ff0cb38
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:15:49.8536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFcGr0XEQFPmEVrUDvW01vHLZsBeQghIxDvxvBOl0DYf7rdH0ThvGDzzLMF2Uy+A5DDmInyIR+gasTlBOvi0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB9164
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12512-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 1C53437B3B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Following the Rust compiler bump, we can now update Clippy's MSRV we
> set in the configuration, which will improve the diagnostics it generates=
.
>=20
> Thus do so and clean a few of the `allow`s that are not needed anymore.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  .clippy.toml                      | 2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs | 6 +-----
>  rust/kernel/ptr.rs                | 1 -
>  rust/kernel/transmute.rs          | 2 --
>  4 files changed, 2 insertions(+), 9 deletions(-)


