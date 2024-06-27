Return-Path: <linux-kbuild+bounces-2266-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE27B919D08
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 03:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A90D1F240F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 01:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D28211C;
	Thu, 27 Jun 2024 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W9Sv0tD+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFB6AB9;
	Thu, 27 Jun 2024 01:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719452832; cv=fail; b=IfuRIFvbTjoW5yb6F8TCgMqMCjk41g7ZexsLCnkLdWMJbeUbgqZZALfPgWsW98br7AP8dS35UtfXXAIssGjChTeYtjTzwVVnrG9BOmfByy+xkrBjywMuWhUWZOWmsKUIjT6eONkZU6pKfhLavFdu9Pj7EIapbsl2ZpKqloPKHSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719452832; c=relaxed/simple;
	bh=92HY/ZY/8nIeuBfj65gYv91NVgbvHe2sWv9XVeFuHFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OzZ1Ef6p5CqAHQFC7BM6J8Cw3ZUU8pXVktMXpCN4NJugVUHpYZ116fZ8FZb272BFuCNcICxtHZ8/LS9XaN7THnJJ90vA/CqYMrsuUN+n5d1g1W1b1ajquNaF39KJ6zWLhzv29fLx3qdX6UV/pf3koVlwragsXVOFQesugX9WMhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W9Sv0tD+; arc=fail smtp.client-ip=40.107.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPYrasSIqeeuo9Cw7tgSIlIBP2ptWHQt3SqbYcnO55EytPaay9jX0LSQJKHvxxsFWRhCZS6z4NoQ8BvD+I+3vK/z/C/6gzBz3DdYX2GxrjBOaJJT073QD11MuUqUnViHu98ziHrqdqIX8WAVXCuLI+mFL6e+/P27mT7eqb5zO8Z2cJmWWO2gi67I3MfSvBdvKBcKThAD/Z0AOOT6uoIVTODFG/+rZtw5Q6D9uwnV8Sld5fMalIotH3BsFy8/pNPPdtbKe71LBMGkuGwLn+FRFZ8IV3aTW2odCsHe9tzaOTBqZJlAqKxqdxMA/7FWDNnfuCoH5ldPIURwg6bfsiS0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4andBKcsiIjy6wuL5sn+ph4WAO0ZLcPFz7ce5Ew/ZA=;
 b=HkCQgVfdhnECQGxpCr2OgdK5wHGUjlwxABqOX/agytrWs/OZys2BOZ1M3Y5hA/Y8/yE6X1qPuDsdOwGoyeRh/QDBI5nlt28MgzmmIOYPxp/3XUGWLYGpqog0sPlDDpk+aiNiWyp2tKrMqd+ckUTwh1KStfRokK0sHMhl63rkRfZtjn9D9/GHYp2cC756+AX42hwEZU7yWDHmV8UHkjMrP1ht0+aSKrvfpDY8IHu1Nm3K0f0rKn4AsQiSV9d1FGMVPsAWxvXv0yT7uq802NWEJsZbrcgDHYSfzqXkfrCwuImK34PkV72YHomDolXgM6M6OMepDKf9HnVIjEgrVDWPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4andBKcsiIjy6wuL5sn+ph4WAO0ZLcPFz7ce5Ew/ZA=;
 b=W9Sv0tD+NYDkpNFgw5oQgk5uaPIGzZbILNeV57jDqBzNGlLy2yEPcvXLxXvQfTHGKHiAMgXqN6YLESmd9CHaVunqqhZilhYktGsh3VAkkazCDVrWN5dxPqzfySN6sZLFAzTpqPmzz+P/qpT1yhNMLokQSe04Hn63sXTts5Wm4HooQemiutkY7ANQf0SinblQRTdZaDGEYPR8m1WJSswJu3pI/UwvksbBIbfrJhCzLmYgoV4ekUhoyafTo5LyHb219at2t6iRrH4JEg+vmOp2Xv2RDX+SiOnodZ7V0O4ewn5WuS3vLODhnuMupB1OTULQvSF2PCAf++u2veors22I/Q==
