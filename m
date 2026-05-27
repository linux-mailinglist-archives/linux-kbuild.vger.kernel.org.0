Return-Path: <linux-kbuild+bounces-13349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJzUDzrbFmrVtwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13349-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:53:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFA5E3AEB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9EE8300C981
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516774014AD;
	Wed, 27 May 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S4az7cgZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A148A3F58FF;
	Wed, 27 May 2026 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882759; cv=fail; b=TtVAndzMMNKTtuqlODOG3O2blr+J77Ucz9CDZXvBXSP9kj4XnG3NR0lshvi07dNfPSaFNK9ywyH65r6XlakgnHyGvXZvnvqEA/RiCwLo1PjG076MuKxwCzHuWwZ5KuYQDAx9yV6qGqNdQ/XEqjmOzMD8/APaxxl3gxTMktSntyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882759; c=relaxed/simple;
	bh=Hr40oUmU3Ov5QoGhcwesd/bktvay6tyDTDvlgoksjxw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ree3POBEbn2CX7ZoY3mptzxnGgl+r8KgiZS/oIL35Gamf++N0k/ysNXOKqIEjQfuo+Z2tr+RNfYx+4s7Akvp4RZOnzVwqILSKYuC/TuKgms+4QrceYMMxExavSAOn+3PiGZVXAdBl6w5p5ysBt/xVW8IODc8Yv+13qW31vo+rrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S4az7cgZ; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jssj6z0az8JwMfvddxLKputetLhOnddWFO8xz83niQj3QN0bU+l3YsTNToefN9gZaIyWMQ73qi28OIxbeFeTu/X8jAyp89J3jxKMqeTp9WdH3Ms9noLWHb6j//s2J/MLcUOZ4GtQbCx/va92U1nHRiDyC4aiUGL8MMuoZWI6XD+0zRGezaAkt8MDOdW/humesydhU9M+qZDf8AvrG5OCi3ES28qd+RiiuqghBCBpsWdNjnoQz1WsIg5MZUpyHvpuQx3OhCNNacZELTUjvG1adOX8fUKPZgfJMIFzR/dnMuW+DttG2+Y8x7aw0daIBVq3W0nR0bVp/3rGIhLhvIN2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSu1T9bIAI/R3Agd0zSGjx1YjTGkd0ZkI3DbVmRVfCU=;
 b=CR8RJmPwpw0BcK946ToRSctWoT4Ewd84Sw5KorMIXu+rzLiIrWo8tHQxLBBuPKjeFHz2fY/7CGncimq02u+SaLWjluPT1C9ox0AC5lOvkh0xeRgsvOQdzfGeYsXipWf6M0KGHH3R4ocEcBgn2TtBUN1od5bkYFGFltO4Ym067oZ0QO+aCIJdknDla/p+iYYy72okg7zQZ+2QfNo7gQvkf33kEl0Tucxi6j9Xtxlc/qxreIIYY+EFy4qNjwwSrtkC+hlo1pbtOi+EIpP+X2Q6lEE0FFSWhROmSiYCPbz57ZCHH59z5JNrJFVmoqfS3UL1CfgDuB7S5pEeDgK/q3kMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSu1T9bIAI/R3Agd0zSGjx1YjTGkd0ZkI3DbVmRVfCU=;
 b=S4az7cgZ7cjNuuaGqZ3uKc1/7kBvJ9N2dkOHaMf2x2FQ/le1Mo+s+U+IToCaIZ2AVh841cMHxvKTxR8GbaoUudw3t44zGsUdj11l3DSuYnS4j1LMeRD+9aaXdYJgk1NfCwmoMIJTfEHCJL9F3ky0HAw1GujQzkwmdTusxCYadxFSYpsyjHXgWy/QRoBs5Tqzon1STo+LOfB9RotW9KQ9lWj/TJiQt8tk3J3fMBUgeXzKZO+LJRNoMHdjBD1zkZVIAQ9u3Tj1KUF4XdQdRcFqShKFA21THe1FJKp+Qv6klcsuOBwuWb6S1qx/CxygDeptB3/k3q7z1fHT91DRSTnAvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/7] gpu: drm: nova: enable calling into nova-core
