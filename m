Return-Path: <linux-kbuild+bounces-13705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TQxVOM/iKmpUywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13705-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:31:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F416738C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=aL+FTJak;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13705-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13705-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACBFC310149A
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006AA425CD6;
	Thu, 11 Jun 2026 16:21:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D670328616;
	Thu, 11 Jun 2026 16:21:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194906; cv=fail; b=pgz7VVdtQGKtBHiC8WwIPd7nMZMqFaLiNRmLKejIEnMrYDGRayV4Z8qAUGf+whBn1deTjdOf0IbFQ8/aoXJBMJxQXneGYe4pJLV8qu9HlFcXHzz/krV53qrFIRZRHE16ugZ+MCb91zlF/nYlCbnfc27/NFxsPpto2J14QWtBIWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194906; c=relaxed/simple;
	bh=U/vDvf/RqInQrKwCNTqXW5TxrDE1O1VtzITHyk86JTw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pyun8W+VNVVMzaFs72wktZ8uXI/UCmSZLRnVDk2MmRyIAs4QGaJEgcIuavBl7xE/TPsoIv/K4UPOdvGV8SVJCnJM5kosls2lsNyqJYJZV0o395DY8Sl1WIra1sYLAutM+eMepQHHkq37bNPtQ0YD2Twu0lNMAyC3/i2YeJ6YhlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=aL+FTJak; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gr7LshFW9RfBEQ+UJbqyCSv5mkWqQMBCjUttBghhSc3xDmqODSeeip51E2atcA8WHVT/zSySxRY4zPjSzOzMA+yCIXCgNd6epqZDc4dxWQsQ7Txrtztl1PMdBASxK3EYgrRVFTiu0Z55e+8T8JtJLy7W0kpplN4xt1EAXyrzDQopcUXRellYRKofG1cLjBWV5MmoWEUa7l748DaA+iBQ87LoyCaDonpblIvGlu+WBMS1RLLGXT3mV3VNziPbusUlCeWCzODHh4UFfvYKjHQ0km+Zcx9BHU5SV3ARIuoW9tXscIaSP3Vt6kAvhElBhOlvSwDPOL1z9CTjIX8CmaG2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE8fucAFZUwmO8QVIHJBuiN2oOkUwEcB8ensrxDjswA=;
 b=KSwg3NzCmkgXC3P9qJPxvqCiYrYz8x+aF6DvK0figi8to931PLjK9FeVXMik6Er4bzGgUe8bajHRk6xgcV3CQtesG88kh8BVSAWOkC7aeFFc5u5Ybg+Ka3fqG+/InMESi8XJ8FZNaajtOK4EwMLH4yBeALimPXgHAYzh4hDp0lgYtIdyxy0BOCyxnw85bx/Qc+ckJzH0O1SNdBoSm+AFysmHK2/yULbnvtTwiQXeCjtfV7Fg8aveF/aMqBdeHfBoFOQhyC2X7eAorJ32b35h4fCo220n9Fu/qTG4avE1zfPtbis4dzV3afyd9W2/b0M42oMIvvy8N75i+6uHw+jmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE8fucAFZUwmO8QVIHJBuiN2oOkUwEcB8ensrxDjswA=;
 b=aL+FTJakNPdMKhJDkxVjgfkifm7XBeaNMiRUCepQamqgKvLtqy1g/6rbD4hCmWep5iILbixD1skSBMStM7zFcVgNqD5L53y8jdgqDebCLTgbZACOxl3v3Cs97LB1F5opRnK5aFRVcwCpHFMzZ2aOHTzqGWkqXwokvj7jGP76w4L9TbkDUIho1rGr96ZKp4QqZBDib9SHmh8FuqGJURZpir77NYGgnzHGUfXV17QOjJcEZsIB1/HI6pyqai4nElNf++wND+BuqiYjJIBw/3pZgiLlsE6OWwKQy4OK36GSe/XX8VnUUW4whMA7k0YagU7jU68lFrdIyJGV647Bipaf8Q==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:39 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:39 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Subject: [RFC PATCH v2 00/14] kcov: add per-task dataflow tracking for
 function arguments/return values
