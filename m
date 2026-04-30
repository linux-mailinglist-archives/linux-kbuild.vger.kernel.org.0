Return-Path: <linux-kbuild+bounces-12961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PuLM91u82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12961-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:01:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D04A45DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 17:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B998305B58D
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E22F43635C;
	Thu, 30 Apr 2026 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s5McfEDi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62486436368;
	Thu, 30 Apr 2026 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560962; cv=fail; b=KMQ3H0McdnMeVNqutpbecymAhoO8NBqJxJ+ZXX6dsWKVV4dOpyoRYAiIiI11CPZWyTE1kL6He7HpKFIZNaEoqSU/PkCrsD3QGg4MP9bPcmk3TPmdOw4F2VmstKdRRwt/C9LL2vlDKrFZdxExlS8cBSmtmo95IyUQRYvmLL/zhIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560962; c=relaxed/simple;
	bh=EmemcMDdhAYFaGQqsB5Xpxi4BkDZfvsGSUaWKh20xSU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EOdLp/gt6uLkdIxo1CXDjl7EaIax0ePvlCo/RGdHyFQIJ95+XSi3+zfGTz5KW2kMU6+5iaN6JT8FnAR7UaY6QP27JS3P2INlMVAfD/D0BM0MoRbHnScRz8iHQ80X7s+vXuDarRHQTVD/axNi8g8LMq5lDougiIPcR8ZFQ6ZeeX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s5McfEDi; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWXTI0pi0p0yjFNXgR/zNupBqViyL6I/0suxSlV1/GFAz9J0TQuZz380ji8TLZzVLEmJySXJ0y53WHLxgUWcRfbaFQzLlNbvlJYL7C1ssKaL/iYlxlANr093dhF0PvdCDIva3/sNl2xqgGForDET9KD/3IEk9MUftCbNjRv6vdFte09MG/gGInFX3a0e2hkdWDh1wxdoNcwJYPsQ+F7SrboWMOI1qQ6EfV/ydswnze9umtYRnaZyBSxsWx0trVYVJmq7q2Bl+VKICuXNrwz5fCAjhccL4w+HMqAj/B0ObXm521ydIjuzhfNUcvbTJUQXnZ8IGyJv5aYYrxVr7SzYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHOCHDXurEmZORS0PhjPlqv3gaPDMbJXQhgM6kgj4vs=;
 b=hEQz48jMmuj3OBogEitwxF2w1Kk21NFjpteTjYooIXknVCPWI2KQnC7O2Ls1LGjEBglRM0JvU0e08y/rOOJIChW1JIpicVrnPEGWh84LzDsBDGn6L6Q8qZxkR464jOuMgxTPApDGmPiTasXzVFWtH37d+6AYfQLcUPPrZtSVtros83aYwlvVt0RkplPjul5QP812F1fnLrynr02X7fg/pijEeAzF9YpyjTx2jCzsTE2VwiMCFu/75w9lmUPZMjNCJrRL+f5P+E9ZAEW6+DhuIepRTWlbojliQntMDw2pyxrb/p4NZcXYX1thoZ8y1RUb/APjM6Cuo4IwIuFL/mt1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHOCHDXurEmZORS0PhjPlqv3gaPDMbJXQhgM6kgj4vs=;
 b=s5McfEDieJoVveMQL8gkgJwfhFDbRTInlIlsWVHwUfVpUT3e7pz9SiNYQFD3CJAG/a9P9T/rl7mpEmry3xIOId1oZoj2u4lUd3IaN8h7pXx17DlvikLhqWA3qU+Hbuehno7CWikVyrgrChgUq3e2Yiz7XWoVEJ7RJa7UrQg5gNd/Ub6+S0eUzo4n1rToke6vsmKB97rqb0EDMrtsv3i9XNCMYS1gOdLuXgUv1Oe69+EGTyNcqB3xAEmEe9yZOx1MB5MShrnF8LF9/7gacgam2f8VarGYdiPQHgRcF2BMxac9VE6WOorHy/Us5t3WyN/8d6VHuz0JRW11nPqXt5vewA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 30 Apr 2026 23:55:10 +0900
