Return-Path: <linux-kbuild+bounces-13580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jcuCISKNImpQaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13580-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:47:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF746468B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:47:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=MBvdhC8U;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13580-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13580-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5FDF93020A94
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12F93D34BC;
	Fri,  5 Jun 2026 08:32:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EC83CFF69;
	Fri,  5 Jun 2026 08:32:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648341; cv=fail; b=lksRcI6iMAcE6dsiDDt7lzOuHr4zRja2xhbrIHhrpvLXqBZtmeoe7P3W3PUg+zA9vVtahyWokwXkcYMQvR1jd9c1ew2EXZqJQITL3KOBysRn6q5kUqZiB9fPyRDFMZ1b32TzBKC3SmHa8IUtRBamRe9dOQJausa/a1mPtTZlrGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648341; c=relaxed/simple;
	bh=tec8M94NptsN7JLV6YHc8vNxk76v+c3t8Kqql2XTDoQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WKgiQik9CedPDixHpgINSUK+hguwHBxgdAa/mN/rZK/OYPE3ZBvTwJL4+MNHs0BDd89ADfydQOr/ExLbRwRX1PwbV9w4js0RVZ1PDQbTGIlThiPOFo0ci5z+Bqq5KeUL2MTAscgq5XUFqnavkhcbra/S4AFgDKtwigzrWpbFLRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MBvdhC8U; arc=fail smtp.client-ip=40.93.198.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k49ITvnuw6hhuGVMObHy/06bcJI+wAGMr8RMqE+u1Kiho9l6AWLT4JTDgBdTp5v9iDG+9Kyy7jhWwqhg2mASxjLP+9GA28mIla0nuBmpVUY0DrT8YgJ9RPWI/zoWZ0mnDHtdwzc3wq3kqVFuj6n/JU07x+5PwN5lM20utSny06ZhdRL0J5NTbqCp2Eqdn/3x5IWTjCEbgHFayCYAwgMiUY0w2iuYr3TEuPJtVm+4wCXQRyvohY0aeXEwoOVCxChfZPN+PmrJDjQlalZM5LHJFCs+Qppghvr5ZpPzSX3TIHjKHzo+ixDoP15NZ3T82TZh6+VEdI5GHn0PdJ+EuNOshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTgL3s2k4HcV02O0BOGTYGIhF6isKW1AGP+UQ9A3JEY=;
 b=FekLHA606vgHYiSHdus6k/mtt3S4K8SAGgHO93vF7uMS9ADbszTmsOsTZk5bVa4yowzrbLwRZLeJ+PgFUAC5ZQOXNY199xbQsvcUmv7pxyKrF24f/KcT3akIMqb+M0Eu/iwNvq9dMY7EQ5dW88YeT8Do+lK0SgWtr7pD7NYP5kpjNGS3WrmwKEDakvpULmwAIdw5mRqChU3Ukro3ZjYPFQBf8ItWXC30joTC9GVQ61QKUfGFIL+YTt57+pbX2nNtittSn+LV6z8FoJexafsHlE2IrLPJZOZm7lJOIqRMmz3wWqa6yviXLTAcPcGqyTzTxHPS9hQ0vsCy7vpzyPj6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTgL3s2k4HcV02O0BOGTYGIhF6isKW1AGP+UQ9A3JEY=;
 b=MBvdhC8UZ8lowRDtqBB3kijTq2vV3TENY63TWG+FVQ0t3x++wNIUjjzlrrQ6cPWR2/C3WNIfSE7lfh/7YZRWBkdg7z2eNySDs3GboKoPR3uq/7SVvq3pRMQfNtCWuQf9I+cm5L1svPBLvlfdkvlFoXbgR+L/QLpeOLYh6wzukGgYTAkMSYCBkQLVJNqy0usnLx9MJyfCumvOueVlGfkzGxqAsq17dtCTT+YHW0JO9WM5JVDfQl3YhVwFHsbijjm4lQYJ95WwcTOyR5XyLdqDwgs3CI4g8xEsEJmqO1IppsThX2DHPW19uTcXvM8J+pBn1LT9ekS3jeXO7H2WeXY05A==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 05 Jun 2026 17:31:52 +0900
