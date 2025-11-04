Return-Path: <linux-kbuild+bounces-9397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD02FC3176D
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 15:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4754D18C462F
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 14:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2A632D451;
	Tue,  4 Nov 2025 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jaolih8C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFF232D445;
	Tue,  4 Nov 2025 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265717; cv=fail; b=aabKyfWv7qY9P2X+QeOI2zs8nVOPrQmadvGWhLeITOD2ynNZQZKnBYafdmsRBVRdhcqMr07Zyt3GNT11L7YxfPKsfPyJ+5drTHo1vFMhVo4SQZmT7pKgaOb9mVAVgiw4+PX3GvhAA0U1AznfUO2Ynl4e77sNOmL35RIa2ttK8fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265717; c=relaxed/simple;
	bh=Aq4nFUtHWJ3NPb8OFFQ4IyJaa63VqIrkKTJAEClOqvk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=uAVvpwJ1z0lCiJYvtp5bK5jIGh9U1N1Nljd8CPIwX9x62MonmBrPaOAHbE6OG969j1ds4J7ylkSctkbXBjGWMvgMfSXg7vzKsMZoPWWP/xCIfz3NMjDgjA3pU3gYd11WduLOaTM3rxVInH+6haGThrQPCpKHvsUC456vJKktgzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jaolih8C; arc=fail smtp.client-ip=52.101.193.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrIFDY5+zeGq4yhWdK49Y3CMlwnKGEF4M10MqJGqFEUDjEBKq0gbgpPJhoDxWDh2PSBO4EGckUvuihZgPamZJHQNDszczJi/PLSgAG3rgq/GEFBzv+5v8+UD7XQHBvo3ykeRDkJYdDAZXnm+wkydvml4xCqhblEfpw6KsILRwm4G251AfWn7PTh7KhmhXIbWUo9txxKcNq8IdNW8RYWtW2nxS7qkqe2qo2EBP/8R+nRccctA+7hlGFLFvbgsMJQ+vykrBx9zsU0Djd9izCX23L4eV1J0EQBC3qAX/U5ShKFDPyQTOKTeiDU8XoK0wW+g8tWF7Dg8e7QcjOpVjEvNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76HndY8YeQr4zda6BT7+92FQgpe8XaicPozCD17syco=;
 b=k5gutQ0SG8dk2Z6+kje2VmAFLYYgYm4B0n+dzAHwDonvm0BlNT8Nkz0S9PHaeXToC6lFtTS3M3O2ztz3w9IIcgNhIb6WxsO8iI/wp2h4V8QT7lnvdx3S2VFFcqiB35bqqflHHPLBQ9sOAN/XZTb1bel7GvtDCzT3POGuUMZU+va1shqLQMq1AZfAXn8+H7j9RGczBX6CmYHeQFiZmIVdzu3W9y0Mo9bT7b/TEGWgwzV9SeBeGOGI7F13wdAEvYBnOuFf2kzsQdxYg18RqBf8UvQUbCl4WZtetSpPNyX565V3ghnn2xPp8wJ9BaJu/4pIbutaXIsHARBKbvHH849kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76HndY8YeQr4zda6BT7+92FQgpe8XaicPozCD17syco=;
 b=Jaolih8CUb8N+UDovaXsChv4uAmI3sapFC5HwyaulxbrdPgKIodiluk1Ef9lYzpkbxcyuMlKuRwn4tnH4oLHlK8Jih9GHz8b4V+NqbMM1Z67WpMyJCtI9GVfmgWpiRozQSdF4giExw6tHgD78cx2tZm5t/nKzUBfBgxv+ruMvqXk1t91nXx9DFDkW9vQLp0LequUsNh4le1tRqFVvl5+7ex8g57pshwSZy/I/9/uTtBkd8psj05apFd4i5H8ln7Q+C0CooGShIlcVb+bLUdodjIEw9yPBQIaoORw7YoPWqq2uQarwXbDr5FpWzMgaYn4q5HA+r8R6Qukiu2O5Q0FKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 14:15:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 14:15:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 23:15:03 +0900
