Return-Path: <linux-kbuild+bounces-5866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C888AA41285
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 01:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D031892B8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 00:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE9012B94;
	Mon, 24 Feb 2025 00:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MyzSgjOA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022129.outbound.protection.outlook.com [52.101.96.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826511078F;
	Mon, 24 Feb 2025 00:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740357752; cv=fail; b=Awo9jZKoeGLeYA82EVLqthqSbx8/IFOi7JNiWAyQTLFu5UriKWhfQPc02XxhyzljqeIYXhhJE8xc8e4g32cRQnGVGWTLg/KjO11PardAWkUwBAq/jqDdaXYWUGvgQP1SRhibM2YC7BY5IW6B7uqahy59U2P/MIOYImwErOVcvtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740357752; c=relaxed/simple;
	bh=PFZxPS5IiV777X6Lx9QhgxYcQt8aFatVe811Qx/ijVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EM44xP3hPmxbGLevqNXuvRutG0i+EwmI1JC/63XomEm7aR4qfoLt8mlzxHimGtIg1ghpwuyk4IAGxuwry8qzAdNDcD9PYs7pd08I7qZU17lD4xwwhqTIBvR1K2spfqi+zJzJImndQ3bSNvQKZzcvB7hVrLXxOWgZlT9XTStLuIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MyzSgjOA; arc=fail smtp.client-ip=52.101.96.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gY8tkOD1UsXUmifu375OfZE8QL0LtEvjy+Y0nAxjq1rq9TuIjWlBnTPFfh7vLTZYEzsXeHCDZYPwNMS+Cc0G4EoeF9VBRlcU/n7laFBiE2TIqK+95L0SEVqzDa4hSYce5IQAU/w3uDJAS1RsIf6stN/vuyKAsnPDMrJU16vgmYO9p6CqWYXxbPaOOgX/JubmkfMWerNAZgjS0GJlEPK8DT82D1s80JtH8o+xqtfzHhDz7Z9BCBpB/iki445WOw2h4etGq4nUKqpqOkvtNot+GZvScz6EprkePgpW8J0y088UdjjxrvNcrn+ZM23pFNTIqujl1LoTt1HTD5xTrXK9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHZcQQxK0gJSQrCxB12G7O7qmc7BLB7tbv2ULAglzM8=;
 b=UOw8YWlA9AjInY90VB7XMO+Z7d+xIOVkXTrd16ZDCY+Opo6h5h7XR1zO1XNC6AL5sMBoULWe+JhqblW48a18y9S8EmkbjCKHZEqRn/rA+LsRNIcHm6w+VEjIlXT+zJl7/izBHK8lPeFst2iWRNkTjgkFKj4Wn+qIAwIdDoD2Mh1xCDCaIFmouivMoog2cJwWgQw45ZBlJMyZCR02oGbdbix5pr/v+XYDalmMdhzYVRoOH2bVGFwTwT5AU1L1KuSG6Ismhlehf3LXUHwDiu8G4IhnGFqSrwao1yNMknuXCdKWnO9nojd8dSwWtg1P+NSOLq6tkL3IRlHZDxnqAG3nJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHZcQQxK0gJSQrCxB12G7O7qmc7BLB7tbv2ULAglzM8=;
 b=MyzSgjOAvzEUOnTFalizdKAHcQDQeSjGMQ7UXhIK4Y4v1YqFYQc1xnuM9feT6hx2C6zSaOCywiC0uAm/aENjrwZrPcFS7I9sarC8uNQoTxhH/o1PB9/a34lWAOYR1EctUyJNCu++xKLL9Y81WMzi5VSRncl1Kwrd5C1JKu0/3S0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO3P265MB2089.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.15; Mon, 24 Feb
 2025 00:42:27 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8489.014; Mon, 24 Feb 2025
 00:42:27 +0000
Date: Mon, 24 Feb 2025 00:42:24 +0000
From: Gary Guo <gary@garyguo.net>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] kbuild, rust: use -fremap-path-prefix to make paths
 relative