Received: from PH8PR22CA0012.namprd22.prod.outlook.com (2603:10b6:510:2d1::8)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 01:47:06 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::e9) by PH8PR22CA0012.outlook.office365.com
 (2603:10b6:510:2d1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 01:47:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 01:47:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Jun
 2024 18:46:27 -0700
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Jun
 2024 18:46:26 -0700
Message-ID: <b3913add-14bc-40a5-8e8a-e2f3ff461b48@nvidia.com>
Date: Wed, 26 Jun 2024 18:46:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Makefile: improve comment documentation for the
 rust-analyzer target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl
	<aliceryhl@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
	<nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson Almeida
 Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@samsung.com>, <linux-kbuild@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20240620205453.81799-1-jhubbard@nvidia.com>
 <20240620205453.81799-3-jhubbard@nvidia.com>
 <CAH5fLgizj3RDCXMe0zJ4jjJrtui-R9x65NtHZh=r+vPQaPqN+A@mail.gmail.com>
 <CANiq72n5b+64z4rVs9f+1miR8R0xnSJXLz4KKcKj+pxkOy_fVA@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72n5b+64z4rVs9f+1miR8R0xnSJXLz4KKcKj+pxkOy_fVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eed6b0a-ad8a-4420-6085-08dc964b0c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RCswM0pETEVjeDlJbmxOemNVaGhOVFl3MVFiWVBYeWdNK0tMd3NReE9OR0ti?=
 =?utf-8?B?REFlU0xRWndLVHpEQS9uNFZKMVZRQzV6TkpaYUZROGFYQ3RhQ3BhQ1ZnVFRD?=
 =?utf-8?B?OHdVWWc1aXI4QUlnZmFRZVdPZC8zVm9Ubm4zM2FWZU1wdkViSzJHUk5EdlFn?=
 =?utf-8?B?T0ZBaXF1emlCVm9UUXBkVUdXTFp0MEJSaFZ2WmFYVUl3SFR6bk1yL3N0ck8v?=
 =?utf-8?B?YU51eG1NdEZmb0JycVhDZGZpdHpTVFRWK25FN2R2MGZLQkcxSE8vOWhTTW5q?=
 =?utf-8?B?OGdaTXNtcEhpcFF1RW01cVoySTdVOXBBUWJIb3JyZVZlWmtuVXJiQk1qTnEv?=
 =?utf-8?B?cnphcmFSbVEwNTdxM1VRUGFNQW52ODYxTjUvQ3d3NnBHZkR3aG9EbUdvT0w4?=
 =?utf-8?B?VVdLdkR1dUFvaERLRSttemRoTFB2T1Jha09JTnZudmJYWGRxT21TVU5LWVBW?=
 =?utf-8?B?TXYzVWx5N2RwUXVZTTdNUHlHS0phTUYvRnZDazRZTEhsVUZOSC85aElrWGxw?=
 =?utf-8?B?NC9ZL1FSb3lCQ05XTTRFWVBGKytLVmEwaHUyaFdHOFhQRVVDak44UHgxREpv?=
 =?utf-8?B?a3RMTlFIMWovcEdZWE9aOW95OVpHbW5EU1JWRmFMajZaMWRiNExCcG5UM3M2?=
 =?utf-8?B?cXpTdlhkNENjZFpLa3FLb0Y5TkpPUjRaVG15RlREZUZDb1VCUDhHL2gwR0tG?=
 =?utf-8?B?cHRuZ2pzTG5iQm1pY2VrMUFwT240Qk5Zbk1zUUFkUDV4ckNvS1c5a0Z6aEZT?=
 =?utf-8?B?ckRiMXBIajl5ZEdWT0Q2T016a214ZGZ0Kzc1dFNURFN0TDdHUS9DSng4OCtW?=
 =?utf-8?B?VGYyWEZQTlpwNVRpZGppeUJkLzVNclJLVURGSjlLTDE4RS9ibzZKVVRKRjdp?=
 =?utf-8?B?a3RUdFZxMjZQd1RxOWhEcHpxSm5DWHhxNkFodHNmOElsL0k1YzVmT2sxMS81?=
 =?utf-8?B?dXk3Rm9hQmVZM2p2V0hlRGREcFcwR2YwVTUyak5RZ1NTTXVMa0diWjBhelVK?=
 =?utf-8?B?SmFGWlNERlVxVzhpd0lIY3NlMlVqeE4rUlovUEtiQlZYU2FsNFZEK2hqTTJ3?=
 =?utf-8?B?QkRybnN3TFE5M2pXMHRwa2o1TDIycnVjTEtEZzMvRU5qM3BBYzRoNCtodlhE?=
 =?utf-8?B?MVBQT2VjVWNGRmRRNlhRU3ZFQTd3YWZSR0d6Z25sMWJmTVZrSkYxU0dhR25O?=
 =?utf-8?B?c2ZNRW1xVGhROHdqSHNldHc3R0N5aGxCUEc4SkRoT1ZNMzJEUVVReWdWc2Jk?=
 =?utf-8?B?TmJqRFl4eVhGRjBlNCtra2VWS056aDhVdUlhTVdWYndGd3hIclI2NkJxQ1JV?=
 =?utf-8?B?WFZKUDRkRE4xNE0wMG5mU2ZyRTM5eTQxeFlUZ01leDIxVklsR3llNTBHR1B6?=
 =?utf-8?B?TE5WS1R4a1Nma3U1RjdMRXBVdDFoV1NDWWFvZmVTQmcyNDkwUnRHSlFWWmwv?=
 =?utf-8?B?TGEvLzNzQ3JoajdOVDVucVR1dlBoMHBJUG9odDVvY0tkMzdTaTdCdWE2V2Fv?=
 =?utf-8?B?WjR5c05xNWUrZ0dHZTl0R3VXZlBRTW1SSzdmUFRNK3JqNEVWWHY5OEplWDc2?=
 =?utf-8?B?aTVFSkIxK0FOVGJ1anA2dDJkK01QUDNVUGtCOThNM3cwTGpmTkxHUnljcEdw?=
 =?utf-8?B?Z1VwSzI4dXBXMDhmZUJwVnF4d0kzbE4wV0t5U1BVdkYrSDlBVi90aHJYQ3Y3?=
 =?utf-8?B?YWkvU2ZaSGNwbmY2WXk1VG5Bd01hYnlxeTE1djNSdHB5c1l2Y1RtaDJrbEJ3?=
 =?utf-8?B?Y3hucGFhYTczb2dIMVlqK3pQSDBhYWp6bFZTU3FyTURqTjNhNUZ5WE93YUtK?=
 =?utf-8?B?R3RPS3Z3S0N2VlA3T20yWGlHZE4wZTlnL1UxMVluUTVYajgzRFNDcjRrNXZ3?=
 =?utf-8?B?dHRFd2FhbkpzR3gxbDF5TmlVT2RHUG16NVdKTCtpOURDQ3AyRUJWbUFYTGE3?=
 =?utf-8?Q?Z4wrSyyytQrFSNNxC8Ll31kLIlOZ1gCv?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 01:47:05.6312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eed6b0a-ad8a-4420-6085-08dc964b0c9e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925

On 6/26/24 1:42 AM, Miguel Ojeda wrote:
> On Wed, Jun 26, 2024 at 10:08 AM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> Is "symbol browsing database" the right word here? It's not actually a
>> list of symbols, but instructions for how to compile the code.
> 
> Yeah, I think the sentence mixes a bit what the file is with what
> (some of) the users of the file do with it.
> 
> What about something like (getting inspiration from the official documentation):
> 
>      # Generate `rust-project.json` (a file that describes the
> structure of non-Cargo Rust projects) for `rust-analyzer` (an
> implementation of the Language Server Protocol).
> 
> I would avoid mentioning `compile_commands.json`, since they are
> slightly different the Rust one does not really contain the compile
> commands.
> 
> As for "IDE", I am happy either way (i.e. removing it or not). Another
> alternative that may clarify by giving context could be "Editor / IDE"
> (since one may use LSP with "simple editors" and not "full IDEs"
> anyway).
> 

