Return-Path: <linux-kbuild+bounces-11751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PZfEtd2r2nkZgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11751-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:41:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6D243BAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC0673022544
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59CF2DC349;
	Tue, 10 Mar 2026 01:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uuk8VWP9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A412D948D;
	Tue, 10 Mar 2026 01:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106865; cv=fail; b=C9k6+f1IpyoyI9gmEjzCr6DADU6WHON2Q5PVTdHB6lGTLPLd5nfNFOxn9ke0MVd4sPDazkv7qQbPYPiC/6c761o3jxPE9ITvUMXs5Al9gTZcr+QgKYfa0syzErxikfTzUJmnwvxt1y7YfZ71M0nJbXU572NKxfxRtJeF/G1LWKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106865; c=relaxed/simple;
	bh=mYDdY0Hx2n5/uzLB6kKrmKY5LJALV1nuMupoLmfinRI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Y8Nm+EkcDxI2JpYtIJa+0cox3gg4kUFZfuBlAs4VcxJrGF5EWjaZNrMKa4KFvnGXatK9erpCiiRVLhYM9phTdEHCCw8ZTmt22fBJlxST1lS3oss5F+PA+ozx0gBIewA3JYTQ8n2aiRedArQmjYM/Tl7eqckCpGWP+CXjQRkTcvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uuk8VWP9; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK10hO8OIX3FkGW8lnXtwrl+gSAzknDnMx/wYvV8msVxYt1RePVWKStUvSY4RY0fza9z7k98DgXcv3xB5s+53XebQzuthT+UySEr8L/yLrb0Un0CvNkPqJPwSsI3iMAZeVNak5J1pHFTti+Vt90TmcQvvQ65IzVPRKQsDq8iniTG7UnZeiH4E382Ze2MMfqlU65EJw+qRXoJeHzBeMOsA9jmtrdC0LVinwmyUF0sTC6hLrVdtoZLoGrSl5SwCJN75RUmsHroPjB45EV5lqo5RT3fNyhJcB5vWrXmcyLNKJ8xfQ9WbjZp7IEokRg2S5zgBDk6KYh5x5/rNgUH4sVvOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2foxQqAy+Ta3qfPEORkdZVPXoJvJbLFBMY90fSmfgo=;
 b=UfPGMyEUGBPZiwCXs0jX5b0o79IW05zFzg8Wd4Jj8wP+DqLxHYAr2qBD+Yk+8ApPsYE8I2IzO19mJovBGzMf5pY+7nDlfQLIc0fzHcNc5gbRdqxihnompjv8sgxJhHiufZTkQn/dmO+aY/qjbFYYLiQ6NH/XBaGEbtquBeav7r0LunYBnrTjkJNScaoD5RYKZ+y1yR68ZtBEqD8ChKwtLbqopsKIibOUy1Fq7nw9ARTTsFYjva3VXxnbgasfjSnoMfddVtSBzjqG/3af3D0Ytnjmm5uptePLK5zMweFqqe2WgsPyHfupEiPC/HcrClAYR7LEWZIl3xLjDFgGy6eoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2foxQqAy+Ta3qfPEORkdZVPXoJvJbLFBMY90fSmfgo=;
 b=Uuk8VWP91xpfhr9TMJgLAXkv87DaGxiUqlLNLbIK1chADfH0V+sNW47CivHiz6qLd83FVmwFO2r7d/D3Bc02JrWmcN2kynOtPg55NZ+avl4dBgzb5tUrEi/VOaFTP+OFPi6GuwThGHv2uLl3zopKzY10om5457U03QQic3fFzi66WuAPZOTGBSRzJrGDaICkcA2NfFOA21fFP0MhcDrQtdOsxVvZtskKPez8DJ0RF8Vdweuof2sDEK4kWFF/1UkIjX3hUtrNJHDDdVwul0ZADaDaQmk3bQHY/PCZRXJyftyO3PHjPy2b2YrKsYVFUKwJXIGUJsK25LKJge536wMAzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Tue, 10 Mar
 2026 01:40:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Tue, 10 Mar 2026
 01:40:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 10:40:54 +0900