Subject: [PATCH POC 7/7] drm: nova: demonstrate interaction with nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nova-exports-v1-7-7ca31664e983@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0109.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0eec7b-ca6d-4861-98d8-08dea6c89313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	RGnz/vb4a6qHoFn+O/v2C4+iTgl61znfEQxtvebAq6uecmqdkf8szRDL0BFFSaD3wcVM2V/8YaIGga+tZ14fVoUSm3nwPGp4nVN16xpk+sXbeRtw+wgx9iuPqfIjR4kdyJPnE5Psr7GM+1fPgJ42AVKUC/u3SuU/4JpZZtEse42MKCq3R3oJCgfDWtfMD3Za2IXwjRXtW8ONcmn5xUREAYzh2Y3BRy04AJEnDk/JA4SjsU8lzdm8CbYUNGAN/m6yDhLiEwrs4CwZuD6p9wcPy4iR0A4SwvvGR0Dt1CIWOKPUvg99ZD27jxx73RQy9f71EAMEAboQaGUdxc1xRpjmi7au0h20XYbgiPdxf+9pWCLmEvLJ4FH3MMf88Ps0bB8XfggKCm5ihbQOfA3GwAZPlBr8fFNXdJNaZ8k9UTBJNWRqMBIgJND6dV/8/FemIuBIsnmeIqTlbLRbFfGXIfgvwvFNATYycpcFOHkBmmOfJTE/nr87JLWDNoj4AOLj7kMjF4vjhzAOz6T1u6t8L5fcqcqkb3ucqfx8qRD5C+5a0J/EDbijUu1Jy3fSCdSBdUReC0757SzQtJ6TVw3+0kyqIAcup4Nq1zvgAeYaPEXvvn5jeyhHFN19z/jd82CEKPqLHymq5vw7/D4TjjDKLqTFsD9z3P05vMypY5+hHdrtz5rlZFy3Lu210QWixK4UaqOYt1n6BFZFvKDCsJEwD8ECtdJxzW1hNdkVi6WRtdxfjbmhWTkjEyU6ga02OrPNHknkkqHyLJqaRoAUP1kK2KC5+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25QVnZSaDlpWkVUNDhSNGlJcXlTbkZabFYzeXREV3Zvc3VjaWt1VnRlc1o3?=
 =?utf-8?B?VVozWVFxWTNMZVRvRHBsRXh5a2pLTS9uLzlKaTE1VUdnR0h3WWFhS1FYL3V0?=
 =?utf-8?B?ZUY1RmVvSlpDbDgvUzFxdjY0M2U5NEdmLzBFWWVyUlZxTWF1emRQRW1xV0ds?=
 =?utf-8?B?M2tId2J4cHZYRnlTR2JqcENrWFBodHVvZ3FLRDFpeWVQRGdwV0FEdS85djZT?=
 =?utf-8?B?K1pPZ001Rk9VK0xDbTFPdlhNTXdwdnlmUEJPQUs1QWJyRktPL0dZM1M0RFUx?=
 =?utf-8?B?a0ZoV0F3dm1WM3VQNkRucE5SRTdwcGNSS1RrSHNBM1VoQnZ1Y2duZEEyZkpy?=
 =?utf-8?B?TUpyNHR0RUc2NHQvMFIrSlY0SURLcmxDSnMyOWhINjlySnFnYllKY3dtRnlv?=
 =?utf-8?B?bVRVaFliVmlXa1FHWUhzTVptMk5RS2pxWG5UQkE3RVZXd05ST0lHVWRPcnhk?=
 =?utf-8?B?akQ3VzZpVExQTG85SCtoUjRtUERVcCtqTm84alJHNm5MenM1cTVLMVVTUFFO?=
 =?utf-8?B?Y3BLbmh2WWlkN0ZjclBMbVhUR2NOLzcrNTdFdXpwWHJ0ditJU1FiVzM0Kzd2?=
 =?utf-8?B?aXFSQnlwQjB4Y09MTXZSbytJNUNlYWpaWEhqTklmczNnWGs4VmUwUTcyMHdK?=
 =?utf-8?B?bkd0ZThPaHNLTVpKU2MxQmtGYzQxWFVrWVoyTWdHT1NvbnMrUlpoRjFYcmlE?=
 =?utf-8?B?QldLazMrSkNUamQ3MzBVMEwwSHpoV3Nhbml6amhEQ3RrOW1qbTZjMnNuMmY4?=
 =?utf-8?B?OFMwSlVSYmMwTkNJMWY5WldDRkVYczhZNkZOdURjSDNhSGwwR0JsVSt0a2hq?=
 =?utf-8?B?ckpLZnIyWEdVQ3NoK3NQNmlUVTRqa0diR2F6Zld1cEI1Ukw5cm5wdXI2Q00x?=
 =?utf-8?B?OEtERVBlY2RHQTgxeTRCZXVZalFZb0dDRXdJbncvTkhneENPcEdPODZGNzRY?=
 =?utf-8?B?UnFsM2FHTWZZWDJoT25zN21YQ3NoZ3l6ZXp4dEFPVHBtdW1PLzRXOW1iNnpn?=
 =?utf-8?B?S3Z3QTg3azZGSGFlMHlLMlpKb29GMUhFQnlNZHZRcVp5UTNDZG1GaXhkbGNS?=
 =?utf-8?B?Rkd1ZEZpM2Zmd3k4UE9XQ0xTaE9pNEdFT3dTYnlOVy9nMlI2d1Fpb2pXdVA3?=
 =?utf-8?B?MFBUZDdJT25PaUFPNUFoMFdMcnROK1A4NDVGc1YwL0FUMjVZZitXSWI0cGNt?=
 =?utf-8?B?bUxPcjVxcDBSUkxnR0ZQbEFKdGxqN1kyRUwzT3l0eXBHd2JoTnJselVZREh3?=
 =?utf-8?B?bzFGdWI3djYvUWE0Mm9uSlFqeFk2NG9hU1VOVU1naGJvaUVJZ1I3QnRoaTBk?=
 =?utf-8?B?Mk5DblB6QW11bmp1OHUrN0hJdTRKTWlUSVZ6Nkc5RVVnRWhEMzM4eVZaenR3?=
 =?utf-8?B?OGlYZUJoUVFJcEVZcnBwNlVQa29kWnkzRDdEaWo1R2Yvd0VTdjBHYnF5MGNy?=
 =?utf-8?B?eHVHQW5QM0t0NlNIaE15SW5PSXdSbzJCQS9WQ0hCWFQwbTBRRUFLcmhiaU5M?=
 =?utf-8?B?bG02SHR0TVBqUFRyNmdxL1JBSlo4WHU5dmR6R0FqMXE2cWRGV1FEMk4rejU1?=
 =?utf-8?B?b3dCTHA5Rjh6MHhMNFYyWGpkWTBCaU12cm5Cd0poSkFiTFZ5UnBmeGVQMXlJ?=
 =?utf-8?B?c3lNRFVyalI5RDhhZzgySTFuekc2eG00OS9JeDJvaDBob1BDRGNZeGZRSEJk?=
 =?utf-8?B?Tm8ra2NLbU5TYlF5NjRKVVQ2U3FSaTRpNXNJRHRHbzZBMHE1bDVTTzlNc1Q3?=
 =?utf-8?B?RDlDRnU1QW1NemNQSGVVaStwNTF5ek5ZMDhDSUpPbnlWTDJ0Q2p3SmRMWTd3?=
 =?utf-8?B?eFl6SGRwbERGL2J3WjQ2ZWJGdXdqTkQyTHJVNXJobUVqaFh4N2xTS2d4MEVm?=
 =?utf-8?B?Y1pCcG8yUllXTjYvNXBkM0lSRzJEMG9uUlpOdG1BZDh5U09xNGFMOCtlZnRF?=
 =?utf-8?B?eHNJS1ZJcGFQNHBRY0NROUFUMURsZjhjcElLZ1NBTjN0d3MxR0RLdFZRZ0JV?=
 =?utf-8?B?WE1mRjFseWVMc1grWVhvemIrSGd1Q3NnbkkyL2x6TnU2Q0cwcWNMR1d3SE42?=
 =?utf-8?B?dkFIZEFyUFRvY3VraUVRUlphL3I5b0ZkM1lDMFlISCtGSG1Hb0lGOERaYmZt?=
 =?utf-8?B?Z2crNmZseEFxeG1uQ1R0MmkveHZGM0IvaVdCL1QySzBGZmltY1dNUjVTWE5G?=
 =?utf-8?B?UjQxdjgzaG5Uc2lXQXVHTkRvWXA1R1NmNHdRWUpDbGRrNENqVGwvQlIyUGVH?=
 =?utf-8?B?OU0xRzJpT3NxUDlvRVc0M08yMENCdGM3Zk1KL1dNdFNCNCtWM3lYekh4eENp?=
 =?utf-8?B?ZEZ4dTF1eUpDTVhBNnVVRXpEdkk5azRkdnBrMlV1S3NkcW9GSmFFeUdFTE1P?=
 =?utf-8?Q?lsOxTErIY6r5Yc1gF0UQ98ThNxy69/tIIa1QtkKf3Z1ny?=
