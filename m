Return-Path: <linux-kbuild+bounces-2230-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC19113D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 22:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E2E8B21307
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 20:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659DA7C6CE;
	Thu, 20 Jun 2024 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dli1C3t6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FDC770F2;
	Thu, 20 Jun 2024 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916943; cv=fail; b=gtBDmNmlOoXH4nKCV6V82J2ufvgvaZgHW8gCZU7l9wPU+U0hYZfiqtazn1ukMaYQbd01tPumLR96ZgSL3lvNZ6vdYEfY4b6Yh/Vskg6guBM5TgqBZbssA2DAjZgz0+aofJ3uXpjesVPA/m7E3NdkwC3UlXbymOqODk3f6gD37HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916943; c=relaxed/simple;
	bh=pFxOGg5A85dKn8goVOWnl72bABIhO69aSe8dM8KzbAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rLkSaeOvMq9gjo0KmhIyGtoOWja5ubxX8Cw295pvnIw3R7sURZwY1KUrwtNvLmW1Uxt4msszVTFMyOuIVY9k6kluI/QnDZLFm3mDXUBLy0Ar/fsr3/CQVcW1FjmK9cRBm1FxJTez+a/r6C4FcyVzMIIyu/lm9sUjXhW7u6zoEPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dli1C3t6; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwrwOSKQKvUYB4BXeoou2abdfc+i98tHn9S3jUU4b1TyRT9eSCpxBS3wFsQSng+GsEQGQZByZ11Kd5N+pjrsHs4OpZ3bWtC1SXrB3aYVRUX3i26IYYS493qgzomUJGSbomrQyCpqHWJgFKHqyvfKF8rLbZJDfIUC0mZoBiB+YUHyPOLQdYVFvIodQWTCTt5PtY6UPIlK3K4AzO9Vex1lcXW0sSCwMGOaYP2wsA9v8cHNXhljFc1wfinkZ/epaUXP4oQRuS8bXqTG8AAe30pCrfA7ejpo7Rvd4P7GEdbePnRiW6XIsnX6j+SEQbysJ05Rt0PkJJ8UlpdJLGotlFUVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ4OM/68Kuff8FC7FNyb8W7fjsLpy4V4xLhB+u4/Wzk=;
 b=fN9OK0NhytPsZv/D33mqxLyWB1yByCHfRXQ4NjuooI/Xhj58YS9CuykCGx8MZe3yHZU9hkB3z0WEs+EVfapfPuNhukb5Asu5Luf+6Q2NEwH9YIOV065i1zbVo7L7DRGPt50FHOYRA9DgOlMVUzS3LXxihZR/U0QIuzXydo7eVzwyvRJKpoB0hUnZdtxjdPWdZUUZ6LW39U9U8T/XgRPUR31tstuc9d+pDMwYyTz7Hd+3YRUFAB4CtE9q7DhoETYgNZJpc1mrj1oNAmlB4mLCSevcWlqLVM4jQEGYW9k5NMq6fKF8HH528EGYGXdO7bH1Lj3Z1GzodgMcJFNHbnRWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ4OM/68Kuff8FC7FNyb8W7fjsLpy4V4xLhB+u4/Wzk=;
 b=Dli1C3t68bN0HQoFjb3MVj2jAymT3CYziCLUuURdYXUcPVdA/jmnGEZss4Smfmhz4mNQQjgdDkelTc/l8aHYPhFsvvqDM82h459bCDBshSnBnBO5Xqi9BRRk4sAHEj6J9YLgEbCyecrmFN/D+iDARNNpS0et25lAZ6aAEwVP36dVAdFrgEzWPfEClRIFqPvRq3Inn1fYlCXFShatgiEceYpHyBYMLIvw7qSE56ZaKLQtsk8ArWrctG3T/Rv4UoJYC/59b/jPrphJldqo2e2LTdoB5fxLPejDcEtBZ06+z8pv9r/RzQCegP3Ye3BtKH0y9s5eS4Kvcky15addZdkjnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 20:55:33 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 20:55:33 +0000
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
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 1/2] Makefile: rust-analyzer target: better error handling
Date: Thu, 20 Jun 2024 13:54:52 -0700
Message-ID: <20240620205453.81799-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620205453.81799-1-jhubbard@nvidia.com>
References: <20240620205453.81799-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:a03:331::16) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8577187b-988b-472d-3a0d-08dc916b53ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/jgwkcbyfiRf3tlVq8aAiapn/vjVqUrahAE75xJCyXaGRaIjUFmYmyWTOEMy?=
 =?us-ascii?Q?y9WtUMdUWXnrK7+7F+/VSJTVvLSQ1g9gVJsmg6IDRAzU/24oiuDvI/LS6/dc?=
 =?us-ascii?Q?AuVUl0FI7WoKDFGArugdPH4BDtAdwpNfpKMWaRHur+7Zd6tWmoHhBiNKMKam?=
 =?us-ascii?Q?2Snf7XMHkeRq4Uc5OlP+RJBknSJ9HwezgRLcHi745cCbxj+qRxN4EXeCz7Wj?=
 =?us-ascii?Q?1WE3dDWOZpl0EqtLUdWFjIPD9r6MI8qeC49gy3xoaK1IG80HeC1r1JSyEy2b?=
 =?us-ascii?Q?CXP+FQkLJ9/Yvn0c/zfzWEgEawVm6U+YBl6McMxXafmisWyg2oDskmCwpsAv?=
 =?us-ascii?Q?NHaApo810EBEUQUyY+9JVVBw85irentI0FSft0brrMFUvFcvD+82jLFaL6yO?=
 =?us-ascii?Q?sHd4MUht3EdbxpnUErMXoOKaUIwqdis66M+0/FmK7Y5Z5sLLkVYzGBirAVdu?=
 =?us-ascii?Q?JmUA48iVcYf4JJcpItT/iL0Yk8uQVHddEJXk3yGE2CqhT+PRQhcnnLA4F8Hj?=
 =?us-ascii?Q?6zo4RT+4C/N51pNIucsocw+TTNGu9V/Qig2GaJx7iOfKEW7psXgcVX1TXfs8?=
 =?us-ascii?Q?3DBCsm/FBTYJsQqmcaKnZvZOgOjVD5RblJjAFYNCJdk1tl/kTg277AIu9YuE?=
 =?us-ascii?Q?oOOHfa0rIQv5SxknkGMTH3exLOkTOZB682X3+u6R6yq6uHeCU+9/+AbTfu5D?=
 =?us-ascii?Q?k6h3eleesbphseFl8TOdW3CxbmZKQtl9fKg5YhiWRxzK9Fu+tJTJN62LwL6J?=
 =?us-ascii?Q?C/AGjVTK+BUOT8swyieM06hPuLvm/daMnHSHPy2+ZA0gHJqnIll8Sl8nEm6d?=
 =?us-ascii?Q?okJWuV33ASYhqdpU5qfaFVKvkkgtF1dtlCqNdwfox4HKZeW4imAyA7SEa0PS?=
 =?us-ascii?Q?8rIjLHl94fVYT6JIsZMP/xC62MpYZs/J+tv7GugesMcs0s1+7RItVc1IfHAb?=
 =?us-ascii?Q?wCodgFzfP/cyunTpsSC2jdPYLYwHMatCBU+F1geDkpDItkngyUH4gKogr3Gd?=
 =?us-ascii?Q?HkmS0ly96MsUTykEhvhBAoPJIt9IJkODnJBWMbczn4yeYprCgeAA1EFiEB7O?=
 =?us-ascii?Q?Cn1+6isp40KVMZioVKVN3M/npqteycsaM1MixYu8n8nfooMgckD+yV+D57aa?=
 =?us-ascii?Q?2YykMVQuujCUec80Db/e8TVJ8amE+N/Y7EU80jXuN7NnRqvrQScopra1r5hZ?=
 =?us-ascii?Q?jEY5zXqTVWjFNI7gXOtfseyKY3HUGV9+cZMndaiLe0CpMe9ksq9p7hcs0rUb?=
 =?us-ascii?Q?sKUmDAoFjVzJBFjjMajwEx7wQLlLx20WeRD2MULegr++5ghBuTRSWtXqCKsn?=
 =?us-ascii?Q?M9ZPlhN16yHajYOB/yMLFX8e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aL7ddM4ZpH9DIVv0qi5bv9Frok0SQvE7OG74aLSjxbJbQeUufcmhyDKczZsT?=
 =?us-ascii?Q?cybE83lRinjiOvccUr1yA5DASvfjhJD9d5v0vm3OUves92ZqZ3rwJuhfZXdS?=
 =?us-ascii?Q?dzSHor7JmMIQRGYBoCvgu6dPQvq1pcthcLM9Igo/bU/SJaMZee84kgt7oGCd?=
 =?us-ascii?Q?L+DlbsEaH0CgsERSThr8SgTJaBAtdJY9FGDYnOHkOnQAaci2fmLen5a+yxSa?=
 =?us-ascii?Q?1DzTOymZ/9enz4MuqUEva9IzZAyQkyqQjIfXdAVm+LZ0jxrMUVVdrsEQCPa2?=
 =?us-ascii?Q?ekftWMImO1InXQlJfWHqWSUEy530i+xF446wjHUOk18q1GmdJfVQrvGWS+pM?=
 =?us-ascii?Q?qOC4Lj+dIw3k1UUGXn3eUhpn0PYTObD4y498uXTPcp4qXrX3dtRDxQ9oir4V?=
 =?us-ascii?Q?CfUWnGIcknljP6D3y+pxTeN0wO3j1vG63IwlhtfB5/FGqbgxB5CjuqZ/gy0r?=
 =?us-ascii?Q?MCEKjnspoN/x0BhwsYIzjO8PutlkRj4ydPcifkOkWsBB9SxwZOr4sD6/72Kl?=
 =?us-ascii?Q?xTXjGWwmgLAy6ctwKR6DG+h1sQnTof0j0yyZiL1ACwhY0Yf/nQ45Dex4/AyN?=
 =?us-ascii?Q?0s6WTAxmBf0NuSz7bcnau0DTmA8zgpHjRbaeYDSyRp0e3osCDIdEWOblwfbz?=
 =?us-ascii?Q?eLM2RSqVYolkAQBf57NdyaljRPd3nP3zA7GiX05cRZ8zoQ/T7sZ+13DHLh05?=
 =?us-ascii?Q?OSeZZVDbfCO6B4tTBftzN+pNp3eRcTiZgCzYKMgkWMw78TeeqzKYnO2sO79S?=
 =?us-ascii?Q?nH8ID1CQLgEKUP+wF+llUh6LIdAmxLpTd5n3Ngibi3ormiWKqd7BPblULSk1?=
 =?us-ascii?Q?SPSPURdR4JNIKHFzgdCmzuJ7k5VWG9TjsTKLBpjr1HfHOdwk6ZLMhz10NFuF?=
 =?us-ascii?Q?Y2eZS8ahvVY3D9oFRZrhBnpzq0NYYmaEPobGrLDKzQVKE8zqfMpxp8jvOc9L?=
 =?us-ascii?Q?yth51VVDcSFmhYj/cV1g7/4qskNsL+AHppbv8EHveHUtl5FFt53x/2x/0Kc1?=
 =?us-ascii?Q?tAS51yFMPHzxRHBuHV6wA0YetkcEh4tL2CuVDcTVaZ85EiSoUM/3zWR1Y9fp?=
 =?us-ascii?Q?bPJKjww0fdtP0n90a/70T/Hf6JlrO9k7xDeWHhsSVpyCL5LB/HwcO3esavCk?=
 =?us-ascii?Q?W4Qdr8B1JSJPjMKjEzPwUaa/pXa9ZrqnGh1B5KbWzhS6QBjlkcMOQLksvZeL?=
 =?us-ascii?Q?YuD5u7dIB4YJzS8UUHqdHajXnlCjIIz2eB7ihJL0WAW+MfWiz9EOmCIvtWTK?=
 =?us-ascii?Q?Lv6Sy39iNaRVl2xMulhSQvVZRqhMXUSYStxlx7NTrEo5zguCstBt64m6AOOK?=
 =?us-ascii?Q?Nxliy1PbtJypw7IUTcYXq3HoFr7ugbGLwj68KrEq2L2WDCcqEQ8qGEIpYjKi?=
 =?us-ascii?Q?oblz00zAw6XFXVaUuIbvoz0+U6oIP5wpzn0FqYG5rX+27cJqREDlGx5/k4Ni?=
 =?us-ascii?Q?8I9PeR6Pfd9T/TuSYphNkeH9hnT8lGgY0Dp0aGac+IgUIjeJtlbQm+YOgSLf?=
 =?us-ascii?Q?J2hYMqaapewK36Zh/Myk+Urkv25PsGbSrIomnhsdinHXaqRpxl5Eno0GJX0+?=
 =?us-ascii?Q?YWehSkZe6dzW3HmGL+zVmXgWuWtDZjkVzPq+KOpbiMJEisB7S4wDrpXMIAxL?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8577187b-988b-472d-3a0d-08dc916b53ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 20:55:33.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9JdNZ+Mj3f2KcKdeVceblthRgHDJkmRQnUfQLPQH2bh8/GPiGlm6yHqoGe52TN2/ghkombGlH35hXOvXGJW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725

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

Cc: Alice Ryhl <aliceryhl@google.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 14427547dc1e..07308277a6f5 100644
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