Message-ID: <20250224004224.07deba56.gary@garyguo.net>
In-Reply-To: <20250219-rust-path-remap-v2-1-8ce2c10d4d66@weissschuh.net>
References: <20250219-rust-path-remap-v2-1-8ce2c10d4d66@weissschuh.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO3P265MB2089:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dcd819-ac24-441c-fe45-08dd546c1cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azdBdlZ3OEhNVFc0aTNoR2VJV1pRUFRCZ0dFTE42a3BYNGFHZVRNRWpwUlFu?=
 =?utf-8?B?dUJyY3p2aFdRZURTU2dYcUMyV0RZc094dnB5UEJYT1JIZXZtWUwzZlkrQmo5?=
 =?utf-8?B?Y29BOHU5b0dacXlnZWU1dlp1WWgwN053d1lZVjNlZHlINWRMVExRY3YrU040?=
 =?utf-8?B?UmNhZUR3aHh4SnNuUzRkYm5oU0ZGdDJIcWVVOWZCMEFpRlFWSENZK1ZhTUlI?=
 =?utf-8?B?WmRVT1ZyZmlwWVlwU2hYL3VxeDlwVGhGU2toZktrSkFhTmJ6Q0NzbUlac2I5?=
 =?utf-8?B?Z1NkMHVrdzZwWjR6OW1LMUFyQnZTc2NNYUh1QWV2WHFRcGVXTDltWGRJd0NG?=
 =?utf-8?B?aEFZU1Y1b25YbS9oSjk2MzJTRDNyWDZrZjNEUkVoUUVpWERyMGFVVTRvcUF1?=
 =?utf-8?B?ellEMENvNHgvQ3hFV0JvV3pHY3BUOVhITUd2NEdVMWd6NisyVjZVVDgvYTJk?=
 =?utf-8?B?dHZyeEdiRlFTUXFKVUFGNnlVK2xJYWVVUkgrZVFWdHdYdzA3djhvemlWYkIz?=
 =?utf-8?B?cENITFMyeFUyT0IwbnNUdHE0WVRSRXhDN2FmUkxELzhXT0lCZ3Q0VjFoYjBv?=
 =?utf-8?B?dFVsYnJrNlFDallFdE9iSEM4cFQyT05jcFcwSUdSRXd6cjgybE44cmFUaEpj?=
 =?utf-8?B?VXFYNTNJQnJoNkY4Z3Jib3hCeVpJa0RTYklwSjlqUy8wd3BFWWVVYWhlOUo0?=
 =?utf-8?B?bEExTmVBdGZWQTN1QW8wTmlEZVZIcU5rR1JHQXFSbmhyZHpabEt6OFVRS1FV?=
 =?utf-8?B?MlMrN1M5NHVmazdFd0hvcTJaZXFueEkreXVRNGNpMDFJODFKckR5RTdzTmR5?=
 =?utf-8?B?ck1ucnJ6VFh1OWpUd3dtQVZpVGZKN2FMNlhaTUhIWEN2SzlBaStDTllScWdn?=
 =?utf-8?B?RTNWcHR5enV5aUhpakxjbXlxRmtnU25HaWZhcU5HUWhFaTNhUDc5Wk9XYkdS?=
 =?utf-8?B?ZTJlNHlFTnVqcDNUQXNOTkVqWVFaTkRzN2YxZlE2NCtUY0xib1VrSEppanpU?=
 =?utf-8?B?K2pDeEZ1a1dQenVBQ2RlUHNHT3BaVFRRZytXbXRZR2RhenBqV3k2eFZYZks0?=
 =?utf-8?B?Z1V6djN4azFPbW9lTUw2TzlTYzdUOWtuSkNRQ2tOZGptWHZXQndYcFhTemFK?=
 =?utf-8?B?TmpybGFudmRCdnY2SkpvQ2FzNUU5Z2hFQzRpbWM2RFlhbVl3bkl5M1Z1ZDhW?=
 =?utf-8?B?dUFGT0ZweUZmVlRISHpzM0pFRDE3b281ZXkxWnZlRVFGSWVQMmFnS2JBNG4w?=
 =?utf-8?B?b05Ga2VwbFNIY2F4b1dEejVQUUU4ZUFTTjkrSjR0cy80ViswdzYrNC9jR0Vn?=
 =?utf-8?B?Y2hHQ3BQVThRUXFOMkNJRUtxbFN5WkxaTjJPM3oyeExRUjVyOVFjaG10UTJL?=
 =?utf-8?B?QTdobDhNSTRHbUlBdEdMdEpHYUZBVHlxZEJXTnZUNnhWcjZDMUxDelFsdHRI?=
 =?utf-8?B?VStwMkI3TDhraUpYcGprOE02VU5heTIzdGxCNDRqa0tnMzZ6WDZMYlFtNEFZ?=
 =?utf-8?B?SklxaTVjcWhNZWFyOFcxWUhDZTBwZ0ZZWS91TjNkaE51SDFNaFZrMSsrSzBN?=
 =?utf-8?B?ZDNGV1YyNFR2dk1wTW5uUU5pUTBpNVV3cmFyaVdRR1pwdFB4YnY2VDk1NFpG?=
 =?utf-8?B?UnVyMmJtOElKbFlFWExzdXRBM2J3UXdyK2Y0K2ZIRnhEcnVRNHVDZEhBTENY?=
 =?utf-8?B?Wi9vZjJuK1lOcWtVOWFTWEEwbmt0ZFcxOW1BLzVpdHFtMnFhdkVqQVdRSitu?=
 =?utf-8?B?QTNHMWhHNTRpUFp3TEFvcHM1U0dla29hczIybXBEUHJVM0tNVENReG9jNnZZ?=
 =?utf-8?B?Zy9UTTNyR3NveFFDSnJGUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZla05DamdCWG1rS3ZQZDhycitiTiszK3AzOXJ1bGp1dUNvanYrK0hTZG92?=
 =?utf-8?B?THhONDNKUEtZcjMxWlpSQ1Z2Q0ZmWUIzTDNJVzNUOVRVUlk3UVM5TmpmcjZF?=
 =?utf-8?B?N092M2VOVnJOK1ByM3NBdXJ4elJYTDh2OWJKMjMweW4vRXdyNEhqLzVpaDVv?=
 =?utf-8?B?Y013OHhrR2lZaGhIMHMzMjY2MjZFYmxPK1RTcUVGeVkwOEIrRHJrSkVUakow?=
 =?utf-8?B?SVJOZUcwQU9ONmh1WlVKVEU5Y3NoNnRKejQybStlbTVjRGdmTlYyTGZPZUVI?=
 =?utf-8?B?d3RCcyswNzZ4eWpIWm80M2RPNzd3Zkx0UWwrTU5tTXE2N0w5M2hERzdnWXdN?=
 =?utf-8?B?WlBGTUNJUElwWW1GQXdMMS81V1ZKTTJXQTlMTzRlYS9KeXJnV21kWjVtUXJJ?=
 =?utf-8?B?QjhwVVhMZnUrbWFUTHY0U0NTZDg1bzM0aFNVUUFNQ2Y4bnBvZ3RXS1NCVW9n?=
 =?utf-8?B?ZnBVOFpWNlRJN08yUmRwd1ZqRVlVRy9IcEFPZXZ5VEs5VnBrOW5YQmsyWVZj?=
 =?utf-8?B?Y1VNbnlsL2c5b3M2cjNsWGZUQUN4TzhLa3FSMVBhR0p4YkRrOU9nVmNIOFFr?=
 =?utf-8?B?ZDlCeVF6a2tjcTJHcFVRdVZiNEFUZ0lCbDdKd1NFWGFLaGpIZjlhYTIrSGRW?=
 =?utf-8?B?NEVKUlhtc2xFeStsdGxBNDNjN0NVNExOYUJqTXZvRUk1c0VWNm45VEsyT2xU?=
 =?utf-8?B?TEVXU0NpS1d5U3FxVFdia0luTzBUZXBZcEErdHBDRWRkSVM0eDRlaWlsTlpD?=
 =?utf-8?B?SnZqbFJVeVhNMGZuM0dwSUMwT2FYZWJGbEV1TWNvMFlCTXV2Qms3UDZHc3pn?=
 =?utf-8?B?ZUsxTjhXWjRzZHJLcHZGUlR5RVJwRVduRXY3M2VVQ3hEUjBWV1hEeWZlMkVv?=
 =?utf-8?B?WVg1ZTZnamloZzU0UEQzUkpTWjJBbWtxWnB0Wm8ranRBeVFMRVY3c21OU3FE?=
 =?utf-8?B?eTFTMnErdnh1OUN4OCtFYW5sbnhNVzczQ2RUWXg4eTk4N3RIT2czS3p3K0ZX?=
 =?utf-8?B?SXllTkxCOVR6QVFLNFZyaStJd01QR2NmWEtMUFYyU3NlcFdMTEFRSjFsNldI?=
 =?utf-8?B?Mm5BdHE5VUo1M1lNYzR5SFRoWTR2MWdML0QrV09wT2FqQmZQNjhGdXcrdXUw?=
 =?utf-8?B?UkE4SVVLMzZ2RkgwVkp5WG5xQjJMbitpakVNeTc2bzI0Q2RWcnd3Y3U0QW9I?=
 =?utf-8?B?U014QTFRVUxEczhoaXlzczVZTDJLaXJYZ25HaDh3K01RNlFDTmNBTC8wUUZa?=
 =?utf-8?B?akdNeHJYc1FSYUtpZW44Vmk2S29EakVVNno2K01jVUZjUnAvSmJ2WUtRSVdY?=
 =?utf-8?B?Ry9JZVcrMHFlUzBzc1RHUFh1dXlVSG5yNWNBbTZubTlsZWpSenV6WXc3ZXly?=
 =?utf-8?B?cGp0N1lXQUJUVFRHYVVVckVPcnd2U1FKTmhFWnIwcUdjZ1F1OUFoYXVKN2Fm?=
 =?utf-8?B?ajNEWWxBTDlqT25BVFo2Z0lqd3RqSk4yb040aWs1T0hwaTRrRldyNVhDaWJD?=
 =?utf-8?B?a1RrQ3lsNVF0dDRWOGhtV1lGMTVTZXgzbTJKbHV1eUZFOEZuajlJZ2tSYlFk?=
 =?utf-8?B?dk5lcDI5OFhSWUdXN2UxRHJsUSsxN0lPNVZsV1d3NUNSL0lNcnZRNEpNUUti?=
 =?utf-8?B?ODRtelZRWGtWMUJ3bm1tWTZKSDc4enBPbXo1NGpITUhoTVkrdGpad1B6WE9X?=
 =?utf-8?B?aFVwSXdMK3NBVGtNYWY3Q3FmZzhYeWd2ZXpkMUQydEw2WXhpV1ZBcjMvdWlS?=
 =?utf-8?B?WVYwT0U4S3hwZWZkczBNOVRxb21sUnByU2hld0hkMHc2U2hhNkdDMENCaldJ?=
 =?utf-8?B?bmlFcXh1S1kvZ1FFUXRobUR2cDZRbzhQandQenMzU1ZwVTJ5cFhDcTJpaDZx?=
 =?utf-8?B?TVI2U2IwMS8rS3dTa0JiMlNvOVhZMWlIRUVyMW8ya1dCa3lPZTgwaWR1dnZL?=
 =?utf-8?B?Q09aa1hsb0pxTi9pbXhZeHhZekhHQ0xEeGFHRXVjMk4vR05aK3hhZDVaY3VG?=
 =?utf-8?B?OE1rNFVlTDQvRFlxVnc4RXVuSXo5RG9ZbG1IYW1SeTRpcUFUenBrZmhPVDIx?=
 =?utf-8?B?UE5TUXFtSi9BRm16L2ZJNkNlWnVIY3RGUnY1N0xmRzAvYlNnM000ZkxzVDVN?=
 =?utf-8?B?MkJUeGJqa0pRS3NTeUNwWEpCbDZQL1ZNTW8zNE9GZWFRb2F2UXp1Sk5mK2Vz?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dcd819-ac24-441c-fe45-08dd546c1cfb
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 00:42:27.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPG0iOhavUVvJXKoM/gT5rnghiJ/h78pE5UGXe9OjColtEQ8sjTC+EWUwPz4SyDSaBr1xSmEEcEzNKU3vyessA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2089