Message-Id: <DDZZ1ZWIPH8P.3M7H00GIMJUXV@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
 <aQoJUAdFFBpQiEZU@google.com>
In-Reply-To: <aQoJUAdFFBpQiEZU@google.com>
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa72466-e7be-45a6-f27a-08de1bac8e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2JWOWhIRW1ZQ2tNQTN4bGw5a3V5ZUZqZVU0RWZML2VWYmU4S0dCNDZQNTAr?=
 =?utf-8?B?VklGSmxlQVVSSjZCRmxrOTdidDYwU1YwZ2VjTlhXeVlENmdwM3hmZ2wzSFFR?=
 =?utf-8?B?bkFvNzZlRy9ybFQwaGlrUzJNK2UvaDgwSmwwcnpvWEtST29JKzVrOTQyWk9C?=
 =?utf-8?B?SVlMM3A1Ym5YYnZsV0lzaDFZTzFyTTZYQ3pzeDB6dGZoR2U2eENmbW5ROFpw?=
 =?utf-8?B?THIzS1htMWI3K0U1aGIvS1VzYno3M3VQTGRWcnRKcWZQSktUVDd1STB3em5G?=
 =?utf-8?B?cGdyQWFOUU5RZVhCQTdJZmtSVnhxbUhsTFhSWkd0ekYvQjBVM1pVSUd5ZTNz?=
 =?utf-8?B?cytDYUF2cG5OeUZVVXBRMVhPZ2w2YnpRWXV6ZVBCNVQ3dTg4YUduam5ZVWNv?=
 =?utf-8?B?WWhQZW5sOUhSc2lkYWtLVWFISytzNW4yQzc4RXdic2x6M293MzYzdjVaRGRj?=
 =?utf-8?B?SzlYaTVLMVZSSFNlaHNqVHAzYXpIaFdmV1FZODVhL0hOSmIxWFpSUVZsTTky?=
 =?utf-8?B?c0wvWE9ja3R3TExVRSsrMVpVQTZ4dytpd2JkMTdsVDdSMUNPeTJCZTM5aHdZ?=
 =?utf-8?B?Wks3ZnI3bU0rem5nSVQ0RnVtNWpjOURCRldZQk1RMCtTWUprYUI2dXhVSmEv?=
 =?utf-8?B?T3BsY1Q1NTErTVpXOWxFZGRrNVl1cmVoNHJRQXRhRWR3ajBybG11cGRQV2da?=
 =?utf-8?B?YUZRQ3NubWxSSFVBZEdDbHc1eW1yendpMUxMNkJjZTBGcGRWZ0ZaQXdIdGJW?=
 =?utf-8?B?bUtjY3VqQ0FlRm5RVzU4QXd2Zm1kQ003QTZ2ZWt0MW9RU3Y4ZllvU2dZbHZh?=
 =?utf-8?B?Tkl5TU1CUCtYVjhFdlNkZXU4bWlZKzMzd0lONUFOeHlvK3krL2VlYWZDaG9Z?=
 =?utf-8?B?eHJqYkdIbi9HVXdja3I3MHFuUjBoMnVpNFE4ZVVzWXB3amFNWHhWSWsvOUc4?=
 =?utf-8?B?eWFzd0lLbEVYbHRkR0dDUzV6bGlMdTdIeVptQVRRcnAwTXhiRmJxQjk3RjFo?=
 =?utf-8?B?YTlyeVVHdWExYndaTXZkcWtoMGpYQzJhRTRDMzNQaHpmRnlyMHZFZTY2TDBG?=
 =?utf-8?B?aUxJV3lTRitUd1BhZlhFNzVRL2tic1FjY0dzQXZRR0V4T0xkTTJBQVlXT0Vq?=
 =?utf-8?B?ZHpjS0w4Y2FsN3JQVVI5SWkrb3ZUWjZWRXNPZGR4RGNRYThQR05STXY4cmNj?=
 =?utf-8?B?V0UrTGxtMktTL2xKT3hPVGRZQ2M1WVBMK2hYb2J6N1YxYTBaVjNGRnl0WkVE?=
 =?utf-8?B?eHFydmpWZE9mYlRtY0R2VkdwT2JSNkF6dlNJSjQ1bTlwazNFdGxtVzd1TnZE?=
 =?utf-8?B?UDhxbEpLeFRLenNNU2pQMmdPUHNOaGdycUFHckRMU21TWExWZHY1TmdUV0xH?=
 =?utf-8?B?MlA5OEtMQ0pvR2RSa0F5aFVGaEkxWlRJZjN3bGlleW1Gb3V3allzanhYK09K?=
 =?utf-8?B?VlFmUXliYkVxcWJtd3dVbHRpK2FKRTNpMFY3dEU1K3Y1YWVUNncwVUpnR1dB?=
 =?utf-8?B?d1JvSFppWlpiV1VPYVFsclhCSnRBekZQcUhxdGZHOVN3TnRrb08vVURCSFI5?=
 =?utf-8?B?SFc4Ris2Z1ZmaXhDYlVuMmNGbXFrMkE5dE9hcjlwVmN3R1hLQUNKYnpSK1Ns?=
 =?utf-8?B?MTdtTEpjcnlKOEtKdk5rYmNobk1rTkFMaVJTdTZxV05vY2FmaG5GQjQ3eU9y?=
 =?utf-8?B?R21VVmxVcElES1d6RkU0Zlg0UWkzVlFmYVovYkU3cXVjQnhLdDFJQkFrR3VG?=
 =?utf-8?B?YWdlUGlRTjJDSC9Hd3V5NGhZN3RaaFBXODNhZzBFazdmUE82ZGhZbkhmOXo2?=
 =?utf-8?B?NDhsdGpSOWxqMTBWSWN5MkZuTm9WdGovQzhLOU5mbVBqYTBOYVRZVzhHTWtO?=
 =?utf-8?B?dEFTR1lJRDg4Yk5HZnFyazVQekgzd013cWFlVTF1YmtrNGduc3pFcUVqOGZ5?=
 =?utf-8?B?WWttOTdZcnB1c01KQ2xCNWFIajhWNWtmamUyTXp3bjE2Ri95OVZlQXIwQk1u?=
 =?utf-8?B?TGhYSkhCcEV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktRRW9sSEZKQitiS1B5Z3FiZVNGTVdzUko4V1djZmdNUmhNam9xV3kzV0Fl?=
 =?utf-8?B?dStRalkxVHZiREFYaFdkZkwyZjhXVUNWUTJ3Wnk3REdpMCtNRUQ3QWFINFM1?=
 =?utf-8?B?KzlBUS91c1ZCcDd5SnFKMGh5dnpwQTJ1TDV6NytrQWVOdXdUaGljam5URm9S?=
 =?utf-8?B?K05oUFBDSmFUbjRvcmRTSnlpaXREbERzQVZBOVc0NXRkTTRwUjlaK0NGQ090?=
 =?utf-8?B?aXpBV3RFUFdWcnhkQVNqc2NqQy9TNkNsMmR1Nit6elN2SHYyemU0Q2lHeTV4?=
 =?utf-8?B?YmVkVVM5SFhrdHJUZGdVVlhsdkhpY3VSUHZzd1QvemU3STcxVGRQRFNkV0RS?=
 =?utf-8?B?UGxxak1nSFB4Z1pneUdrbUgwSnNHVGtVZmZ0WlhhNzJSRDBmVzlTNWEyQ1FY?=
 =?utf-8?B?bjMrSzlnZFNaZmpuOTRMZDkzWllZRHl6elVsRFY4bGxHeFhUWWg4dlN4YzZ5?=
 =?utf-8?B?S2d6TTZVd3Q3S0x4cVBTQXRXRVNwdmNjYnd5SUJVYWN4VjhhdkE4d2dlbEcx?=
 =?utf-8?B?Vk1TTEdPV29yMUxiYWpCSHBTWjIvbndZN1dJRHZscUZndXZhZjQvQ3dhWk92?=
 =?utf-8?B?M1doR0FjTEgvYzlGUWdpQTQxa1BaYng4WURNKy9ieUxHYk1rN2k3cytQZmFE?=
 =?utf-8?B?MTRNVmZVNG9xMkY5d2RPS0h4Nnd2ZWxUVVJnV2EyYUprT2kzL0ZENENRbWdV?=
 =?utf-8?B?MGJ5b3NkMFlzZlZXUmpQWTlELzZGWlNYc0FqM1BWQmFXWjkzWHErQ0RmZTFH?=
 =?utf-8?B?NTRZSEZvWS9vOG5TbEtNN0VpaXkzb25PRDB4Y0QveHRGbG1vb3hpVVFUWHdT?=
 =?utf-8?B?Nlc3R2VoRHRJWDRkZ2ppaEo1bU1wb05yRGhnbDBQSXlJeUhsT0FhbmJvUDdI?=
 =?utf-8?B?Vlk1UURYbWJGYkhJZ2lUQTVsaGdSVjhRRUk5ZzkwSmhQRzFhTWJnLzdNVk5h?=
 =?utf-8?B?cUdNWW90R0pXSEZLcSt0SzJnckR6U3dSNUtIQjFSdFBMVXloN2xBOE11K3dB?=
 =?utf-8?B?WG40aXlPWHJaNjFUUFU5Z3JKWjdBLzBMVXl6azAwdU92dGFVTEgxRWpCY291?=
 =?utf-8?B?TG4yWEQ3b1ViaXE0RWphU1RQbm0zS1p3bUJLRjFJVHNGb0dWTFkrTEFHaWJK?=
 =?utf-8?B?eG9kc0dKdnFCOFB6eU5oZVRNYW5GeDVuT0VmL3AweWtnc1BIOUJKbE9IY2Rs?=
 =?utf-8?B?clU1dHZkek96TXhUNUoyckhRYUx1UURHNE1ZZmIzaXE4aFJIY2pvcXY1YjNT?=
 =?utf-8?B?ZFJSeDZMUlk4U1Z2dFU1M3E4ait6Z1hwUEtpZW8xY21JR3lVbEdLemFlN1pI?=
 =?utf-8?B?QngybVRxMUNSZmhVeFdWQXJVNkdVeVAyVk1qYy94SkIrL3JQNFp5UWc1T2RT?=
 =?utf-8?B?UnZweFBpbmNmbWtTOEQyUUYyUTFybThIQllsV3ZhYzZ0L0k0YUhTVktiTXdQ?=
 =?utf-8?B?WklHbEkyNmdCUG0yLzBKQTJZSnl2QS9oTTdiN1JlbjQ5TVJzbzBiYkpVTGZq?=
 =?utf-8?B?dWRhdW4xZURZcnVpQ0NTNkhEeHFkZFBiMmh5WnFTOHN3OXB2UWRwRTVtYitM?=
 =?utf-8?B?VjFsRzFnWDYyMGIzcG9EOFRVdWtJbDVQeStzZit0Z0RSYTBWRFV0eEl0R29t?=
 =?utf-8?B?bDRTb25PTE42Z29vZy9KUEM3TFVKR0NuVTFaQWVDMzdaRWZXbElRaVNEbFg2?=
 =?utf-8?B?REFYOVlhUGRNTjlYY21KWHB6U29abEZMa3I3VTU3K0RhdFRoek0yUERTYlVE?=
 =?utf-8?B?Lyt2RjZQZ080YWVBTHE4WlFLb0N1TjZ5R0JrRUVsbkNxYXhid0R5MDVscU5W?=
 =?utf-8?B?M0N0ejlWOWtMWm1YRHI2b01DdlJrdXNBTFh0RVd5WkUvWjFpdk4vNnI0UmNB?=
 =?utf-8?B?Ukl0MERhRjFlZC9EcUJYRzRDVjRuYUtadVFQTHRnMGtERjBnNEw3dExKTkZp?=
 =?utf-8?B?QlkrZXVFK1dGS2pUK0xRT2Y4WTdtaGN2eFNMU1ZVbmUrWThYMDZqVEV2ZS9q?=
 =?utf-8?B?TS9GbnI4SzcyNlBSS1p2NTJocmQ2V0dCajBkQnlCNUptWW1iZytJU0wrdXh1?=
 =?utf-8?B?U2JjbkNqbHhoQjZVeWlma1pOb3E1Z2VFQWpBV3FpN1NhVGM3ZUF6OXkzMk11?=
 =?utf-8?B?Rit5a0J5R1pwQTJPdTFWWFVSK3ArUFoya21kMVNWZWg3Q210Z1dVNUVyVkdJ?=
 =?utf-8?Q?p00Zl/1CFbVuVcq7alG5mjSRDEp8MD2aM1xfdDPaDkRj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa72466-e7be-45a6-f27a-08de1bac8e35
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:15:06.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbuCKYxV4jPPxR5bV/coW12hmUuSPC0dBNxJFWIsnlVQP3dE9CqOgx6pFvbNtzty7qqdY5O+qUyq6MbRFwCuzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243

