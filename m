Return-Path: <linux-kbuild+bounces-11006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EQ/Gj4NgmkKOwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11006-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 15:59:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557BDAEEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 15:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C33F3304CCC9
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 14:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDD53AE6E4;
	Tue,  3 Feb 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dsmx+Miv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021093.outbound.protection.outlook.com [52.101.95.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130C3939C9;
	Tue,  3 Feb 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130614; cv=fail; b=TQX2SYYvpQnjYZ3mqxv4VhO8mtqn0WVFZRbIhpqBiQiMJXkjiBLEVsY2Z2wR6jaa53kPfK32DXoeoeMXMXA79Ck2rKkk2257pxi9ywt00FTC+pQ9az2Raq6CtWPtnYvA/woojDkYlSjuIpy52r+9VTaufdApfDzQDTTFp75/jLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130614; c=relaxed/simple;
	bh=EtxXxvcBBaPAdbTBeZPECpE+YnDbdi8yoYzIZoPXpGM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Czr0CG5FU/pmDQnBUErKKJokYjJ+8O9EV+JPN9b+ZxF/WhgbOUNncYfBVGT9VrAkcHzfzfu8YtdO/T1QaHgvt9S0tJRRBIh8JN+TyViFAIX/rl6Wplq0kAAIMrt3hPWpXiz/JY2JYKbKoNGafZLd4ePThV9ygoXxumnOfgGPZsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dsmx+Miv; arc=fail smtp.client-ip=52.101.95.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czy3uRBuBvIrb8eRwj08x2lMETYan/+z18/o8WOaRdEc4fbW1SuQU/bFzy61WsNVHM/tTuf/2LjUI8r+FdhFy+r2EH1INzFRdc6dtQfapFXUznaF3VkeOmjiQ675ZZ5uTpWQfH3uMVZvbtWQFMLTecpLknKsQEjVwXChf4fu4oYEjYREEKVxtdVgRaU1yz6eaNZ335lu+J6Qdj3jc/xKZwfBLvqlWuGtT9fiEg/vxS5s/HWtnkUf6wns1qu9zu61X+FhHm+X4I8iCMuzCR9V7VLG813XhxZBmlIrqIES3N/vJIRBMWgGwaRn70741Pu8XhxK2/n+R8RQNR1mCYEsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+Tl85DUmlzlm/mkzTfoHHCvx+PRHMMNTzyPODQCV4M=;
 b=xiFHoE0/kyUvaIeUEMAy482n4Cq5b/sJv6dV9tuQcfLMjB+uOcQbRPKUW3dCcvGHcIHygNfaEXBb/rSFlZSpTTQQoULjPwzmdmS3+U3aK/2NupdJP4z00Oy0Iv4QD38cAadnH7sM1gtambuw+vJM/9FTepMnfnQt8zB/50eaot1jKzzbR/5QLdD7sYvmuOZbD6uyEy/rQeC2TkzwwjfmdZQwnyajvhGld32CvSwqU5KRKxiP/8/Pb+DI77AKkqenRiR0H1bp0ZpmMfkaWocPJzQWMqbMwmG6UlxizenSEatyKbQl6Vwf330NJgUY+jWUzdqfcxTlnoSBpqkN3I9RUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+Tl85DUmlzlm/mkzTfoHHCvx+PRHMMNTzyPODQCV4M=;
 b=dsmx+MivGWOaXfxOJ79bcjtSr17hlFUcE3dqMBFPy5FEei180Dt7+V+g/ou7gWfY5gMAyHJYIbeaSgEJF77TpBrpa05TIhfDqTBkfPvQnBMmQK0TBm/HsaMdGJ8R21FiKW4dImGSwlER37NAs2lNHErMpw51acYoAM5s4HmkY2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB7806.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:56:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:56:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 14:56:44 +0000
Message-Id: <DG5EXHDFRTWZ.WLWRUDWF9NSM@garyguo.net>
Cc: <ojeda@kernel.org>, <gary@garyguo.net>, <charmitro@posteo.net>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <boqun@google.com>, <dakr@kernel.org>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Linux Kbuild mailing list"
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected
 versions
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "HeeSu Kim"
 <mlksvender@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260202222144.2689495-1-mlksvender@gmail.com>
 <20260203002116.2703251-1-mlksvender@gmail.com>
 <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: da312011-cfbb-46ab-1e5d-08de633472ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eERDdW85RGlzaldSWFFyWjM2dzBQSkhxN3dJNTV2QVlTYVFRd0lSNlFsdmhq?=
 =?utf-8?B?aDlSMk1JOElseU1OOTJvcjBIQUZnVEY1QnVuOWhudGJya0k0TWN4dVlERVJ3?=
 =?utf-8?B?eEdvb0lEZGR6SEpCMVF5b2E0dUozWXd5RVgxZW5vdnlVdG0xNXRkdXFmUVdo?=
 =?utf-8?B?TTg4RHlXcWg2c3lxbXhjVFI4THo0SzY1Si9Sd3FCUktRWHpVVzRzWXBDS2tX?=
 =?utf-8?B?U3hpT3VJaDFkRi96ak9rUVdYSWhxZldqTXlDUHhYWklqR1ZzMVJ4SEhycnF4?=
 =?utf-8?B?ZUMyVzU1Z3BBdkR6R3N2T08zLzBad0IxODdYY2tHVDVUUVpodVZiMWMxcUpp?=
 =?utf-8?B?VEJwcnRVK09sQzBtb0Riak1DdEp0S0dVVWRtZ1IwVVQrTTd3NHdSVnNVbWJa?=
 =?utf-8?B?QWVFZzI5NGxoOWtuQzhsMk8xc2ZCOFQrT2xVZGdzU3lSbFQyRHBoNHpKbjNo?=
 =?utf-8?B?N1RRQ0pYcVpRcFd3K216N3c1L2JCVTVKNURXT3pJbE9jd3dDUnlLTHVSV3pY?=
 =?utf-8?B?SDA2Q3FEcVA2bnhJWkcyRUw1eUwzVFRiOFdSS0RtcVpYQUo5VElKWFczNDB1?=
 =?utf-8?B?YytzS2xieFdnNko0NHdGb3NibzA2MEhiNk9yMWdwMDFpVWpHVGQwSTVpekho?=
 =?utf-8?B?YXFidjVSQWNwdkdCTGpydktSbnZwMGdQYVBJN1IyTTIvVEZpQ0owQ2Z2NWVH?=
 =?utf-8?B?dHppYzFRT1UrWG93Vit1aVdDVnZQS2thZEtpQUllWVk2eFhuSmNtcDBrem5I?=
 =?utf-8?B?MDN6aVNDN2VOcGxXR1IwWFdYVWxGWG5pQS84MS9tak55L3BaRUhNelcrYnhp?=
 =?utf-8?B?T0lteC9ZSXBtT0w0Y1ROZUhOc2pzK241UU93alVITUM2M3FDZ3ludXJQS3Ft?=
 =?utf-8?B?aVJVWVhTVzhuaklvbStyWjFvREc4Y3NhUkQ1WTFTMnlTcElyVkpubXlrd0JM?=
 =?utf-8?B?VjRFRm5reWo1dHB3a0FMRWRHK250UUpRWFJ5Y1N0amJhOUQreVFIUFFyT0Rm?=
 =?utf-8?B?WkR1M3k0aGlBdDQ5dnhCTkQxV3BNTC93ejFCeGZCVTYvcGhUWGRsSDJsYVBD?=
 =?utf-8?B?Z0xpUC9OVWhiVCtRSlhwclh0WHE4MXZwdkM0aVpSdHVVOWlBSEE3RlNqai95?=
 =?utf-8?B?RWlrT2pxSzlIcHpKbXpYSDhXSG5CVHc2RTJSQWVFNVBjaTdXTDJxN1hRMEJu?=
 =?utf-8?B?bkorbkdRcXpEenVrSFlJVnBRUVlZcGQ3Yjg1L054QmkzOE83Z2FiK1N6UmN6?=
 =?utf-8?B?R2xqNkpzWlFBdDdlaUJxeVdxVWVtVENHTE01bmNmTnRMdTZRRy83cWVybFl6?=
 =?utf-8?B?ZHZZMVgyOVRIZjFXcW9WUmR0b1lvcVlEZlA3OXVpZmk0UEpRNkw0bUtjZ3dR?=
 =?utf-8?B?b3I4cEVHMHR4Y2hISk5LVlRIN2Fsa0lLQXFhM0ZOSkhwY3dnL0FVY2lULzNr?=
 =?utf-8?B?UFoxblJuMlpOMzNyd1kwL1BhcDJRc2FsQVNKYUh2ZGpCNVVnTThOMzA2TWJW?=
 =?utf-8?B?aHF1ZUlEQWpUZjdNUkNFU0J3d21oSFpTQWI3UWoyR1llQVZiNHlIUUZtMVVR?=
 =?utf-8?B?Ujdsd3BPcWRkZExReXp3WVEvQ1ZLTlFJRDJabEh4blFONTFRQjNnckFFbmlC?=
 =?utf-8?B?Tlk3dEZVWjExYmFUTEplNGQ2MU1ibU16ckM3TklYMTRUUU5qSi83aWlSaG1W?=
 =?utf-8?B?NDBpVmM2MGFaR1dlUWpjYWd5NXBRNjN0cDdmeGZGaW92SWFRa2M2RzQvZWpZ?=
 =?utf-8?B?eFc0VTdSTzBsZVBTTTl0NUhwZHd2TnZjRzF5aFJRcmJEQlhsYUZYdEl5cVht?=
 =?utf-8?B?T1RFRVVHM1BkQXh1THVMLzU2UnRlQXlvRWVTRVUreEx1QmQwTTRqeldCcnFq?=
 =?utf-8?B?YzA3Y25Qam1pQW5iWmJiVWFjS0RUTS9Zc21MaXlaUTZFR0FxMUhhV21nVCtI?=
 =?utf-8?B?RXBiWU1tSUVaajNKYXlVU1ZzVXdxYWxLN0ZlT1BEYURRZUxYSVoxZG9WckY2?=
 =?utf-8?B?aGJsTFZjRklBbHFVNVdGNVdNaHB3aUE3Z3NMMWNNdGNYMGxmYjZERW9TQTQ3?=
 =?utf-8?B?Vm5ObXVsWncyb1c0em82OUcwRjA3bGQxNWRXcnNrM1l1RDJiRkRaKzBYVVlE?=
 =?utf-8?Q?Jalo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2FUV00wY2VRTmhpQ2dhQ0xySmhFczZhc25Sb2FuNG9ld1p4YWsyVVFKRlgv?=
 =?utf-8?B?ZjNGZVpuU2FpQnNsRDdoNmZNSG94Vm5OaTZqSnpBdWdHWHFER3JiR1lHNkRR?=
 =?utf-8?B?TVpVbXVwT1FjR0VWd1FyREM2eDM1amtEOS9hSE1pcDY4WnpGSlpQUVF1Qnlo?=
 =?utf-8?B?WXNaTG53Q2FKaU5VYzdTQ05UYnMvSE56M3o1UFpvVjhUa1ZSV0dUNjl3Vm1o?=
 =?utf-8?B?ZHBSZXJwN1ZwYWhKTk5GNzFXMEJoVmsyelRzVHd3YmZyWWIzRVVlSU0yVFNj?=
 =?utf-8?B?MHhrOW1MY2l4Njgyc3h5WUcwUHRWV3Z2bVYxd0tDd2taTnhqc01FWGVxVG1J?=
 =?utf-8?B?L3RXd1E2VW5aOTJYWUFQTWdqTUxQQzdpWHgxVGJNSmNSZUhHelIrRW41dytC?=
 =?utf-8?B?RDJ3UEtJNjB2ek81MTBabFMxTzF2c3lCUEhDak9VN2ltc1BrMFkrQTJ0ZHRJ?=
 =?utf-8?B?eWlrQ3ROR29oMDB0eUVLa3pzRjNERmszMkNWSXpWYmJMS0RvL3JxUDF0ckpl?=
 =?utf-8?B?dEljaXJPS3ppdVRENXNLa2NWN2hnbnFYQWNCMWxZMUVmVWYrTGZubFZjRnA4?=
 =?utf-8?B?Q3R6aTN4d0pvMjdqdS84VEplZjdMUzl1TjFheU9jcGV6cC8yNFhpYXJVVHpY?=
 =?utf-8?B?a1JXbEhUVjQvNnNQc2p2eDM4V3pRRkFjc0lML0E0bU5EM0pHQnBaY1NnVGJi?=
 =?utf-8?B?aHp5alFwNHhac3kwOFk4ZGxXME5VSkRSSmpGVWNsYWJyYmN2MFR1cDVvQ2Z5?=
 =?utf-8?B?R3dtS0ZCTGh6WHhnSEJiUG4rTHk2VnJCVzVWTkxHTjhIQnRYWnYra3AyaEYx?=
 =?utf-8?B?dlhtMXhNQythbmg1NXJDdWxrOWY3Ty9mZ09rZzY3NDJ4TEtrekdXODYvaHpE?=
 =?utf-8?B?bmllRUFuSU1xSjFRN0Q4V3R1ekwraVdNaHc0Z212emZsRGRFYzlJTzIzejkx?=
 =?utf-8?B?T0h6V28wc1UrNFVZZjR5MWZ5OUY4NFE2WlhrMVN1eUVGcDZSN25yamF0QTdw?=
 =?utf-8?B?ekRyV0RaM3BtMkJpN0ZvR1hNK1NIS3NaejBwQjdsMnRUcUMvVTA3VXUzaDFu?=
 =?utf-8?B?RmRxamFVYUhJdWtDa0doaDI3K0lWdmlaWld6U0JaS0ptWXpsa3BDU2xsajBy?=
 =?utf-8?B?OEJGUFlvNy9SOTZCMVhkRFVtc1pIaWliTkZXQzNXWmJHM2FIa2pRR1JEL0l0?=
 =?utf-8?B?U3ZGT0hBMG8zKzVHbzlzQmgwTGI5T2NveHl5TmZxTCtVODdMYTR0Q2NkWDJy?=
 =?utf-8?B?RmdLazhBZ1QzOEFCd1RTbWdNazl0eUNSWjRBS0ZoSWVpZ0kxc1FWdlFIMHFo?=
 =?utf-8?B?MkQ4cWg1M0IvSXBFVTJKQzZkWUJ1Rm5qZmJzZWVSdWFFL2dVQmZzZVpra3JZ?=
 =?utf-8?B?MmZKYVdPMHdwYkdRY0xGVG1zaXJWWStJaHZMc2JQZHloczh2ck14KzQ1SC9W?=
 =?utf-8?B?T0dJU3M0M0grZ25TZ25ucXFyV3YvcWVLcDYrTUZWWGREcmtTdEUyUzdiTnRD?=
 =?utf-8?B?UmlySDc0cGpYa21kK3ZzRkdiNE9xQTkzUGYzSGd6WGw5WnI4VnUxdmQ1c3RK?=
 =?utf-8?B?VlovRHlqdTE4V2VVaUVnNFhBMGJmaWxNZ3YyYmlWMzlxOGRXTlBsYTJvZTVK?=
 =?utf-8?B?NXFETzEyMlFUdXBqNk1GaXNVc09qVWk3REh0WVdSTnhIMFdId2ZDYmZLZHJp?=
 =?utf-8?B?RC9YbjVVZlBSeWhEOFpOMmJISndNL0QyTGhRYmxWWVhiR0dEMXZuODNweFNN?=
 =?utf-8?B?Z1B3QzJoQjhrTVFVWnphVmxSUDhXYTBSWW9lTnJxdWdIVlJydWxHakgrUTMr?=
 =?utf-8?B?cVp4VmZHbzRwR1JYVmhUMEFnU1NWVzRzblAwOVlleDhwalptM3RIRzFWeWJi?=
 =?utf-8?B?UGg4RXpwQ3llR3IwVjdaeEtTSkNPQnY3a0phMmVJYzhyZEZDWXhqeXM2eU9C?=
 =?utf-8?B?TzcrVE8za1ZnZnpsY0R5ZlRsOE5peW96ZVZkYXhmNDF0UjlaU0pkUmdtcTFO?=
 =?utf-8?B?cUtJdWNTV3lsWDlUVXRzNGw3M2JmeENQcm5tZDhrSS8rSWhKdlFtS0NsUDdq?=
 =?utf-8?B?Uzh5cStMMkpUdWVEQzFsL2RQVXFZVzM5dG9LSFloR1luYTBqV0dqVlFBU1Ni?=
 =?utf-8?B?WGE3dFFaZ1hILzYrQ1d4LzkxbXdaWmthRGVONUF3SExFWEMyWTFJNGpzOE1E?=
 =?utf-8?B?Yy8wQk02Q0t1aDEvNFJyTzh4VmdmOC85eE5YVFRNS2s3aU5PUG14NVNHaHpq?=
 =?utf-8?B?ZkNBZTc5VTZoSDluWVBoMWlrSHJpazd1KzJqa2tmRERQSGlBR29DVS85Q2Fp?=
 =?utf-8?B?c2pobHRNOTVjdVQ3UHNIVU9RMEpLZUtUYXlVeERNSnpBd0FxcXM3QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da312011-cfbb-46ab-1e5d-08de633472ac
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:56:44.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07BvsVpQf5MAKGIZ1hkA78jlUHfWEnreKaROUsLafoYrNrX+fTlC7YCK4PPsPl2GzKj42xNw+yG+lrDWsWoBuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7806
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11006-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,posteo.net,google.com,protonmail.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 2557BDAEEF
X-Rspamd-Action: no action

On Mon Feb 2, 2026 at 4:00 PM GMT, Miguel Ojeda wrote:
> On Mon, Feb 2, 2026 at 4:21=E2=80=AFPM HeeSu Kim <mlksvender@gmail.com> w=
rote:
>>
>> This bug was fixed in Rust 1.90.0 (rust-lang/rust#144523). Restrict
>
> Normally these references should be full links (i.e. a tag), since we
> do not have "autolinking" like GitHub e.g.
>
>   Link: https://........ [1]
>
> Then you can use [1] above instead of the parenthesis.
>
>> are affected by the bug, avoiding unnecessary flags on newer compiler
>
> To clarify a bit: avoiding the flags is good, but I think avoiding the
> skipping of the checks that the flag does is what is more important
> (i.e. if it were just the former advantage, I would say it is not
> worth the complexity of the added tests).

I think skipping workarounds when possible is in general good, as it serves=
 a
good reference that it can be removed whenever the toolchain minimum versio=
n is
bumped above that (and with the help with LKP, it means that it's also been
actually widely tested that the workaround is indeed not necessary).

Best,
Gary