Date: Thu, 11 Jun 2026 18:21:02 +0200
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG/gKmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDM0ND3SQT3ezk/DLdlMSSxLSc/HLdMiNd4+TktDQLI4vUJGNDJaDOgqL
 UtMwKsKnRSkFuzkqxtbUA+ffaD2oAAAA=
X-Change-ID: 20260611-b4-kcov-dataflow-v2-3ccff828eb31
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Yunseong Kim <yunseong.kim@est.tech>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yeoreum Yun <yeoreum.yun@arm.com>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194894; l=14087;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=U/vDvf/RqInQrKwCNTqXW5TxrDE1O1VtzITHyk86JTw=;
 b=zOhXe84rhNa/yDhRbbYSGu5nQiCwfZNW/GME967sDdQORFM9dhOieWJXkpAeGxgT7ip6hJ7J3
 HA3fj1QuanIBDbptQpaCmfs6ltAyIex96zM+taopTyZ+2cHyjSSBTtV
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GVX0EPF0005F693.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::13c) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edaa4a1-998d-431e-56be-08dec7d583d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zBgW47YBTrH/VHw4J9c/bBTfcbYwTsJqADfptSMiEUTWDq5/MTWqNBt3yEU8twec5ycA9QGuLHqixVB0l9+zAIyq0I8Nw+b53hdiUEwVj7j9r9fLM2l0wXzlD66CYm5Eh7Wk0kgORpw0plNdB/3LTD7b4liZ2jGy++8/B2TatMMTjhP1iAJaQEmlLlpSdZNIV7IpxIwKn28aLrRDjioj+nYywyjLAe0yJhTK7yP+6Gk61pwVftcJaizaxbJUZz/UapYXu1LAXqtLXJDdXqWlOn0XxpgbpjZ1/dSjiNdPQqtPa6QyZd4KH+1mzHTQu1QLsvHWO0vucGZ8ThOUqWtnDpl6iE18ptQGPsdHkceVDVU/cgkg5X4eANHIxkO3Vny9a2njRCyIfGmXFYAmM1uq7LxKvpSMF2fZyYv13B5NKjbHs5A8FbXfDf9XDQ8jolTJm/Itu/1H8KYu/2n77ZNi/6nFli46q+BC1Ga7uQDIXNFTEFJvtDZoLC+8ynCj3s/gGUJ1mqA0+2ch4nH5HXnBWaOG1kdiQgs5jHD62Olm9FvGBsCY5EQfW6xrgXuW6xcoYaxeX3Q0g4P3m89zQxufE7/9ixgYY9VoxjWjNluxDq9KlsdlI0X6Tmrh0d1ciQAFSNhiO+Rz4fkUodrpX6/gLZUPX1NLRJuM9hudCBDMdRCoUOZMYG0WB/Hy9SZ8lqTfjQ3phqekn6qI2uxTtPF1TS1NdWFglJrWUsea7gL9LHB6tQY45VVOeksC88s9s1i5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZoakhsR1NhQzk1RnZlQnlHeHRHUzgycmI2Ymp4QlZxNGlqOHRLTFNDNk1a?=
 =?utf-8?B?Rm5WODZpbEllMTE3VkVhNE1VV1ludkFtZWE4OUE2enN5TDhhbDAwMW1ZUzFU?=
 =?utf-8?B?QzFLeTZxcmFISkxNZi9JR2N2bXNnT0kxQUVIaGh6MkRKanNsZENNWTFabjBO?=
 =?utf-8?B?SlFRb1RkYzc1WXl6YVdZcCtIOEpZZllhaXFEbFRTcUVkMGs0eXNIZTNDZTFJ?=
 =?utf-8?B?b3FDZld3YnJhRGNudy9aVHdOWXFNRUt3Z3JWd0pHS2tVU1diMDlwckFLNTJj?=
 =?utf-8?B?YVV3bnBHblBPQjViQ05GU2hIWDI5dTJjQ2xuNDFCZ0RpYm5Jb3lGeEpvcmVu?=
 =?utf-8?B?eFo1VjZUYnVBaktUcDQ5NG96dWVKYmZHS1h5VzRkRE9RVlVTcy9jTGlJZzI1?=
 =?utf-8?B?WkdabXJnRUo1LzlobjdMRmtPLzVpQW1CRVVDZGlNaTBtYXEyWUl2aWNYLzhh?=
 =?utf-8?B?TFIvSDJoSEludmZYOEErU3hqQUZQLzBvQWo2SEdxNlhFYmhNcUxzbndaYTY3?=
 =?utf-8?B?SXZsL1UreVNLbkVaSTJFaFlaMXFoblZLMklweDlPLzMxaE5lZ2lvVENhTVhi?=
 =?utf-8?B?YXZEcHFPVTdGNUR5MlAxcHZkTHJvMis3VVhHSTZvQ2RlQmQ5dE8zRzMvNXhW?=
 =?utf-8?B?Q3BqVmlLa1MwNjdWUFo4d1RrYmtlUEtUbmIzWmJtVlBqR1R3MnBDeEdkRG84?=
 =?utf-8?B?eGNOcUJSZlNPd0lPLzJtZldBbi9DUTZrZlc3YnZCNHpkTVVzOW10cEFzY29u?=
 =?utf-8?B?d3pQWTFKcDA1Z1l2MVpyQWFPVzFVZGJHZDhLaGs5UnNaSEw3N0xSa3ZkQzRl?=
 =?utf-8?B?cjdHY3JqUGh5RXNpRmZlU2FZZlM5cGNYWWlramNRd0ZPZWdqK2Q5d0xxVlNM?=
 =?utf-8?B?Y3Z6SmVCdFQ0bjVweUtJdUV6U0o4SkJQOWFnNFdaNkVQZHlOTlVwaDlSVEZ0?=
 =?utf-8?B?T245ZFdETXh5REdvclRPVklxMXpSRTZ4cURpdkVDekg0eG5mUFBtS0t3aFRF?=
 =?utf-8?B?YmhaelBqMmtHQnpZSENmTnlmNU45cjhhY0V2ZFBxRE9VWjVsYkRrZCtRZzFm?=
 =?utf-8?B?cDZqUDQ4L0Zmc1FYRm83RE5zSmRxdWZqVDBnNFJtMWhjd3VYS2RlbzQ0eVRN?=
 =?utf-8?B?ZFNFa1F3OVRWVGRRMHZlNnkvcHFMajJGcDRXcGdCckd3Qkw4aktKZ2J2Qi9j?=
 =?utf-8?B?M2ZJcU8yRVZIZkVtWE95KzFDc2M1RStXQVpzYUp2cmZnUHJtUnh3b3JxVGQ2?=
 =?utf-8?B?RTlUU0NFcTBEaC9jVFE1YWlMK1lWQlo5QjBQRGpzZDNCVitVOTV4d0VWTkpJ?=
 =?utf-8?B?V0drOEViYlN5bkdNVlZxQjY2RWEzRkNZNklNMVYvUHY1L1JPa3hBcStDcUw0?=
 =?utf-8?B?aFp5U2tKOWZ5c1lDMnpNbmZteC9KQmt2M0tiR0N3YmtSWSswN3VkcGExU1Rz?=
 =?utf-8?B?YytNMFNpN0pEb2c0ZjU1dVNiRXd3V3FsM1NNQjBZSGs3YnBQMW9qZ3RsMERG?=
 =?utf-8?B?b0Nkdk11Y0Ryb0R4ZlR1blZFVm9MclFROFBsUi9GQjF4Y0ZNVyt6bnlWZWdE?=
 =?utf-8?B?dGYya281dFRqZkFVQmlRSjZuQjd3YTlldUlRcVRSOXJzV3gwQStxWVpvaHJO?=
 =?utf-8?B?WXFDMExKeVVwVzlCaVJiUW9EZFI0WlNaUWdiK2N6T25WbUhHSzJxeHRzU3gr?=
 =?utf-8?B?d1o2UG5UaXgycWhPSmJjU05TcENoZG5MS3ZXcUF0akhoeDM1NWU4T2lkb0tQ?=
 =?utf-8?B?SGVEY3dNY25KaktnYXI5c1lNSG9ZQmxUMDdUM2FnY052NUFKK3Myak5rQnEw?=
 =?utf-8?B?RmFCWVJvVE5jd0kwUFNJM1M3WEJtN0x4YXBnY1FYYzYzS3ZuV0FqZER5R1BM?=
 =?utf-8?B?dk1iTkxjL1VYQ2Y3emloTm12bHJPQ0h2blpZUmV4VXZMYlRZS2dLZXJXQXNC?=
 =?utf-8?B?ZmYxL0RhMmI5UzFFQXJzQXpoTUtCRTk4aGhGNjJxajA1dzlOUkFBUTBSSVdn?=
 =?utf-8?B?ZDI2SzIwLzhIM2dPNUZEUlI1M0czVG1ad3Q3ZEdjWHVFWkU0VHQ0dHV0OWgz?=
 =?utf-8?B?Y2E2ODhReXlaZGZ2NmRBdXN4MnF4cW84WVhCMXNyUXlRVFJrc0s4eTlCNHpi?=
 =?utf-8?B?UEpFTnA1VndCVldId3JKOU1GYUVwUlB1TnRHYS9WNXZVWWhKaVpjdzBnVFQv?=
 =?utf-8?B?ZlhPN0w0TFN5K0RVVGduUCsycTkrdmVnZFFTRWlTMzhOK0R6eit0YkhHc2pj?=
 =?utf-8?B?UWl5VkNoWHVKaFdSY2lEWldVY2w5YTVhME5adk1pT3U0K2dJZG1rWTFUWlUw?=
 =?utf-8?B?N0E1VStRallzRURLdlhXeTFmUXJGdWZoUDJHaTdhV3dFVFhNb2R5dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edaa4a1-998d-431e-56be-08dec7d583d7
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:38.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYfBvj1kByuauOrs+AMF64jcie+QbFlmVkpL6lry9spvj3OojjeyQ5cOnOVrFA8fyJZwgNQNDVmnWibzbEAdNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13705-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71F416738C9

