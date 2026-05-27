Return-Path: <linux-kbuild+bounces-13351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP8BCmnbFmq2twcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13351-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB995E3B1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53F973045CA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97FC40242D;
	Wed, 27 May 2026 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i1W2d7uV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E76A401A3A;
	Wed, 27 May 2026 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882766; cv=fail; b=fBklQg2ehW89Z1XDhMBb7VEuugWmYBAtog2lVoaRqN1xOrg6KhFox19KNhrB1j2xlhYnJpbCs1WhLmaeTt0GdhGvTmAgWNq+4yECHOa/1h1XFb+JtYfNiHZdWXkozB5C2iNj0Lz+3aQyokqt3M0qrDdjNJDPGAEHateGbGeQBLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882766; c=relaxed/simple;
	bh=DE+78wzdiBmB3ZZlFlvSumxuj6VnlXxqwHGJKacXpeo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nERafYvj0Hbz2e3vUEJ3Z3CXHVTRCf8w2WZUX80ffdBSYkMtrvTCF9b5fKbly+mxZM+s/pkxkiTlfv8vpKRR93fwchIhv7yHyy3fJDfuNuxbiTWeGkS8L4Es2RIKpdBGG1JS1LrvPFEGHk8i2OGgDP42QGZxcReLUM66BQrTRFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i1W2d7uV; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxjiAXtkEY3B+8fIyrHoFYURi7b5816v6++FCrRi16kQ8NdA0ENN+vRag5YUTsMMhXDIQdcuwnH/eSsxzrTPKp8Ny/CGTIVqcsE6KGeTi0qJmFHgvRO/lgqDdZPkhFNQ+A6Tlz1qkB4C6PjVOt5luv4fyQQpid5qn0+k+o0htc5H4y+j+TH/dGvBlt3gk1MsgNNTpQ0q4geI4gKlZT1etW93nK9NfDEkoXG/O2svIqAmMIHw5MEuJHvoHwfnATzQHDZgu61qsc5dNmHrqr51PDsQQumutnnPU2mUDF9maYKqgHEgtl/UnvV3RvFJdBQWCdOsOezmaecNdnDTMlZHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiFBu+F8DpcIIS0JVcfQJoNkkzj1i9UtzcpHABzUpCA=;
 b=wpmv3YT/4CWbIBdwDsOrFfXbHphN4F7KMj3UiLNLC3iiHlR7NlmM/MyBgCL8LWyaGCy+UWfHJ9kRGPAl+yCGrOop7VMZv2j9iyK1y8S6lPzWiGcPuBZBZYv5wD0jk24HlbYBnqh/W1E1PHvmZKDgcUBlP8aKHwAUyT6PYN2MY7DGMGdFXfykJ6cXn6Ao3TfzHc47Oq3RT3O0iJpwtiGDAhZplHp+rRQjSKYx8E9mVadcpq5Uy70g2+i4kjVKen2dOs8FqRV1Kzy6rctnBhD3Zn0aRjGXHFgJHcfmB4+xmdfuaYUGsPE6qnmNzyO68UwRjZEwuHalvgaegEVDUNgXnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiFBu+F8DpcIIS0JVcfQJoNkkzj1i9UtzcpHABzUpCA=;
 b=i1W2d7uV8WbuoXWplHvBmDNyNOiwkjueQN+4tBihD5r/vHxRF8FtVal0m8Qpiz7K9siZl/T9VTbpJvNeARa2cU9kmmzcRE1C2eKy/Rr5oN0lUhQXgY0+vr63v9OLN6oso7hM+uoOIgZm6GWgnkstFw23b2UeAZwX0gc/NQOBZtTSe7aPiCAHKqO1W+YyiqrPzo0/gG8igGlGpKrk5sZMuvZlTtsbCp8e1oGqhWETMic6MFfySIGdel+ALhinP2iG1xONq+ftBlaPBKb1KEssr43lJLmDbzRI/LUtmKfb16olnbt1buT0MM66dFgqerH6K4cylQHFfYpYoQvdTFaseQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:18 +0900
Subject: [PATCH v2 2/7] pin_init: always inline the #ident and
 #project_ident methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-2-06de4c556d55@nvidia.com>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