Date: Wed, 27 May 2026 20:52:16 +0900
Message-Id: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBAFf4Xs2ZrSQhVO/ofhUMoia2JL2tpgS
 P9dwLPHSebNWyGgJwzQFit4TBTI2Q3EqQAzaftARsPGILhQvJKcWZc0w2V2PgZWczE2jTK11j1
 sk9njSMuRu3c/Du/+iSbujd2YKETnP8dfKnfvTzqVjLOL0bJUqsLmKm820UD6bNwLupzzF9qio
 Eq7AAAA
X-Change-ID: 20260430-nova-exports-502f996c5aab
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: ae41f1a2-22d4-4355-b1a0-08debbe66dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|921020|56012099006|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	QQdod4N13lEyVWT8Re+fmt8ctr8utUwx7StjOx0HsL8Dy3vH7lGVJPBeURU7NZnv5H3dIi/NXMRyQIj1wI4vKMJyHm4Gn+f15nntuIaFLTlkbwXeEY9vF2wEvZ73VbXd+sB9EsQApMEOVaP3s/AaqrW/ncOkiLpDp21W3qxIFwIfPjGbfTM3EVqljsKuLwzWGxxfUQRyxguDpty7xBAGeKcZrtQtPhiVGF/6f588tLW46teP/K8CUR2x6iA0Ads4ctvavJA5wNhZ978yYQQncIzPSMvAfx6HNBhR4tC6W62uWph6a6agdu0YurDWtEXVixw8Xw5YR52v7c/wYGy++bgSs9doh57zERMEpocvIt4pwaftKa4f+UDC1yS8tyQ36qq4LaCubFz7e9RBZPcjnjrcfPpwr73107vJsVGWrnZ+wDSlUOkm85kwgq1VBsJPGd8Wv7p+rUfJyF/jnzjWxPhZASMwgCmsX+OhfdbA7mUSjQl5pZHcwiULqVjekUDqX43Jv2nTFUqTlb9UMlBRur99dl5UZfvvgdk2p5b/4dpYvIKWDDW13FvUp89BBfpzCLx176BZvAU4RFZNUAnpvCeteavhuqrTJGokqxwgptKk1NXtsb5GUmAjr/LYpCC7Or4/WgjTUo0W6M5ezuwhbmh+tVgi5x9wxUwB60uDzdhTDiBlTqogiS0lWJ6+0Jg1j/i0dDj3leviZ8KjiGo0Yl7CEeIY3sLSP0rKPM5u1+Uys5rtcVsSsSJ0BnZCYm4x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(921020)(56012099006)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVdpZno1bVhpWHo2RWFGYnlnQ0prVVpXbUtzWk1ydFlaS2pVeTNmcUZ1alZ3?=
 =?utf-8?B?YzYxQWF1TDJSU29qQi9vbWN0ZmprazJOb3RBV3pNWGNsbmNha2NZZlVtWUZG?=
 =?utf-8?B?a2JCcHB2QjkvMCsrSFpCa2lmOW9jMjRSK1Uwd3hmY0tWMklEdVVROGtrS3RT?=
 =?utf-8?B?elE2Z1RDL0Z5ajJETXFiS0wwbnJjQ3JzNHFJckRDNzFuU1pMR08zalpzUnU5?=
 =?utf-8?B?WXZnRHY1b3E0VDRZWExxSkh3Q0k5K3hYdzdBczY4a2I3OFNIVEdOZW55dnZ0?=
 =?utf-8?B?RGp6RXhVWHB3YWZYNW5Dd01qaVRsaG9PbjZiOVBJSy9RL0dYZXhvYjZHc2pX?=
 =?utf-8?B?c1JVUWk3VW0yeXlNQXhSMXR4ZVN0SUdLbHREL08zREgzM2lyTjVLaVAwRzVF?=
 =?utf-8?B?Tkpzdm9OMHZHSHJqYWkwcEFpVFNKa2s5eER3OUV2TVdZRFh6MlNZZkpaR3U4?=
 =?utf-8?B?b0FSNmxUaElMandZL1lraUJjUjlFb0dSS201ZFk3M2h4TXZpS3Y3WjkzRlJV?=
 =?utf-8?B?dEM0SmQ1RGdHdGQ1Z2o1bFh5VlNrZmNQUDhnbG1XcXNGcjdpWXpwZFhBN3By?=
 =?utf-8?B?d00rRUgxSmxJRW0wbWF6c1RCOXJ5d0s5Nk9CUDVmZkRubURzT0Z1QWxKSUlX?=
 =?utf-8?B?SWhMejRtVXVrK0FYcU95ZnRrWTdVbC9nUVdmbGpDT0tCRXkrRlBSVXJ2dWlT?=
 =?utf-8?B?ckJ2b3E3QTVvTjZVS3NkSnZIVnpZSS81MWZjbFdIcmRPOGpIVlpjZEZMZEFr?=
 =?utf-8?B?OGxHTCtWVFUxQUJqODdJb0lJKzlIQTQrTmFpTzFmYlhHdzdhMGpoc0U4Z2h6?=
 =?utf-8?B?eE40SU5obHpFc3BiNGlpWGJPcXVOaWtnT25ZQW9MM0cwQi9NdDM5ZkNzY3lT?=
 =?utf-8?B?V1BIZkFSVFluRDNRcUsreWFkS2pxa1o1TWZCL0NPQ002c3ErV1MzS2tPcmVH?=
 =?utf-8?B?allpRStVK0dMdGxQSkQ0SzMvYmYvMWt2SnNiS0lTVVVpdzczZEk5OHgwVWxM?=
 =?utf-8?B?ZzdldHNHZ2lsL0MwcHdrbG4rdVdSQWVBU29HdVFnQUxxYzVxcTFvK3BQSXU0?=
 =?utf-8?B?ZnV5Q0U1R1lCL0VqVHVCN1htc1NDZGhIckRUZDNkNm54c21MYXlPSFBUNFp4?=
 =?utf-8?B?Qnh5OEVsK0hkM0RmL3gwazQvRXhiTE16VDFoK29kdzI0L05pdWM4Tmd2bEoz?=
 =?utf-8?B?cXFoZWJMeGJrbldBR0x3bUp0Z0pOaDl0REZKa2Q2YkZIQXhGSEpoMjV2NGhn?=
 =?utf-8?B?TWZ1OEt1WVZuYkMvWms1U3cxZURkRUIvd2d4bzQ3Q0drekR2eldlZUFiblZk?=
 =?utf-8?B?SmZWdU5kNnM5Sjk4N2JIRmtjVE54eU10SVMrZnovRnJORkRPSnJBcnhUVFVX?=
 =?utf-8?B?TFl6WHdhQ1BNZ3JaN2lPcHlqUUVVbVFnZ3pKSEh4M2V5VmNMOUhuQnpFZStR?=
 =?utf-8?B?aFI3L3lxVFNPRU9aM3NZYjlMTmplNFZsQjZ2dDVwYTJBeWd0dU9yVGlWcGdo?=
 =?utf-8?B?TnFiekxHTVA3UDB2bTkwYTlDVWtSZlh5TnlkRVhxb1dHNlMrTXd1WkVCWnN1?=
 =?utf-8?B?SStueUhNcXdnRW5iOEZkT1VmeDM2c0hzTnIvWnR0eU5mTFFhREo2VklMb211?=
 =?utf-8?B?QzdERXAzc2thNEVXbitEZmFNT0RnUmRSMWpiYzJESDFmUzErazNkM0dOblc2?=
 =?utf-8?B?dWhaSDlEaE1TWDV4NXMrYUYwcUNMcmdMS0piZVQ3WDZ4U2xIb0dKTWNxTjFJ?=
 =?utf-8?B?Tm5mM0xXaWtTRzg1RkNLcUsxcWJnZDFwcVpKWGoyTnpVemNVZFRuM0xPU1py?=
 =?utf-8?B?MzloMW9EUktuc3ZFdnF2UnNRbWhwT1daemEzc2Nkd0pUQW10T3lyZnBzVCtp?=
 =?utf-8?B?L0FKNWpIY2YvZGorMHM5LzcvQTZZaGhJcVBqZGhGMS9XalFNSzdydnZPa2tH?=
 =?utf-8?B?d2wvTDd2UTUxMXFnemhibGhSdkdUZ3JQcmp4cW5uZ01UK242UW1RdHhqdnVy?=
 =?utf-8?B?V1c5V05mWTBmOWJkdG10OGRiNU5Oa05BdENKeFNMaEpKMElkc0NBQy81YUZI?=
 =?utf-8?B?Q0prSEpXUGVjUXNqTTdhRmhweUJQYzJQRkZ6ZlJCOEhXUkFUUnRrUXBVdmx5?=
 =?utf-8?B?cVA1LzZzY1ZkckkxSXBVLzhTOXJJYzF5Ung1dm10TkN6SUhiQVZheFg3cVBN?=
 =?utf-8?B?T0RjRjZWTmhqbjlBSFBTUzJGUi95bHZSV0pFR2Z0Z2ZwejEraE41SCtvZUxZ?=
 =?utf-8?B?ZXZFbU1kNk9DTGNRTXBuNFRqMDl6K0hnZVZ2VzJRMFJHcURUZDE4dFV3dFh2?=
 =?utf-8?B?dFZUU2o3VUphWCt3S2N4aHRVNTNreTdjMGdyelIwUDl0OWhLQWdvOVd0WEw3?=
 =?utf-8?Q?sd4IUHhQu9IIYESWZlwVbOI+5kudyFPMPeNXHd1K2F5i1?=