On Wed, 19 Feb 2025 22:22:13 +0100
Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> Remap source path prefixes in all output, including compiler
> diagnostics, debug information, macro expansions, etc.
> This removes a few absolute paths from the binary and also makes it
> possible to use core::panic::Location properly.
>=20
> Equivalent to the same configuration done for C sources in
> commit 1d3730f0012f ("kbuild: support -fmacro-prefix-map for external mod=
ules")
> and commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to make __FILE__=
 a relative path").
>=20
> Link: https://doc.rust-lang.org/rustc/command-line-arguments.html#--remap=
-path-prefix-remap-source-names-in-output
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Drop the usage of $(call rustc-option)
> - Link to v1: https://lore.kernel.org/r/20250210-rust-path-remap-v1-1-021=
c48188df1@weissschuh.net
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Makefile b/Makefile
> index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..9ed2222fafd4fa37a367b87a5=
c681936368318e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1068,6 +1068,7 @@ endif
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
>  KBUILD_CPPFLAGS +=3D $(call cc-option,-fmacro-prefix-map=3D$(srcroot)/=
=3D)
> +KBUILD_RUSTFLAGS +=3D --remap-path-prefix=3D$(srcroot)/=3D
>  endif
> =20
>  # include additional Makefiles when needed
>=20
> ---
> base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
> change-id: 20250210-rust-path-remap-e97cec71e61a
>=20
> Best regards,

Hi Thomas,

Thanks for sending this. I can confirm that this is working as
intended, and it also fixes my language server error reporting when
building out of srctree. So,

Tested-by: Gary Guo <gary@garyguo.net>

Best,
Gary