On Tue Nov 4, 2025 at 11:10 PM JST, Alice Ryhl wrote:
> On Tue, Nov 04, 2025 at 12:53:18PM +0900, Alexandre Courbot wrote:
>> In Rust 1.80, the previously unstable `slice::flatten` family of methods
>> have been stabilized and renamed to `slice::as_flattened`.
>>=20
>> This creates an issue as we want to use `as_flattened`, but need to
>> support the MSRV (which at the moment is Rust 1.78) where it is named
>> `flatten`.
>>=20
>> Solve this by enabling the `slice_flatten` feature, and providing an
>> `as_flattened` implementation through an extension trait for compiler
>> versions where it is not available.
>>=20
>> This lets code use `as_flattened` portably by just adding
>>=20
>>     #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>>     use kernel::slice::AsFlattened;
>>=20
>> This extension trait can be removed once the MSRV passes 1.80.
>>=20
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yfGcv=
r3=3D=3DFi4edr+sfmw@mail.gmail.com/
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> This patch was part of the Nova GSP boot series [1], but since it
>> requires attention from the core Rust team (and possibly the build
>> maintainers?) and is otherwise buried under Nova patches, I am taking
>> the freedom to send it separately for visibility.
>>=20
>> For v2, the methods are aligned with the final names of the standard
>> library, and the extension trait is only visible when needed. This
>> simplifies both the patch, and the extra labor for user code.
>>=20
>> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvid=
ia.com/
>> [2] https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yfGcvr3=
=3D=3DFi4edr+sfmw@mail.gmail.com/
>
> With the below concern verified, you may add:
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks! You may want to check the v3 that I just posted [1] which also
addressed your comment about having the extensions trait in the prelude.

[1] https://lore.kernel.org/rust-for-linux/20251104-b4-as-flattened-v3-1-6c=
b9c26b45cd@nvidia.com/T/#u

>
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index d0ee33a487be..a84b9e3171a3 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>> =20
>>  # The features in this list are the ones allowed for non-`rust/` code.
>>  #
>> +#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
>>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
>> @@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>>  #
>>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for detai=
ls on
>>  # the unstable features in use.
>> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons,offset_of_nested,raw_ref_op,used_with_arg
>> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
>
> You should double-check, but I don't think you need to list it here
> because all uses of the unstable method are under the `rust/` directory.

I will check that, and indeed the comment above says as much.