X-MS-Exchange-AntiSpam-MessageData-1: 01aT/ajYc3lmDw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0eec7b-ca6d-4861-98d8-08dea6c89313
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:52.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdjN9vqwATeBrROo/l0YeP1fjeDOwfJFdjoim/BLR40f/mTjQiU5dJ73N2PZKOYwTL1oP3mpIWnEcc8wukn7XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: A64D04A45DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-12961-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]

Export a few items from nova-core and use them from nova-drm in order to
print the chipset of the GPU being probed.

Some documentation items are added to make Clippy happy.

This is only meant for demonstration purposes, and won't be merged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     |  6 ++++++
 drivers/gpu/nova-core/driver.rs    | 20 ++++++++++++++++++--
 drivers/gpu/nova-core/gpu.rs       |  9 ++++++---
 drivers/gpu/nova-core/nova_core.rs |  4 ++--
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551..e18e9fccc067 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -15,6 +15,8 @@
 use crate::file::File;
 use crate::gem::NovaObject;
 
+use nova_core::driver::NovaCore;
+
 pub(crate) struct NovaDriver {
     #[expect(unused)]
     drm: ARef<drm::Device<Self>>,
@@ -54,6 +56,10 @@ impl auxiliary::Driver for NovaDriver {
     const ID_TABLE: auxiliary::IdTable<Self::IdInfo> = &AUX_TABLE;
 
     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        let chipset = NovaCore::chipset(adev)?;
+
+        pr_info!("Chipset from nova-core: {}\n", chipset);
+
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::Device::<Self>::new(adev.as_ref(), data)?;
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 84b0e1703150..985f65e13bd5 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Main driver module.
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -23,13 +25,17 @@
     },
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    self,
+    Gpu, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
+/// Driver-associated data.
 #[pin_data]
-pub(crate) struct NovaCore {
+pub struct NovaCore {
     #[pin]
     pub(crate) gpu: Gpu,
     #[pin]
@@ -112,3 +118,13 @@ fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
         this.gpu.unbind(pdev.as_ref());
     }
 }
+
+impl NovaCore {
+    /// Returns the chipset of this GPU.
+    pub fn chipset(adev: &auxiliary::Device<Core>) -> Result<gpu::Chipset> {
+        let dev = adev.parent();
+        let drvdata = dev.drvdata::<Self>()?;
+
+        Ok(drvdata.gpu.spec.chipset)
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 659f6a24ee13..75190ca0693b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Declares some core driver types.
+
 use kernel::{
     device,
     devres::Devres,
@@ -31,7 +33,8 @@ macro_rules! define_chipset {
     {
         /// Enum representation of the GPU chipset.
         #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
-        pub(crate) enum Chipset {
+        #[allow(missing_docs)]
+        pub enum Chipset {
             $($variant = $value),*,
         }
 
@@ -185,7 +188,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
@@ -247,7 +250,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
-    spec: Spec,
+    pub(crate) spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Arc<Devres<Bar0>>,
     /// System memory page required for flushing all pending GPU-side memory writes done through
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 3a609f6937e4..ccb98c73457b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,11 +13,11 @@
 #[macro_use]
 mod bitfield;
 
-mod driver;
+pub mod driver;
 mod falcon;
 mod fb;
 mod firmware;
-mod gpu;
+pub mod gpu;
 mod gsp;
 #[macro_use]
 mod num;

-- 
2.54.0


