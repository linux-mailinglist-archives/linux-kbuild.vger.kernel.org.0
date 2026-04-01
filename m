Return-Path: <linux-kbuild+bounces-12514-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKAZIwAdzWk0aQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12514-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:26:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1AD37B33D
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C55F314D7B2
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708003C5DCE;
	Wed,  1 Apr 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MavsocaM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022100.outbound.protection.outlook.com [52.101.101.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AF1E47C5;
	Wed,  1 Apr 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049527; cv=fail; b=kmiADl7KsIz6UzNy5HPyklMkKtvxnUzt0HjruzVqoviwxh8udHI24WOH4sxaojy+1NOyP19U/5di20MbX66GVW4JngGbnOunTDAthUUFuVOoqp/EyKTMuH14mDM7zTJFyn6rieamHPdUJb75amA+/ZBVEIMqmEIcEPAWMTp362U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049527; c=relaxed/simple;
	bh=fdPAnUYQKsqNJpJqzxzY6fn3Gnkz/NzeYm1QVCxZPDg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=S0XjACFV8zWnlDsqse1YcV5ulSsSUJieMEk0NaB92KXSbAAgEimTUy3xCs1e0lfbam5+zcku9TyNPpWmKfetgPD0NX3MdDQsl1S7oMF9jlk3mNU5MHxRtbbWb2Cz95nafSGEr62mU71ctd4GmnEkuTCyBnxW53txaqjqZIIcdJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MavsocaM; arc=fail smtp.client-ip=52.101.101.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc/ZQ9afvyZW5Xu/1TwwrN96ttjK3qbo4hbkSNRQTEeoaX5ZIs9+ME3lli08BAU3AhBaH5IdVaz6VT5O40eCM+svL1LxPgro1D7IcRqIU3xIDhfHmHS7ESB28lebEbg5LMW2h/wqBRl29XAYnQcOZ3Mf3pMRVQkK+X0aPo8341Fzk0ZsajeEnqqXhMbg0Ho/mppi3DhnMD5QUFG38Nbtp8zAzogSQMxvhO+Rbumb4xkgtiYGmvdZS9ThhrlswerwTJU3ZTu34Ie5H2CZRhw8euWq3pXL5Cnrfez8wfs10BsuFSQuOxjiN2IWRmDrGtaz7vdiVNvUNpavhDiyiy2vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ4NfFHgcekBbX16iaW90Rs39I0/P19I92XrA6UoFx8=;
 b=MRK0F+MAkcTpEzRsQH7myCeBvJxfEE14HloEOSoyld6hK7Qo6QeXaNrn4IVSuSlJttej3tAAyYTuLwVYVL/txdIKYzyH6sQyHGxoZ9MZBG0/OeatIzaaYv6u9i8Rh8DsK66JtwlTwSfrodsT9UqL96wGIZo81jf4zZbFMyYklKSOPdy3bKep+FGRX+KzCOCe8w93l0JF73wA04v1sAy9dfXL0QOQ7h49kIYtPE2fDpb2LhVyfNBFjpng+e3uDiCV4107HCM6a6uhDh1ifbSPdzYcUmxagDhK7PxSRE2I7jHPz/CaNoi6LuNI2lN+Gck9xiEiIGIkzYD1dUtgkgcm4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ4NfFHgcekBbX16iaW90Rs39I0/P19I92XrA6UoFx8=;
 b=MavsocaMT1DLghXdDnnm08FVjyT+Sq0B+Q2LGlXElLPA8LNqK7YGuJAlX64J0r++71vO2QlKh/KetYBCXVF0CHAamN3a5M9Y5inS5QmiCEpfeXzHOyKqhd067axfXXskC2DV6sUvw7rE/6BV2SI3PBJuN/FkzSLCagy5JXFiI8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:274::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:18:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:18:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:18:37 +0100
Message-Id: <DHHUJF4R0YBA.1SN13R4WRTBUE@garyguo.net>
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
Subject: Re: [PATCH 04/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and
 simplify code
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
 <20260401114540.30108-5-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-5-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5572:EE_
X-MS-Office365-Filtering-Correlation-Id: 851d6403-873e-4c26-2ada-08de8ff12fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1uyspV4XV9zrGbQH5nzrQowgVVKI5rWFA3HWqIYdwhUOwQqks0FC35g4cRbPcuUYGri38KqPN9hNGBFrmFJHSExEboV5UY0rssb/ZGfrolotaAsHXHRGSNrDfOK+dzG+v2zk6etrbwAI+wXtBme8bp7QZRYTygWLsPRTVmmPn78+f3hB8kcpMX5uVC5B7/8Kq4tv2HpLoBUsXQzppGr4o+Bzvs2faPJAOvsHFtYGHAudLPNZfxAX9iG2CxHZ6KACUXs8kWMrpkjTzb4s+lCZ6VzTIQunc21r1UhZEDTfV9GTYDiVQ/MDTR6S/L0gYIOARP5ly7jsybqRNIJ/qq0vn2oObI/fm6atSW67tz6eqFliCbc1E9WOLWz5PSXKR45THTz0JmOkZ3RLKAHZ+20c89SsBZcq99fW34CCLn7pXwmiNMrK03jrY71rYuEJ3C/gkHa3bjtVwtquAbIT/EBwkCB1uwNfjOyHFxo0erFFRxsEqcUpwrRIaQPPEtWd8K3o6l6ESpcihNf7VVTsJS3bmnmudL8Bic4OrOF5pIRZzaPzgnd6eraqY4+a6IKohfsdXNVtuHheDVs7WsXQyYaXBnQQkCDnGfE5RMkYUVdWMNT3CWW2qRnxH8L9mvtJVuV2gjQx/wBNvabI0c6FrCvs2FLUeOxuVmJUCllo13++BgjzgaB0nn+umAyoBH+VeYJRhnP0MjdBxnpWr3927k+gB/CU4XxBvEyeAm8e+j/4xemCKTZWQIP6up19RJjg/dPB72jISZJXqjEmYWyicGZHCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnlHNU5neHFRa3pxWXFYaXdMcmtCU0EwR3c5R2N3M3lSdjQ0Z2xkb3ltRGxv?=
 =?utf-8?B?L2NpMnVteFA3U05zNmE0aUYrYXpaREdPNHh2NTN4N2QrYXY0Z0FENmhoZWJp?=
 =?utf-8?B?K0d0b2tzdFVJZTZ4T2NidFVuMDRnYmFnTGFEb2JIaU44WUlyYUVxaEVGRUJ1?=
 =?utf-8?B?bTlTdWc0R0RFRUROeTdaV1pJcWVwVHRWTFRjd2w0SjVOalU2RzIrbVE1amlO?=
 =?utf-8?B?WDVvTGZIcVRRbnYvQitFRExOMkgwZDFvNFRFbklzUHA3WDFoQXV2d0ZPbkY4?=
 =?utf-8?B?SjlTcVYvUmhPUkxZZWlWbm9kMkdySjJ6VEFqOHpuRUcyK1orR3JMOUtlWXE2?=
 =?utf-8?B?VUFWbVZDeE14NWRRUTlzckFJVDFPTG9FZTNSdVFkNGR5N3pKR1dhaHkzalJW?=
 =?utf-8?B?OE5hZXBIRTJka0lzamswR01VVmtWYVB4c3V2eWowaGJLSkUxUkZTRkpiVVEz?=
 =?utf-8?B?OUltQmNjZmFUYVdHNE94MURCVHpaczc2SkhBdlQ5WWoxc0R5VC9oVHJrSTI4?=
 =?utf-8?B?SkNuSkJ6cnQzYStiQkoxaXRyempsUS8yMFNSc1JSa2s4aXc1VmlzL0dKMjY1?=
 =?utf-8?B?bENUTFFYUTdDZkIyREtzTnFHTU1VMlhzbWw3cVBhakpJVGdLV3ZndmtYZ0RY?=
 =?utf-8?B?bHE4RE9yR3cxTEt0bG1hZFBlbTVFUS9FczI3MEtsYUdORzNBQW1SVWdDQnV0?=
 =?utf-8?B?NHhRdW1aK21vd2RGZnB3cXJudHBiQjZvejk1dU9BNDBwSDQrUlI0bjhxYlo2?=
 =?utf-8?B?eWYxcy9XSTNDVWtzdlFxRUREMXhzLzJydU9IU1ovUU9TZTVhVVRuRy8wSUpo?=
 =?utf-8?B?Q3VvbjFtS2VMVVBGbWJEUmhwQjE5TGc3NlRzMkRoWExsT0dZQzY3bWdpU1px?=
 =?utf-8?B?TENkWDNFVkxzb2tLUUl0QmNuTmRna0NoU3JoZTZPeExLM3gvamZHWko5Wld4?=
 =?utf-8?B?S0NlMjQ4MmE4Y2k0YkRjd2gwTG5yRUZaeTNQOFhPR01RTEVYK1FRdXV0a1N5?=
 =?utf-8?B?enVLYUhyY0FiajVURWFNaitlUHU2KzIvNGRFajRaUHo1a21rRzVGa1B2dm9u?=
 =?utf-8?B?Qjc2MXdXdXNaZXc2VXAyYmFsREhhZHpjU1J0VWlzSFRIVFA1Wk1MT21hTHNs?=
 =?utf-8?B?QzFjL2lNcFJSaXpTczZPaHhyWU00VWQ2VWkvVW5aZVZWZTZ1WG1lZ1R5TFdQ?=
 =?utf-8?B?d1hHaGJYVjNmQngzNTA0bCtXSkVoL2VpcFh2cUJuUTlhcmsyQTMzVkluVHg4?=
 =?utf-8?B?MVBVK1lwQUZZRzM0emg1LzB1MlJnU1h2UWhIbzVxQ2pEY2lUN1hqV3VHbzgw?=
 =?utf-8?B?bDVMQjNBWkt5a25pM1BvUERzdTJwdnNnbDNqempsRzRRd0JsRDFCTEdQZC9Z?=
 =?utf-8?B?emZITi9qaUZUeWpzRlEvVXh3NmN5Y2ptMzFoeENmWHF2TkNqWS85azJtMk9J?=
 =?utf-8?B?cTM4QUxMSFJROTZIeWFGdFdPL1ZvOTRzOVg0N2lQL2NhcjY1TDJCQW5saVpM?=
 =?utf-8?B?OEpQUG9wMVkvdXN1L05Yako4WU9Qa2tReHY2THJJbTlKVzM4c0FiOGt4NzRp?=
 =?utf-8?B?OS9kOHBCRkIxaUN5NDREZTUxYTBUZHhPVFpaeW9OM056U3RiUUl2NTg0amRD?=
 =?utf-8?B?ZkprZXlldm9LVHBrU214bThJR05ScW4xVEk1U09ON2ZEUzdUMCtMQ1VhWGov?=
 =?utf-8?B?RkU3NkhRdFU2eFJZYklhMHBHekVsU0oweTJHcUtKNGsyMkx3MmhDcEE1Vzk3?=
 =?utf-8?B?QnUydDlzVFViSkpVTXV4K3FRMi9nNmdleTg1VTZpT0IrMFJGanlhRkJCdUVn?=
 =?utf-8?B?V0pxQUlJR1FseWxTbUQ2K2FEWGpWbGJUU3diVjJIVU54YSt5aGN3SVBFeWpy?=
 =?utf-8?B?M2x0ZWliYXBBMk9Jb0dReENGSUVtOStrRVFmb3lTUWM0azRtcU9IUWNEMndp?=
 =?utf-8?B?d0laWmx1MFN6S001MGYxdGdjOG5BSEpPTHRJK084eE1GK29iZ04rSkJGVDdN?=
 =?utf-8?B?djBDMUNBM2xvZkxMUFp0VkNHUndmUjNKUjVRdW05M3k4Qlc3VWdyMkR4SEVu?=
 =?utf-8?B?MnlvVmNQakZkb0dacUp5S3pXY2NETnN3MGJYNW8ranQ5dXhxcWR6VVdiM01p?=
 =?utf-8?B?Vjk0Vnp4WXRnUXFZYWhvOXJ4Q0hXRVpMbVczUVA4V1NrMytFSHh0akdUZEkr?=
 =?utf-8?B?WHdnbllOYnF0bXFxbTlUZEkySEw5eUtFTjVlQlozVHdlbTc0eGVHYWh4UFpa?=
 =?utf-8?B?Z2F3NHhvYkNjV043WVRub3F5cU12TVUrc0I0K1FDR0FLSDRVdWs4S2c4NjVv?=
 =?utf-8?B?WWVrTVg5alpKK0FFdE4yZ0E4ZnV4L1JUbW1qUndrNGpxaFlMdGhCUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 851d6403-873e-4c26-2ada-08de8ff12fee
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:18:38.7974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+wDEMd1QVjfLxes2tOj/x080c8nxr+U1lMVV1V1aG/MRT/0yRnT9BHBu7Ul4dld2oyEJHc5bEYcG08X21rzVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5572
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12514-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 4C1AD37B33D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
> Kconfig (automatic) option is always true.
>=20
> Thus remove the option and simplify the code.
>=20
> In particular, this includes removing the `slice` module which contained
> the temporary slice helpers, i.e. the `AsFlattened` extension trait and
> its `impl`s.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  init/Kconfig           |  3 ---
>  rust/kernel/lib.rs     |  1 -
>  rust/kernel/prelude.rs |  3 ---
>  rust/kernel/slice.rs   | 49 ------------------------------------------
>  4 files changed, 56 deletions(-)
>  delete mode 100644 rust/kernel/slice.rs