Subject: [PATCH v4 2/6] gpu: build nova-core and nova-drm from
 drivers/gpu/Makefile
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-nova-exports-v4-2-e948c287407c@nvidia.com>
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f17529-dfaa-4eb6-75b7-08dec2dcf2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	k12Xcza2EwRjyRZ6L2Cp5lQ3wd7zVyUt9y7A+kYbV8udv8GnvNXhuwizwhVNc6IJzR9JaNrwfegzqyeS2c+y6dyrNOCcn9NRWEmG9jGEqr0wf6kjUiyODyTl4Z6Hl/FS4GgDusH7yAhTyG7oP69tj9ohwEKPa/VJ+H4AT+HJaInIlAyHaVnBo5eVt05utfE8hVuRc3sGleYqUxOxn+mNoemEghw6nuhCXrNBwdm4XaorORmEDDbEOdBwz+TxdMfPQwn11OuoueIPzd+x6bZ5IiVofWAcN37rVqfVjmSCMZkuK1L1W1Uwi1ZQeAIe6SoSQrizerjzr9ydtcvv/Vg59ViFqOMrIGKW+1n5cCe3e/adRxpZ9oZ+kL6CJqq7ABDn+ZYB81qgftv/IWRaxLcr0U2OnVKl5AnQXJwzKUFU9MRU/0tg4KE1i0SUGpZn2BTxYYjN7cvTu+FpAU8iKyi3e3DM4J/cwKrEXbKl+uTZrbyExi3+2opvvObIR2NGCrtw6q7C7/8fjK3RPcRRLOPKyuNq1SGjSSKM7Sp1OzoQK9hHceUXoa7QgxgAp6QiJ0yA2M8p3TSgYuN1+bzuuOiKMLymrXmG3jfx3X0G76CLjte9DmZmvofhg9DU69Rtc2DVVwXyepdlanmdck1EjLbmCIURv4hkzm/F45HsHhe4Q+IhKetwBtmM58/1wDyzinRvz/PlTvtN+K0nqGNG4ynlm/Y2URB1XW3Hl6IcvPf9E0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZMdjR5YlJqaU85UUZqY3RJRzc2NUl1UmxoL01lQktFK28rSCtlTDdnTVBK?=
 =?utf-8?B?MGIrNXZ1cUJBWStxMW44UWMvdmlhYnVQT3NPdjlUS256UC9qS21Bc2FVQUdZ?=
 =?utf-8?B?bCtFVFdjcjhLZWpUT1l3cEo0UHpXcDUzaTBvRHM1M3lJR0tCRDgvRlFmbEJZ?=
 =?utf-8?B?TkFhZTdWaWFjMVBMOEViZ1JISGEwWHYxazhpVDZKdDdjSktjTDBQNVRDZ1I5?=
 =?utf-8?B?S3lhZE1xcnRPTXp3Ly9YUmdVbzJ2b25HdFIvUFphc1JrNlAwcUMwOVBPS3pX?=
 =?utf-8?B?R0VFaS96Q3B5aTMyM0o3Umd2WThDWFo5ajcxZHN4ck5VZm56TDdSUjQwN1NG?=
 =?utf-8?B?ZU9ldXZGMW5vZ3psVUdTQ2Y3ekpEK0Y5TXUrZVpOR3ZxVTVBMkE4SFRqenYv?=
 =?utf-8?B?dThyVHRDdURzSEM1SnZ2aVZoQkJDTTVEWlNCbURFQ0ZzNEFxME9iancxNFNR?=
 =?utf-8?B?WnRXL0M5OE4xcUVvMlkyazFWV0tYbllyZHFocUxuMFF4ZWh5Mjk4L21XVFBB?=
 =?utf-8?B?M1A0dUNGVnBETVh4RENud2pQcG94L1kxT1haUlBpMlcwT0lXYnB2SEpITU1q?=
 =?utf-8?B?cUlzRXI3ZlFweDJKY0NENHVzSUJVcVhaZm8xanpPRlB0OTVEblVZTHRvdThL?=
 =?utf-8?B?a21pYVdrK2FjVWdRb3EyWGc0TEhmOTB0ZEtDTWIwaTYzZHpWL2JWUlBEd2ZO?=
 =?utf-8?B?K3lzYlJpeitDWnAzakh4amE1UzZFTDR3UnhkUE1hNktuVDNGdGlWczFNbWMy?=
 =?utf-8?B?R1dUS1p4ZzBWQ3VnelorWFF1LzJvejRoRkl2anYyWUtQVEp4TEV0OGhRWEhw?=
 =?utf-8?B?bE45aFRYTVhtbk5qMVY5dlBIYUxkdDRRZFRKMis2V0NsQko2anlSdEdpbEJD?=
 =?utf-8?B?dlBFd2dveXJnZlI2VlEzVGNCSk95LzhJUkdncHc1eHZpWlpxbmhRRkc0cy80?=
 =?utf-8?B?dGhFQUNTRGM5aGx5NVplVGdFVFZQWEpuUW9vYTBuM2NTdkQyVzF1VU9xc1hr?=
 =?utf-8?B?bnZGMEcvSzFwaG1WRTRFcGlPdXdyU3dJMEhCaWoreEk2Ulp1T3ZlK2tGNVBG?=
 =?utf-8?B?L1JTejRUMTJhcG9XbEd4Z1YzMHh1emhMbjVXN1U4WlAvNFd1TkJmUGdjc3Ro?=
 =?utf-8?B?dWlLbHhPM1RVdzVPbzlqSzBvaWZTejgyUzV6ZlcwZ09kSTZBbHlaN3dLdUN5?=
 =?utf-8?B?SGs2cnByV3BPQTA4STE3cmF5ZWhHWWJXeDYvTm44WFBqTzcxMFBmQWRINlJk?=
 =?utf-8?B?cXBMYlJwWGZqdDFFSnZjUEFrYm5RbnpjaEwrVHBEdzFPSVpiVm5kK2hLV1kx?=
 =?utf-8?B?SnBrRCtGdVh0NkFaSW9BTEZFNVVHeHlyMG1VUk1uWWoyZi9Yc0djVUhJT3JO?=
 =?utf-8?B?TzBRWFAzbldXLzVJOWJ3QWp2cm1WU3IvZjJodWIxaXZPVUl1QlVGc3hieDht?=
 =?utf-8?B?azQrWURFSGdHcS8zbzIrZ2tFWXg4eDNnZDU0c3ZHcTBlSi92UHliMCtoamlE?=
 =?utf-8?B?Z1JyeXhuako0M1p2SjRtNWtwLzR2N1FmWlpQUmtsTkE5eVRER01hbUZFQm1D?=
 =?utf-8?B?SDI1WnNmUjIzN0w5RDd6SUN3WVdnd21UVW5WYkN2dzhEaktRenVzN3hGMVZK?=
 =?utf-8?B?cVE3MThFaVRlRWx3eldURHlFSmpQa0RaOFdLSlUwZFJQTmNIRTZSWGhFemZz?=
 =?utf-8?B?REFqcEpTMkllY2lDcVdLa2dDUDYyem9CU01NNHRCSDhzQmErYUxEQm92Zlp4?=
 =?utf-8?B?LzlLZWRiNVpKYmxJQ3BEWXhoY0MyemZGS083Y2NYaGNDNWN6U2dicTV5eUsw?=
 =?utf-8?B?TzVvamhvRmcwZlFuTm04VXV5OVBoazQ5dnhsTnd1dVRPNUZHbTljRjlneWts?=
 =?utf-8?B?QzYwdEp0eE5lMmlDTk5RWGpDankxWnB1WUFDYjkxSnAySTkrQklGWGhzM3NM?=
 =?utf-8?B?ZmFNZ3lzSlduMG5LcTVtUGJNejJQTmNFSzFHUno3TWJ5aWxhTVpIaEpSSnE5?=
 =?utf-8?B?MTJjWmN0a2ZIOGtld2dCSWF4NWhsNUR1a3pJSzU2WEI2cmZXbmRrVDA3Vytz?=
 =?utf-8?B?aDB4T3RVSGZNK2Q4dUFhVUU3dlZWMWwyakFPMEtHd05FOEtJL3ljYXN0MFFK?=
 =?utf-8?B?S0FjWGxreUl2L0xCQ2o0WkRUWnVaQU4xN0RTY2tWZjRkSzkyUlJDQ1pEbVo1?=
 =?utf-8?B?dWFFUXMxaTRId08rZnBidGpRWUpERFNPVjZicXFJaTJZWmFwNk81TWRrRzZL?=
 =?utf-8?B?T0xNb1RyRXM4aVpzN2tFcEc4SW54VUNZdkcrcGRNM1hlUWhjWDJVbmtQcFE2?=
 =?utf-8?B?elBDL3NxUDZseGd4VGo4aVdMK2JteXFqcGx2RWMzNEJ2SnBHUHRwaTd1TGVw?=
 =?utf-8?Q?n9VliY1ipUMHUxtLgvpBn8J8qXbq4bxKodeaDv++CcFjr?=