Introduce kcov_dataflow, a per-task dataflow tracking mechanism for function
arguments/return values at instrumented function boundaries.

Motivation
==========

First, Coverage-guided kernel fuzzers use KCOV edge coverage as their
sole feedback signal. This cannot distinguish two executions of the same
function with different argument values. Fuzzers plateau on stateful
subsystems where security-critical behavior depends on runtime values
rather than control-flow topology.

Second, Existing tracing tools address parts of this challenge:

 1. Per-Task Wide-Scale Tracing Contexts (ftrace / kprobes / eBPF)

 Break point instruction and redirection: Hooks physically patch global kernel
 text. The kernel cannot selectively hook functions per task; every CPU core
 triggers the hook, deferring PID filtering to post-trigger logic.

 2. Rust for Linux Tracing Status

 rustc correctly emits -mfentry code stubs via its LLVM backend, enabling
 native integration with ftrace, function_graph, and eBPF trampolines
 (fentry/fexit). Metadata & Signature Analysis: funcgraph-args parses Rust
 via pahole BTF generation. However, idiomatic types like generics or slices
 are difficult to represent cleanly compared to standard repr(C) structs.

 3. Inline Function Tracing Limitations

 Tracing Visibility: Inlined code cannot be targeted via tracefs. Its runtime
 footprint is absorbed by the caller. Debugging requires explicit noinline (C)
 or #[inline(never)] (Rust) markers.

