Return-Path: <linux-kbuild+bounces-1965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD448D6D33
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 02:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10883B2431D
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 00:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFCFED8;
	Sat,  1 Jun 2024 00:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SA5C+/qg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609A6FB6;
	Sat,  1 Jun 2024 00:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717202944; cv=fail; b=G11ERI89AaxkwFJ6k5XUP92HcEiIXDrnK7qanbsja3lO0clL+RG8E/3aWzwjemwp1FWfijPcKPlBY179udBMNyfqNw5MP70AMj9xDXZ8sDfiRM0RMn6bnxyEjMEt5l/KaqiRhXZWMWqKwzEEE9dNNadWfmJ/ckLntYALRV6WVzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717202944; c=relaxed/simple;
	bh=hSheAr1uPHW/ocTPDYc3WyKn4GKNbpjIbW/zSKj78A4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O0rRP5V+9xnkmpypHyNw9gugphg5a7ZgJg4yGRPl+tYGVjYvQpDrrC4oLB39JiBXzuQJjq/hEkduYQka0sw9oQ1HbVK5KVJ22p/JSoY6NKVDCQzzjrPKChDAeceqCxXOgYU3UEEJITgXgQzKhBR+A2cEr6dDuJMKaSWNk/p+aRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SA5C+/qg; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So61LHcxj/K9xRsx+GbWfFlBzG5DW2GKXiYso6L5CBB0j4xqz609Q89se7O1ObO9oeZjFbr5lubNMUfmH4IG055XCq1WGu2piYQ24Pz0AtSmxgHJmTHyIqPYvcWekqI6aETYt39SxjSDJjuvLm+kLuPRDNOCkWPryZneFf522GUT8A45lqbkU26sXtW5AiHG7bq+3SX686qIh10cZZY0kfgWkduckne2qIt30B4KY/shd5w14TdD9mtmS5h+k5HGittfpNgC5FmiI8MJKpXiW6P+sjLqTrKRG0riPe0XhbKwd2rjn9bSqQprmK+OaWOgFM2J7dsXdt4eT2FQ+35IRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4CjiUWzwWVDo5U5rggXo8NhTAk0+tvy0s6AgdaDpIY=;
 b=kyuPXDbs7GCpzCk87oiCcFB+XeQ0g5lRl0uyXeOO8K0GABIY7ShPB4brHwv8DU/9juihb2jaT1xbSrxhXVyq6ncDMcROrUBo0Om5jGnXYoX+rmnBob/bzft7Z2rAn5eKUzJkVJoQ9Dt0gRpYxDMi7BfP5T7akN9ySM47RTYRIaXWW4567DNm+sIpqN9RY26iQG58h30lJomo/gAmnNa+XQrxzy8aL1Ph2BxKAR4Dj7BoiaXb98x8oRcFtwqaexzl+KUrsz+mp7XFDhysqbstUYkfG5O/l8YSUYssIFfXq49b95iW6Sg7xrW/sTyb+PnTeNWRj9VQHZnt9DhRmI3Xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4CjiUWzwWVDo5U5rggXo8NhTAk0+tvy0s6AgdaDpIY=;
 b=SA5C+/qgqlDP1lM0EXZ19DC8Q6o3zvaqbO+fuAkmmycPEhFmS7UCAXur5SGehq8JB9eMmtmxVI5N2VbWMgiHcjvtQELjJP+AGKSC22z4/iYco9nDPIxK4jXrs011355RfEtGtC67a9B0fY3Kfo+ZUhyndlrn//SG5PUkSj3LIMZoSRySj7ua9lhhXwyFEC9UMBBmWYrCkqIET8Wzq7IjXn0lEq/CFTopqQ1tpbHWI+kaZ0hOcUpBsU9KPVKUPf6s0BShT2w7CBqpRXcpem/HcXmMSEeWrxWUxPy1+uz9NB0L5TQ0OhsKrMXxhnwnarUGuiFtgISZJXj1aq/ny1d3ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by CY8PR12MB7682.namprd12.prod.outlook.com (2603:10b6:930:85::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Sat, 1 Jun
 2024 00:48:58 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7633.021; Sat, 1 Jun 2024
 00:48:58 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH] Makefile: rust-analyzer target: better error handling and comments
