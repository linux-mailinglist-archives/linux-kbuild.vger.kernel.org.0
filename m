Return-Path: <linux-kbuild+bounces-2279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1C91B43D
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 02:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F28283DD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 00:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6158912E6D;
	Fri, 28 Jun 2024 00:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eHI0h/WX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BFBDDBD;
	Fri, 28 Jun 2024 00:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719535459; cv=fail; b=nwCaqv/8I61gqleZAQKcq0Tx6n2ppfMfN80b+BNyb2x/SKCbsb3OT+S+ycETzxx9qdGeaqZZpPoAxldezzo3uRLqFQLFv2eXYKam1X0hATMPY6I3ot/ftIMcKlev0+/dbDS8ZxTDmm2NuNgPCixv6l5cBxyLtM8OBf8HUhgeQo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719535459; c=relaxed/simple;
	bh=v/inXYvnpPInfYnYh+5q01dhkZeWZJZr008Tvq7qVo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S1H0x0w3Mp5H9yH/M8RCpaTgUT+uPsDPWWkok3scEGy/MF/JjwIJ/d+HdbjtBIFPDDinv2Eo+E4Li5+Xqp3TwcDEflxUhMT4tZ9jRBIOyNtFb627bJMAfZyPpd5C8SzF+l5vOURBr3+/Z54EniNKB9xqYhuFzW97Zu5YdNNtqtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eHI0h/WX; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koM4WlIwGlF26VdKJSbDk3xNvLyJKzsblC3iSR/bABymt7wIse4u3m2s6X6Qw/s+xaDgNUHw/hDe/kQ0HdOazR6waVMHjnJa8EYNY844bNcKJY64P3MFabp9aLR4qX/BCDrWFGc05duk4imbH0MGBjTebKdkxF0w+MElvu2fafeK+kKpuqWsVSGO2h1bxafWtDqc/6/16uavtDYMvhcqn6ikKbBO8bstJBsuozGJFU4eTHQngNQMxu9KXO3RZCzG7l6ZAZwd4KMl92fZgcPXcTERywlfHcrQ+gDtYvN11pUkh5DAn5zC4lKYNCNKoCS4pE/hoVi/RGuMvVxszfw2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8N7hoFYXWoj4Xp9dw1TreVFCrqgSWmdnVzWTgl3ulM=;
 b=Oxs6gBZeNG+nY1u+34AYxLI/Q9ASgFfyRLO7SBzuuzhigp/9L+m7UHpbgTUM+F6gI6noF9xcLHot8/Iho1nvQgTJw2/p+ulTEGOqQAMl7HHl9xSeGdJL9oIbkiDVxLH2k2UA+huOakyTulvp3Zkah2QIrwGNH2OptnFjFSJIhNVHoVMLdd68H52+nA1s0mp8a/8d1z34XXEDgpcSP8TtJXFcNMRsyDYbYrmth6c04iupY03SPJfObLuCO1+0F8cNs9YzCfN0APoXXMDeOBDOMMQkkCfg8caWpmxQirm4oLLZzYJsEAGnhtogJd/hGxjJtMBWO1zVWPjHxgy+eODsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8N7hoFYXWoj4Xp9dw1TreVFCrqgSWmdnVzWTgl3ulM=;
 b=eHI0h/WXUmxH9/nzJPPQhVmKDMMaAps8lIsevudC1AtLcIybp7uxGC12h8PmTpXowDShJFPwi2rw4/CQvRsL1IdcgittTAeZqBNOVPy0o3f1gmkCFiT2VLaAYjjYwNqZe3cZqUdgBpgH6qACiqkKAF+vC1O3cbHTOJH01oNdEg4I77+D66K/3zR0vx3d54PAzMlE1ApIXgKr8100nrwOmoE7nxcMipyidqTIBtvSfdV2EKkJRLVV+ahoSpVlv2iCnkCbLO3yMD/FN/owTv8xGboi2KNKIOsnhvPnSoU2uBYG7X/yc4WEyRLG7eg/er6bUl21eyw1crwpy+jgKyjNLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:44:03 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:44:03 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg KH <greg@kroah.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
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
	Finn Behrens <me@kloenk.dev>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 1/2] Makefile: rust-analyzer target: better error handling