In-Reply-To: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ff05ad-7fb8-4000-e9d8-08debbe6727f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zYGzHfpk63nIioo60ZQZVYRnT/z3RD0afSs0FpOnwghemXfm/tdGyd/S1I8k7rQYeFqXxmlvJ9UnCO9vyruYT857UEwxx7vOKwmFtV9XOD6PO1AEzdimfmNgrAo0UA8sRvNlPApCb2vC121hD/6uU+ChshqWpow7B0kLFu5dIW0BFmbBeX/3evsYONr74Yp6xNqCF5QwEhFeRAz0VORidprx4wJpf5MSNBTVWs5d784PQ2/5iDzyaHXh0hRG1mdWQMXPTE3KcxMqzG68KAp4ZOQeRFbMfqTh+c5KDkBJin4L0gKnY5hkpZ/Kp2K0YVGzJfWBz13MC1eX7s4d/alorij7+YNrPUxpk5kCYUVMr6Q+ChvU9rF/TA7jeBtChODBCGzn1PTodNch3fgyIsqqS9u+ApGULNbIiJnNmXESKhxcYP09uAEuHicFi5VFgRcgb27PsXHo/SWefhZMgrUZ9Q2FBhZxYz6+Pei+bRQX9nCQcJmS2iaO1+bkBs83Di/ZbMIvE63cBBs3zYJXrZXk59fHNsA/nKdXhaw7sGgAPQUcx0+xSRKgET+x93dZnx40Y8ie2O8DZ+9dPaltRKIVKSbG733mk6fi7+IjUTEObgZqVlszYS8u7H5JwchclDPyaRbAec4OMKBkD91vNMJZAdHXSLGEiOJZqvDyyF38asvqrLiz7GC3oK5X9enPutADiMatGsYXuGTjJK/NTr5ozvkPxUF7HSP5bhIO9SOI3vw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTJORksyaDJrQkJrNUthdnFaRFdSTmswQ1lSYXdFT3p6dUN5SmlTalJOZy9h?=
 =?utf-8?B?andUbVBNWjJYYWQ2L0JycVNYMXRGRENhNXRvanQrOTMwbGw2Um4rSGdkMDdl?=
 =?utf-8?B?a0d3VTZ4NlRjTHRyOEVveVBIVE1mYzA3Zy9uelFkNHpJQWszalRzNWE3RGlx?=
 =?utf-8?B?Q2Q2Ym9LVzdWNnM0SVlmTDlIZ0VJbVduZmxRWTlobDZNRG9kUDFOeWhKdWlo?=
 =?utf-8?B?aDdsRTNmZDNSbXZtUmQvR2tZbjh4K1NHZEFCWXpkUTdpTkRhYVJzbUNjYmZz?=
 =?utf-8?B?ZGowNXlxbkhZV1hnZFFUTHJLaHBGdEdSSTd3VXU5WWRwU0IwQU9pSTd3K0F6?=
 =?utf-8?B?ZVJPUW9kR3l2TjVXczVFZnpPQ2dNdzh6aXBHeTR0dVVpZUllU0JROXM0QTZR?=
 =?utf-8?B?SHExSm5hNHE2MWxCKy9uTVZtQmYya1FpNGE5cXo1TnpQMzdsY0ZrZElIaGFK?=
 =?utf-8?B?cldrTElMNWtackRHZVJHZjNubTV0K3JWZHpRam5SWEtOYkV5ZnVZSHpWN1h1?=
 =?utf-8?B?a0ZaSXh0TjBaZ1U0SlNsV1hyUGwvcWc4aWdCSDFhZ2crZWRSNUFsV1hSYkkr?=
 =?utf-8?B?ajg2dDk5bXlncmRVTWVqWHRobEJtelVMUVhoQU4rRytBZUlYN2FDOFR3azB2?=
 =?utf-8?B?MWtqTFVKeU9RbFZKR1dhRXA0VFUxU2lKaHZQNEVyQUpuOEw2aWJiQWl4cTc2?=
 =?utf-8?B?L1g4MlFVU2JpOXNvNlJVU1kyVG5uQkZnSk9ONkVjRXFtditSRU1odGRmTGdk?=
 =?utf-8?B?YVgzRXkwdkVRYzB2T3E0S09mbUE4STU2NW9WaFc5NWpsMnBoS1cyemZPb1Jx?=
 =?utf-8?B?S1UrTU9yTzN1TW5xWnJIN2Zabm4vZlVEZWZndWxLRmhGODErQkNVZVIvUCs5?=
 =?utf-8?B?V2p6VUhDWnhUcjN3dmJsRkxFUjZBMXFEdGZUZTBFQm1ieUFrUDFoeWxac212?=
 =?utf-8?B?a2xJSVBtQzREZGExRHdJNFREMVc0cjJQKzY5SjJlTFlCcVZZNnpObmFaaEFQ?=
 =?utf-8?B?dWNySzJQQnB0b1ZDUkFkUUU2V0VtOHhyendRVC9aSmd0dlBib3AzejQvd2JL?=
 =?utf-8?B?cUVsWHYrUFRnN29oZ29Jc25qMVoyMFUvVjBhVVp1R014ODY1UWZvOEd4S0hC?=
 =?utf-8?B?WmJtUXZNOEZUWFg2djZBb1JxWmRkMXRkblcxSU4wREZyRDRHWjc5S3ZlK1Bt?=
 =?utf-8?B?Mk9mUjVlTmV6K3lCQjB1MlhGZXBFQVhKRFNrVjNxbHVWU1BHc1pxY2ZRRVNm?=
 =?utf-8?B?NDFiVEVBaDBpbGZudlRDVDhZT1FOVzVDQnpsSTJBek9RVFlUN3FiTGVJV1Er?=
 =?utf-8?B?VS84elFwQ3pkRUkrZmtzV0dWOXJlbnYxamcvUXJUTGZpclJPL1daL2lITHpO?=
 =?utf-8?B?bU5qTGN5c0M4YUd3cTlVN01hU0NVMndkcDZ0M1k3d1ErWlZtN1pVaUxXWGxy?=
 =?utf-8?B?bVRjUDZnd3J5LzNYTWdDWFBNRTdUb2Q2cUVTVVRjQ2xNcmRYMVFRMlhjUXN4?=
 =?utf-8?B?NGVOVVl5RWdLeE5KL3lMZHh3NUpDeVBPSS91b05URVJ2MkFDRGU4T1RYQ25q?=
 =?utf-8?B?NVdOZW5tTTNpRjFOV0VwVUROYzFuWVBRSXlKRXdFL0t2WHZJc0tVaTBBWjYy?=
 =?utf-8?B?aEFaV2NBRC9icHBQeFRLTDIwenVhMmUxZmUvN0VSaEpzMksraGZQMWw3RWhX?=
 =?utf-8?B?RDJlRlBGYno0cERKTGM0Q3RqSFlyaTI5NGFLT2Npdng1WXNaekQxZ1RMZlRB?=
 =?utf-8?B?WEd4N3NaaVkveDlvdlh2R3BXaC8vbThLQmFCOTFiSlBoWmpDWmo2djNrVnND?=
 =?utf-8?B?Y2NWVENlSm5zZnAwdUlMeDVyeWNBOEdRWFlYR21FVi9hZU9MamhQSjZLZVpY?=
 =?utf-8?B?T0F2U24zblMvczRCb2J5TzB5b2RjVSsxN3hETFRLMkRXbTRBbGtCaDhVYmVN?=
 =?utf-8?B?ZU1yU1lMeC9TNXJvY295bTkxWW5lZ2FNZU5zZU9JWDdIUFp5QVk2bXltSlNI?=
 =?utf-8?B?Z3p5SU8zb0ViMW5vNUU4S3Q3WXMySklka1l4TmFEMWJ5aHBkb05xd3BERk43?=
 =?utf-8?B?QTF5d2xkM1VPSzAyWmJzVWVWOERvMmQwUVRPMDVXYjczUHVWdFpyam1RUVdm?=
 =?utf-8?B?b0VxQ1NxTDVxVmJSaTFNbXBxNnRyaG9SZEhub0p5bTFVNnNhclA0QnZ4elNz?=
 =?utf-8?B?ZGptcTNialN6ajFCcm5IbkZhK1lFU0VhTzQreG1MQWhJYWxHNEZaZWJtVTZ0?=
 =?utf-8?B?ZncvZUxWL1I3bHJGMzRtOVVzd202NVE5cnZ2a0p1c2VCb3FlaWNlVnRwUWpU?=
 =?utf-8?B?VXJMb1RwOEppeEdkWFFOQmpobHp4ckRKL1pRN3A1aTZWV0xTSGtYRXlkdERF?=
 =?utf-8?Q?0CKXYkYHd6TkQiPwnm8DPOFUY6vZEYKuczNUud5lNeGsW?=
X-MS-Exchange-AntiSpam-MessageData-1: BCPvH1NZrHJU6g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ff05ad-7fb8-4000-e9d8-08debbe6727f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:37.2716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdpjrOGHcAlMSnkQune43rVcbM6ohRalLrW2eq+ibVAKIl9XwZ4LIeUJiWkeIEAV8c9uR/oDUwek2aYMxhTcww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13351-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9BB995E3B1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These methods should always be inlined for optimization reasons. Failure
to do so can also produce symbol names larger than what `modpost`
supports.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/pin-init/internal/src/pin_data.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 7d871236b49c..945254740f61 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -395,6 +395,7 @@ fn handle_field(
             ///   to deallocate.
             #pin_safety
             #(#attrs)*
+            #[inline(always)]
             #vis unsafe fn #ident<E>(
                 self,
                 slot: *mut #ty,
@@ -409,6 +410,7 @@ fn handle_field(
             ///
             #[doc = #slot_safety]
             #(#attrs)*
+            #[inline(always)]
             #vis unsafe fn #project_ident<'__slot>(
                 self,
                 slot: &'__slot mut #ty,

-- 
2.54.0