Date: Fri, 31 May 2024 17:48:56 -0700
Message-ID: <20240601004856.206682-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.1
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::21) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|CY8PR12MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: e3552b23-15b9-40a7-3bb7-08dc81d49f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zkldY+v0Z8iMSd3NjT/8zcG0HDr3dg3u7OODTARDGeM30AsrLFd7RAlwgChS?=
 =?us-ascii?Q?o6QaTth/ldChVy9+WjsrOukrBbDPiueYQhaMypYMpeswzlV0RxH4EUKM9I7R?=
 =?us-ascii?Q?De9/h+GM7JJ0ZDMXbftCQoWWW5FJkP8VTfyQYz+1o9Onfr/PntUWLNtmXJ6F?=
 =?us-ascii?Q?6JDuTpHRgWajuSpMW46eUsAWCmTSXOMHaWhWvKeM7UyLOIyaAPVagf/SGwOh?=
 =?us-ascii?Q?tDNbJD7H94gDkUw0roIKMBvKMy6nF0jpOsoVeg14Zw5vtvWT4q0Qt5vdB7s1?=
 =?us-ascii?Q?5aH5sPEB/o7Z6B0F95sZ8eZD2f7yaEgxjlxFdnH6HB2rbfskMMcaNh3DvwTW?=
 =?us-ascii?Q?0Y9VZF5dJyrMdPCNMpG8lRfymPwOYKlk1ic95EcQ+41co3ZHiEv7m5cl8Flz?=
 =?us-ascii?Q?AT00yD1eq1C7ZgkYX1s8TbNYG+4BjiBB4liw9x12Sh/QzD5maoTcihBSRMnc?=
 =?us-ascii?Q?OAKgrqmfeFtjkFzFUU19NeRJEhSi5KX8M4cWrNRvADmVUK40ro+BqyUmvFhs?=
 =?us-ascii?Q?YMMAOBtUOWZ/fyzt3G3vw6ikHVRBceCiz+heUNKmhYKtTQ1n7QfWT7x9i5Tk?=
 =?us-ascii?Q?Jg/NNIgunMmqGr3bm4S559bONjwtP9mDrivqh3Tq2z9rb2R12aTflqKe797w?=
 =?us-ascii?Q?Fm5xMSLaEEC3jTywoRspEueyJco8cT85/Ekjs9TrY9/UfGMIEmOZHtGJr5De?=
 =?us-ascii?Q?igwNauQmgESsbjYgLu1jFMYQwPt5zIoxTfQyCb4D3+f+MPS6JuwQhw/NkE9a?=
 =?us-ascii?Q?xxIO9HLiTBaf/+As8b/48pk9n0ZDu4xTZXuj2GnwQ1SY/jxtkIwQr3sOl7Su?=
 =?us-ascii?Q?zxwrnnp/loVuvKnQKLJ13PNpsSuA3DJsz3bLQcMQlPGvSlyPTjv2XN1pa7tj?=
 =?us-ascii?Q?BVjr5SyfJ7NxlpuRSXN7kAjmLK8459nH8hOPYM4q4KeCtER5fw7pzzTcNbEz?=
 =?us-ascii?Q?Xl1dPr0ET3YO8J21h8dcoxaomMvEQN9Jq6p/UtEhSnjat/VKdNRMv5rgWEsE?=
 =?us-ascii?Q?+XOeYBzNR2OjWQN7knq1IOgjLpsRcpndMGwsIHJ1gTo0Kb3b1vYQb8h1nYcn?=
 =?us-ascii?Q?hfolBgiS5T61Uln2Pls8A20/6WBk7KbeKlky2PiLv6aTiqSxn5NeZyCwXbD6?=
 =?us-ascii?Q?M/D8kSD+OOFOwOlNKten8FwU+KVNgXG75n7B8nEyToaqfgDwH+wpSzjM10Rb?=
 =?us-ascii?Q?/9MYjcCD2ykwEaM5Yoz9KuHNBGdnuT3bbCY79BNGTjaqTRcsCbN2upOnK3uX?=
 =?us-ascii?Q?RWw/7SHgnhAWDeQ00pMOTR5zQHgb/KFlycYnnKWMaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YKDQOrrM7CDRUJvHcKBFVaE2BWMcUHimiJGFZSgGg6KT1hd5IAeXf+1+IuDR?=
 =?us-ascii?Q?cBqZbYecYx5IGlIUL9snXjwmYxLak5ZRsuUdSdSETdFadv0HMmHcAn4jv4f1?=
 =?us-ascii?Q?syVq/yVpOzqddANDHE525xJpesOq6qAGuyhye4Inw0sY4phPGNgPuoPrmqFk?=
 =?us-ascii?Q?rtcVoU7O+460TOJdFMHVV8iFj7Iao/m2k7nurS+boyMo6XR6BV2ljyA/EwL+?=
 =?us-ascii?Q?VbFKAG3EACNxXiNOO8o+UaXX1RnEnWA7sICILk/KkkR8xLwiTJnf18FTX+v5?=
 =?us-ascii?Q?9lJV6PNSuoE/gB5t20h19Y5B3BK8WUa343xuKNKRIUAmWAmgOEsfUo9W0NE/?=
 =?us-ascii?Q?tznee1GljiSx431JwaDBDr9Qw+VF7WaJz/6MeuU8n1APex0nKmW1Eru5ELXT?=
 =?us-ascii?Q?5CLW6aj3KhElAAk7KKPZvmc4R62IXr66/5SmwyfBs0AWLLiEnwiDw3NMBdP0?=
 =?us-ascii?Q?O+BPUhq1g1+WrcwzLDgUHS8MHw5YDDiKM/HrJtNqeMcyss/vNKgu5gQ/7U/1?=
 =?us-ascii?Q?ThYXOhhqI7u17Old6ZFinxSapwnMnewSIn5www4/i7cU3fQK1p/obS1LGHaa?=
 =?us-ascii?Q?j7XzwxJUjcffYLf6vw7F1Ge+m2LIVqY7MfevpvoB/gizlfOzphI3SKhwFCW0?=
 =?us-ascii?Q?1vd+uvRXgPfUyG4y2j7Szpq+ZFBhyIqX6IUOG2Y4Ci0hbeWdTBIKAV04RG0e?=
 =?us-ascii?Q?diwFBL1euveiPMwb7Sjm2dAYI97cHF8eWcEDMSdUGnit9Pl69NWO+rOiahCO?=
 =?us-ascii?Q?qXa+uRF8AY5ti7WG9p66vXhilLyCxGzCKfGUHwv8v7Kk+Bb7zVAtGsjnCYcW?=
 =?us-ascii?Q?g5xFPzbWQKKNlGmobrjgGH7Zx/xaTxoV4bvx7pMOS4l8C6THTbUWLP/H6IyY?=
 =?us-ascii?Q?4AjOCnue8WAOA7EZv5KmL2aKz7k5x1EjoAMo6DholV+D+bj7NROE7/aBWh3n?=
 =?us-ascii?Q?zkgnRu9cc/0ayGqtf+V5jduWQJYP3elLmQYCDdCwySpXV42QgCFdGPcfzSJp?=
 =?us-ascii?Q?38zSg9tVw6uo5ok13UKx7RJ1U+fZd/UA+oFcgdN/zUzgw2QpdD4xDGtu1xOg?=
 =?us-ascii?Q?LyDjWKCAPfXIQZ9iczau0Yv+V3n89/gj6VcOQ+FnvP7L34siZjFSHxgySFep?=
 =?us-ascii?Q?dU/kjqUlqOiAd+79EhCxLZTt6JlJjJrG2QqVn2m4kfMpcm8dk8EQY9SQMb9c?=
 =?us-ascii?Q?5awg/e0Ky7k2WwdtYVd2oIRGNItUWDw/bmolE3ATyJ28xBx0nIdxYTusppJW?=
 =?us-ascii?Q?9Fyh4SAbSjaBGRFqChRD50F1MJF/qclXc15qnU0NOqSpPhXZCsb3kr/nSjIy?=
 =?us-ascii?Q?uN54Ow8YXR6hOy+W7cUjVpvwCvOJhJ91DOkP8AnUUmeMgWvLb3dmB1B40+28?=
 =?us-ascii?Q?q43n7257rk63ORDyqjiKMhpcD3pMDM/dcXRieT0PUnXUsTAzRMRbrqOK9ioA?=
 =?us-ascii?Q?9HiXCtIDshUxZfaVOGpAa18skVNDisOpfJV4T4cNngzyh06HWIaza6xJ8ig9?=
 =?us-ascii?Q?WxIU9HJLz0AodQPufD6Bd6otRAxWBRaX4w10ySZAxa1JbRaeguK0Ff/OZqZZ?=
 =?us-ascii?Q?/SKzfxhAcahi7oA8bcVyWNcw792RHLHpvGbU1pkq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3552b23-15b9-40a7-3bb7-08dc81d49f4c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 00:48:58.6179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmH7EnXbEUqHaz0wutgp6d5sTnRCopDlQehJ21dZbe6D4AJf1LIIUbJmv7p6+v5kw7lM3TdPh2x0mpfObnYUjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7682