Message-Id: <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
Cc: <tim.kovalenko@proton.me>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4c0c29-068c-4d7e-e5dd-08de7e4613f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	kueFiwBGT7vN/5evoqc2YOUHMU7oHk4k1JPbcDRuhNqAdso70x+IVrddE1sIk/RIFId7l7l12Vaa5LGHdVJl9YfTqCKdy9GZepHsg80HRbh/79HgOPohGzLWQYx74XtzWWfcwjPBUJdy+L+EDXOe+5zMuVlxIgTDG0JKFioZrUZ4ma7Jzs0Unpne7v0DZbgree4g29xeztZaGOylucOY4CeTUKnftsk/Iq8D4+2uHFlJy+8p9S33en3cT9VqY7kFIlyGlkOlwdil49gNqQv7db4W2KAz0Q5ULSb9VNByOcbh8B3PkQNiXHjbPq6F1vqqvUp2XsaLRKm15k8pPPO2E1DFVJXxn3AVKO+VE8eHBqMI+QGkM/4BxfdQpCxneHs0Cmd0+agcXPb3SRlLt4tLlLO3FBrBy2ZclmAPFjNvvE9nH3jXtRrnxfGBeim7RsPIvBlVoaroMz403POXAfpnmu0RgN1rWGktqXXGjMk6T8cX5Xx2d/M/JLbzzzzhViLv29s9rTelQRTZ9TVorzfJUOTwoTdKtzW6ARLX/QMJ/Nh6QMFcWV9PgezkIguNT5YfxECPpZ2Icqy6PW+7t4Yap1TFC/BqOC0SPstbdkefZMfDpeGF7PRycxsk01tFUF0Yo3PNAC746kEt9Vy0JzajH8g5lbHz5xA0t3ChxJqi2ynizNyoDhm+u5yv5edUBX2XA5ngawgOGb5X2yyX4iIhwC/trGAbEJEJmBRXzR39F7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNPU3N3ZzA0bzFlaU9leXBlN242MTkvaXVaR2hvaGVoVVJ4TWU0QkdhT2V1?=
 =?utf-8?B?MmJpbjJ3UkRXZzlWRmlNaityTElDa2RKNnpOM1JzclhUT2JESExmREFQSU1z?=
 =?utf-8?B?RmNnWHJnVEdXK2cxQkcxN3l4TDc4UStRVVgyS2V3aDJwaTVra1Zybm5CTzJP?=
 =?utf-8?B?eTNmaDE1a3JDN2g5ZlpVeE94aExnaHFZU1pacEN5U3U4Mm9jQWlzYlc5UWZa?=
 =?utf-8?B?ajYzTjVZOWhpR0F2dVY2WlhXL3oxbjluNmViZTU4UnhYaHVManNwK1Niamgr?=
 =?utf-8?B?MFJFNmxQbXdDVDNjREoxTzhZakRoNFFVb0FnOHl0QURMZjFydmRVVUVRd09X?=
 =?utf-8?B?REdkNTJIZTl2R085cDlYdVlpWFNUVGVXaENibXB2UHorRzBJVVNHRWxRUEp0?=
 =?utf-8?B?N0ZRZG1vUTZHZjJMY1Q1cW9zeTZLT3BtaUgrdU0zeTJPcFhEUGxDQXFIRkk4?=
 =?utf-8?B?VEphOHZSS2pEdk5EL1p5UW1hUjN4RkVvcGhIZWxTMlR2M0ttRE5zcUZuUkhl?=
 =?utf-8?B?eDhOK0ovTmpmQUEzUCtqb1p0RlNrbEpET2xDRnlXVEI2Rm5JZ25WN25MSWxH?=
 =?utf-8?B?UG5STExFaFFHU09QM0p5eGIrd0tsbERlb3Y1cGhhTFVFQUUrMVpOeFpFRTFU?=
 =?utf-8?B?dEF5bUlXaDNoelpmekduNG9tVUZTVzgvNzM1ZGtMejgrcDJCME9wYVdrdGRm?=
 =?utf-8?B?ZFpBZ1JDMVBJN21lazdrOHNmK0ZPSjNzWG9SSTRsSTVTcFA2TU40RkRJTjJl?=
 =?utf-8?B?akNQM0dBSEpML21pNW1wTGRxOWlMQzF2enRuN21Wb25Na21TczkzQ09pSGFi?=
 =?utf-8?B?SEFNNERSQUJOcEdkUFNhQmlaOHpWVmZ1ZWM3elgzeHdQNjcvZzQ0M0gvNEhz?=
 =?utf-8?B?QTJLN25uOXI3WjJiM0ZHUFIxUU83OFRaVGxzbWVIRFprbGF5cXM0bmtSc3JK?=
 =?utf-8?B?b0dhMjZnUEhHSnFvUFd3K2ZOdzdOOEV6MndSRU1QdWMwKzRKcG8xYUF1N1hL?=
 =?utf-8?B?WWt1b2xCeVRNOFp1MzFQbFk3QnNHNmc0UUJORWtueEEvUm1MYlJOWVNVZ3Ji?=
 =?utf-8?B?R1oyNmtLUzBwM0Z4WWhOd0pMY0JMcU1YQzN3eU5hcUpETmJvT0lZK3ptUWk0?=
 =?utf-8?B?TjFjVVBHbFM3MXZsTVhORmlwOEhmb0hIeCtoSjNBcGF4cEZzZWRQWmN3aTBq?=
 =?utf-8?B?R2NpMm5taTdNYStrVW13aUMxYmdLVU5rUU9VWWZZbzdRay9VVjM2WVF1Y2tD?=
 =?utf-8?B?Y3JtRFBidm8yUXlqSVJxem5ZNHJ5U2NaOVo4bS9ITjZLQXB3N0ErWDF3a1VN?=
 =?utf-8?B?Ti9VMmJFaEV3RitaUlg1djF0UW5HK29GUjdjdEZZcGVacnV6UCtyQkk4ck05?=
 =?utf-8?B?MW0waFFGTDllbVFUaUpZTGVXeEFtUllvdVd6Z2pZR2EyNGNVTE9XYU10Vlg4?=
 =?utf-8?B?ZDhQT0RjeDF6Sk9iQi9YQkhWdTJrMGNIZm1XR0xKdTF4RnU0RCtmdXBpQTcr?=
 =?utf-8?B?dmU2WUw2S0J1czdPK2pLR2tmVmw5Q3Q3M09GWDY0dWNaNVlJNzVLZ1EyVkpE?=
 =?utf-8?B?K3RLeE9vWTBReGxmOUM2UlVkVlVTNmFwSWtqZ1ZYSzZ2UERHdGkrS0Z0SmJO?=
 =?utf-8?B?dytMQTZ2UWtRL282TkszeXNyNkl2L3REbm5ta3F4Ujk4dFBPZlBzbjVzYzZm?=
 =?utf-8?B?NHo1RFRxVlI5T2FIYTFvUDBwQ3ZEZHJ0UWhvMGxudFN4cndJQW1xUitPcXla?=
 =?utf-8?B?TExjZHRDTWE3VXl1c0UyQTV6ZFAwc0l1bjNDR3MybFVPbGE2cm43UzY4KzJz?=
 =?utf-8?B?QlloNEN2WVV5Qkc0T1pTWFB0Vk1jSFlGdFZvYWkzbkxPSUNvU2l2MVJybmNt?=
 =?utf-8?B?NjRkTjM1eTJIcUNPTUxFb0l5aEprS3FnaEo5ZkNISm9ncVEwMGJKeUUzdTl2?=
 =?utf-8?B?L3g0Tm5odFY5MHhlR200NHpZaUNnOVRrQ3pPMFBKdVlGNDFXbHFqa1FtVzNl?=
 =?utf-8?B?UjRSUEF1VHRPL2tYNVV6bDEraHE1QXNKSy9PaG5DZXJic2RsVTlOYUEvazh4?=
 =?utf-8?B?ZWQwWkcxaXVUWkVvWC9KaUh5K0lJaU03S0wrOUhkZjQ0WGtnSHI5NmdsQTRW?=
 =?utf-8?B?aDJFbVZDYlJOSE50V3BINHhQRTRsb3Z4WjFMSlVPNzRtc29hUjhHMHJuN09u?=
 =?utf-8?B?M0FVR2JjZzU1RnlEbEwxYzkxRU1aZUFUY2xVSmVKRUNaclZvRmowUWs5TnhO?=
 =?utf-8?B?d3o5WEJiSnB3Z0RiUDNOclRlM0JIdUltaXNHY01nUThOWjdPWnlSbkNGSzVX?=
 =?utf-8?B?ZUVsZERJL3ExblUzVkZLNTE5SG9Xd2FucmhLSFZ6TzZsWWgrLzZyVXM2STU4?=
 =?utf-8?Q?vIIx6ObB8fX70je/yRR1Hvnyra9e77Kn8ckVDt6ZMYKNc?=