Date: Thu, 27 Jun 2024 17:43:55 -0700
Message-ID: <20240628004356.1384486-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628004356.1384486-1-jhubbard@nvidia.com>
References: <20240628004356.1384486-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca7803b-c687-4222-d04e-08dc970b684e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+3xxJ1nvGcl6ozf9jOC9Hri17gQLeBMWcC2XfHs1V5+TkqnYT/jUSRQw0Ktw?=
 =?us-ascii?Q?ypPJ+4Mwk4KDlnP9sK+X7VEtDVbV8IVoF2vjn2m8NpoERwEufRZkvgDyyQ+6?=
 =?us-ascii?Q?qnMrvh0nwqPgAHehuMNCMc1+ywL2DE0pvyI44vrslk2VqOfU5VJfzFLz+N/T?=
 =?us-ascii?Q?GbD09zn8C8UnUR9Te0sqHuHNsy4hc4nvhHXksy8b1hVSvgUl2Gf8l4I1cWxm?=
 =?us-ascii?Q?IOfK6gnblwlFRB7gcrOGpo8zCSTyVWS+Wc8q+m7wzEJYtfryAH5b4dI/Zvwr?=
 =?us-ascii?Q?UfbTi9p2CPoBsfSdATZrr/Izf1Zj+wpIsiijW9M5S7UyrA4+XGRCIP4S3dBv?=
 =?us-ascii?Q?SwBnh1k3qgbXhbJ6A8IWFRvffZ3UGDbxcz5s+9m2Th0TFL/WH+Qn8LcjTDpX?=
 =?us-ascii?Q?rKdTytwk2WvASa4YfZjcAyrPckIrltyStuWJVaHeRlUe6iqEWq3osSUr3nm3?=
 =?us-ascii?Q?a2Qw/mxYiHOvB8DfzA9/2hV6m5vsDqlHRS8X2XLP5R4mxqZNtc3VAl3/FM45?=
 =?us-ascii?Q?YWiottwNR27CwdrKzgDRFdTdva7syTpwiaVsnBVLGFY6XOFsdgzg6sBEHE+j?=
 =?us-ascii?Q?m7QONi0HJI0tQubrmfzfJJQOA/83NZJAnhR5KsBqaGG7X0faQExXKCu5CVSW?=
 =?us-ascii?Q?KtV+2318eWhcu3NRKIaCQjr5yCjNcZwHdFJI+Pvg363HsaeAySY3v9u/r2UY?=
 =?us-ascii?Q?46jkWApQ35R8VdTdw+/MoEoPbDGme8U3T527deiJuCOJu2jI7eDSryGxzC0y?=
 =?us-ascii?Q?WNYafU60JwMA4UCnwpUVMDk2/uWW4hb9a7nmCI1EL4N+fTJ6pR+V5+2kN6vx?=
 =?us-ascii?Q?nfPOwIgkcWwejjbzM/mAlaK+LkW0EDgA8uZaRGC/Ow9564uil1bUE3Ml1AU2?=
 =?us-ascii?Q?Ck+0HumzuzCIxL81xBqvxE/ppWKvW9HznK6BNZ+/g4K5fQJPX3cC410EQ+xB?=
 =?us-ascii?Q?M34pInqSMFZMEqtEvG7ZToNkO0EqURk0t0MgjhgVxxlL+Hb1y7fZj7SyEFHO?=
 =?us-ascii?Q?vexOqom49KPg1DvjM4ZEclURBWUrNT5RLVoTeFqpC/W596RAOSBBgJs6wBwl?=
 =?us-ascii?Q?s30A3O7Rmlte40lwvMaIlmSMJSMBzVJS8o5rttkUilojnlyMCCb8XlWCHpZs?=
 =?us-ascii?Q?vlUVx3vBY4aL9fZButOeCUmuYWrqjH6Qb7o7UIzrsORSKjST3NZ75braicHP?=
 =?us-ascii?Q?iD6+qUg+UWP1UskMY4nSN5ja4xSdZ6S78+CQKcL575qTR0b5OAcT1v+C97in?=
 =?us-ascii?Q?LTGGTAKwPJZ0U3fKCV/VdF4fzBvhhGYZKWNZ+Y2xc0JRLtsGW4SIL1EPduCH?=
 =?us-ascii?Q?FOksMJ9ELD9+NFHC9QqMjB7jKmBt7rgGSjX4r64UGu/sIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d0Zs/e3ef1SZmBvH/nS8iz7YetrwNyGG6NY42iOoPy0SVbUJze8vucUVQaPW?=
 =?us-ascii?Q?I/P5x5sIr3cd7M6oTanbYxVXDohFWt5TFIu+08KHtnCA14QOezBk2bIctgzm?=
 =?us-ascii?Q?I+Ni53W8EDwt5I+n5cZCPitTNZlE4uR5tpRcBNk8cp9jc5wtmxvuUH1FD3Ld?=
 =?us-ascii?Q?84QKIselc5guDGfVAZhuwXDVyQJyNJrGM92W4vSLSGYe+8XyaRhd9JZRxDd5?=
 =?us-ascii?Q?BjmUD1ARasp+C/SMcj0OEhLCckXojOJwp15tvPfoEWiq695nPuW61YiAGNjc?=
 =?us-ascii?Q?qukxxQXFhaSn9jWxk7sgR0qYQTmv6dQ675/4c3DA7vKY+dpYIO+I6dUOODfu?=
 =?us-ascii?Q?0brCpHFAtn0+AI0wL4QBgYPaw7Cp0NLPYF33JxRP6wjNuO11lObfrGFAoiWh?=
 =?us-ascii?Q?yahuQ/JEB0QTT68Q2dyBJPG2CVSUSIDz+gvCvieq8lH+AgWbEVoZjhcq4j5v?=
 =?us-ascii?Q?nVrdHWkFD/64xWrN135ue7aWuj+m3HMVUYl8KwcBcVeTAYu/PxN8vHve7uqw?=
 =?us-ascii?Q?zU3F3K6WXTG9yUc6NUREnsG5YOkdswbx42Pndv3yhaGPZZD+VuB8eu3rAXjr?=
 =?us-ascii?Q?aBSd4O2pEJqa8gPGqy6to3ZWt5g7X/eVkU1yNyTX5FHUC5p6iB7xI3DVIbPq?=
 =?us-ascii?Q?2hWzf8fK5ogFLBHYivszyGTovVCZTdw1mCYIX33E92n7r2TK3OsTh60d1EbW?=
 =?us-ascii?Q?6r425NcfJ2IqeDdiIxVxDdux+Y+YAgoF2F7qGpD8k1zdTuayzcacKPu8dVKB?=
 =?us-ascii?Q?fLOs7dgAqE+n0tgXxA8Cy3XCbrd9Ht6J5D7vHOqQ0RUSstSHSCzIbUxUMHOn?=
 =?us-ascii?Q?bU08qdFTW7nekWjgYgquCk6LdF2oRjafXmEEkcKAnHUWCExTZVhp7829/8Jw?=
 =?us-ascii?Q?Jta0hd9XYvLfKGhD2pyQ2sNSqug7cA0TqqToZrkpfURKYlvFAXbWp88ICJC5?=
 =?us-ascii?Q?tt8HsLdohHRjsIpDf/8Wi5GLtvAbxfWsojktZ9hurZSpSY3KdbjXNMSKASZ3?=
 =?us-ascii?Q?voQcrYw8cWBD8yQJLpNYnJ74oPxoiUndWb01dkkDR1VHmTpeNKzIzaae3qnv?=
 =?us-ascii?Q?3Tff4KXfAEZStbZA/EqCbVqd4O/lS9l5Wi1wEsib+yhG3gXjesgFAjGz192N?=
 =?us-ascii?Q?L80lJa0wZddmX1XYg3aDUCMlJl48NoUyBaWf76jpz1hFGg1XLpNmtMZgN8RJ?=
 =?us-ascii?Q?EUNifM56baGwDhz5dCtBJI6wJwKDX6WR4YnYVkMYIIok+f/lmaYiKf+r3T7s?=
 =?us-ascii?Q?O6XdMDHrtImMYtgZxIrKqvO5QByehv7n32NqGM+3C3PcKe9Jt5ySMQLSFoNy?=
 =?us-ascii?Q?7JtcIT8GtaaV8ASYl7E05xWgU0Q9SSqHckirUgoU9RC2AHaIpIrilGHaKq8k?=
 =?us-ascii?Q?WpNECXX5/Ku/xO0epUkM8qGmTYo47ZUgVTTfIJGAm/AaXyMDEHeEnt5bwCVG?=
 =?us-ascii?Q?bT6Vtvmm0xPjUZzIxRHI0kidDGX29m/J5v0kzPnpAJM4wDqhbP3j/8OTgF7h?=
 =?us-ascii?Q?E07fXe2TXSlvY8LMLQv4qUOGeZRWRxlylO9OLsLtW1iTG0cBHl6lMSHQjIvs?=
 =?us-ascii?Q?p2GT6gAgnac9or49rpL5/Ugrgx/nKOE7jF2kaGVo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca7803b-c687-4222-d04e-08dc970b684e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:44:03.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tgazDyTPZ/XrKRtzKpUVy4I1CVi79PcovBrmHYSaeaeu+09VBM++pMjQKkwQSoQTwmRnc0iTmRCJJtDJHd59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126

1) Provide a better error message for the "Rust not available" case.
Without this patch, one gets various misleading messages, such as:

    "No rule to make target 'rust-analyzer'"

Instead, run scripts/rust_is_available.sh directly, as a prerequisite,
and let that script report the cause of any problems, as well as
providing a link to the documentation. Thanks to Miguel Ojeda for the
idea of just letting rust_is_available.sh report its results directly.

The new output in the failure case looks like this:

$ make rust-analyzer
***
*** Rust compiler 'rustc' could not be found.
***
***
*** Please see Documentation/rust/quick-start.rst for details
*** on how to set up the Rust support.
***
make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer] Error 1
make: *** [Makefile:240: __sub-make] Error 2

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Finn Behrens <me@kloenk.dev>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 4d36f943b3b1..204e9be0e010 100644
--- a/Makefile
+++ b/Makefile
@@ -1970,6 +1970,7 @@ tags TAGS cscope gtags: FORCE
 # IDE support targets
 PHONY += rust-analyzer
 rust-analyzer:
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
 	$(Q)$(MAKE) $(build)=rust $@
 
 # Script to generate missing namespace dependencies
-- 
2.45.2