1) Provide a more self-explanatory error message for the "Rust not
available" case. Without this patch, if Rust is not set up properly
(which happens a lot, seeing as how one must routinely run "rustup
override ..." with each new kernel release), the "make rust-analyzer"
invocation generates a somewhat confusing message:

    "No rule to make target 'rust-analyzer"

This is confusing at first, because there is, in fact, a rust-analyzer
build target. It's just not set up to handle errors gracefully.

Instead of inflicting that on the developer, just print that Rust is
not available, with a blank line above and below, so it doesn't get lost
in the noise. Now the error case looks like this:

    $ make rust-analyzer

    Rust is not available

    make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer] Error 1
    make: *** [Makefile:240: __sub-make] Error 2

2) As long as I'm there, also add some documentation about what
rust-analyzer provides.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f975b6396328..aca2c96820aa 100644
--- a/Makefile
+++ b/Makefile
@@ -1967,9 +1967,13 @@ quiet_cmd_tags = GEN     $@
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
 
-# IDE support targets
+# Generate rust-project.json, which does for Rust what clangd's
+# compile_commands.json does for C/C++: provides a browsing database for code
+# editors and IDEs.
 PHONY += rust-analyzer
 rust-analyzer:
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh 2>/dev/null || \
+	    { echo; echo "Rust is not available"; echo; false; }
 	$(Q)$(MAKE) $(build)=rust $@
 
 # Script to generate missing namespace dependencies

base-commit: b050496579632f86ee1ef7e7501906db579f3457
-- 
2.45.1


