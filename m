Return-Path: <linux-kbuild+bounces-12957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP25DjBu82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12957-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:58:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E84A4589
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C71F93087120
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12C1436341;
	Thu, 30 Apr 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DhXv9aoh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98B43634A;
	Thu, 30 Apr 2026 14:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560946; cv=fail; b=gP90Huy/yiwaKmLQhJG2r53EVbjbaI1OHOEuAWMFvB24tyF9rNrsZ8fd6g+EYrtdjiERY+dET9tP5stKYh9DbUqt4da7QyTZ++1p/UUA+urYN82Uk/DyxgfxW59mmCcMlurYpFSA9tHvDBzucBCC3CDZGB2hnfo39l7Q2fKNuHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560946; c=relaxed/simple;
	bh=Sdvg5JMXd1N5hbxzAyqJc/xD5HAwnbyFFazxnqXBAec=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PoLy8UFjY56n4ssTVfufN00mhgdgNqJhONP/xIBmPVwd1JzDM1opfqz77bufxeLoVcmWM/cXtucUFjQVsqpedBGBnxOqTISCeVo2iwjPkwtV4XMEjM8DDrWG2SF2ZrQb0hYgEjnzTkqui1AfJeO2BK09/tryJFnZaOH1QV8GQH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DhXv9aoh; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1dBdGWaC+GloupxSusOzykEALa8AXHUnWyKy/t7gO2w5BmQpozBdK8JeUYVCpOiEJCH72ffwRQxgJ9vNwh4l2cBPWsDeAfE4CcPoC3sZYXzOTfS1aCuWwkUU1oH+U85uSiJwP55ohXIQfiuCEjyHIgVKoDz26XNeV+/uk113QAaf/BRJFlWWFRYOwFxM0Bb3uonRdc30gb2MwrLCNzwcjqoyak8e/OYa3Ac02vY8qZEp2WvEPJZcI0ABlFAs7/TGGSJMfU93Y0c25Y9cFvg9C9MxvsxBRpmpiHnm59LcsL9ntADe8fdxz6L582S7a3SP9wv4YspAPFgg0eDjO1c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bIz4G5SGvBdHw4FdXTfTnOMCLZatcf5CqsXBPMG8OM=;
 b=cNr3uXC7ws+gDHy3og3n04+p0DNiObG4/3/Q6mHXoR43zISli0wJS1lP4vR9FZanCr50TEG2yeSbNE41jm2nWw+VUcFdNyeDaPjs3KFYWna+ffH7MTseVxm1gYF0iaWhEEys8J8ZBzYMQywj2Cz9lsbGLhDmHbd4nidTQ1qA4h/c2RH3BMIeFdpDoQWGifVcgre6ccRtZ8DIAtfil/wzSxIXVCjT5SJVzfy3uXIE1z/YrdcmW173Dcm1IN/TyoEGpaRC+rIG1qu1T1P6rCiOtJ2IMx6unXLG9jVBDzUPQd8Hmmte9q+FhBx1b3Xxm9pW2FWLBHMVUKelwq9ep8nMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bIz4G5SGvBdHw4FdXTfTnOMCLZatcf5CqsXBPMG8OM=;
 b=DhXv9aohcLOx7VskEdgscR+DMU7yB4G1RrlJxY7rGcFWkXPVhK5CGj80DIx2o5QpHPGKtFQt3xj6elTOZ34QsaxpEM9POuQYKe5iRAKh89W3Kdk+5RUpc6IctLcwLJJYP7Xdm3VdaBFeIdELa6Hw5jdGAlhAMVXCfPsXXyQzMbbUeHvTrLg1dTxgpnGsJcoaEs2N175sY2YubAdci7PwRmGyQ8SQuoE6J1r4+wZzloR3l0m1MccBD9ZWGA0kVaaQxcpDxtnIDq5/gxw0gIjKI5B/b9yZR+aILqW6W1uH1YmWIQEUeyzCDqVuWbG2LhtehqCKBdo+K+S+DVBM0s4NGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 30 Apr 2026 23:55:06 +0900