X-MS-Exchange-AntiSpam-MessageData-1: 0GMPkVB0JT67SQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae41f1a2-22d4-4355-b1a0-08debbe66dea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:29.6226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLcAOKkcIq9MjyiaTxPzLEaZcJEwIe+t3wrGjO8ZGo8zxwDMNDEweK9mdx2I4+Zkkag7Wztna2D2kCg1cvc2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13349-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[26];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B1FFA5E3AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`nova-drm` is scheduled to expose a user-space API to receive IOCTLs
from user-mode drivers, and to call into `nova-core` to perform the
actual work. We are about to reach the state where we need the ability
to call into `nova-core`, but the current Rust build system does not
currently support this, and the solution will likely take at least a
couple of cycles to be merged.

In the meantime, this series introduces a Nova-local workaround for
`nova-drm` to call into `nova-core`. It generates the `nova-core`
metadata that `nova-drm` can use to resolve references at build-time,
and also builds a list of exported symbols for symbol resolution when
modules are loaded.

Since Rust symbols are long, this work ran into the limits on symbol
sizes `modpost` can handle; however the overflow path was not properly
handled, which resulted in late failures. The first patch makes
`modpost` fail on symbols that are too long for its internal buffer and
report them. It is not strictly necessary for this series and can be
merged independently if preferred.