X-MS-Exchange-AntiSpam-MessageData-1: qwEnoJNIF4C6XQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f17529-dfaa-4eb6-75b7-08dec2dcf2c3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:15.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWbeKkz0jp8MAgAW6LI79LN/ocW6xQPvSrT0pSeQUj+TsPJZLs6/V9EGRv/F6QHe6OlurYfHWUWYxvjD9rbm3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13580-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FF746468B8

A dependency between nova-core and nova-drm is about to be introduced,
which requires nova-core to be built first. As this is not easily doable
from separate directories, move both build targets to the first common
parent, `drivers/gpu/Makefile`.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/Makefile           | 12 +++++++++++-
 drivers/gpu/drm/Makefile       |  2 +-
 drivers/gpu/drm/nova/Makefile  |  4 +---
 drivers/gpu/nova-core/Makefile |  4 +---
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index b4e5e338efa2..45e0941324fb 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -7,4 +7,14 @@ obj-$(CONFIG_GPU_BUDDY)	+= buddy.o
 obj-y			+= host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
-obj-$(CONFIG_NOVA_CORE)		+= nova-core/
+
+# nova-core and nova-drm are built from this Makefile so nova-drm's dependency
+# on nova-core can be expressed as a plain Make prerequisite rather than a
+# recursive sub-make. This is a temporary workaround until the Rust build
+# system supports cross-crate dependencies natively.
+
+obj-$(CONFIG_NOVA_CORE) += nova-core.o
+nova-core-y := nova-core/nova_core.o
+
+obj-$(CONFIG_DRM_NOVA) += nova-drm.o
+nova-drm-y := drm/nova/nova.o
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e97faabcd783..e635fcffd379 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -186,7 +186,7 @@ obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
-obj-$(CONFIG_DRM_NOVA) += nova/
+# nova-drm is built from drivers/gpu/Makefile together with nova-core.
 obj-$(CONFIG_DRM_EXYNOS) +=exynos/
 obj-$(CONFIG_DRM_ROCKCHIP) +=rockchip/
 obj-$(CONFIG_DRM_GMA500) += gma500/
diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
index f8527b2b7b4a..b9fad3956358 100644
--- a/drivers/gpu/drm/nova/Makefile
+++ b/drivers/gpu/drm/nova/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-$(CONFIG_DRM_NOVA) += nova-drm.o
-nova-drm-y := nova.o
+# nova-drm is built from drivers/gpu/Makefile.
diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 4ae544f808f4..4c15729704a1 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -1,4 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-$(CONFIG_NOVA_CORE) += nova-core.o
-nova-core-y := nova_core.o
+# nova-core is built from drivers/gpu/Makefile.

-- 
2.54.0


