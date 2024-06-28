Return-Path: <linux-kbuild+bounces-2277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AA91B439
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 02:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75203B21173
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 00:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAC8136A;
	Fri, 28 Jun 2024 00:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U0ZALN/t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE5B4C7B;
	Fri, 28 Jun 2024 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719535450; cv=fail; b=UntEPSUGgHV/Zjjrju1sVrvkL052XaPboOqubhNSx60g5KkZpwelCBWH1jBVoLpL9FAvYhisfD17RDU9MWn2VIwjzDydaY/c6HlQw9sRFMgx7qlR4TZljpirFRbeiNPJ/XIrf3SYXbNEmQ09tInIvBptXyUrRSaIktYagoYuHfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719535450; c=relaxed/simple;
	bh=OHhV0dIi88bcFt876sR8yOY55xQo8bHYUw2dxzcFjHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jXDtKJR50a85G0fETEMcou9bGSmMM3aW6rjRL0o3OHAiqUvaTx2O0TbP+e1kfqyVuoxga+vVH62AhjtC6YU6BYbZklLKZD/G0ITifpGpB+0wpxUiizH39X7E6URNkUg7XncMSsl/eutPvl0wjPIBbd446aq/pfYz6Ekty9cZUj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U0ZALN/t; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIGHhiCx8dUEr0LtDQ40daYUiyqfwO05l+qfaP+9EfRghj3VQV0Oz9FDzimSz5C+X3MQayNzH4lhYD2mVzNQ40Vr2KV3atgzIlufOoVQkcNHjb8DfO4Qzz60uRerhW7a9XBtnkfvRwEUvp38dlZWt0u5wH/o9JV0qRRXb5c2hzLQo5CgZ0jams7CukvT2t8G7/IogYh0GFJARPodsAjzia00mAmJtNOYuQ9GWMgLW4MPDtOv4VEtQXPndiwKL5Y+Vs4ntWpFA4bRaQPQtEPMQ+w2SzUezQf5jqxscYkpRLuWdBd5BPiNT4ACwZmkexApc5NDV9XrjwD0PGyPDY9sKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItE36E+f4vxPUaJTM37LL6S5MbJLxW9TIEdEoIa+Bs4=;
 b=XBmaskXXV5IdRKBhw8ZBFyGyQvretWnS8jL4KiKqkO8bhjX2hb0tPraChDfvgiMGCWewQwD6YQ7j2d1aDYXNYG33E2Wy9xE52ZQK6L+3RWq4L5VMaSybMSCeubuaXEGaXmwxYyY9JglVZ+ZuMi5yrQg6TcXkpBJ9vtFJCUifrmkPquDpGWA4LZ8jw91JI3v9xX1tOIZecF/ety/6sUW4ZMa8vnxbjB7Ih+BmhT2MzLn+GDwtt6bqVKG9fatuNHtnu2reVER6Pxm12Tuxmx8Ci4UA5WoI4ATtXBJdD5KOKeKZBLXcOiXIep+qPWY7ei/gmiMeHJLzwzpETq5D73jpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItE36E+f4vxPUaJTM37LL6S5MbJLxW9TIEdEoIa+Bs4=;
 b=U0ZALN/tNAF2QZAckhS6gQ89pa2wZE7Rob+hFCYwdnvYZ043+dZHXpsoBhX4tTWkqVYjaPryJeLYYBdZxkocqDXV4uLp2jogZIfKrTYLe8be1dfg68qZSUwjXqpNw5+yK8ywHNrBPFpy4YxkV8gM4DSmaSbgwEUMvl3vrCJGLewqEu2INlrCYJr2XJFf5M5exdwGT4GJu0kP8sVfQ/QkMIoyZlpTOYW9rzx3G3nQDo2TT8/h7z1ATOFEi8DgNzKJ1koqOtPqS257xEK7nBiPxrxgvjqBz12aRfrkzH960BDWWheSndBxNUpd1bSIv5v536UAxIPfEzYxJO62viA2Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:44:04 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:44:04 +0000
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
Subject: [PATCH v3 2/2] Makefile: improve comment documentation for the rust-analyzer target
Date: Thu, 27 Jun 2024 17:43:56 -0700
Message-ID: <20240628004356.1384486-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628004356.1384486-1-jhubbard@nvidia.com>
References: <20240628004356.1384486-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: c10560c6-5ea5-4939-c233-08dc970b68d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OyY4S9N89NyTaunjTcJEQJ9cgDBjaUpeczMCK+SxBvYxxb8wGAE/oCd1GJsR?=
 =?us-ascii?Q?CFz96yF4cafceLmUGJkR5cp2biCj+sDWm9V0Ot97cMnKYlCIIXafVKLpLWwy?=
 =?us-ascii?Q?oPbzFG6k0mdgl1B7AuG7gjW7yP5b3sUx78yziby4GOojntLOAXsbZ2sHJFSs?=
 =?us-ascii?Q?+2i3/tRIZTu54T/fG39wFlt8KJiXNZt2JRXx6hVDluB0TqfKxaDu/TsEsH7D?=
 =?us-ascii?Q?ciBKiGk991Y/vpAadXi1CDIkcOJernk220MiZ5WFtEjQHUAugwzs7wJsR6m+?=
 =?us-ascii?Q?0xhWCuoEgaiPGfXy1ft+75pP8jCPks5/5wP7kxltVVTAUtM48fO8plfJ2hrb?=
 =?us-ascii?Q?PhL0y2fY6en72Kb9GuvKDqQTlciS2zfyNG1/nPINkDlmZPuQya1ZmdQTft+E?=
 =?us-ascii?Q?pg2f/ahPxx0b3SskG3yy6jh5JAbYwg/H8QRsSaSkgr7HzSSMs0YhnJv4EcCT?=
 =?us-ascii?Q?GEHSErQeF6Fzh5IA6+eFhHFMHC5mEH2b2L2f3KxS2232vphiAlQzho7IjPBB?=
 =?us-ascii?Q?LEFJidE0XwJkBhqWRjhsb7BiRRUVHQRpBY5BmlzFid0ERPRtWsV+/YsAdEDv?=
 =?us-ascii?Q?iPo7gkwMst7TZyOZvZ1lqkmeVFVkN8NAh59hTjh9xVQ+h+5lCfE1BKczy8z1?=
 =?us-ascii?Q?fJ8wyyZkZJcWiuD0/zwByMoAUXb3HNievh+K7nvkxRFSpqpzMLqYmZBF7O0J?=
 =?us-ascii?Q?pP8KLCQ0shOl50mCmStDDVhWv2LqUz3U+lB3hmRDFnShF1yeUWVhIj0uPOYn?=
 =?us-ascii?Q?w7gjrP4UlDgo4tRAWXZddbFJevFrBeYr6c1q6QatSEBsJfNsGjSyfWtb73WV?=
 =?us-ascii?Q?yahXnmJctseX3JjeJ8OIOE+Lq5sMVskCW4Zldj2eSLTXbuWLU+ntYdEZQzWL?=
 =?us-ascii?Q?HnWWWZNzrl+yBHBm52pAdSTobTp55a/+Od3DB6xf/2QpvpI/lQgGmaZXRyPw?=
 =?us-ascii?Q?ci86W7FZ6LP3iTQqUnQ/4U8cCVZY/kW+1AptjQ22xMEt4rvol9uiXX79PN7O?=
 =?us-ascii?Q?trUdABp7I4FlV3G9e8LXatSvAfxP80Cr5gryXJyMNN4Nl4WEdnpZOuGJIIhe?=
 =?us-ascii?Q?XnRtTgQpXbOdJCt5BR+DVjdap0kJa7g4s5jERKE70tBcXZfibfzrXvfcxgYg?=
 =?us-ascii?Q?Z1wkakHC91yJOe53TfESfyfvAymQRV0CWYo67cNuadYs3ja4RfUr1bFPLSMu?=
 =?us-ascii?Q?m5kS0LPDO+W8SITodJn1EkxtjiTfliEvlajZazhT5kXDjPTK7ZjXZ52mj9Ph?=
 =?us-ascii?Q?z/6K61WKSffmzaj4wMssHK1WU5lesQlDjGIH8UpAN4F0cRJLZGH6dt5BIpzw?=
 =?us-ascii?Q?8IMFGQ8+/A/9sX6gsvDwRCLshibFGfFaQxsPwN3RJ9ExdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3RUrVC5op3f6jwLrBTGc2Q3QFnhjqwaHeZ2Wtc3jdAK2TspO3ENyAXF18akQ?=
 =?us-ascii?Q?yS2ahZOQId/o14RS3gfmXMzn9dFaKdqx4meCRRZ5R2biA+T3AiSwUIHM65Hc?=
 =?us-ascii?Q?AYD6yz/NsZfzHGy5IqdPfNkyELCXPh7doTop2O+POphgXjw+fN5ih5597nvX?=
 =?us-ascii?Q?s3IMRrrWUJWSXsjAL7JR1xJdYwTOBoK4o06DPZptfqVi3R3D8JXcoY9xhjHv?=
 =?us-ascii?Q?B2e3X/goClv8lh54b+Ym0OTbv3a5pauXip8caAFrzEF2+Twcquoh9gq7q+NJ?=
 =?us-ascii?Q?BzV4LkeZXvNu4fjwm8b6EAnvqAfdmHVKUW6TMZ9Z6xoKjiWsu3aXRX1zRoMf?=
 =?us-ascii?Q?m6ZwzUFcljAAxdVMLqVNngXRBJa67/mxsUj4UYUXIwEfSTVdUKCYaz6BCKtg?=
 =?us-ascii?Q?Ety0EMQtTBk6eKD6URH7rnEW4+vng3xoVW927HTggB2a/GXVGyJMLQwnXDIB?=
 =?us-ascii?Q?S64Z4DpuX5/lre5E9D9z9vjrhqBE05CSbsckjiWyo/73yC6QzaLQkEio4ucy?=
 =?us-ascii?Q?78m/C6zJWlDyKwpO9I3BK0ctd8HXu8GAfAERrOgyWUAF4XvXcJTUGTMJ6KHE?=
 =?us-ascii?Q?YCVH/UWHT3mKWplFakadg4cq7foPrTNnnKE2lxqrVORaeZeQolXH7rkjVCmL?=
 =?us-ascii?Q?qn6QNqpav8Z+CyEQ9AuilRgg4mXZ4vVvUE19WhCb6DvO0P/2yEh3zzEeQeeU?=
 =?us-ascii?Q?tWn9nlxaK53ZKvtxT1lDauXoAXFfHuCspNoS5kJk1/l/P2YRjtPWubzM8hHP?=
 =?us-ascii?Q?C/jK7NNbzznURFzyGJtx0K35jq9LJrqIV/1/1+HI4W3/gWiRTcFwxgu3nm3y?=
 =?us-ascii?Q?bfayfMOBaWXhiIBxYqzP+JGNyBwbOniulJBC9dhS5NeFU3kx2QTlM4JNqmRh?=
 =?us-ascii?Q?mYYOCX3C4uUcVCh4De9yisbgnBLIKqmi+kP4j/TU07Pb7hS5sW3TgZl7QlLH?=
 =?us-ascii?Q?JSHgoxgOce5lWhvLXDVpyaamuoZAcyybQJIhwLzWs/gu+kxKUzy+kn45liRI?=
 =?us-ascii?Q?kj+P376aH8TTlAcNfgEDllZw6s2WpcDp5ufZqr+avdO7Nsw6soZyYCsKFs9E?=
 =?us-ascii?Q?5QzcdZMO51L/GvoolOrjahlP/lwc7Y46y27H2dLxV8zy2wCzl5sUo+W3pO2w?=
 =?us-ascii?Q?rLBd8KuNzKthWgY02/HTIDNaG/OMu5JPMRQIVItVzF+9Xcra62QPPbcZXtVP?=
 =?us-ascii?Q?Biqn7E6HCgmV/KDpiLIST5ss3zAS/3FHkP/yOpCj1uLNeiLq31UsgqkiRh6b?=
 =?us-ascii?Q?bR8A9mJfrniIOsQeKglFd6xVtxbPm2IGD+bzt1DAs7LwfVKnMo1IkCk7ZzkK?=
 =?us-ascii?Q?NnEsPimydXvnu1ZONnU3qj+Wk/NFRQ6rj5xyKil1c+SnX8Nu87GCq3cZOxdV?=
 =?us-ascii?Q?rCVzf0M8OosOP1qURRU7ra7mX3jrVd89plu1X2S/8X6mZ1TneTlDziHjTTKR?=
 =?us-ascii?Q?EJqGsxYXAG63jxmxEZe33aXpwTgrYtfVlM9dfZDc3S0up3ntsLGemQEOcM7E?=
 =?us-ascii?Q?ocJp4Y5w91vkRaWTvEBTJSHiJMhNGMuBcYloWbv2YzIr9QaWywk2H5PJc7Qg?=
 =?us-ascii?Q?4vy6xrEL++khlfqXY7LhYVs5UkYjENbvkXlauuBZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c10560c6-5ea5-4939-c233-08dc970b68d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:44:03.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wWKJaa34T5U0ErY848LATKnwe44GsXjiGhgAWB+WpKBGyxZma/VFIrAm3bCC71kr/RxuOsXBhlljCIWaoJ+Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126

Replace the cryptic phrase ("IDE support targets") that initially
appears to be about how to support old hard drives, with a few sentences
that explain what "make rust-analyzer" provides.

Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Finn Behrens <me@kloenk.dev>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
-- 
2.45.2