The second and third patches instruct the compiler to inline some
methods of `pin_init` and Rust basic types to avoid those long symbol
names. Interestingly, this also results in a smaller nova-core binary
size [1].

The rest of the patches enable inter-module calls from nova-drm to
nova-core.

This series is based on `drm-rust-next` with [2] and [3] applied.

[1] https://lore.kernel.org/all/DIN76NTFEU1N.1RT6G4IFD62RG@nvidia.com/
[2] https://lore.kernel.org/all/20260525202921.124698-1-dakr@kernel.org/
[3] https://lore.kernel.org/all/20260525225838.276108-1-dakr@kernel.org/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Rebase on top of HRT v5.
- Inline some `pin_init` and Rust basic types methods to avoid long
  symbol names and optimize code.
- Print truncating modpost symbols and abort upon meeting them.
- Drop increase of `buf_printf`'s buffer.
- Drop obsolete nova-core renaming patch.
- Link to v1: https://patch.msgid.link/20260430-nova-exports-v1-0-7ca31664e983@nvidia.com

---
Alexandre Courbot (7):
      scripts: modpost: detect and report truncated buf_printf() output
      pin_init: always inline the #ident and #project_ident methods
      rust: always inline some init methods
      gpu: nova-core: export Rust symbols for dependent modules
      gpu: nova-core: emit Rust metadata for dependent modules
      gpu: drm: nova: build after nova-core metadata
      [POC] drm: nova: demonstrate interaction with nova-core

 drivers/gpu/drm/nova/Makefile             | 15 ++++++++
 drivers/gpu/drm/nova/driver.rs            |  9 ++++-
 drivers/gpu/nova-core/Makefile            | 46 +++++++++++++++++++++++-
 drivers/gpu/nova-core/driver.rs           | 59 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gpu.rs              |  9 +++--
 drivers/gpu/nova-core/nova_core.rs        |  4 +--
 drivers/gpu/nova-core/nova_core_exports.c | 13 +++++++
 rust/kernel/alloc/kbox.rs                 |  2 ++
 rust/kernel/init.rs                       |  1 +
 rust/kernel/sync/arc.rs                   |  2 ++
 rust/kernel/types.rs                      |  3 ++
 rust/pin-init/internal/src/pin_data.rs    |  2 ++
 scripts/mod/modpost.c                     | 11 +++++-
 13 files changed, 154 insertions(+), 22 deletions(-)
---
base-commit: 79c29e27d676a74f9238506a5fe2134637356708
change-id: 20260430-nova-exports-502f996c5aab

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


