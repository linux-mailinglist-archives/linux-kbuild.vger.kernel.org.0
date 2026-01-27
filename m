Return-Path: <linux-kbuild+bounces-10911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMpoB9NJeWmXwQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10911-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:27:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F949B61F
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 00:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A52C13011C79
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788522EC0AD;
	Tue, 27 Jan 2026 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="G9nR2KV3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022095.outbound.protection.outlook.com [52.101.96.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B52EBDCD;
	Tue, 27 Jan 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769556427; cv=fail; b=PjIOgw0wV8jZmkmyMYMn83y+TDIYL2a0rbwZ8dKLhOJ1Uec/bmmbGE7imn4+OKuxcA5Bmw42XaCczqmX8SWXF2BQEETvTvFlU8iNLURFs5Yrdl2xHjeXVyXQ8YyRORy3LuYRGJDDUA2+mt9Siw9F+jojkBFPw2LUC8XzXhFaeR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769556427; c=relaxed/simple;
	bh=2E2HMpgMLmUGPklCnaoBvBwnBEjixLnMAzyaGEPnfKQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YuQt4HQL7LHlSPCyiQ5WTBpa57H+MEfcdmxHuqUk4Qq1A8oeIuGYNdOBb5JxOb3z7CQ6Dj3GgobxYrl80+h2/Nte5q8ufDmZ1KT5DXNOmZPmq1vci9bh+c3mb+vF+fGPeVJW1QMQUuBEp1QhY4Dn0Cy7EBb3bDxmu0wTHydVb5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=G9nR2KV3; arc=fail smtp.client-ip=52.101.96.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciHgCxRfD1X9K37U7EQNdnpcfokm9LVHC+IPUXrIldTYTKejueOeEfBQIA3P2RtG91TCA6GzmJQwg4BNNYudrn2vr+2V6VUSVd2FMANfIGZciEOt1KfFZfGiLD/DLLTAAZzFjPrtxUWzub422/w1lWBfWPS+VZ5LgPHXr4vwodYCzu3ZPRQhGsEaiiNzbeiQjIIQTwHl3ojeoxG4Rcoow1akF4ymdeqCZ07zQwvWP5QoCRdGYJutLvhMWbbB5qDWn5oLQNx2cQ8Z0qVTQegtl5FMPsP75YgNmKbaL2t4H7c4GsinQRy189En7bx3Vnn8fZjTRAD1ziWoyb2g5Y913g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E2HMpgMLmUGPklCnaoBvBwnBEjixLnMAzyaGEPnfKQ=;
 b=hwkv1V66v2AOLwymLbeN4+Y3efaIKgY9JOzynnr2g0SbDwhvYOoYM/TBu1nnHzvy8wPcg8N14d7ucRGd1B6wtBtbsAq1EZCfVmOb3OrnbbMKin0bmIbZasSTF+Wmx7l9xByEhkYL2q83ufbAAPFKYphXuTs2ApI1trMYjMb9xooLEFsMnPvkWpvTSbZpnpKmHujX6rl8w/7kZ4JquaPLQvDIu8P0F1i0jR9uoVCvsPJqJfE/yXcuQoJ012mHS7yqZuFIXEJIddr3m6z0WxuuHqZakkkIPN5csMNFljK6atL97MPpd25+LJ2JegpW8rvFPVPnEAZbWhF3IsyjIcbcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E2HMpgMLmUGPklCnaoBvBwnBEjixLnMAzyaGEPnfKQ=;
 b=G9nR2KV3SIdzeq17kDdZtPLNuw92zm+I//Y703vqMPrIYHNy1/66BkCWqg/iw0b1qaOMLwLXtTHwpw++CsYoWrp+WmaDHyqu8QnqtxUoFqIEO5W6i2H4RvmT1o9GG4zyuCoL9OJHNbG422WGxyg1E9/eaEhUMp4VXsqbFUjUQ80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LOYP265MB1968.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 23:27:01 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 23:27:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 23:27:00 +0000
