Return-Path: <linux-kbuild+bounces-2998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C686F952D96
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 13:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC3C21C221F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 11:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944C71714C4;
	Thu, 15 Aug 2024 11:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AHL20BO7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2055.outbound.protection.outlook.com [40.107.103.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583A1AC8B4;
	Thu, 15 Aug 2024 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721836; cv=fail; b=VhonU1iAMCDo5t7OrI1LqJJbqcnDQjRlADTMHE4a12QpS5wx+k8PIVs6DzfAFpN8QLzrWl664xVETAsVQmlPZ3PoBHioyojFYB+Oj5JdmTQ5VGfSUWRlH4j0hNd/QVWKX4jOUQy20zP0qq6J2lkinI1k+1gHPgcgABvQAszrEFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721836; c=relaxed/simple;
	bh=c9EyuIOq6RmbeMiOn0z3MC9b4hZk+kHEaNjxIjuGciA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cS1k1c6q/MGHMGk4soLezpq8pi1Ky/q4odI+RxFG5Xw/FR/AUnTCQ/+JxM4jxl8dfVPSRUupmyIViLtOGSXr+sLwfo1F9ZhftRJxabZmmSmsACKeLNX9dN4Q4PBvVzfczEYMAGtWV0DDbSWS2PWO5SC1J4ihlBnOQKwCzUq1wHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AHL20BO7; arc=fail smtp.client-ip=40.107.103.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJlcP8iruqS/6XR0rzFT5cEkSazjJdTuewrHxDhSvCdYBdm2trDiC7SXn/KkA0A6yhLkWZe1Vx/h8ENpHzHOWnZuNzZ0OaoIudTuHPPx9McasJi4fIU9VonRWAovrSPpW0w8A9MXicEsa7xylhxE2CzklkYIPOJGZFPuD9DRsQazt/Cd2YZSPHJ6lLmKpHfYiZyzec1kdWe4AAHc76tjD8Kr5lnnffqXtnr30LjoiFqiZBm87NUkum4HLPe8mPJm6EzUTDlBpk40cyaIhNvR5u7O9o4ZzHT1Zr/qtj3+KSBQ32OVqFHa2M9HhA1LAC8OXJXTUEwN9/PfROH3Z0111w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xa41/NoV//ZGQX297XIDIXjtw/cGH9X9PZtqX82Hng=;
 b=NQEoOMGHQotbO1pcYWXe0THrJ4v42WgsrhjB3nLkdLobBYCeRihS88dd2zyiJAfBfkTM5OIsJPeWvw47F978IEQk+neJvCwUnH6h50mfkG1Iy0NOJtaHhPgFKJ55QFxLFMUiZ/5HwiiG9DdXCCiyxbGfsQ8Sj1zFK6wZa2Pn6StEQINAuncu2ok6o+N4ZG3mJU3XO22Ikj3WMWnhDLTlztEnlZAWXnEMesKL4QBy+W0M+Q1sTkxnD4U2qfWKSZ40WI+04uy7zGgqPSPSiMFNwq1MoDYuJQXCu3FVqkqq7IBQ7N5XHguxZvPWGAjuIY4UHh4YngR8SIVrtwWNIsqsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=metaspace.dk smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xa41/NoV//ZGQX297XIDIXjtw/cGH9X9PZtqX82Hng=;
 b=AHL20BO7FpkR4idQHz8gDYQTe0ZT7veaIgzPnymCGJ7K/FOPf34h9DkCb6Gq3s6JhjRiYxIHhnzLPKUEk1ic+0eE076xXmdU6iEzu65DudgN6tt2vKEvXr4i77WGvptsQ/ob0GLSiQgxBJ1SAFs7WG9KTXFp2XNfApBlh0PqTNTDb3yL65qZSS7kDkZDMVp8Zw77L6NBBVbVROhu7TyWKNiuGfpZBNKkZRoT94euLE41vhb5a5PdZHp/YSCqtrtFmeZmqAtLV0Jp1I40kKFaaofTUwcWVIusJVQ4lzAlOp2SjelsP5liv1hVBbuxzsGLRzBu0iiE5NbUKjN7/xdyww==
Received: from DU2P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::16)
 by AS2PR10MB7047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:595::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Thu, 15 Aug
 2024 11:37:09 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::95) by DU2P251CA0017.outlook.office365.com
 (2603:10a6:10:230::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Thu, 15 Aug 2024 11:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Thu, 15 Aug 2024 11:37:09 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 15 Aug
 2024 13:36:55 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2000.de.bosch.com
 (10.139.217.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 15 Aug
 2024 13:36:54 +0200
Message-ID: <c96a0827-cff7-4558-983b-42f965f80005@de.bosch.com>
Date: Thu, 15 Aug 2024 13:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
To: Andreas Hindborg <nmi@metaspace.dk>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
CC: Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20240815103016.2771842-1-nmi@metaspace.dk>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|AS2PR10MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccd17c7-f0b8-4e6f-1dc8-08dcbd1e990b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2VGdnR5cXB5K3YrdENmUkprYnhVYWxhc1FIanJhZzlFTU9objdEOTdnS0Yr?=
 =?utf-8?B?WS9rbTB5ekgyUERBeHpoSFUvREtXRXhJWDZhTGpFLzRweTJTV1FDKzc5Ukhw?=
 =?utf-8?B?NHh0eUdnZkptUEpYN0U2ejhhTEZ6bHFGNW1kaVlkamJyUnRYVmVxU1pjTlgy?=
 =?utf-8?B?SkJLZU1XbUVtejE1SmRUTzhMN0xWMVk4TnJxWkpKWWJvOFZ1WThNZGxNS1U4?=
 =?utf-8?B?UFJWSGRELzRVdzNHNTRpemVzQXp3eVNoWWdKcTRMZGJQTVdyY1Bna3BqN3Ez?=
 =?utf-8?B?UnNnNHlZMCt6eFovcDhGQUdyTXhaNmZXSngreVU5UXpxdUYvajBCUzhmdnF3?=
 =?utf-8?B?MUVzM20zTWRMODkwQlcxKy93U1BGbm5HY0Q1RkRkUXZDbDhGNzJNbjU3Z0w3?=
 =?utf-8?B?V3NEMkZHbUdIdDR6K1h3R01XM2ZlKzZ3amsyQk5mdElZV0l2cHBTY0FFbzlY?=
 =?utf-8?B?cGpEVkJzN0tBbnZRTXB6MHZOSUVUeEdGL1hYSXp5WElYclBUeWZRTjJrVEtW?=
 =?utf-8?B?LzhCWFl3V0hFZzY4di82K2ZNUE9sRHczZ0VPQXFpOXkzQ28xUVZKSTlDYnpM?=
 =?utf-8?B?c0FQK3FiSC9FbDltOXJWTzJKUjduOGV6aTJEa29zL1ptNDEvY1dZSWI3NWxa?=
 =?utf-8?B?UGlxWkQxQlBkdG14MVgzUUFaOUt4aFR6a3IvSlUwODFOVG10YW94bzFpblcy?=
 =?utf-8?B?ak9mNUllMHk2S0tlNG84WHNkNnNQTS9Qd1pkRFgxMmhuU3RzNDQxSk1SalBY?=
 =?utf-8?B?d3dyM2JXU1RyY3NxSGVoUEtWNkFXZmZRUUYvQVpCNW5sWVlFaVRCQXJzL3du?=
 =?utf-8?B?eml6R2ZHM0RsallMUVEzUURSb0RUbHowK001eUFLNlYveEFmQ2J4ZUdoWkdE?=
 =?utf-8?B?N2xxeVBNUlJGNVhYRkdXN2JGK3NTdnk1Ly9OMi82THNZaGxXeWJOZWpXU3lU?=
 =?utf-8?B?UHYxVUdobkpUUksvMFJFS0FVU0I0VDlOd1QyM1B6ODFaVElVUldxNHp4RHlJ?=
 =?utf-8?B?Mjlvd0lvTFBRYjlpZXMza0lXUWxhemRYbUpkSmtwb1djS3hnak5aa3BxblJy?=
 =?utf-8?B?eEdUK3hXL0pBUE1RQlg3Q1VVMyt0YUdMdXVhMjhYbk84cXNMdDFsNHNRdytt?=
 =?utf-8?B?UUNuNnNEMERLb0xPNXNzS2NZektQclUyajgvNkwrWWhrT1VJTlhGYjBMV3dx?=
 =?utf-8?B?UnFySzRhNkFYYWU2WFNxcndPbzNZMmRPODlzWGxNTkovd3I4cGN3aUU2Vkpj?=
 =?utf-8?B?MWNWcFpTRDBTTG1NVmJVTWcvVzI1S2wzajdwemVxWE9IYnlQWjJPcklTYWcx?=
 =?utf-8?B?VGpXQzVQeG5sR2EzMWYvNHdwUVY1a0RsdkloS3JweVllQkxHZGhTa3pXSUVx?=
 =?utf-8?B?MFhpUXJsT0RLaXI2V1A2U2cxYVhiZXh4MEtLd3BOU0ZaSDJ5TTdZY0JiKzFO?=
 =?utf-8?B?czdlUEFUYU8yZXBBNER2Qjh3Q2txZWxDcCsxVDVqQ3hQVHpxd1hYSHJBdllG?=
 =?utf-8?B?bmVONGJ0bllNdUI5dG9SUTdmcFN2N29wSDV2YkxQUGdQTThoMEkyb240YWht?=
 =?utf-8?B?S3o2MzRIZlArZ2JmeGo1NDdFWkhQem14ditOTGlWUnVVR2h5c1pZZ3hPbURj?=
 =?utf-8?B?TEl5MlRCaWEycVNSMWdYWm9tZFFIMkVIMGtONDlYTWFNNDVtdDdDTFhLVmF0?=
 =?utf-8?B?Qms0K3BRMFhra2Z5V2YzZFN3VlU3dS9ZeWhqVStlUHhiTVBmcWpWOW1NeFRJ?=
 =?utf-8?B?bjZpTmJEV1pucGxNS3hyMThNN2VzdmdHdEFFemR5ZXdLZHArckNRNDljMUZX?=
 =?utf-8?B?TWU1Z0R0bjJxNmcwK2FmWnBtM3d0cFBpWmdNdjA3NlNFM1VDcldUZU9qZ21h?=
 =?utf-8?Q?M5ACq401rcGww?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 11:37:09.2516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccd17c7-f0b8-4e6f-1dc8-08dcbd1e990b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7047

On 15.08.2024 12:30, Andreas Hindborg wrote:
> From: Andreas Hindborg <a.hindborg@samsung.com>
> 
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
> 
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Acked-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk


