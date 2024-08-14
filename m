Return-Path: <linux-kbuild+bounces-2973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4059515A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 09:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4B15B2C0DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 07:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A70A13C9C4;
	Wed, 14 Aug 2024 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ZOkgQUzb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892234430;
	Wed, 14 Aug 2024 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723619979; cv=fail; b=fiS4T9v8fOfHvoxLSugztxo4kmVrFAC6rTVTMsuUSzwMQNXX1JnqALYZtS3PxhhK+PgVKfrO8ytDZ+6ng92jK7Hvt2KiUu/8a6QKzC8wcLyM1DocMnHYJhnK7YbYWKbr9EVbtQVkavcQvGKnUIi6KoRBVUxsSU/vC2FM12A8/u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723619979; c=relaxed/simple;
	bh=u231pKj/SjTK45djiW1ShtlYtaockuSEU9gB7CeAQi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TPPVybZCkDSagrdMyc58fScg+0pVmPnLjvfuV88kMn10R9h69yAvrWPk+u4bi6sh75Wbd9bqbjOyqeC0Sw4ZlQiq4JwGy2W19GAYtBMErNQVJwi22r5nf2wyEMqqBZBsdRc5eFIyRSTjLrVJfcrRDqE2n1Klm2uFNnqt76e3mGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=ZOkgQUzb; arc=fail smtp.client-ip=40.107.21.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVqN2+g2Id380wzbhnGSdojLSJ2XcBQubpd5vCfviEwE1t7wlgwbykV7XMQhctDTYhNpkfUvNAPdh5fdeKe8vtithA4kGj6MG6CKeRh5BZzSx5aMhBNJPOWvaTPJnZzbgwWqmZA8SD7WNyXjurItdcLggFUhiMBXmHUViQSmH8/K+c6Gb8QnOGLVgAaerN89zUdRs+E9uGdtw2b8hecBYdfKhHxrk54abXnPiKzCWGn8LYhoub+wKB6WWAd8plBAzrbDz4ShUn4pMVWrn/TydSfEbjFyfeJKs+1XjgEbi1BU4txKQDq89+hydG/WE0IqqCeGah/P/azYTCy5Nq2iLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i157vzuqEX2FEqTgRZjdFv1qShAcbImC85G1FwPcumY=;
 b=szsNjCHT8ufFVz+FAdTy0G6AH1oMXig1HIakN698gYMHsBaOtLbStTTfSGyHEBwIrj/JWS8xvfd5hyK9Cyt0tjlnPr8ct3iu3so59ePCU5C2uZsIdX1KLeHM8xROeVUhbzW7Io3Z8UP2BMmb0vfaDwO6vAaQ+TMFTdCK1c5p83t/LYo33UWyNp7Rh/L5OZiioadprM93QbSAP7EKlWb0gKxaHcH6oojEsGuwR0Oh6NdVbb2ssH3tE6RKp+pdpM9JtzfrP+Kv1boCj7m1E+iMTfetxi3Qqf309mIMhPbMildhkSMe9Mh4Zf4JrPy+Qojq858/3yYmk5dV6g2e/ILJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i157vzuqEX2FEqTgRZjdFv1qShAcbImC85G1FwPcumY=;
 b=ZOkgQUzbwfaYzxQ6VTPTXULfSuw7hO94DtrclEk3PLfZ8FiYoqAOLPmT4x4M25UfA4+2k+BgvzWaJwN/zTo+bFIsFsSR4qHx5wdHeTtcUu2y7UjgymT3b6TfCN9hQsFts1bA9m5Le9mq6ti5c+aG3MN+HthAPJfspH19uwjQJ5HxUtL1GORNrGcbO/ChXHE0HS1MLIbhTjtiUUxqpbyfMtRGdMMA1z0vzP/Jn965+ecZB9OU1j5x0LnRurFUJE7dBvkg46RUiaDhPmWf+bBcvOrz30TlsffcHZanoW2wiG3gadxJhh3Kgyt/RwiAqvtwj0wt8VfrziKEdhT8EceC5w==
Received: from DUZPR01CA0306.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::16) by DU0PR10MB6155.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3e7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 07:19:31 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::e1) by DUZPR01CA0306.outlook.office365.com
 (2603:10a6:10:4b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Wed, 14 Aug 2024 07:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 07:19:31 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 14 Aug
 2024 09:19:23 +0200
Received: from [10.34.219.93] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 09:19:23 +0200
Message-ID: <29eacb0f-fd78-4024-aac5-1606fe002dc6@de.bosch.com>
Date: Wed, 14 Aug 2024 09:19:17 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: rust: split up helpers.c
To: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
	<linux-kbuild@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>,
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
References: <20240507210818.672517-1-ojeda@kernel.org>
 <ZjqmfIhRz99BqXtD@boqun-archlinux>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <ZjqmfIhRz99BqXtD@boqun-archlinux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DU0PR10MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: deb2d159-d0eb-4aea-f2af-08dcbc3170e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2o5ZGl3QVgxNExYdHI2WnNDZENEeDR0QVYwNXd2WDB0cy9VRGQ4T3ExQWxu?=
 =?utf-8?B?YW94NUt4aG5UdW14MGQ5VGZVMjhjR1BBd0dCR0tNcURkOFFHc0d5VGVZeGxO?=
 =?utf-8?B?ZTlGNzFEdnFXTGRwa0E4Q2czS3E4bG43Zm1FRnVrb3dDclk4cURYNEswd09x?=
 =?utf-8?B?MXlmRXBYR2N5eDdWTDBhTFdiYnRjOTFQYzZQQXhWWnNFV1I2a1JCdGdreC90?=
 =?utf-8?B?L3l2NTVsdzdMSVpLeDVvK1grZmNmSFJmdUlPLzhkUU42anhzeE45ZG5hQnls?=
 =?utf-8?B?ek8xd01xTlFrTUQ1V1dKUnovWHNHQ0tuWEhPV05NcE52TFViSHlJdnhDaXB3?=
 =?utf-8?B?UWVFWkV0WmQ4bnhOaUlweXA2cWxEdGgvc1lFZEtPU2g5LzB0aTRwR1JMRFI2?=
 =?utf-8?B?cXBlcko5K2VITUZYNkx2L2ZHQ2V6N0FRUzVZRXJqTWJESnNUVUVMSUZldFJN?=
 =?utf-8?B?dEx0ZnVrVitvVy80SEtGWGlrM2dQQTE0K2NYRXhQZmYxS3NxUjRPcGlNd01C?=
 =?utf-8?B?LzBvanVjS0pyZ0JsaEVSd0RmMFhhY084NDZwQytjc0thOHNXSTk5d2xiUytD?=
 =?utf-8?B?NmpvSG91SFpUanpZNnVqWGZSY0MrUDNnSnR1eVZ5dnNweG5nODA1dnYzaTNz?=
 =?utf-8?B?VGFKVWdINkNadUhQVmwzaEJoZDlIZk50QmkrNDdmU3g3RWUyNkFqNnBHSWt6?=
 =?utf-8?B?RThMeUlRcGtqRjA0SmdhOHhzU0hoUXRLd0lWeDlFZlZBVHZVRks2Y2Z2emNp?=
 =?utf-8?B?Qlh0cWVlUmd0SWQyWmIvYlc1eDR2eHZQRG9kQ1IzWjd2V29vdHJmck12QW9y?=
 =?utf-8?B?bGlhY3JLd0ZwL0tPUDlJL1k0SkxUSTU0OUxEMzN3WGRBM0FNUVpPN1NSZkFm?=
 =?utf-8?B?YW1oQ2o5RXM5YmN4amlXbmk5TDNjVTc1QVNpVmFyeVlKNkRuK1AxT2kwNjNE?=
 =?utf-8?B?UWhpNDZneko1bHJ6VUthUXFDUUZrOVhkYW9IL2lGWUNXeGg2MEYzbkgyT0pL?=
 =?utf-8?B?enlFNUhlRmpJUlZ4aytsclhOL25wbXB3SlFvVkluM1l6QnJZUGRoUGR0bmVO?=
 =?utf-8?B?ek1ZamxRRVdtK3dZUmhNNzhPbEhvaFd0dWVXVkVxL0l4VlB1QUM1MUQvVFJX?=
 =?utf-8?B?Z2Q4Y2wwWEFXLzJ2MndNVEw5MFJqUjMrQ2ZXUy90VE9YYW1RQUNOQ3RZUEc3?=
 =?utf-8?B?bUE1NGh1RFZmK1plYUdKVFZTbGlTL0RLbXRvTFQwajh6MGZRZ2Y3YnhiOWVW?=
 =?utf-8?B?RkVWaDlENDFtMmN5U09PRnd5NHk3NkFESjhWOXo3SzZVYVBsS1R2cEEwV0U0?=
 =?utf-8?B?VjF1NXdmNUp2WDNEek9MZDdNRDU5emJHckUxMGIrbDFwaFZ6a2dvZW5zU1I4?=
 =?utf-8?B?V3lYMVdlQ2Y1VjFnUmVxemFaeWkrZEFtUm5jcXB0QzVPWXVxeGRxNFZHZDQy?=
 =?utf-8?B?RnI3eWJibEVpbXFIRFRPRnhqREt5OTVNUzJFS1hBVDdBSXFFZUNIZll6bWJV?=
 =?utf-8?B?WGJrRlpVMU5IZDZHWkpjVFZRQVNmc1YvZGxrM2taajZoV1k0UFh1K2tZdmMv?=
 =?utf-8?B?elFscHZ5VlM0dU1xUDRpUWYxMzFQTFhsY3VUOHhJeE9wVDl3S0lDNDNPM2U4?=
 =?utf-8?B?bjd5cm5WWExwTUlmLzlrbjdiNmxJQjNBYjVxWUxRNW5sRzZYK0dyWkNPczB2?=
 =?utf-8?B?ZjVOQ0ZLakozQzYya1hBcHFHalVIcHo4eURzTTg5ZDBHeXBiNSsvVWJvajJQ?=
 =?utf-8?B?WDRYTUl5ZHBPM1BwWjk5bCtKVUo3SjNCSzdtTWdiMGhId1ltVGhCNlZFYVM0?=
 =?utf-8?B?WDRPQ1NBd2QrUkwyUHlySWhSaUNlZ05TVG1vaTZFTFVocjJJM3g2UzQxQUg1?=
 =?utf-8?Q?ASsiOQ+cqO0Zv?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 07:19:31.2014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deb2d159-d0eb-4aea-f2af-08dcbc3170e2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6155

On 08.05.2024 00:09, Boqun Feng wrote:
> On Tue, May 07, 2024 at 11:08:18PM +0200, Miguel Ojeda wrote:
>> From: Andreas Hindborg <a.hindborg@samsung.com>
>>
>> When rebasing patch sets on top of upstream Linux, merge conflicts in
>> helpers.c are common and time consuming [1]. Thus, split the file so
>> that each kernel component can live in a separate file.
>>
>> Each helper file is listed explicitly and thus conflicts in the file
>> list are still likely. However, they should be simpler to resolve than
>> the conflicts usually seen in helpers.c.
>>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> Reviewed-by: Sergio González Collado <sergio.collado@gmail.com>
>> Tested-by: Sergio González Collado <sergio.collado@gmail.com>
>> Link: https://lore.kernel.org/r/20240416074607.1395481-1-nmi@metaspace.dk
>> [ Reworded message slightly and fixed nits in it. Applied commit
>>    84373132b831 ("rust: helpers: Fix grammar in comment") here. Added
>>    SPDX license identifier in new Makefile. Applied Markdown formatting.
>>    Added `.gitignore`. Included `helpers_combined.c` in the `clean`
>>    target. - Miguel ]
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> This overall looks good to me, one thing below I think should be
> changed..
> 
>> ---
>> This is a patch from Andreas that I was going to apply to `rust-next`
>> with the tweaks mentioned above, but I noticed Kbuild was not Cc'd, so
>> we decided to send this as a "v2" and thus give a chance to Kbuild to
>> take a look for next cycle.
>>
>> If something in the diff to v1 is wrong, it is my fault, not Andreas' :)
>>
> 
> [...]
> 
>> diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
>> new file mode 100644
>> index 000000000000..f3106f248485
>> --- /dev/null
>> +++ b/rust/helpers/build_bug.c
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/export.h>
>> +#include <linux/errname.h>
>> +
>> +const char *rust_helper_errname(int err)
>> +{
>> +	return errname(err);
>> +}
>> +EXPORT_SYMBOL_GPL(rust_helper_errname);
> 
> .. this build_bug.c should be avoided, but this function should go into
> err.c.

It looks to me that this is the only/last open comment? As it seems 
there is some consensus that this change makes sense it would be nice to 
get anything like this :) I just stumbled about a local helpers rebase 
conflict, again ...

Best regards

Dirk