Approach
========

An LLVM SanitizerCoverage [1] pass inserts callbacks at function entry/exit
that record argument values into a per-task mmap'd ring buffer. Kernel
backend reads struct fields via copy_from_kernel_nofault(). When not enabled
for a task, the cost is a single boolean check.

The system captures:
- Function argument values at entry (with automatic struct field expansion)
- Return values at exit
- Per-task isolation (no interference between processes)
- Both C and Rust kernel modules
- Instument even inline(default n)

For C based kernel module example, eight_args_c:

  vfs_write(0x0)
  0x0 = full_proxy_write()
  full_proxy_write(0x0, 0x1, 0x0)
  0x8200080 = __debugfs_file_get()
  __debugfs_file_get(0x0)
  0x0 = __debugfs_file_get()
  0x0 = trigger_write [eight_args_c]()
  trigger_write [eight_args_c](0x0, 0x1, 0x0)
    df_func2 [eight_args_c](0x11, 0x22)
    0x33 = df_func2 [eight_args_c]()
    df_func3 [eight_args_c](0x11, 0x22, 0x33)
    0x66 = df_func3 [eight_args_c]()
    df_func4 [eight_args_c](0x11, 0x22, 0x33, 0x44)
    0xaa = df_func4 [eight_args_c]()
    df_func5 [eight_args_c](0x11, 0x22, 0x33, 0x44, 0x55)
    0xff = df_func5 [eight_args_c]()
    df_func6 [eight_args_c](0x11, 0x22, 0x33, 0x44, 0x55, 0x66)
    0x165 = df_func6 [eight_args_c]()
    df_func7 [eight_args_c](0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77)
    0x1dc = df_func7 [eight_args_c]()
    df_func8 [eight_args_c](0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88)
    0x264 = df_func8 [eight_args_c]()
    df_func_struct [eight_args_c](0xaaaa)
    0x16665 = df_func_struct [eight_args_c]()
  0x1 = trigger_write [eight_args_c]()
  0x1 = full_proxy_write()
  0x1 = vfs_write()
  0x1 = ksys_write()
  0x1 = __x64_sys_write()
  0x0 = fpregs_assert_state_consistent()
  0xba5748 = __x64_sys_close()
  file_close_fd(0x4)
  0x0 = file_close_fd()

