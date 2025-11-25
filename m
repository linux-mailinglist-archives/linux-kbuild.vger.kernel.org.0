Return-Path: <linux-kbuild+bounces-9829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CADF7C8492A
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 11:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D64184E8F0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 10:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1339E314A7F;
	Tue, 25 Nov 2025 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="HD9Ya+uB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463C261B6D;
	Tue, 25 Nov 2025 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067963; cv=fail; b=SqP7NKKWMHSn04yRbZm4QxLYHisrXCfsM2O4eoem9HphdSq4j8PE76Bv8/nVzuYyuyRa7BXpdqEkFUQ3e4blfTP1VE+gt88g7TItlkirzIqIpHf8uhvw4qdBVKKbqmVK8tEnTob1PbOZQmsWQBfvAnHTLZ6xU3JS6LHo1nDAFU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067963; c=relaxed/simple;
	bh=iFAhtscJr8UK7HtXuD/EHjok+J++1kWGZuYe1060I30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PLHTgeM9Z5a/FNSoIDMHkFAu/VM9d5RNXeIEJ/iIG1ozhJimDgbjSytuhWpYhv/d8JgmnvzFXvVNbQS9dla+2+8NspyYAljyXKeq1+EexiG52YuEVt1Zn2Qf0JkJEHkqjfoBoyoPg5SqWwBDL1bt1/B8czE21/8sfzGtEWUtJGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=HD9Ya+uB; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrZ1DahUXI/85wx+chRq1ZFJBvyz3dO+3Za/rVKKBHtb+vPJIWKtKIq295M8eDmXkWm8wpm0rVsreCZlqsfmdUCfy0oUo8MQKCh/5A4gI50yILOB1OiorRbzrUICelTxRGT/n2H2OR8NoyVa/B6S7UxR21cxDzKHVt5OlnprriqRqo8F201RwTYPyIpBGS7xK2Di7slWx21WaSxMn8uiObxCSdP+Lrz97tXEv5ERMFKImSKmJu/0jZssOEo/c17G8Vj64O1xlSJQNwN/M9N/X/87BUsAGIoPlWGnuL3qcG/dcGhQMK3RgCau+xuZeVWnpS/DzXZVjASWCkW1ohs26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zccKMgKhXsMuofRmMv47fJ6/oKU6gLryFRi3KSl4xHQ=;
 b=jfWWcltCWdY583VwU0UYE0Hy/FWlWQiZbeBmnIsJOP9aY13CipWQsJZR5b5mU6eFfH8E5vZbBGjc541QaUoEw77+8dyz/6eXgoyvVP+dFcHcf6qFpFptOINZWCxAC4Xa9lH84brhCassf45eGqGKciRI4VU3109/1szqd9lyy94licy1H92HMOS5GN9NaNjYTyEHqFFz0SnlnjTEX55Y+B8RagPu8I90nmsGPoWuJfZV+FgcHVAgJZFPCS6eGPjpb16Ac7MHdoD0heGE6ehcIUFzHDZiyYKG/Ue4roL95sYzxhQZK2hYf5JIvBFnVMdHLq0mJg7MAUo9xzJ5xIYXiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zccKMgKhXsMuofRmMv47fJ6/oKU6gLryFRi3KSl4xHQ=;
 b=HD9Ya+uB5YzIWalSOihxKBQBzEygjnbYmWiTzhT2OkV2xnJVsV7SSC+kBtau3b9Dgrqld9vn3PnomFY3QOLV30UKNbgVkHM501hu1c7yuklzCOWfaMnPeK2pLW6IvjQZpi2o3X9POilvpBngj3hpo76Kw2cTprti7m2H8ei5vW8wOUNn8MygqtMOhL1/vG3xYKJH2N4zf9JBuqQj57siR1JmQ/XSKuW3cjkggxOP88qdBBoEGaucDdozWqw5/wWZ4lrH3wzNYNkYyaEPyqkN3ySsQS+wuS1nH+YLhRYotGXkSOCRHtGD8WC4T5Z1QhysS32N3eOyb1xB7EmFPNziBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PA4PR07MB7293.eurprd07.prod.outlook.com (2603:10a6:102:f6::18)
 by DB9PR07MB9175.eurprd07.prod.outlook.com (2603:10a6:10:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 10:52:38 +0000
Received: from PA4PR07MB7293.eurprd07.prod.outlook.com
 ([fe80::ceb9:4aa7:3c02:1f42]) by PA4PR07MB7293.eurprd07.prod.outlook.com
 ([fe80::ceb9:4aa7:3c02:1f42%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 10:52:38 +0000
Date: Tue, 25 Nov 2025 11:52:38 +0100
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <aSWKdgypKqt1Mq_J@L-PF2SHBMP>
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
 <20251124130747.GA3957523-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251124130747.GA3957523-robh@kernel.org>
X-ClientProxiedBy: AM6PR04CA0026.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::39) To PA4PR07MB7293.eurprd07.prod.outlook.com
 (2603:10a6:102:f6::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR07MB7293:EE_|DB9PR07MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: e63327bc-1df6-4059-7ad6-08de2c10bfb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGU3amJGMExGTGFtczVUQlVWWm5vWnFOY0IvZUFJUG1TY1c5SHR5RFZaWjM4?=
 =?utf-8?B?NTRFalJVL1hsb3VyNXRxOG4wRTN6K25FQUxyTmNaYkJlR00yMjdSem9mODlr?=
 =?utf-8?B?NjFxeUlxUlFsakNES2p2UTZrZU5NcjhzWCsvU2FkeWdYMmExNTlmMlRybHJo?=
 =?utf-8?B?b0R1TExEdkNxNkR2Y3piWnRuNElNZmFFYzQxMWVNdXZWRWp2d20vaVNmczhv?=
 =?utf-8?B?dSt3OEl5WW8wQUZCOVc0b2ZzYk4zTWpoSHdQZXVUOTNqNW1iSjN3aGtHSU5M?=
 =?utf-8?B?ZGdQK1BHeFdhWEkzWkVxdWVuRVZ2Rk5ibkF5cjFBbnRuUll6QjhVM2RCc3FX?=
 =?utf-8?B?MzF6SzdNUEtlQ3l6SzMwdDkvd0xjOEd5SVZML1gyZFVGM2kyV0w0NXl3OWRM?=
 =?utf-8?B?WjAycG9sbjBETFpuNEhZYjArdDZGTmtranVuQlI4TkJYY1RpU05QSHU3dGVr?=
 =?utf-8?B?RnV1aWgrMHFicVdTei9jTDRyb1ErdkJXdkthcG5Yb1FDK1ZESGpSVC8xaXpP?=
 =?utf-8?B?SFd2K0pSeDgyUEFKdFlOVitYaWRoTU9hL3hKc1U0dUxkcnRiaVJiMGpaNEZU?=
 =?utf-8?B?OFhZbG5QcERVbERNT2VnTzByTkVFNTJuSzArREMyZzdIV2c3aXlPc3l6QzE2?=
 =?utf-8?B?M0M5V0tnUmxCNXo2TWUvdWdMM2cvUTN6bk5FL1ptSThsQXZuS1RORXNMSzZS?=
 =?utf-8?B?bVdmczY1azJpdlRyTGdpK2ZYbDI4R0hwV0lwR0VzaEllOCtON0l5bkpnUDU1?=
 =?utf-8?B?THFWWnYzQWxxL3Y4T1h4ckhxUy9YNE5wNG1Ib1Z0MXlSUkptNHkyZi94bGxa?=
 =?utf-8?B?ejdZRFlRSHVzMXRxZEhOaWY4TzNkbXZROHNsckdYOWNCU3JtNjBhNEJ4cVQw?=
 =?utf-8?B?S3Q0M00vdU9lRWFuNitlaDR6V3U3RFJUdWlOU1NzeEdpT2UyMFBzMkNUOFN4?=
 =?utf-8?B?QUlYSm1JSjNJNnduREUyWnlwS3YvSnpkV3BackZXVVVzVmdTTFphOEhOa2kz?=
 =?utf-8?B?QmJwUFYvQ1N2REdWOEVzak92cS9iOXplSjRSZ2xtVnpTaTJZZTgrY3AvUUFs?=
 =?utf-8?B?Y0h4MU1TOUdaZUZuL2x3dS9LanJqYTlTS0x3RS9CdXowSHMzS3dwNmdKNXlR?=
 =?utf-8?B?YlV4QTNqRk1QSDdWVVdTdXNiNUxIM3lYRFJvdnAvV0pMOElxUjZodlVDQlV1?=
 =?utf-8?B?VldiU1Juc0lZMmY3TUJGRTJOZjVmTmpuNWVuK3dRWTRvWk5rMEk2QUczZjBh?=
 =?utf-8?B?YklObXNIdHdEZTlkOUdmWnBDTkZiQytJTHFvZGIzT3U3b2Y1bmZZQnlvNlNR?=
 =?utf-8?B?elpjQVB6eWU4M3E1QXBpTXk3OFllMW5oQklMSU1GaGxCSEVQd21CWE5xRnVa?=
 =?utf-8?B?b3MraVVMS1hIRGNzbGd3ek5Xckh3YStjY050OGJXVkRpV3hSRi9hUXpBTEh6?=
 =?utf-8?B?b0N5OFBhY1FXcW1SdTZPaTQzMDBLbW4yMytMWmV5aXRZZnJrTXY2cUdMMkov?=
 =?utf-8?B?R3BzSFc2U0pGOTRtS3Jzck5ZamRIeXE4VldBS2lpQXdid1RNSVA5NUcyN3Zw?=
 =?utf-8?B?ZGJpa1NDTWRIRDFhTzIvNFZsU09qMTFTTXJsWnBFeHlTdUQ3a01PWGFnd0Mz?=
 =?utf-8?B?R2dGektFL05Vd3hNemY0NEczclZOUDZsaG9SK3JOdkpvSzlmMkpwbTFMVVM3?=
 =?utf-8?B?ZDA2NGJ0bHF2bkdEOGNNenVJTFA5S1g4Y3hCdHpsbEJIK2pJZnp2Tmk5WXN2?=
 =?utf-8?B?QklmOUZaZHg4WVpEL0RicGl5UFExeEpWOTZHWmo0eG1GRzljTno3YU04VFZq?=
 =?utf-8?B?TDZ5cDJMY0VONzBva3NwZGZua256bGdTdVlkRTFoTkdJRXVVSmpOVW5hMktV?=
 =?utf-8?B?S3c0cTVEMnZaS2xZS3d3MVVsdmpJZWNKRmlQTFFvQ1FTZTNraUZBT1lDVzFn?=
 =?utf-8?Q?7yfpVVXjz/d3fOIbxbnkXegyJ2kfNHmh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR07MB7293.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEdNQWhFTnZ5aWd6Ri9rUit3S0tWZkcrVkZkc0ZhZ1ZiNDNVMDJWRTQ2TnRn?=
 =?utf-8?B?TVhGb1ZOTU95RFRWV3AwMjlodXFsWGZiOGxZMG5PUS9Vay9lZjNGL2dpMnJz?=
 =?utf-8?B?MmRraE1xVld5dDZZanZOY01UN3FkSFYrVWNSdnF0ODhndHVZRXdSYm9Zc0V0?=
 =?utf-8?B?L1VrSlVFaE5QWkFhSnFkbzZuR3hRNFBXV1NhdkRZYWkrVlo2bmlLWDMxWUlx?=
 =?utf-8?B?ektXVmg0NGFZdVRmNnRjL1JqZ0FISTc1QmhVS1QzYkNQdHYyNXpLd1FnV1BC?=
 =?utf-8?B?TTNUcW5laFo0V3lqV3I4cERrZFhyRHNwcWVQcHJCa0Njd0h6WTE1T1lEQzNC?=
 =?utf-8?B?ekFsTFJJa1ZKKzBtTkZjWkRtRnpHbklNZmNrVFRka2k5U3lPRE12c3FFRXND?=
 =?utf-8?B?ZS9rWERnazhqRmhTOXI3R0RuWGNYSnRFeXJ1WkoyNHhBVUN0eFpFRDQxdUJM?=
 =?utf-8?B?RUFZWm9rTjd5Q2VxRGtsTnAySjl1ayttR3BKMG9lbXlieUZ2SWlkYVpVcXFw?=
 =?utf-8?B?elBvazJIQWtySmswSjBxN3FFSkM0TjFmSHNUd0Uvc3RNT2xnM0VWQ3ZWR1RB?=
 =?utf-8?B?cjVNbWd1ZXpHdXNCZHpSZlgyNnRBclpEMlNPeW1WM3lmWjU2MGlzbkpUbVJM?=
 =?utf-8?B?UXplcXV6c0hWeVZIUDBnQUtXaTVmQ0g0WERYYUFhSU5ZM0o4L1M2Y3VFOWZl?=
 =?utf-8?B?M0QzSTAxQnpsSEdVU0pRc2JVUitxMllRUjlRRU5lKzk3YS9MeGN6aENKbFNp?=
 =?utf-8?B?Q2t2YmRRL0V3OXA0VUZuTlc1QW5xblZZMGVBZTF1M01ldDk3MmkzNFZrOGRo?=
 =?utf-8?B?cnNKL1lCSTFFaDRSRDFWRG5yYkU3dUJlbVBNM0srVURqT3JMMmdUUzF1TWxz?=
 =?utf-8?B?VGZJdEcyWTROOVgxSW0rMWl3Q0NPaEhQNllUTUdjOUlhaHlLRHh4eExlNVFu?=
 =?utf-8?B?ZkZTSzRWbGdpc0drVzlQZXBsWTlqa0VxaHkwekJUdVFPY1EwOEoxdGkrV0xB?=
 =?utf-8?B?VnhCNE1WTC94WC84T2pzTUtEZ2pvZjRBVkJqdkNjVCt6clROcTA5dTlKTUZS?=
 =?utf-8?B?d2VPM0FLTktxQ0ZLWmp2dk5uQWg5MmFTZkd6UGgwTjh0Q0VtdXp3T0Vsam85?=
 =?utf-8?B?cGl3UzBoL3dsMTJ3cEFBN0RoRnV6L3pkWTVsalZUbDd6SS9vZ1BGcFRhWkRN?=
 =?utf-8?B?elo3dUxTRDF5QnFtS0lsK2hxVmNHR1krTVlIMzMxUjdSRHhYcko4SXlMTVhG?=
 =?utf-8?B?eE5HdTkxanpBYnFVMmZ1WTZzT1g5QzR2bDd0ZFRkTGhIVlhnS0QxdklBNDgx?=
 =?utf-8?B?ZWZxQnBBbmVpeG83ZmlPZ2NGWmdPSWZrMVM0dFVkMTZ3T2JESkJHTVNvNXdF?=
 =?utf-8?B?S2VSUUlxNkVtaGJoTnFxeTBjaHB6VHZHek9yUFkvZmhHN2tmR011UDl5Yis0?=
 =?utf-8?B?V3hHSzVlcEJ1VXdrZW1DRWpJVTZPUEQzOWdreHkydi9rbS9id1hHelkzMWEr?=
 =?utf-8?B?d3p3cW05M1JEWWFEWGpUOVZKYWsvN0pGT0hNYTVyRllYbmcyQVVLYzluM3Fx?=
 =?utf-8?B?QVdTTW5TS2dWQ0JGR0ttbFZGWDBqekxQd3pyUFR6UWJXYTN2MGdXNG8yTG5o?=
 =?utf-8?B?VVhsQXJjYXBjMFNuM3FwZzB3Rld0enEyVGpHTlRrQ2k0VEhEYks2ZEExSHdO?=
 =?utf-8?B?ZVVGenJEOUVjSjBlcmZrbDFFWk4yblhZakR0enU5STNIdmx0MkduU2planhi?=
 =?utf-8?B?Wk0rV3hyZjVmOUdqVlFWR2NRdkIwMjJ1dEdxM00wMFV0TnUwS1k5K0JvRklC?=
 =?utf-8?B?UmVRRE9BMUxzZEtES2VxT3FBeGN5YTZLdnRRQktQcm5JQ0NYZkpaaWt4K2xx?=
 =?utf-8?B?MHdoaG9jOUhNL0pDWHppcllKM0FhazhDVVd2UXV0STdrVEZ4bHVGNWRSNzNK?=
 =?utf-8?B?b0VGTW51UmpkNVF4a1BMRFA4ZmVHdHpqMXpjRDhmU0UyR0F0dzhJWUZxZW8x?=
 =?utf-8?B?dllPZUoxNkVXZTYxallQZkZXSU45aEZlVk9ibThPdHZNdlUvV0ZGTjkxbXdX?=
 =?utf-8?B?bXhBU0tJMG5Zc2pEeHVrYXZvWDZZQ0FNRHpYYXV6WEMyK0NkanF0cUNtd01C?=
 =?utf-8?B?RHFHRUtBS2ZEV2IzclQ4NU5yaW1CVEd4RzhhRGhWZ2lHL2c0aVp6VHA5WW5k?=
 =?utf-8?Q?dyRFPUmUM7k5VRKjmgp5xtc=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63327bc-1df6-4059-7ad6-08de2c10bfb8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR07MB7293.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 10:52:38.3928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQCNj8MJGEu4PLHjboj+zRCjtc60or6yAq8Kkgidsq+RRvSAiClSuzB4s85pIJ8rbHWVPCFBt7d0K80QhKc6WEZTSE7XOx0olB5fPT4CX/IG21boiiIP4+BJl2pL4nWr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9175

On Mon, Nov 24, 2025 at 07:07:47AM -0600, Rob Herring wrote:
> On Thu, Nov 20, 2025 at 03:06:43PM +0100, Thomas De Schampheleire wrote:
[...]
> > In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
> > scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. The
> > value of 'targets', however, is only final later in the code.
> >
> > Move the conditional include of scripts/Makefile.dtbs down to where the
> > value of 'targets' is final.
> 
> This breaks 'make dtbs' (and just 'make' for arm64).

I see the 'make dtbs' failure, I will investigate.

I don't yet see a problem with 'make ARCH=arm64 CROSS_COMPILE=[...]' after a
standard 'defconfig'. Can you please clarify how it fails for you?

Thanks,
Thomas