Subject: [PATCH 3/7] gpu: nova-core: rename module from nova_core to
 nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0260.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8289ab-27df-43e3-3e69-08dea6c889b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	tOQjlQFzpZrKA6+JSW/CbgYOy2ZHahoau8bglGVPwbqrmqhp4eSjA+OPWp9ut3s9bwgONurU2Of5Ap3ks/93SO3zA8cEhSrZV8p69eOClbCspt/i3pLMlwg/wTTOwkAB9ZcoGgnMXrzpV5pbLKhjpPQPO2l1UNRjDcrNvJcq3htxnUxVVRtfkmEqhUnp4hSIn3TrdxonWM8WEBVv6CjNnY0KFvdsPD8vqOBTQFrsLYxnzZXzFrcoZrPPQQDqymze9c+5I6J5DZEv80DURbE+V0HtIVC1bdFJB1VXkPxn7xwHEFYLHOwbs+hkbpVcaYvMhP4RHQwtNmJm6RPkAHu3AMiJEtHnF9SMcrYwD6VffiR7TL2smQtxbUK3zYn94LsyiKIclQ3hVmQziC/6RlFxIX+aVopDDQDl//VIyRNcamzHERnI8mmCAW0XcZhnp7lccfnsWVBBCDBn3HsU9HobSW4i1JF6CEdhbQM0xnK28I1q/V6MoecLOljN0fe386CtsM424BcfVhRuAxVcNMjbYw5ym2pZxlv/W0Dl5w9QmLz1CWbSyHnkUqiKot0yvoIod1+MEwDyeNWFFRq1cRlFu994Fx/bhwuPiW0DZ0ZU4kSFPS+uaaqtGS6t7JMMpEmk6Y5HmGZqiDkngITF6n9yjUIzaEuIkaTZnwmEv5zd/or7rp+CJfU5XBIhWarPSqYCWvC6HWe2q6GSGCcrFdtdykjgytATL3zeioHI4P8EMH0YAhkFBbRtHqwBFYpiET9zsJhNkZsnafP6puLZYXqxxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBZSlZnN29WK1VNRHBpNks2dCtjMkhTTEYvZmpQakdPeEt5QXVwL0laRmlZ?=
 =?utf-8?B?Yi9rd1psY2RHYzV1a2RtazE3VFBKdmpPa1A2Y0xvRGlUaXZMOUdrSTRPSERz?=
 =?utf-8?B?V05lNVhTVXd4NDhpY0I0Zm1VQWM2MzFOMXk1dTlWbFpXUi9wcjVnekt0bVkz?=
 =?utf-8?B?ZUlCQ2ZzeEQvMmxnb0pVVTAyUEdxVUlKQ2ZZM3VBbk02RU9LK09TZ0k2NmFk?=
 =?utf-8?B?T0g3T1BuSW9QaksvdEdWUlVIOVMwdGJjNENYZDYrTmQvbWFXT0xwNkgvWnhC?=
 =?utf-8?B?K2VEeGZPQXZocVV6ekxhRjVQK2hyYzNaeE5JanJlNEJMNnYxdU9ONEVPVzkw?=
 =?utf-8?B?VXNraFh5UVNnUHJURHN5NmNBSGYrR0RFVDFraHNKa0sxNHhyYi9jY293eDNu?=
 =?utf-8?B?djR5Y2ZVQ1lwYnpVNThYN3dLV0dkakF3RWxxQ1J3d0FHSkEya2YrY1dKU3Vk?=
 =?utf-8?B?M2hlV3ZzT25yV0RyL2ZRTHBNdlVKRzlUdE9YMGpvdW1DaW1idzRXc0s3ajkz?=
 =?utf-8?B?TDdkMnBKSWFyK0owckFxZXN2VlRPN28wTzV4RlVjWGhNaEFvS0NtMTB3d3By?=
 =?utf-8?B?TkNrdEVta1l1djcrRlV5OU5RU1FQRTVrY0o5Qm8xb1d1c0NXZ3IyQmNEdU50?=
 =?utf-8?B?TlhrSDVGWHlnM29YeEJmL2Q4YmFmUjExRTRDbTJwRmQ5YkdjT2NTWHBEVFlS?=
 =?utf-8?B?Qi9ZTWM4TVZQN2o1Mytwbm91VTNjR0FzNUhtdm5lTW9sYzdYRFUwdkdicDla?=
 =?utf-8?B?Z1d5Ym1IWDJLVk00V2RHdnlIeGV5T2FlRnlzWVpDYzJNdyt4Z2EwYnpDc0dn?=
 =?utf-8?B?TkRtRHJwcHRqdWI5anY4YVRVN0lWNjlVZFVEN2hkcnNDRUhmNGJ3N1Fram1i?=
 =?utf-8?B?ZFp2VFBsWDFXZDRNWTlwQzZSNlVlQ20rSVlTVUdYTFlLTDhFMEw4MzBmZXQv?=
 =?utf-8?B?VGJjQmVMcXVFYzJHL2RmVVBMRk5lRjdXOEFIS0F4YzVjbzlUeGtnMldoeExS?=
 =?utf-8?B?cllLMXVmeTk3cnZSVVlKSzA3YzNsSnMyZjViUTgwMFJoRjNESHYwcnBNc2tL?=
 =?utf-8?B?YkdoVUk0OVU2ZmUxWlBBQ3htdHpROHJiYndRMWFvczMrcFNWUDc1RGdVdU9U?=
 =?utf-8?B?V0tIb3g2Y1daS3I4YkVnaEtMdk5tWlYyQURQM3Y5d0NJaFc0MDRYZWFwODNI?=
 =?utf-8?B?clRZVWNOaGtXMWQrOXY1d2RVbHRnR3lZTktNWmpzenloeHhLSEdWVTgzMFBF?=
 =?utf-8?B?V0pLdlF5MlVOWGxSQkVyRXFJSFNFYjIwcnBqNGZNemJqaU9QTVgrbU1JT2U1?=
 =?utf-8?B?a3kxVGsrbng2bFUvSUdxU3g1b2RqUFVibHNSOEgweGpnWDUzZ215SGUyOWJm?=
 =?utf-8?B?UGxPd3dLUWNLZEh5RlFERElLdURaTGN5NzVUK05RcXFSMEpHc1RBZmZFQ1R4?=
 =?utf-8?B?b0ZrZ0JLcHducUN1aE9JQ3lYVzJaNTRLQmpFMXBLRi8rN21YMFVVeTkybUJP?=
 =?utf-8?B?TE1kVXdMMnkyZ3BjRENaSkd5Y3E0cndBejVzL3k3ZDJHdHo0NTk4V1BaNkpu?=
 =?utf-8?B?blZDUUE1eFhDTkh6VHlZV0oxblF4TVBVSzZiMHF1aHZuNm93aEdGNWV6bkVu?=
 =?utf-8?B?Wm5iWVRqRmU0Q0J2SXA4a2xrOHo1Y09WQ1RJdXExcmEyRXcxS0F6dFQ2NHZa?=
 =?utf-8?B?a3JTcjhhdmt2aFNTTjFvaDhMUmI3REtWV2Q3ck5PQjNGa3VjaFE1ZmtKWkJI?=
 =?utf-8?B?V0RSOTFJajd6enEvQXd5ZGh0TWdQM2h3NmNJcEpVczNPL1YxNlZMVFpjaUpi?=
 =?utf-8?B?dThQY0hFUUlIVGxBekFzSm5MOXRLTWRtek9Ld3JJcUo5SGUrek5ZQk9wTjhy?=
 =?utf-8?B?cEQ1em40azNheWJBejFTdGEvcXpaZ2dWQjlaZWJUSmZFZWxucGtkazFzT05I?=
 =?utf-8?B?YUM0bnAvRnNtb1hKa2ZNSUFBNElIeGVuWThrSUhIbjVUV0xtNk5reGoxbzB3?=
 =?utf-8?B?aXNvZmRObjE5MTM1YzRsakg1VDNUOWN6aUZmZURVTEordno4T2ZnRFI3b095?=
 =?utf-8?B?UWJnS1ZwT0VGT2tMdWM5OENTSUpFM3lrV0FzeUl3WUVmWHFBWThGb2JqWUMr?=
 =?utf-8?B?SXU2TVhSWHNEc0haeS9qYXpiMUZ2UllCRENhY3J3YWtsdGtyY1pBclJEbDZz?=
 =?utf-8?B?QWhYbUwybzVlWDBOOFlYZTgyQVZMaXI2dUVhOWpNMGFvditoN2lickZpZGl4?=
 =?utf-8?B?cDhTMFpucHhWWDJ0RkJDZURYUnlmR0NtV0xOSlZMR2NObVY3RnA5Wm9OVVJT?=
 =?utf-8?B?WjZpcllsUEJHajVzMmxWLzBXYUhhV0xJK3dCQVNIeW95M3l0T29OY0QxMUph?=
 =?utf-8?Q?X99RDp5HtxqYS8YRVg0Kf7EZNsRIeSPNt7OW3wF8QBbUE?=
X-MS-Exchange-AntiSpam-MessageData-1: DuoVx8joCH1iuw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8289ab-27df-43e3-3e69-08dea6c889b0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:36.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP7pmFVZio1ooHRpWCIZPjVbyKCjLTPB5tB9rIWhGga4ohwz9IsmTjQYgTRSq4rFYWmvVofBo3nB8dsF3848JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: 9A4E84A4589
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
	TAGGED_FROM(0.00)[bounces-12957-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Rename the kbuild module target from `nova_core.o` to `nova-core.o`.
This avoids a name collision between the module target and the Rust
crate object (`nova_core.o` from `nova_core.rs`), allowing the driver to
be built as a composite module.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig  | 2 +-
 drivers/gpu/nova-core/Makefile | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index d8456f8eaa05..f918f69e0599 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -14,4 +14,4 @@ config NOVA_CORE
 
 	  This driver is work in progress and may not be functional.
 
-	  If M is selected, the module will be called nova_core.
+	  If M is selected, the module will be called nova-core.
diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 2d78c50126e1..1f794baadc86 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_NOVA_CORE) += nova_core.o
+obj-$(CONFIG_NOVA_CORE) += nova-core.o
+
+nova-core-y := nova_core.o

-- 
2.54.0