For corresponding rust kernel example, eight_args_rust:

  ksys_write(0x0, 0x1)
    fdget_pos(0x4)
    0xffff891481d2bc00 = fdget_pos()
  0x0 = vfs_write()
  vfs_write(0x0, 0x1, 0x0)
  0x0 = _RNvCs3p16QzTwthP_15eight_args_rust13write_handler [eight_args_rust]()
  _RNvCs3p16QzTwthP_15eight_args_rust13write_handler [eight_args_rust](0x0, 0x1, 0x0)
    rdf_func2 [eight_args_rust](0x11, 0x22)
    0x33 = rdf_func2 [eight_args_rust]()
    rdf_func3 [eight_args_rust](0x11, 0x22, 0x33)
    0x66 = rdf_func3 [eight_args_rust]()
    rdf_func4 [eight_args_rust](0x11, 0x22, 0x33, 0x44)
    0xaa = rdf_func4 [eight_args_rust]()
    rdf_func5 [eight_args_rust](0x11, 0x22, 0x33, 0x44, 0x55)
    0xff = rdf_func5 [eight_args_rust]()
    rdf_func6 [eight_args_rust](0x11, 0x22, 0x33, 0x44, 0x55, 0x66)
    0x165 = rdf_func6 [eight_args_rust]()
    rdf_func7 [eight_args_rust](0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77)
    0x1dc = rdf_func7 [eight_args_rust]()
    rdf_func8 [eight_args_rust](0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88)
    0x264 = rdf_func8 [eight_args_rust]()
    rdf_func_struct [eight_args_rust](0xaaaa)
    0x16665 = rdf_func_struct [eight_args_rust]()
  0x1 = _RNvCs3p16QzTwthP_15eight_args_rust13write_handler [eight_args_rust]()
  0x1 = vfs_write()
  0x1 = ksys_write()
  0x1 = __x64_sys_write()
  0x0 = fpregs_assert_state_consistent()
  0xba5748 = __x64_sys_close()
  file_close_fd(0x4)
  0x0 = file_close_fd()
  0x0 = filp_flush()

Design
======