OK, with those changes applied (minus the backticks, which don't want to
be in this particular Makefile), we have:

Author: John Hubbard <jhubbard@nvidia.com>
Date:   Thu Jun 20 13:54:53 2024 -0700

     Makefile: improve comment documentation for the rust-analyzer target
     
     Replace the cryptic phrase ("IDE support targets") that initially
     appears to be about how to support old hard drives, with a few sentences
     that explain what "make rust-analyzer" provides.
     
     Cc: Alice Ryhl <aliceryhl@google.com>
     Reviewed-by: Finn Behrens <me@kloenk.dev>
     Acked-by: Miguel Ojeda <ojeda@kernel.org>
     Signed-off-by: John Hubbard <jhubbard@nvidia.com>

diff --git a/Makefile b/Makefile
index 204e9be0e010..7db597bdb09d 100644
--- a/Makefile
+++ b/Makefile
@@ -1967,7 +1967,9 @@ quiet_cmd_tags = GEN     $@
  tags TAGS cscope gtags: FORCE
         $(call cmd,tags)
  
-# IDE support targets
+# Generate rust-project.json (a file that describes the structure of non-Cargo
+# Rust projects) for rust-analyzer (an implementation of the Language Server
+# Protocol).
  PHONY += rust-analyzer
  rust-analyzer:
         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh


> With that changed, if Masahiro wants to pick these two up:
> 
>      Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Otherwise I am happy to take them too.
> 
> Cheers,
> Miguel

I can send out a v3, I'll wait to see if there is any additional feedback
first, though.


thanks,
-- 
John Hubbard
NVIDIA