X-MS-Exchange-AntiSpam-MessageData-1: tQLEJh85wW0Ucw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4c0c29-068c-4d7e-e5dd-08de7e4613f4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:40:58.4457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thze7yAZ87BPsHQBuuMYEevqS0ylKWoYez0zA+wzWW/9F6w4aMyTG5HAjxXAXIQvLCW6mNtUqsp9i935iXMR5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918
X-Rspamd-Queue-Id: B9D6D243BAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11751-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[proton.me,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,proton.me:email]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 1:34 AM JST, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
> ---
>  drivers/gpu/nova-core/gsp.rs      | 34 +++++++++++++++++++--------------=
-
>  drivers/gpu/nova-core/gsp/cmdq.rs | 15 ++++++++++++++-
>  2 files changed, 33 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 25cd48514c777cb405a2af0acf57196b2e2e7837..20170e483e04c476efce8997b=
3916b0ad829ed38 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -47,16 +47,11 @@
>  unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> =
{}
> =20
>  impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
> -    /// Creates a new page table array mapping `NUM_PAGES` GSP pages sta=
rting at address `start`.
> -    fn new(start: DmaAddress) -> Result<Self> {
> -        let mut ptes =3D [0u64; NUM_PAGES];
> -        for (i, pte) in ptes.iter_mut().enumerate() {
> -            *pte =3D start
> -                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
> -                .ok_or(EOVERFLOW)?;
> -        }
> -
> -        Ok(Self(ptes))
> +    /// Returns the page table entry for `index`, for a mapping starting=
 at `start` DmaAddress.
> +    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
> +        start
> +            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
> +            .ok_or(EOVERFLOW)
>      }
>  }
> =20
> @@ -86,16 +81,25 @@ fn new(dev: &device::Device<device::Bound>) -> Result=
<Self> {
>              NUM_PAGES * GSP_PAGE_SIZE,
>              GFP_KERNEL | __GFP_ZERO,
>          )?);
> -        let ptes =3D PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
> +
> +        let start_addr =3D obj.0.dma_handle();
> =20
>          // SAFETY: `obj` has just been created and we are its sole user.
> -        unsafe {
> -            // Copy the self-mapping PTE at the expected location.
> +        let pte_region =3D unsafe {
>              obj.0
> -                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
> -                .copy_from_slice(ptes.as_bytes())
> +                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u6=
4>())?
>          };
> =20
> +        // This is a  one by one GSP Page write to the memory
> +        // to avoid stack overflow when allocating the whole array at on=
ce.
> +        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).=
enumerate() {
> +            let pte_value =3D start_addr
> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
> +                .ok_or(EOVERFLOW)?;
> +
> +            chunk.copy_from_slice(&pte_value.to_ne_bytes());
> +        }
> +
>          Ok(obj)
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee990=
38ad10a16e1e32d 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
> =20
>          let gsp_mem =3D
>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle(=
))?);
> +
> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
> +
> +        let start =3D gsp_mem.dma_handle();
> +        // One by one GSP Page write to the memory to avoid stack overfl=
ow when allocating
> +        // the whole array at once.
> +        for i in 0..NUM_PTES {
> +            dma_write!(
> +                gsp_mem,
> +                [0]?.ptes.0[i],
> +                PteArray::<NUM_PTES>::entry(start, i)?

Does `::<NUM_PTES>` need to be mentioned here, or is the compiler able
to infer it?

In any case, the updated patch

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks!