- Independent from existing /sys/kernel/debug/kcov
- Separate device: /sys/kernel/debug/kcov_dataflow
- Separate ioctl namespace ('d'), separate per-task buffer
- Lock-free write path: READ_ONCE/WRITE_ONCE (Tested on x86_64/arm64)
- Safe pointer reads: copy_from_kernel_nofault()
- in_task() guard rejects interrupt/NMI context
- Per-module opt-in: KCOV_DATAFLOW_file.o := y
- Optional global: CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
- Compiler flags: -fsanitize-coverage=trace-args,trace-ret
  (Kconfig uses cc-option to verify compiler support)

CI results:

  https://github.com/yskzalloc/kcov-dataflow/actions

Performance
===========

Per-module instrumentation (recording active):
  +8.3% on instrumented paths, ~27ns per callback

Global instrumentation (INSTRUMENT_ALL, recording disabled):
  .text: +9.5%, .data: +44%, boot: +71%, syscall latency: +133%

Prerequisites
=============

Requires custom LLVM/Clang with trace-args/trace-ret passes:

  git clone --recursive --depth 1 --shallow-submodules \
    --jobs $(nproc) https://github.com/yskzalloc/kcov-dataflow.git
  cd kcov-dataflow

  cd llvm-project
  cmake -S llvm -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DLLVM_ENABLE_LLD=ON \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64"
  ninja -C build
  cd ..

Build and boot kernel (using virtme-ng):

  export PATH=$PWD/llvm-project/build/bin:$PATH
  export RUSTC=$PWD/rust/build/x86_64-unknown-linux-gnu/stage1/bin/rustc
  export RUST_LIB_SRC=$PWD/rust/library
  cd linux
  vng --build \
    --configitem CONFIG_KCOV=y \
    --configitem CONFIG_KCOV_DATAFLOW_ARGS=y \
    --configitem CONFIG_KCOV_DATAFLOW_RET=y \
    --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y \
    --configitem CONFIG_DEBUG_INFO=y \
    --configitem CONFIG_RUST=y \ # For rust kernel tracking
    LLVM=1 CC=clang RUSTC=$RUSTC RUST_LIB_SRC=$RUST_LIB_SRC

Or without virtme-ng:

  cd linux
  make LLVM=1 CC=clang defconfig
  scripts/config --enable KCOV \
                 --enable KCOV_DATAFLOW_ARGS \
                 --enable KCOV_DATAFLOW_RET \
                 --enable KCOV_DATAFLOW_INSTRUMENT_ALL \
                 --enable DEBUG_INFO
  make LLVM=1 CC=clang olddefconfig
  make LLVM=1 CC=clang -j$(nproc)

For Rust module support, build rustc against the custom LLVM:

  https://github.com/yskzalloc/rust

Testing
=======

Tested on linux-next 7.1.0-rc6 (next-20260608) with custom clang/LLVM 23
and rustc 1.98-nightly. Verified on both x86_64 and arm64:

- user_ioctl: 9/9 tests pass (ioctl interface correctness: init, mmap,
  enable/disable, double-enable rejection, buffer capture verification)
- eight_args_c: nested call tree with df_func2..8 + struct (65 context records)
- eight_args_rust: nested call tree with rdf_func2..8 + struct (65 context records)
- rust_ffi_contract: detects FFI contract violation where callee returns
  success (0) but leaves buffer=NULL - captured without crash or KASAN
- binderfs: exercises binder driver via binderfs ioctls (BINDER_VERSION,
  BINDER_SET_MAX_THREADS) with kcov_dataflow recording active, verifies
  argument records captured at binder ioctl boundaries

Links
=====

[1] LLVM RFC: https://discourse.llvm.org/t/rfc-sanitizercoverage-add-fsanitize-coverage-trace-args-trace-ret/91026
[2] LLVM PR: https://github.com/llvm/llvm-project/pull/201410
[3] Repository: https://github.com/yskzalloc/kcov-dataflow
[4] Paper: https://arxiv.org/pdf/2606.00455

---
Change log:

Changes since v1 (https://lore.kernel.org/all/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech/):
- Separate from /sys/kernel/debug/kcov (own device, own ioctl namespace)
- Rename internal symbols to avoid collision with existing kcov
- Add CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for whole-kernel capture
- Fix INIT_TRACK race, fork cleanup, task exit cleanup
- Add recursion guard barriers
- Reject concurrent enable on multiple fds
- Move from tools to kselftest adding:
  user_ioctl, eight_args_c, eight_args_rust, rust_ffi_contract, binderfs_test
- Separate patch regarding kcov-dataflow Documentation

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Ben Segall <bsegall@google.com>
To: Mel Gorman <mgorman@suse.de>
To: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
To: Alexander Potapenko <glider@google.com>
To: Dmitry Vyukov <dvyukov@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
To: David Hildenbrand <david@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
To: Michal Hocko <mhocko@suse.com>
To: Shuah Khan <shuah@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: linux-mm@kvack.org
Cc: linux-kselftest@vger.kernel.org
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Yunseong Kim (14):
      kcov: add per-task dataflow tracking for function arguments/return values
      kcov: fix INIT_TRACK race in kcov_dataflow
      kcov: add barriers to recursion guard in kcov_df_write
      kcov: reject enable on multiple dataflow fds simultaneously
      kcov: clear dataflow fields on fork
      kcov: clean up dataflow state on task exit
      kcov: exclude kcov_dataflow.o from sanitizer instrumentation
      selftests/kcov_dataflow: add trigger-view.py
      selftests/kcov_dataflow: add ioctl interface selftest
      selftests/kcov_dataflow: add eight_args_c test module
      selftests/kcov_dataflow: add eight_args_rust test module
      selftests/kcov_dataflow: add rust_ffi_contract test module
      selftests/kcov_dataflow: add binderfs ioctl capture test
      Documentation: add kcov-dataflow.rst

 Documentation/dev-tools/index.rst                  |   1 +
 Documentation/dev-tools/kcov-dataflow.rst          | 321 ++++++++++++++++++
 include/linux/kcov.h                               |   8 +
 include/linux/sched.h                              |  10 +
 kernel/Makefile                                    |   9 +
 kernel/exit.c                                      |   1 +
 kernel/fork.c                                      |   1 +
 kernel/kcov.c                                      |   2 +
 kernel/kcov_dataflow.c                             | 356 +++++++++++++++++++
 lib/Kconfig.debug                                  |  43 +++
 rust/kernel/str.rs                                 |   2 +-
 scripts/Makefile.kcov                              |  12 +
 scripts/Makefile.lib                               |   9 +
 tools/testing/selftests/kcov_dataflow/.gitignore   |   9 +
 tools/testing/selftests/kcov_dataflow/Makefile     |   4 +
 tools/testing/selftests/kcov_dataflow/README.rst   |  58 ++++
 .../selftests/kcov_dataflow/binderfs/Makefile      |   4 +
 .../kcov_dataflow/binderfs/binderfs_test.c         | 177 ++++++++++
 .../selftests/kcov_dataflow/eight_args_c/Makefile  |   3 +
 .../kcov_dataflow/eight_args_c/eight_args_c.c      |  95 ++++++
 .../kcov_dataflow/eight_args_rust/Makefile         |   3 +
 .../eight_args_rust/eight_args_rust.rs             | 143 ++++++++
 .../selftests/kcov_dataflow/run_binderfs.sh        |  13 +
 .../selftests/kcov_dataflow/run_eight_args_c.sh    |  35 ++
 .../selftests/kcov_dataflow/run_eight_args_rust.sh |  35 ++
 .../kcov_dataflow/run_rust_ffi_contract.sh         |  35 ++
 .../kcov_dataflow/rust_ffi_contract/Makefile       |   3 +
 .../rust_ffi_contract/rust_ffi_contract.c          | 111 ++++++
 .../selftests/kcov_dataflow/trigger-view.py        | 377 +++++++++++++++++++++
 .../kcov_dataflow/user_ioctl/user_ioctl.c          | 156 +++++++++
 30 files changed, 2035 insertions(+), 1 deletion(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260611-b4-kcov-dataflow-v2-3ccff828eb31

Best regards,
--  
Yunseong Kim <yunseong.kim@est.tech>


