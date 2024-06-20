Return-Path: <linux-kbuild+bounces-2227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B50911326
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 22:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68DFA1C2170D
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 20:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657221BA09C;
	Thu, 20 Jun 2024 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YckpSR3D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B911B9AC7;
	Thu, 20 Jun 2024 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915302; cv=fail; b=OxnKqs4al+MjAWACkPZv45TnTx4vI95uQRg++/nPhsAehQ0ksI1LsmsrArCPxij31qoAklStHYrXo4fNvgN+93CdkfSO6zvN0oleYUUL+KsVBSb8Bl+nlBTnmnLbreeslupI9dvXUuk6dumg0xnvR3vb0jtEYHFDAP+2GA1aczA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915302; c=relaxed/simple;
	bh=EWsmFE0VhiTyIr8PdhjXynm3s2pbqJ0zaT6lrsgmXAE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j4mEqmze78Y4IoUwS/e73nrTdwiCosLD8r0JCnbAGKV21usWFL/lSWQHNrQ1lOsgYUOGz/2ElQxohqOx8Xo8tPEvmkVy3XKSvqOmngc519nesDeDlRVqjvOedvvfXy7zOg+F9LeVnybhZP3GQnCc92Ujg5K1I/EdRjcoFbZqdN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YckpSR3D; arc=fail smtp.client-ip=40.107.223.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0iPMvqJciGHmKqnQpg18WFtz5KwTXXfjzt3sRWldMVVefamMdlZ+ewxR7EFZwZ0d610fS4PyoV8RGqHt4U2qsofybCRkMk/eWZLYNwQ8jREQCXApjHeCX4oryff4MIS5k37l/tvq9IAUBSO58t5035AuwJnvAeyjcu9nsV/ZRgdT9ufLL+fOsJM8hHizB18ODY/QkT61D9lTWYWHofIK9tGhU+vuX7LdrlIFP7iV7lgZFJPi7EBVR8C28AsufufTXAArOpXkMncy+nUgWWlwQ3rdL+nzHA4mIKuBcTugVSN/Z31QHVDbX1nySP2D2i6yqRTZh0eMwxjqYJdnrYlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcjF9quHG3DpR4zyPsx/B2zhHWGVZyIlRAuoBs712b0=;
 b=I5hBSjRS3eaRQKMfsNuv9cvpfp3j2U8taK4/jcOw5dsboddm7lWAIYe6tnCKXfER2DePT+S3cKNV4YCur5Z8sPm30YTj4A6ddTnLNx04s1F/jG5e2nfcnzNc1MD4FD/raj9iBTCCC5hr4N2dKuopbHXnUCcZpoM8E2CYRKllXoQpjXALeyPix7qdNGFGG8AUSCCV2j7pwV2D4GkKS3OAE7B0Xur96CisBJ1u7Gh961OcDCRddX3w9FiNTmjmOJJYiGJG7F26qHj8vuNM/sU8WbiflcmQz7ffRCYXr3hHRTWsGydNH6K74XyrWPCIX0Vhxji/PumalF3cKk7OyNBwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcjF9quHG3DpR4zyPsx/B2zhHWGVZyIlRAuoBs712b0=;
 b=YckpSR3Dm8W30fArdTo/FMdkJ/8r2wts4NIx81xCqES56XwAgP9/BYNy9CR5QcfnpqUMotlIJyNvNlWLekGb7xckXcLXzQZAgCtcBF38XqPwJZYDem2GpTixaQp7bG3F5ARgo5ABwItLFvptf7j82ch6ZFHh7Lbc+KVDzztYF4YS3pyqQsRVuBbD1U5Uq7KHUPKUKy/dx/mb2+kFCb5QCimi5p6g2REEPrUApasUi22Kif0+doyiqRoXEBPmuMFQSLCBKO4HOw0EAUUHEN8WqPGEPdk5jCp4WVy/sTG/VtIkJ+kqfkDi0u6MeSMae0hdTkUXLmyp/TkCo65+TJypIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SN7PR12MB8820.namprd12.prod.outlook.com (2603:10b6:806:341::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 20:28:13 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 20:28:13 +0000
Message-ID: <ac99b0da-7019-46b8-ab0f-5f4e08755d90@nvidia.com>
Date: Thu, 20 Jun 2024 13:27:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and
 comments
To: Greg KH <greg@kroah.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240601004856.206682-1-jhubbard@nvidia.com>
 <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
 <4262dee7-b6fb-449c-9de8-7d6404912338@nvidia.com>
 <CANiq72n=mFF5+MxAmOwNS+ZOGo=H199MX_5nPiZTKchFK+Gn6g@mail.gmail.com>
 <2024062005-subtype-collage-2c35@gregkh>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2024062005-subtype-collage-2c35@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::22) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SN7PR12MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: b46bc6ab-2fc2-4474-9669-08dc91678273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|1800799021|366013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGFyQnFxak00NDZIcUZ2VXpFOFA3d243bXZkdG10cFN6bjIxb2NVV2VwY1oz?=
 =?utf-8?B?V0h2dkRUQWk3N3kvei82NmhqZTZIYXA4eWZ3cUpxMnFMTldTZk5yQ21SOTBm?=
 =?utf-8?B?Y09mdGNGREpqeWdtNHlNZTJmKzN0QXFUNStGM1B6MHkzcjRDQVd3TTU4b0I1?=
 =?utf-8?B?QmVHSldZUExDeWRzOFhKcTJ6WTUyQzZpTTk1NldNWDFlaDF5SzhlS0FZNTdr?=
 =?utf-8?B?b1FwU3ZTZ3VzZTFnNS9kRGdPTW5xamRYeDBZNWlUdUV6OXkwQ3h5ZnB0aHNU?=
 =?utf-8?B?VlN3MFlaMTk5OS9xMS93dkNvT3RidHdUKzU0VUE5WXhzeXo1blFwM1U5UEVo?=
 =?utf-8?B?VlJ4NzNVQ29VZ2wrVkkrZTNQYjBtM3lLdktrUGVaMlNGcGJQRnQ2YlRWcE40?=
 =?utf-8?B?UFgvZ1RYK003dTJpNFJwY0V2SzJGcEtsTHNzWVE4cDRsMk0xcWVsQ3UyK2RU?=
 =?utf-8?B?TGxYRkh3SnRTYXVOaFNReTg3Q2FYNzhFM3JiemNvdTd1UTUzdnVMSmxhMWpi?=
 =?utf-8?B?NDRFZDVkc1g0elU1WGVLZFEzM0R3VzlDOU9zakNoZHpXVjdLSENVUFZGVlNP?=
 =?utf-8?B?RnlBK0FLNWZ3eC9hSkY0NkxsNVZYb29MdVdON2VmRXZwcmNibnh1cVBSakhm?=
 =?utf-8?B?aW5ubFpveExOd0VIVEhmK2JXcDFCZjVzQWRJUm55SnRWSVRKM3AyeTJnL25W?=
 =?utf-8?B?ekw3YmZ3cG1wbkhxbE5SOXpWZDZtVW5GWUtoaDQ4V3JqUTJsV2dDK3ZFejNG?=
 =?utf-8?B?blBiR1ZUQlJMN0tLTExwMDVhWXdpTEFKUFlXQmpGTkFRSFJtNjY5S1gvV3M5?=
 =?utf-8?B?b3ErZ1hxTUo1SmYrL2RIRjdkdVUxM1RzOENER2FtTjZmQ09XRUc1aXBLd29z?=
 =?utf-8?B?SFBFQ1I3UUhSS01sUUw3SHA3TEIwWkxSRXlGWHFIZFpvR3J3RHBoTllZaTZ2?=
 =?utf-8?B?ZS9SUGxscERkNzU0V0FjSTNrbVlPTW05aGhqMFU1NWhpM0RWRjFKVmNtSjRx?=
 =?utf-8?B?ZU9ubEdWQnpwenJ1b1k4VU5PZ2lUbGtaSWZUanlJMFZERXNYUjlWK0JzdEJI?=
 =?utf-8?B?a1V3eDBzaEV0cW5GdWEzcVphQ2VHc01wTkZQR21ZZTBPbnZQd29MemEwMWh6?=
 =?utf-8?B?andLc25sVFFGVUlDbC9xbXZjOVRFNnVqQ25NcjFNSGtaOVJNVWdNNGZuN2xa?=
 =?utf-8?B?bXkwZE5nbmZkZTRlQnk3RWlVOGlLTXRyVEZGYmh1L3BXL2JYSnVCL0JDSk0y?=
 =?utf-8?B?bDBTVmdXcXhoZ3ZOSXRuaitwRnhvaDk2ejZNNGp3L1JjNnY2bmJQclkvemkv?=
 =?utf-8?B?TlZpK09XSi9sRmo4TUVaam9vZGMzTG4vVm1JYnRjMTJrc1Jpb09wcVU1aXBw?=
 =?utf-8?B?eXBGZnhNMmJKTTNSYWNGUVgvYXpvT1ZYMFZTQ2s4allzVEI5dXlsbEtUMjgx?=
 =?utf-8?B?ZS81WFVEZVBvSWUveTNyMDVhaGdwQk8wcEZxZnhsNVVxT2RCWnB4Nm5PZUZp?=
 =?utf-8?B?cE9Fa1p3NmZFVkszb3dFMExPQmdEaGpRYWNWLytYZGV1TjRWczJ1djZEdVZy?=
 =?utf-8?B?MEFXVGcxbzVjOHdZVUlOQ09ZbDluMEFjKzZIU2lsb29hdlRuK1RJMDMvMU5s?=
 =?utf-8?B?Sk13MSs4bTVpdllLaWFjT0swN2dGUU9MQ2t4dzVYNjdBOXV1QVlpelJCLzZj?=
 =?utf-8?B?anNBY05WVmgyd2Y4ODZqb0FiSGdlL0luaTIyc3VZczEvUWVEdFZnMHg4YXBY?=
 =?utf-8?Q?HOqPl9NVEtbFzHgwecR7FXv3LaTqso8cCvSxChA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2x3S1NRMjJuUXhhenVBblQ0TGhVd0xVS1drb2FTZkVhaDVZclpkck9hTEQ2?=
 =?utf-8?B?Nkp1dDMxdDFTTTdSbW9SYS9iUDJOUkpodGZ1NzJ0WlUrUExBUjMxTXhtQlVS?=
 =?utf-8?B?K2VGandQTkw5b2ZTUG5PM2k4bnJCMjdycDhXUzh0NU1ob1A2clpaSFAyNjls?=
 =?utf-8?B?L3F4cUNOdFh0TUp5ei94eGEySlFlc1oxcnpQNnhHamtrYTVBMld5QU5pMXRx?=
 =?utf-8?B?Rlp5M1NPL0RJb3ZLeG9xUGdOVktNcW82blRTY1hHc2ZzUG5mOThhWUcrOHVC?=
 =?utf-8?B?dCtRbklIK0VSR21yNHY2LzF1RkpmY1lvRnV0c2pIV3laTU16SDZjNHpvUTZj?=
 =?utf-8?B?ZmUrMVRlbmZjaHJ4VE1qeWNtUHJRN0JJWisvckJxZ1M2WGdXMEs3dTZkVHZE?=
 =?utf-8?B?bGFiWGx6TTFZRGlzVmdhbHd0S2xhQ094ejc5bTZDQTJ0UEFGdXVENXBuQlU0?=
 =?utf-8?B?a1FyeEx3QW9rOHg1eVJ4K0kxQUdNM0VrRW9zenNtNUgrald2MWdGNHgxajF6?=
 =?utf-8?B?WURuZDlhRlEzc3VXSlUyRk4xZWkyS3FkdFRyam5DdkFhN2RJTVZ4UFpNQ3Jw?=
 =?utf-8?B?RVVQN1VKR3dMYmxMUllTK2FFdmd2YTBhS1RiMnRWcjg1VFJrV09QSFNQNkpJ?=
 =?utf-8?B?WGhBSEFmN3h4OG1tRXVMTG5KZVgvWnNtTkNUWk1XSkpmWVkyUFRlWHFUZlUw?=
 =?utf-8?B?RU5zNndMR1NhQTdRV1N6T2F5dUVyMU8wZkxNbkhYbG1malhEcWpvMitOWnQ2?=
 =?utf-8?B?Q2RUUnJ3eDJHVElqQWw1dCtEYlo3eUJOZGo5YncyTkNHazFtR2U0dHZMOUtP?=
 =?utf-8?B?VG1EczRLRlFxN2k0MXdueDBBdXJVYjg1ajFTWlhaY0x3UHQyRjFUZ0xTVWVF?=
 =?utf-8?B?dnUrbTQyZFYwQjhQNlF0VzJCd21ybGp1M2QrMlo1Ly9SeFdyU0l5SUdiQjQw?=
 =?utf-8?B?eUY3SmpOMnIrTU9qUEFGOTRLMkk3TXVuNVJoSkxMWGc3cURnWmNLL0JUQUU2?=
 =?utf-8?B?OXpwR2FQbmlBaTBlSW9XMEtSNGlEcFo4blh5d25PVUxqd0cxbG80Ny93YUpM?=
 =?utf-8?B?ZHFxeE0rRmNVdzkybEpIUllzdTdOWXVCUGVZYVpqTEcrZHYxN0VNNi8xVUlN?=
 =?utf-8?B?QS81NkE1YTJJZGRnOVgraW5tVWxkZSt5Z1RrZ3dZMm5oQ01FSDNodlpwVnZH?=
 =?utf-8?B?U0dKZk5OaWhocmo2bWhkZXRPTjAyR1RuTWgzanNiNWZnNnA5QlFFWHMxZDJj?=
 =?utf-8?B?cDRPcm1HMkg0WkwrdURhY2p4WldaYWRSS3dzcnlOQlBITC9xSW13YVhnTkVM?=
 =?utf-8?B?Q3NYZmZKcUdjb3l2R2xrZ2xiMHo3YlNxTGhPY0dBb3U0WS8yWitiemdDQlZv?=
 =?utf-8?B?bm91OGN3dGZReGpOMmR2SVlZRnRKY3JNNDBxbU4wb1c5QkxQMmI3K0tuYjla?=
 =?utf-8?B?VUEwM3dqUXE3eWV1cUpXQ0RiRUd1eDcwUEhwM095NXBrblZjUVZib0QvZ1Z6?=
 =?utf-8?B?NmtZVWRzTXRha3ZVQWttL2ZwWGcwOFZrQmZaYTVKOWFRMkRhTm5xZE5WRHRl?=
 =?utf-8?B?QkZaak1FYVNZNTdCeFAvQlp6S1VJT2doNHcrK3laTzhuZXk4N016YVRtSVNH?=
 =?utf-8?B?eURqb3l5YkNYOTR0ajd5NG4yWHFaYjJEVUt4RzF3RElNTTNKWDEzNXp4VDll?=
 =?utf-8?B?VWFGcnBIc2ZmN3NFQklONk5INzY4dDdGTE5VTk8vZGhNOFg0ZHc2VzlLUFZv?=
 =?utf-8?B?Wm5VMm9CUjNrL1FsSGxoR3FjSWYyRGtDdmprNlNEM0UxS1FnZjdkZWdBcWk2?=
 =?utf-8?B?R1o1VGFKY1ZwcGdOd0xMUWZyTU9PQlQ4ZkJxbWFYSUlsYjJpb3pJN1FmNmZj?=
 =?utf-8?B?SVRvMkFyWWJoOTlzOFUzOUFWUUtESGExVTQ1SVdFTHd1d05nZEVoVXp6S0px?=
 =?utf-8?B?bEpHWGgyeUpQL1FCdWNGTFdyUno5WDlYOHJNR1NGV2xtM0JjOE1LUzFMSDRT?=
 =?utf-8?B?amtlVUJDZWlJSFk5cVJtRmxJMHpIcE11bzM1MGpWb1hEWVBVak5BM21YWjlK?=
 =?utf-8?B?eGNSWm5MdnJScndpM0ZBQ1dYaWxvSzgvTms3MkR6MXpGdUkrWWthcVZaUmRW?=
 =?utf-8?B?Yms0YnI1RGdIZDdnajVCNDlvbmNTMWtYbytBOUFGSzZXUWtCeXN5bkJ1NnRK?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46bc6ab-2fc2-4474-9669-08dc91678273
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 20:28:13.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO/Ewrln6SBho2UbyYACSvjC5fBzAz45XbBBieeBmrv70eVMX2Mj9dDhr2HuZgEeZAcA1+KWlq+w7dWuossxPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8820

