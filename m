Return-Path: <linux-kbuild+bounces-11396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB+gIaNTnWk2OgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11396-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 08:30:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3481830A9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 08:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A1723006031
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFE826E6E1;
	Tue, 24 Feb 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LEvq9P5Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020140.outbound.protection.outlook.com [52.101.196.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3919EED3;
	Tue, 24 Feb 2026 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918238; cv=fail; b=sWCJC0GDh4kphoAwZLaeUP6pf7u/6hg8tDSXqLzRbLN6rKy0AzL3j236OfyLd4P1g7W4oxaLYr6s1T/OrokIDkKOCMjPVPvjhVVea4EEjubKL9T5iJCFdf9LU7L8jl4RABX8GGDVxjsxqxCJS/vUpiVpNqfeb6h/o8VgA/Fw/NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918238; c=relaxed/simple;
	bh=eWVYnz4mlQdZj2J0EF3S88QeyPSggzuK2ZkBCpuE9uo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mmhpYxm/TbsBNq7lZVpbWMtSTB0pDO0HHmEJY0OASSl9ZtVtJ0+5QKU+WaZyvhiL9yTo6umwJhcV+CvDEOHsWWAFAiSNxstfuJWvOWACwyPY5iFSe00JfrgVVE/EUmLW2ePHP8XkTokQWYYPZ4kYnD7uSGrtG+kX0jR+3THS4j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LEvq9P5Y; arc=fail smtp.client-ip=52.101.196.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1CI9PFvCGCZuahcjX8HIFXslUNtgQD2JxOIkW+baZFCJbiw6exFEWZL90SBwdLPJ1EiBPh9Oo6KGx5fCp4/ID5mZ6YIuvxKINVs7A9sSkrN3Y5ZEzrTCm4lCllrlv/VjK5C4gl4C9kWjYbBYSfCVTpTpTZZRRyeq7thBpvjr/05zbM7Y7efZZmumq/wkzL9k4DWbnXaOA9yc4SwdS7dFgJm8uMpzhTCaI2sfNtrDanzddsAHLOTg/UW17WKwr3/o9E1sOiNdWKxWCQwLy0IlS286c7oQhiG1nf4gOTXskXQSd9T+aTFv5ju8IT3RgpMv07OqG/0mCQiNpd/1ui8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvg7tMTtyfR07oLCzbAVl54XvCaW087Rh3RRk94Iwlg=;
 b=X8ptTubRG21FIBcXhSihwy5cXsZaUaYO7WJ09Vlu1ktNFvjgvsHtgJjnCRv+FzymofVkxm3zozJKvEbP59y8T87KNhzuWy+H9PJQIW9jhBL0Z1bTp/+JGqLMO3BWCSmBTP6Ku8kIKbdGTLyrILlz8cJaGTKwZaQ8ZrfO6LdipRiLTpDl6IFRdXJ2zMVu/BrVJIbJrATxkxAZ99HUhJsbWCjrpuQSmZ9E8csxeiALFbh1Zj+JXKDD/7YFVpYBJZcP+QxBsKgaAnUKAcec3NbQ4eWFlWN3GkPt34fRZQKb+IvDy4Aa7m8wJsI3nyLfc2khD8twZePzKaoNq2urmuGCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvg7tMTtyfR07oLCzbAVl54XvCaW087Rh3RRk94Iwlg=;
 b=LEvq9P5Ykx0YA3eAp0lBEodXfGe+Bx1MXpj7wM7aZqxYU2L82Ez+Oci5TMKmLNUFKYtYBCF2Ykh7QrQomlqwWUMLcCorEjyKwhlOSnaIy1fg6as0x/jA8lR39eoWhezym1LqFJKJjKokEPlCXFDr10cRZEhG9GZVGKACOxbLBWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2340.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 07:30:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:30:33 +0000
From: Gary Guo <gary@garyguo.net>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: kbuild: emit dep-info into $(depfile) directly
Date: Tue, 24 Feb 2026 15:29:56 +0800
Message-ID: <20260224072957.214979-1-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2340:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c3ddb5-e570-4db7-094b-08de73769852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1VVNFJZNkVFVCtjbkZaS0lOL2U2WnJBVnYyampoQWFud1dSbHQvMDlMZmhI?=
 =?utf-8?B?WWlrQmVNUW8zK2pCdDcvV3A5aStaWGJnbUxGRXlXZmlCT1hZNUEzOFBEK1Y4?=
 =?utf-8?B?MjFPVXhvTG5Pd25mSEZrVG5GaXZ2RFFmbmNHOFUzRTRGV3N6dTJOZTh2TjQy?=
 =?utf-8?B?UEhoeXJQUTVhdEVQY3F3T0J6OS9CT2lFQndOUWtHaWVLRWhpcWZBQTd4OFg3?=
 =?utf-8?B?WVRrbzZNTTdJekVYcElicWwrVUlIdTlORzZqT1ZNK21XZFRGa3hIVW93MEh4?=
 =?utf-8?B?Ym5US0xMSzdCRUVtbzZJeGtSVnFKRDNZbjdlb2ZMN0E3dDBCclc4Ym1Ha3Bw?=
 =?utf-8?B?NHJxcUIyR0JQR3U3M3JoSmp1QWptNjJmRUM0eWxJaS8zUlV2bkVWdzJla3gy?=
 =?utf-8?B?MTZXZzZWQjN5TEdzWDJHVTY1KzhBZHN4Q21LS1BDZDlmUmdZUktjSGxqdE1O?=
 =?utf-8?B?WXB2TnVJWDJxSkVHbHYwbW5sbnhmY0V3R0RMWXlETS82TlhibnVIZ0kySVN5?=
 =?utf-8?B?KzQ3UDdLeHprYzNpUFZPbjhXZml3aU93dkZHTGZkQWtGWjlvWnFPWlFFdG5s?=
 =?utf-8?B?WmhDa3MzTU9QaE1zc0hHbk1Wd2pRNUFUZ2c4ZlhHNTRKVXRrM1NERDcrenVy?=
 =?utf-8?B?TGNiamJsQ0pWUEc1dUlHSWdnQUxEUXFwbGJFRXBDSE9kOWduTktWc002WU5y?=
 =?utf-8?B?SFZ4cmZFdlBPSWlDTkhaMW9XNzBMS1VtK2FIb1o3bm4xSnJRSXFZRGNFdXRF?=
 =?utf-8?B?clNCdUNjL1dOT3dKeThDTjY2WHQ0QmpmWGdOdVpEQTZ6OGlWVUovU05FK2V2?=
 =?utf-8?B?QUR4OHgweW1yd0ZlU3dZOUNOYXg1a0ZxcUJjeHpQZVYxTWZ1ZFhCbGVXRERB?=
 =?utf-8?B?WkZHTzFQdndJaTZvRlpEVHl2eWo5bEdQOXRHNzRKVmhlOFEwS2pSLzhaa1Vh?=
 =?utf-8?B?TktKNnBnOEwzNjdORy9JaS9rQXcrTzBCM3JManRrbWoxRHg1YmxaYmJ1OVZo?=
 =?utf-8?B?TjhHdTJCaUIvNVhzMVZzUU5wTHBieEJYUWhRSllmK1lhcnczWWIxOXBWaFVT?=
 =?utf-8?B?WHRmSm83WWNoTUNJcXVSbnA4blBDaThNVVVBdjNvclJ5ZUc4cUxRcVNwdWlE?=
 =?utf-8?B?MW5VYjFNL3FwZzg4TCtZSkdHYVM2MzE1V2JtcHYwWDBZYVVVZWYvTmNNK2xH?=
 =?utf-8?B?UWd0U3JEZ2VTajZxb3JqMmlTTlMyRldrWm9KcmVUQlY5U2Rvd0NwK01sR0J1?=
 =?utf-8?B?REdCRThWNjJYQWVrZ2ZxRUZ5TU50WlIrNFRBSmZQV2RmSEozd2VZeHFWT2RE?=
 =?utf-8?B?cWE4bllPZWFSVEtOR1kvQTBSRFVyTTdsRC9hdmlmSlJ6S2Q4UkoyNmJkM3ly?=
 =?utf-8?B?V1RXNWJHcmRUQ0txMjdKZEhuMVAzMURZU1l0REZqd2w2eTdabjdoTDFmWlpu?=
 =?utf-8?B?YzF2OWNlamUyWUZJamtNWHdMa0FpR2lhcG81cHp0OFgyZDdVY1VyS2FUWHlP?=
 =?utf-8?B?RGF4VHBhRUpJcUdXeG9yVXBUK3hSWmRWZllhRXVLNW0yclZ2Mm9idlZmb2Vl?=
 =?utf-8?B?QUI1cHl6cEpHTUlIeHRuL1VoWDNSR1pRbGFyeUVIRVl0cFM4OVVDbTNEbG84?=
 =?utf-8?B?WG1jMEhGYmpnZmc4RS9FK0I1dHVESlMxeDgrV3dMaDhKZzVCMHA3bGVack9M?=
 =?utf-8?B?V1BYekNyMlJRdDRVaVlNQjkwcCtheXk2V29Ld1Fxc1I1eHh0QThTZnd1TUll?=
 =?utf-8?B?aHRGQUF1amRuaW5rVXhTK0Q4MXNML09QVkRMYTE5bDB1NUt6ellhZEllRk40?=
 =?utf-8?B?SWNXZnc4QmFBSlNrVGhTbWxNQnRBekUyaDliOE9xWThpZW1uWWgrbnc1QnV6?=
 =?utf-8?B?Q3BzZ3hZTmpCaXE0N09hMHJmU1NXb1p6ZmhUUkJ0TjlHZTJOVFlWclVNMjZm?=
 =?utf-8?B?cTVwNjB5UFptTXg5c1ljejhZczRveXNRYmxBeS8vbk05dGJJUWNPczIxeEFD?=
 =?utf-8?B?aVJnWUVMUVl2QkFQbnpUa1pjZVdNMTMvTCtCbDRBVjhFVEU2RnF3WWtyNk5M?=
 =?utf-8?B?R3RpeGFSbTVJcitVelZqbERnd1M2SjFhUUMrL1BhRi9jdEt4UlQyWHdSN25G?=
 =?utf-8?Q?1WeA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm12YWpNL01oRnBhMXB5d2VLZDYwcWdQMlkzVWQ2QWVDZTB5RFU0ZTFpTFZ5?=
 =?utf-8?B?cytBdnJlUFJLSUpGbENHOGE2dG9RSVNwejBLU2ZZQ05VWGlaQ2hJU3dhSHUx?=
 =?utf-8?B?WHJ2dDRObWNTQXJNeFV6a3YyZUdMU3BpbVpCQ1VjZ0d1VWw5TkFtZTVGeEZa?=
 =?utf-8?B?akhDeDkwbVBMbXkya3ovbnZhWlZCbVBkbnJjbVVmZjliaVZ0UDBYRVgvKzVQ?=
 =?utf-8?B?cTROVnhIRVRFQ1NQKzBTMm5MQml0Vkl3WFRIWURiZExaWHNaYWdHRi9Senhs?=
 =?utf-8?B?VWtSRTUvZnVDcGRUZGx5aE9hK0c4UWgwcXRpc2h3ZVJUWkNpOGloTFVVelN2?=
 =?utf-8?B?eGo3dnB5S2NLZ2Y0REpPdmZleGNURndvbzF1NU5GVnZnK0IyMWp1RUtJZlRq?=
 =?utf-8?B?anl6R2NLcGg0b3RhNDVSY1RHSGI1VlV6S09OQjZ1ZFgrU2ZrZXYrU0h1UTJI?=
 =?utf-8?B?N3dBWllZUmZFK2lHWkZOU0ZVRnZrMU1NZXlQMEppYWY3RnRQcGpsekdBTXRo?=
 =?utf-8?B?UTdzdzRydkRUSkJSazR5N2ZXVW5JZkxwMXl6K1JvVHpzVkI3NGt3NWcxcDJk?=
 =?utf-8?B?MDZUY3JJOUpRbWRUditGci8xbnlGeUQzMTFqM2RCVWZWWDBmSUJnUGdaWEg4?=
 =?utf-8?B?NE9OZGxYTlZMZGFLZTRGQksvMTRSMG53WHJDMXlucWdsc05WTGNmbk9mQnR4?=
 =?utf-8?B?bmgvNWw5bDlhSU9vZDhZZVZCQU9UbzhqaEZMR2xhRWFXeGRGTHR0bGErRG54?=
 =?utf-8?B?NzZCUkxweVNId21KYUxwREt1bzQwb0NuM0VyNll0UDBMSndFL3A1UXFHSTdG?=
 =?utf-8?B?QUxidFMyUU5EeXJQVTdDWkJiZm12UXJhU0dhdDZ5VlhSS29MNUVxam15eGM2?=
 =?utf-8?B?L0FDWWZyQW5VS09aczQwOTlJWXlaVEptL2lxNk9xZjNSb0ZEckRzYWNXTWlo?=
 =?utf-8?B?V1NoZTQrSjh4MUZCcW5SWFhleldIaVZHbm5PdVFuS3RvZmcveHFHUlVhS0dr?=
 =?utf-8?B?dEk3RS9lek9VUFF0YllGQ0JVNzNmV00vbS9raUhobzZ1cncvQUh4WGVZTzBT?=
 =?utf-8?B?WlhMaXM1YWtodXRlRFdBeVQrQnNvYkV1ZUJaQjUzQktoQkc5VjY3ZHBpWWVs?=
 =?utf-8?B?eHVRTHBwNXNXTFNlZGYyblU2eXV5Y2owWGt4aW1TUTQxTWdVVnpvYWhDaXdB?=
 =?utf-8?B?di93R1JObVcvN2w1MUJ4eUFKNGhoYXhQMS95aVlKSzlrcVZSZHJJUURPb29o?=
 =?utf-8?B?dkROb1NMdU5KSVhydS83bm5pZWhsKzJlOGxpcVZmVHpSZ05XZ3VmLzNNcGhY?=
 =?utf-8?B?Y285RkJLbHhyb0Y1NS9BQ1gxbVlkMHNuZFhVMUNTM3hUZjl3a25QeXVNTE8v?=
 =?utf-8?B?QWt3c1g1NzFlZWJoT28wOGNyL3AyN1ViMWcrTmxmRDZVOTJyUjhFcWxuZ0da?=
 =?utf-8?B?dTkvTFYvUFF0L0tSb2pvVU5hZUJDTlpEZWpEcTlqcUFJOU05MmhTUXR4bHV1?=
 =?utf-8?B?U3ZqU0EvV3FUQUdTbUlpWnlPK2QzeTRCdTJZSTk1R0lyYzA3Z3YxVVVZS29C?=
 =?utf-8?B?SHhyMjlkWXlNbnBRR0ZuZmh1eWsxM0NENzl5UlZQOGREbFpKY1JsQ0p0cC9B?=
 =?utf-8?B?L2xkV2FzdFh5aGU2US9QN1NMV0ZKa2F1RzdZdit6VHJzT1o3R2c4UTFnYjF2?=
 =?utf-8?B?N3hTd0JlOXVHMWlIaHRiZFJPV1FFTWw1YUxkZGVQNVdyb3EwbjFxdUNoZHJD?=
 =?utf-8?B?bWp0Z2IzRkNxOHN2QVcvRlFvY3VVSzdONlZqelZOQTZxaVYxUG9CeHVUcFp5?=
 =?utf-8?B?ejV1aHc2NDdCYmd5bUZYSEVZMUxkcURWa09seGpLc1MvaXhlTUtaeHQ3a1VU?=
 =?utf-8?B?T1laUzE2dCs4cUlVNlhEdkhyWmRKODFjOS8xQktwaEFxMTJiWll5TTJlYWpE?=
 =?utf-8?B?NHNNVFRGMmEvWGg3VmU1c01LUFVETmlkanhiM21CM29nMmpFTGFWNXhqM3FW?=
 =?utf-8?B?aXNZem9DV1BiN284N1VZaEFXZlpmNXRDeGN1Y0l5b1VJekdLMTlTTGFTWVZB?=
 =?utf-8?B?OG5OaTQ1WHRDSG9paXhSbkJTbll6VGpjY3pMeStPdHE5c1JVaVd5eFRxQXBV?=
 =?utf-8?B?QzVvZUJNdnRDanJaY0h5RSsrelVsUlRTVmdkeGw3UkRIYmIzT1U5U3ZNZDNX?=
 =?utf-8?B?RjRFMTg1LzZkRWZWdi9JMS8ycEN3YTNQVGRkNzdnWXVtSDlBbnZXMUpybStn?=
 =?utf-8?B?U21rNnYxOWpMSFNoOWRBUDFkSDMxdDZqRERNVENKMkNNeDZNMC8vUkQzOUww?=
 =?utf-8?B?OEtpUS91QjM2aXRPRWJjYktieHJtN2Q3dFdzYjc0UWlsSjJnQ1ROOElYaUxo?=
 =?utf-8?Q?mzZlcd6c0fvjcYdOzucnC4mSIAaCBWhmfk8fG?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c3ddb5-e570-4db7-094b-08de73769852
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:30:33.5253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP2/oeo8Q2vhM6jYDyupc66hFWcpg66wBxHk4joCAO7m+xnNw/mPFzho6ZxMw5APLlbnM3FlxKr8iu/yY9Mieg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11396-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,garyguo.net:email,zulipchat.com:url]
X-Rspamd-Queue-Id: AF3481830A9
X-Rspamd-Action: no action

After commit 295d8398c67e ("kbuild: specify output names separately for
each emission type from rustc"), the preferred pattern is to ask rustc to
emit depedency information into $(depfile) directly, and after commit
2185242faddd ("kbuild: remove sed commands after rustc rules"), the
post-processing to remove comments is no longer necessary as fixdep can
handle comments directly. Thus, emit dep-ifno into $(depfile) directly and
remove the mv and sed invocation.

This fixes the issue where a non-ignored .d file is emitted during
compilation and removed shortly afterwards.

Reported-by: Onur Özkan <work@onurozkan.dev>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/syn.20artifact.20being.20tracked.20by.20git/with/575467879
Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 629b3bdd2b20..1500993d7ecc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -526,11 +526,9 @@ quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
       cmd_rustc_procmacrolibrary = \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
-		--emit=dep-info,link --crate-type rlib -O \
+		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
 		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
-		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<; \
-	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d $(depfile); \
-	sed -i '/^\#/d' $(depfile)
+		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<
 
 $(obj)/libproc_macro2.rlib: private skip_clippy = 1
 $(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
-- 
2.51.2