Message-Id: <DFZRED86Y1CZ.1J57GLBRJP1JJ@garyguo.net>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Gary Guo" <gary@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Kees Cook" <kees@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org> <20260127221531.GC3382807@ax162>
 <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
 <CANiq72nK2K4mZNnpJSWP+Z1h3hkwSLtN+FOWKzUYdEJD92sU7A@mail.gmail.com>
In-Reply-To: <CANiq72nK2K4mZNnpJSWP+Z1h3hkwSLtN+FOWKzUYdEJD92sU7A@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::18) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LOYP265MB1968:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c19f7c6-665f-4691-b8f1-08de5dfb92ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVIrQkpwS0VVNUpDMnhybkMvbWM0WUpZOHVSWUtOMFRhWWV0dktwMnZ3YVAw?=
 =?utf-8?B?d01LVlR5NXUrZEFjaEVzd0RlQTBYZWY3d3FjdmZiUXREeGxKbE1vUDJnVjBG?=
 =?utf-8?B?WDgrS2V3NnZ5Sldia0YvZ0JHMnJscHk3eHBwbTRORW52SVZhdEtRNG9RbzR4?=
 =?utf-8?B?VmRzang1TUd6REdqYmpUTWhHL3JVNnlqZ0xHZEdSeDlvUlhTM01uN3ROaFV3?=
 =?utf-8?B?WkFjNFQyTURadmJBcWJSVnJxcUh4SHhOVzJzYXNFYmlCWjVFTXhya20xVjky?=
 =?utf-8?B?WGJaQk1CaVA0SVlTR2xYaFplRzE1elNWcVRER09MTHl6TFpRZ3ZoVzYvMHhR?=
 =?utf-8?B?OFhuR3dpakd4MGxaVlpReHp5ZEJSL2Zsb2xMS2twTkQzVzJLREdOdDluUEJW?=
 =?utf-8?B?REhNVXpuZEdkbWNVNVh3dnorUmVpNVFqb0c4YU5BWWltMkdoZEcrdzJQUlhr?=
 =?utf-8?B?RG9YQzR2VmtoaEVSYWx5bjc4TUplRW90OUlkWFpIWG5scDRKek9NNVV2TGsw?=
 =?utf-8?B?ZEs3WDc5anNod2VHN0s3UzhVYmFFTzM0U0pYVDJnblBsaFFwQ1Qvd2hHN2dJ?=
 =?utf-8?B?cUg1ckhjWHpjdzJ6d1VBUUwvZ3ZlMUJrNVFBdDVnSERUQ2VXMGsrNmx2dGU1?=
 =?utf-8?B?K0dPK3lmZjFaUEJxQndPVDlwemlJTzFTNXBEdVVra1BLNU93ejZOK2NXeTAv?=
 =?utf-8?B?TWVsRDdYaU9rb2c4bTV0MFhrZVJ5ZmQxY2FwSWlLM1ZXSU04RlVzN29TdEx6?=
 =?utf-8?B?RHQwYnBBSkV2aFZmT1FVcmo1cytzN09RYTRSUU1ESnltaTB5TFlmVFEyOTNN?=
 =?utf-8?B?NThVQkJFVll1ZzNyZEkzcWJnZkxxV0xaakJ5M1BqcVFkTjJVVDdwZzVjRkpX?=
 =?utf-8?B?dTZjb2xmSEpKTy96OUFob0JmclpMUjg1MDBhSGV6TzcwUzArTGFvMFIwci9p?=
 =?utf-8?B?a2NsalhiL2psd1BrSGFkVkZJUVJaTVYyelRKMnFnSFZjeE5QUGRhS3NJU3Bs?=
 =?utf-8?B?UGl2bVhtTjZPdzI2NkR6dVptZkhrdEFXSlcrSHVhMmV3RVUvUGdzTUpicDRG?=
 =?utf-8?B?c0w4WWdqYzVoeFFPQjltSy8ySjJQblEyZVkydXZURlR5VnAxM2VGSFZsdmtP?=
 =?utf-8?B?cUc1d0kvTlF4YVlPMlpIQmMvU2ZVUlZPcmlCR3ZsbVZ4UWtCeUk4cURReVdP?=
 =?utf-8?B?d0VNcnJER3padFpvVlJUTE40OXk2SWMweks0SGVTNHhDeDJWK1VCS1VPZUJn?=
 =?utf-8?B?R1ZiaGlRNUczV3hlbnZSNlA3Z0xiZ0txSUxOd0JvYmV3SnNsLzF3dmpuTTVM?=
 =?utf-8?B?NHR2alh1TkN4cVJpeHE0ZDdXdGJ1cTJkb1gxdkhuMm0xMTBocTVlaDhGZkZx?=
 =?utf-8?B?cU5yaFk5OWhNTStlM05TMEFtbVkxQnlNdnFOc2pYRXFSM1FkRThGRkpmWEFI?=
 =?utf-8?B?K3ZBaFBVU0JadndFVGpWMUxPYVMyMUUwd0F4c2g1bkovV1J2RHU3dGtidjAz?=
 =?utf-8?B?MHhqSjFmUnUwYkJqWUlhY2tYWmg5STBVUWhXRHJ4eWhEZDg5Qks5N3hSTTkz?=
 =?utf-8?B?UFcwZ3hPTnpRZmVGczU4cXowZDcvVjEzcXFCL0V4dVRhVWJISmxJbW9WK2gw?=
 =?utf-8?B?djBOSEVFOXRWMkRmMzh3RWFkQ05BNUFjTVFkUlV4UmVuTGhoKzJ4SUNBTWoz?=
 =?utf-8?B?emZ4RTJpZmRyanVOV0Nmb0tUaG8wQXo1VC9iMjk4NUUrRjdsRHFzcThEdHdF?=
 =?utf-8?B?TjJWaFJWTjh1aTdCVExlVDljL280eldvVysrSS90MkVPZWxDZnNDRnliZndU?=
 =?utf-8?B?aXBROUlvNW5YZXV0RXNBRXkzZW5qdm05SWtmSmc3ejNUZWNYaVBoTmNocjBo?=
 =?utf-8?B?dldGT3dDUmxCRmpRc0YvQkJhOHB5b3JMd2ZVWGErRVdXYi8ycys0amg5aWt4?=
 =?utf-8?B?dkJnOXJ0eFVSRjJoKzhuYU5VSGRGNnAzbXZxcjh0eHgwcy9FS1hvY21vd3JX?=
 =?utf-8?B?dmhLUlNMSWxWMGQwenB5am03UXZ6aHloenNWOW9TZzh4MmhRSVU1M0pOaFN6?=
 =?utf-8?B?Z0lHbjYvK0k1bVE2eFpURHViU0liU2RCKzZHRVB5cWtHU1JmSWpuOG9LRHRa?=
 =?utf-8?Q?LnOo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MER2T2xyV2g4bE9VeXhtNkNPUlZKQitYbTVrSmVNTjdLNXlVYU0rOTQ5bi9T?=
 =?utf-8?B?N2Fvc3cvcS93QmRzOFY5dS9VeEpqeXZxUnNEdTI0QU5URUZkWHpkWmQxZEhT?=
 =?utf-8?B?YUk1WUVINlg3NWRjWFU2Ri9PVVcrVGtIaFB6REFDeU15Q3cwT3kxSkxGc3R6?=
 =?utf-8?B?d2NqL3Znc0FIS2k2MUZRVDF3OWt3dEFEMTdiQ3R1SmFoSnhzU0NyR001WVVB?=
 =?utf-8?B?WmFFbEp0Nk1lVlFaUGw4QWhRaEo4MFhpOHZ3Zm45em1MeWN3VHZVekZ0cG53?=
 =?utf-8?B?dmNSMEFjd0RMbVpyb1paME5ROEdYREF6aUV5KzJ1Zk42dTB1NGIrMFdaUWNz?=
 =?utf-8?B?eStuWmt6QnoyRGEvby9ZamNPZTFJNHZObmVMOXo2ekYrTmRxUVFGdnoxUDh6?=
 =?utf-8?B?cnJXeDVtSDk4eEpwNGl1U1VWZVdpaWRXRDZwVmVLOEtaYjk4d0lneldjSDZQ?=
 =?utf-8?B?bXI4d0dLN0tMR1UvYkN3QThVWnhTZDdFanU2b3V3SFBnMGswQ2hZcHlkZ3Bh?=
 =?utf-8?B?YkFjSU9LTFJyL3FSV0Z2clZ2d0hDbWVJMjRiTVVXdnJORVBhNU5PK3piS1Zl?=
 =?utf-8?B?ZGVoWEFBN1FVWUtFSWRIVmNDS0dvZWNQK04xL212VXhiaVA0SXpRWkFDTStC?=
 =?utf-8?B?ZkZYaWhrbHpnUGlTTUZ3d1lYTEZiTGxtMG5wdFI4ZXlmZzNuZE5BNEJmSnJF?=
 =?utf-8?B?Q25pdmF2RDhibWhGcmtUcjFxck5PNFZtT1Q0RnE1Qk03L0RuY05aR1ZZTEZ3?=
 =?utf-8?B?YWJnVyt5WVRlbk1TN1RYZ2JTblU1Qis2enZ0M3Q2aHpOa1JqaWdoQjBWc3RW?=
 =?utf-8?B?Q1E0Q3NCOHFSZjFsZHppN2FTeEMyMkVJN2dOanNBeE84VnlERzhZakJOSDJJ?=
 =?utf-8?B?U2xydGRUQ09hVmk3RlM4VXllbjMvZHBXVC83SkFKNGVBb05HbXUvMDN6VlFW?=
 =?utf-8?B?VjFxSlZXQjlLNENwSkZFWGYzNW5pYkV0TUxzbFFERWk3eElYa1BUMXduZjdu?=
 =?utf-8?B?Qjl3VlNUbGY0YUp5Ui9lV0lRMUdIMFpBNENGb1NVclNTMGR2YWMwWGxvNUlw?=
 =?utf-8?B?ZlVVVzhLTkk3ZWdsb3ZMeFIzQjhFWURuMmVNQVpEenlqSnF2STQwZDF1SnBL?=
 =?utf-8?B?bUlXbWFQdWZleWZVSXhTWm1QcnB2UnJ3a0lRMUF5Ym9hR1RyazJLVnJQTDdi?=
 =?utf-8?B?cGtYa3FWVUpUVkNxMmxwOGpsRUhCZkhnQWJwQW9jMmZ0cDhBbVBtUzhnOHFi?=
 =?utf-8?B?WnVtWHZiSmozODNpLzQybDJ5VkVSQlo5R0tDbkhHZkNDdHh5UlpMTTAxZVZk?=
 =?utf-8?B?N2lpZVRtNGg2d3FUZUxOZXJpT1VKMThRWDVIU2JuN3B4TkNWa1lsVy9ESXU0?=
 =?utf-8?B?NHExNFBpcUU5RTZHTlRsWnBoZ0cvaVEzVjZEZmU2WVBRYjhybHFLSzl0eSta?=
 =?utf-8?B?dGVTL3o3bXk3QlZkcE5VTDViM1NFTzJLUUJUQUFBNkQ5akdDclQzVVBkdjFN?=
 =?utf-8?B?SkZobXIvMTdoTnJHZlpEV3orbGFRT081WDE4Q1RUSE1pN2NvOG05UG13RUZN?=
 =?utf-8?B?eTduT3dTa3Z3TmxyQkZ0ZDU2dDNnbG9meXFFRHgxNGd6cmNmRGpGdFVpbmF0?=
 =?utf-8?B?UWNTT2JMenRZdlZ5dlJRcDA1VkNQUG45RWRISEhTS1FCNllTYnYyVUxZQ3Q4?=
 =?utf-8?B?bTZDUGorb0ZSSWtreitrUzB0SW96R3VvRmtwdHIzbGE2QVZVUlpySzlJVUg2?=
 =?utf-8?B?bE5weURLNUlicnBNT09QUXNqYkZacFd5aExKczJ2MnFDRjJLMFFtVVpNUmoy?=
 =?utf-8?B?QzJSbjJiblVUYkpzbjhtWE1xU0hKTllVOXJyT29rMzRPZ1BqZk54dmZMNklD?=
 =?utf-8?B?SmUvejlXN2x0SlpJTHhJbEpyM3NJenVqdEo1NVNjeHlWM0o2VnNjaVdZM24z?=
 =?utf-8?B?ODZuUkp3Z2poa1B1RzBjZU1kNWJOVFNTZStmUzlNSjFkYWluNWJFaFZ0ZFlo?=
 =?utf-8?B?QVVqbWdSZDVuemFkMndIUTNKTVcxZzlEdE5DQitQQlM5bXFVNXlJNGxLSERP?=
 =?utf-8?B?Z0tscndQdFZlTW16ZkU4a0VkNHJqcmpxQ0dtK1JJTGFiTUk1RGs0REdKRGd5?=
 =?utf-8?B?Q1JBVnpRczNhdnpETTdNQkRQcyt5RW15cFBZRFgwemQxYVJzNTdkVzdwMi9Q?=
 =?utf-8?B?cVpKTklzOHFsdzRxOHVTUndDcUlMcEpkV1U0NlhzMm1IeDdJTjJCREppRVcy?=
 =?utf-8?B?Q29vQThZK3E1eHhmZ2ZxZ0Y0WWw0MUNUSExLdzlYTWFsQzBqVUdTVzVEa0JE?=
 =?utf-8?B?YWJoWjVpQ25FZU9zQlhweXVQMTBvVjZBcmxWU1JSODZldlFzZHVxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c19f7c6-665f-4691-b8f1-08de5dfb92ce
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:27:01.5003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oE1EYVk/DKpWJZIIWSFpMv+RCC1TiekWFrht/ciZ/lEzvXuRdhwh622SnlIz5/BuOBaf3d9Mtc9IVeilyYSOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1968
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-10911-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	SURBL_MULTI_FAIL(0.00)[garyguo.net:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4F949B61F
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 11:12 PM GMT, Miguel Ojeda wrote:
> On Tue, Jan 27, 2026 at 11:51=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
>>
>> Lints in Rust do not take arguments, so there's no way to represent some=
thing
>> similar to `-Wframe-larger-than=3Dfoo`. However, I've made klint search =
[1] for
>> `CONFIG_FRAME_WARN` and use whatever value is there.
>>
>> Link: https://github.com/Rust-for-Linux/klint/blob/168031d93c3aa538c8ef7=
1d1e448ae77c2cef7a7/src/binary_analysis/stack_size.rs#L70-L82 [1]
>
> I would have suggested a `.klint.toml` like Clippy, but with Clippy we
> also want to eventually have a flag-based configuration instead of a
> static file (or attributes in the source code which means probably
> using conditional compilation in some cases).
>
> So, even if the lint is toggled with `-[AWDF]` style flags, could the
> limit be configured in a separate non-`-W` Klint-only flag? Or doesn't
> `register_tool` allow for that?

No, there is no tool-specific flags.

I *could* add new flags by intercepting the parsing of command line in klin=
t,
but doing so would require conditional passing of command line based on if =
the
compiler driver is klint, making it not a drop-in replacement for rustc, wh=
ich
is something that I want to avoid.

I think the best path forward is `--crate-attr klint::attr', but that is ga=
ted
behind custom_inner_attributes feature which is further away from stability=
.

A shorter term solution might be to add a cfg specific to klint? For exampl=
e,
`--cfg klint_stack_frame_size_limit=3Dfoo`. This way the interface at least=
 is
specific and not relying on Kbuild internals.

Best,
Gary