On 6/20/24 1:45 AM, Greg KH wrote:
> On Thu, Jun 20, 2024 at 10:31:53AM +0200, Miguel Ojeda wrote:
>> On Thu, Jun 20, 2024 at 8:13 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> What exactly did you have in mind for how that should look? The
>>> "make rustavailable" target has some leading *** and some bare
>>> statements, so I'm not quite sure exactly how to lay it out:
>>
>> I was thinking something like:
>>
>>      ***
>>      *** Rust is not available.
>>      ***
>>
>> (the `***` prefix is used also in other similar scripts and by Make itself).
>>
>> However, thinking about it a bit more, we should perhaps just let
>> `rust_is_available.sh` tell the user why it fails, since it is likely
>> the next step the user would do anyway:
>>
>>      $ make LLVM=1 rust-analyzer
>>      ***
>>      *** Rust compiler 'rustc' is too old.
>>      ***   Your version:    1.62.0
>>      ***   Minimum version: 1.78.0
>>      ***
>>      ***
>>      *** Please see Documentation/rust/quick-start.rst for details
>>      *** on how to set up the Rust support.
>>      ***
>>      make[1]: *** [linux/Makefile:1973: rust-analyzer] Error 1
>>      make: *** [Makefile:240: __sub-make] Error 2
>>
>> What do you think? Then there is no need for extra output here and the
>> patch becomes simpler too.

Yes, that's perfect, actually.

> As someone who just ran into the "wait, how do I get rust to build on
> this machine again?" problem, yes, having the link to the documentation
> right there would be helpful.  I did know where to find it, but others
> might not, and it's free to add.
> 
> thanks,
> 
> greg k-h

Right, we get this for free by just letting scripts/rust_is_available.sh
report its results "out loud".

I'll post a v2, and with the comment part split into a separate patch as
requested.


thanks,
-- 
John Hubbard
NVIDIA


