Return-Path: <linux-kbuild+bounces-11809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADRnHg+dsGnwlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11809-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 23:37:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B2258FDB
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 23:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F7553038149
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 22:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFC03AEF30;
	Tue, 10 Mar 2026 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pBi2KuFT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022113.outbound.protection.outlook.com [52.101.101.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338A1F0991;
	Tue, 10 Mar 2026 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182220; cv=fail; b=fxNsSnqGd7H+MlED/1y7kxFVDusuPST4yL+yqfxTOgAxyT9Y0Z/xctyr8+GKL8Kx1zmChBXKhCndrCVvPHnffIre2l2/WuVVji7o7bwo252lWMJ88gDJNoCCow3fsvDbtInaBI5voomfrMc4Ey68ZQTCnDyzR5zHC2LCYVO2KbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182220; c=relaxed/simple;
	bh=xxLn1iwMQy9mdGkxN9mwbN3ZRZeiIFKs9bWe2GRNwUw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l1W5Ly9D34h0GoqXjRPH1mqvKobC7zQJpN2ynteP46Ff36dnrH2AjrOHAmQ+ktmJYwpK/nMIzJbcdWZ0RkfuphoBRuigWcBFDlmTyz6h3z1plkeS5a/dLos0A0xVn95pzNvkKJUD/V+DiiszABj46J8HOeliSV4J8e5z14w3Uec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pBi2KuFT; arc=fail smtp.client-ip=52.101.101.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHG2K/wkIdWzyJjMtUN1Gp2w7++lYCyODIMPfC3ElY3w4pTKbWsS166tSrXDdaq6JbSMyC50bw7ZEfOToJQrvmMslM60qyPkVP1ITElgczDhNjuxfPF6eVvdwKlSCKj8sfev58r9qtkx+cvMEorxRgnDSSChduIIglzyWjqE3pmEYLkX14cqfXku8VwyrBLFrl97YRRG5bWQU3W3//n53s+da2W+e9eGen2gdQCedlAdSDiPQuZ2+XCpZ9QFuaAmRYemRCmCuC3wnu1ToABhQn7AI4IXagzfeFo9t0pZoIZtP3jPVWmVdZvKMdSH1UUPdKUA8qv98eElP3WeJWFP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6oEcnWzX+B1zMr+4BQYSRJ/2m72Tiwyqp4AcdyvLd0=;
 b=wNFiv3zfU14iUR/cDNe42+fQvW2aMNV8aJzOtLdpWdLZxw1kQKsl3piVqq9OV6lhNBeYtirj2mrNVBTP9uB1iyEy5VKvmJARKEgWTYJU5k2LNG4Wy7zEOMFmnB9BUANJgx+x+ZMU/s3R+1Hmyay/lECeDuHUA2mVb3/nmBLtge+cvus8ykwmovdfbFTuGoKzQkMwTi5CJDGnNv4UUrCNiLb5iRhF+fgA4BOo779B3PLXzBVNYaHJZ34opAWSbx8meiIheQ0MsOPN0CgDSRAxs7JxLlugc+op3rTTnFuVZb81lKX9Ihw+6eXoC35FNjr8su2rz+Ko141A5P/JVQ6UDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6oEcnWzX+B1zMr+4BQYSRJ/2m72Tiwyqp4AcdyvLd0=;
 b=pBi2KuFTtUT3DZ1zxSRWAb9e8eFQ511NK/EJ+F+eaujmcnuH3f9bJe0kEqvwBzDK6nEJk1EKFoxe4Eyl/9SjkRIyGBuYc/MAbJX/kd/bHp4TkMdsIZHWOBnI3zOqiw/XgVwqiOJJXYsvyL060sz/n0Hd3g5eSsZZooM8remqFTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Tue, 10 Mar
 2026 22:36:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 22:36:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:36:55 +0000
Message-Id: <DGZGMWASD35M.4Z0SYXHS15Y3@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Jesung
 Yang" <y.j3ms.n@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
In-Reply-To: <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
X-ClientProxiedBy: LO4P123CA0249.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2071:EE_
X-MS-Office365-Filtering-Correlation-Id: 069b8283-ce76-485d-fa18-08de7ef588c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zTuNhqcuckV2Wi6e3mtPSRVlRw8w1n42Pz9Ys1BRRsGLY7rZ4QZ/YXFMWX5wOp+idOGnGp3NEo1QM6kWOHslAWFwgs3hJd7Df8GfwTSVcncyoCr85CWu6pFhqnt2uPlyygfeDGERLF9SUJ960A2vqMxwsL4kophJ8fA4Eb5r/UfshjkKnDlP8TKI+l3WI4430Vr859QKUpRhHcekdhZ0RmSYtJsda5oNyYDycahhlov9ZKqjKjvGD0EQyF3m5bh9jMatptfl9zkKFLz/bCuzT72YvRnhjE+7sPui8oi1HZQ0UF4X4yTeKhNMQbY4tno0mJLyq3v7c7Nckt+alFhQ8lF2bDOvjp8LboRgF4sTcbHHUENsQ8X7PB8ZNR6x1b1jzCnhNwAD6IWrvQxGSAmw5MZfEJQP6P/2u8uG/9xctSh+vOvte7+IRmaODgmouW6m19o/KU7CPIGuBaFYB+T6U1LobduMqfaupNH/CZtonSGJP64Krub9Giw8/37wo/DyBmbLbn8B2mADJr970X7t9WdfKESjK1g5hzNpjay3fgpi0vn5aqklVKQl6OkB5iijUuGbMGGx39AqgVKWLzVDOGGLICWgCz0qricDQ9oKiJJ8LVBh7ijAJNm5f1wVRK/8Ll2TnjIpAisSHzmMkyG5oTeKa6XKqNx95ateJaRpGhT99JtfRoiKPzKYUc7ZZCV1/aFcNjYrxYVhb0uuev5og9aIF1/ldmx8TCWpGCLEe2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlRWUklzbE9FSWc3YldPR01mUjdhMVgvdlFBZTBlZjlZZXpYbnZmSU9jMnpt?=
 =?utf-8?B?MDFJZU51MEpBdXNWMUdMMytjbUxlSFpnWlFWZGpBODI5Z2dxYnQxTG8wUjNo?=
 =?utf-8?B?OEwzVEJib1BIdXoxMTljTHN2YmZYRlhNUW8weXRjOVVGd1d0N0dvY0VCK1BX?=
 =?utf-8?B?ZlQ4QWVDbnRlV1JyK2hPak1ZT0lDSVZaWXkzNW9vbWhUN1FSNlJDanZSUjND?=
 =?utf-8?B?cmdmcnAyRWVwWWx0c3FiSEJOY0xyRDFrWkF2V3Q3cDhySkpNMmVaU0pBRTZv?=
 =?utf-8?B?Tk9mdmRGSmhPMWlGYnduV0tTYjBLUlJGb0FRTzV5alorcnRVc2pkSG1HdXNs?=
 =?utf-8?B?c0VvU2lHdHBoWWFpUmZyR0xzZmJIUWdzTy81SFZYMzhCWnVpbGFzaHRHcnhW?=
 =?utf-8?B?Y2hlTUQ1VDE1ZXRYbU0rNUU5RlcwaURDVEVtQ0lSMWNGY2QwSWVlRW5zZFd2?=
 =?utf-8?B?SXJ4STh6VkZIMFpHYitySmtYeW13QnJFUTB2Qzd4WEN6N01pMXo5SlI5T0Yx?=
 =?utf-8?B?ZW5kb2ZNQVRGWkZ3TFR1aTJIOFBZV3FMZG96U2FDTDhWV3hIQUxTbnhtSXVv?=
 =?utf-8?B?YlhPVE5pM2dMSDcvOFFNdnF5Q1dDQ0s0VlJJb2JXRndRVlI2dXlJQVljMjBG?=
 =?utf-8?B?cUw0c3Q1T3F3cW5MTzV2YndNckZ6eFV2eENwMDVBUmxRM0lCM1MvZXY3QWs5?=
 =?utf-8?B?MkduVWFPWE9LSGRwTU5uOEEycTZFMjJOREx2dndlT2VtS3F5d3QyeEVwN2JE?=
 =?utf-8?B?Q3ovQUl5RXVkREd0Wk14OWVZWHkxdHZsTlpJSmJxcm10aWhFZ1MxOXBCUzl4?=
 =?utf-8?B?RHRxdXRVanRIR1dRaGQvZGZsMWttMjBEVGVJaTh2a0M0WGl3SkhyWmNzRWh6?=
 =?utf-8?B?RTQ4YndRYWpjdnJPcEtFcytjdnFYYnRCbjlqK2R6cjZUOFlEdDVFaktNNGIv?=
 =?utf-8?B?MWdVRmxlbTh4TEN5eDV5eDhvMHBCb0VxcEx3Q2Fmb2htUVFqRXRUVm9TYmh1?=
 =?utf-8?B?azl5WWMxbjlOR0xzaitISzdHZkhhMjFpUk9vMXVxYkE4WCtqMnJiTWMxbXY5?=
 =?utf-8?B?ZkZqRnBLZ1NiajhkUHRSOFdySjl3MytHWmxYcFlXdzhOK0dyQ09sSHorU3h6?=
 =?utf-8?B?TzFERFRqMnpmNnE0Z28xQXA4NnB6bm1zNDMrbTg0TXM5dkVKamRNSVo0YnBZ?=
 =?utf-8?B?VTIvcldPc2hoRWJJTy9aaWRmSnRZcTNDUEVpQ29JKzJsa0ZxYjZGQzFaL1JR?=
 =?utf-8?B?UTYwSjVnVTJqTWxna2pFUUN6eERsc0NBMkpydTlJazZ2Q1FMSm5Bd29QUGlY?=
 =?utf-8?B?NjI3UXVxM05tYnZTKzZ3ZnBwekZ5Q3V5dndVbW1GZm94S1QrV2FUK0V2cnRj?=
 =?utf-8?B?ZGIvMndTV1JBbDBzZGVuNlpVSzNDdHAzMXBIemF1WWhCczBFSVVuUEZGRG5h?=
 =?utf-8?B?UVVzeHp2MVdWcmgrTkpEMjhjcHFoN2dFdUd5bjJxUWFiMTZ6QjBqNmRsODdy?=
 =?utf-8?B?QVdsYlY0VktPb3BCSjgxMS9HMWpqekZmSjhKUVNreTRNN2FaVE16ZVN0VHZo?=
 =?utf-8?B?aHdlcE9ya3JYQ1pocmJJeGJZZ0Erejk4R3pVb2hoaWNNcURvS2V2QkpMMk02?=
 =?utf-8?B?MVZxUnF3L0NqdkdYcGQ2Q2xMMythTUFmVGRzL0lka1NGMFZoV3NLRHVPZFRE?=
 =?utf-8?B?L050YW9vQjBmcVdacFY0Nk1Yc0pxb29nY0JkTURwd1M0V0E4d3FmVjhPYnNl?=
 =?utf-8?B?WTNFUmIzZk5ScjNzaUFKS3JlWHB1YTNaR0xVSHEzejlzTGFMYWFQclo0VUt5?=
 =?utf-8?B?c1VyKzBnUmxTc092TVpjK3JLNEFiQ1RCdm5GdVVSK2FacjhTcjh3SFBSNnpi?=
 =?utf-8?B?QTIwNlkzK0hCdkkxc2JOOWtYeWdIcXcxQ3NTcmk4SldnR3Qyam9KOEJTc2lx?=
 =?utf-8?B?OXF1LzREZHE4RWR4cFJjUHA1RnpkK2I0NVR3d2xoUkRpNmhaSEJ6SXNNK29X?=
 =?utf-8?B?SWwyUGVPcXRKc0NUbTBTdCt3Y0FZSG8vWlBXRUNDQVBHeHlrb3pNdCtDSU1w?=
 =?utf-8?B?bGtmRXdjRmFxYWZwRVlNaFdqY0JTUHh6aThPcnhDSXFNVWZJclRQdG1UUi9r?=
 =?utf-8?B?WXNBK3p4MHNaV1pJQmRNUUxNZ0VVSTRlVExBRG45Y28yVzRhbXBENTFIbHQx?=
 =?utf-8?B?S3NDdzlmb1FIaTAycEdOQ0Q1eU5qMnR1QjZ0azVCVEVDbGFlUjdmNjRTcHN1?=
 =?utf-8?B?WXFacWVCTCtXNE9hTG95TzFVOEFLNlRLd1FLcFdEUjdJNjd3dk5zQjVaeUlw?=
 =?utf-8?B?K29qU2doSkYvd1RhNU1KVlJNWEowVmliRnN0ajhsQkxWbzU4dGRmQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 069b8283-ce76-485d-fa18-08de7ef588c2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:36:56.0492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5a6iPVxfAKRsIA2+gDS+V61+2TRr5Lovo++2p0TcGC//Z8jCoVrmmGNVp8puqUUq/49UlOLMvPaBdgqdgZZbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2071
X-Rspamd-Queue-Id: D50B2258FDB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11809-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 2:53 PM GMT, Alice Ryhl wrote:
> Currently you cannot filter out the crate-name argument
> RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
> include that particular argument. Since --crate-name is an argument that
> can't be passed multiple times, this means that it's currently not
> possible to override the crate name. Thus, remove the --crate-name
> argument for drivers. This allows them to override the crate name using
> the #![crate_name] annotation.

Could you add a line about the fact that crate name have no impact on outpu=
t
locations as we always use fixed emit paths, as we discussed in v1?

With that change:

Acked-by: Gary Guo <gary@garyguo.net>

>
> The --crate-name argument is kept for the crates under rust/ for
> simplicity and to avoid changing many of them by adding #![crate_name].
>
> The rust analyzer script is updated to use rustc to obtain the crate
> name of the driver crates, which picks up the right name when it is
> configured via #![crate_name] or not.
>
> Note that the crate name in the python script is not actually that
> important - the only place where the name actually affects anything is
> in the 'deps' array which specifies an index and name for each
> dependency, and determines what that dependency is called in *this*
> crate. (The same crate may be called different things in each
> dependency.) Since driver crates are leaf crates, this doesn't apply and
> the rustc invocation only affects the 'display_name' parameter.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  scripts/Makefile.build            | 1 -
>  scripts/generate_rust_analyzer.py | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 32e209bc7985..adc3e2d1ac78 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -332,7 +332,6 @@ rust_common_cmd =3D \
>  	-Zcrate-attr=3D'feature($(rust_allowed_features))' \
>  	-Zunstable-options --extern pin_init --extern kernel \
>  	--crate-type rlib -L $(objtree)/rust/ \
> -	--crate-name $(basename $(notdir $@)) \
>  	--sysroot=3D/dev/null \
>  	--out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile)
> =20
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index f9b545104f21..d25bc3d7e719 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -194,6 +194,12 @@ def generate_crates(srctree, objtree, sysroot_src, e=
xternal_src, cfgs, core_edit
>          except FileNotFoundError:
>              return False
> =20
> +    def get_crate_name(path):
> +        return subprocess.check_output(
> +            [os.environ["RUSTC"], "--print", "crate-name", path],
> +            stdin=3Dsubprocess.DEVNULL,
> +        ).decode('utf-8').strip()
> +
>      # Then, the rest outside of `rust/`.
>      #
>      # We explicitly mention the top-level folders we want to cover.
> @@ -212,7 +218,7 @@ def generate_crates(srctree, objtree, sysroot_src, ex=
ternal_src, cfgs, core_edit
> =20
>              logging.info("Adding %s", name)
>              append_crate(
> -                name,
> +                get_crate_name(path),
>                  path,
>                  ["core", "kernel", "pin_init"],
>                  cfg=3Dcfg,


