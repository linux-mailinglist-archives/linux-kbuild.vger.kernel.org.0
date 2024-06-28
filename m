Return-Path: <linux-kbuild+bounces-2278-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C317091B43B
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 02:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22759B22986
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 00:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D73D2E5;
	Fri, 28 Jun 2024 00:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZdnpbwKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF8B645;
	Fri, 28 Jun 2024 00:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719535454; cv=fail; b=e84ab5xR2PBBkgTsX2PG6257KHr0PcxuTlFqRjb0Zb1YyhRbIHiAfH6T9CRSrT8VsDEaNmBJISBk0fLliSGLLyhvEsGCukWJTZpaghYtnF3d6Gl4rcWtClKI0sdMbzvsJf9xCksoWPrgjzaF80wFIMz0FjPpK9Pcx0dScxFSlQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719535454; c=relaxed/simple;
	bh=er0xhJAwUgCWWoE6xnWVnXAXw66PZBorMvyBVdUvoJE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZxEvK/EHJ02JrNvmy9h0l6PwOEvJLhGy57ZUao9HSJl35qUVLhOtj+9CLfl7ghaU/yu71kY3998ucboYzbSESgZg/2RdPtPv6uGZfgr14JDdMtQD2Nia+EVmvWaAIFtxrFQk2xqb61VI1oDG1xK5AVKlFMX3tm7fm4EFuOEu2vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZdnpbwKT; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiWO9Su5ZTfVgUOjBccuErc/Y3Pjx5GAN0fTL30hJSANNY6plZzantYqWF9V+VThGXn7IVdf2Z/H6/cd+2L+CBgA+SPRFiyJU2j6F5tT0w5nEMpcxxb4x0SgRfiZyilUfLXZ0Muh9c5X5JVInjuoU6u08t7iblLA8/YTFA1X1x/UtwUp+iIJTwUJhgAvV2MKlEOFPM0W5DaLH+Y1v+Oeczg9jMWSFfKIVLdo6vFT6JP1O+tLIQdoCFJ1aFOqXg2jeFmm6hIFBReNZ8sMID/M1BSASnQ78xXqrHggtdkZRC9kDMz2NoNvGY1B4Z4Wh5AQPrqKmAvGUDSQAHAxnY1gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LZRLaIkMIif/FzPtsAE11TkuK0UT3e/5HiVi+vKfhk=;
 b=mFat45rxag9JHG7a9iVi01sawoNosgh8zrpiJS+hHcHPNL0NFizPmzeaVZH1cu4KpMgIdibJe9kF238UEXnkjV9G53xT16M4ymPSRF7nw+G4n44u1lO/NZI+w4qwHVV4j5UiA3o48W0d3Jkb/h/Lz0D0N9HL4O8jxE/YPdzIvGY3YG3RJxXDkFCwkjDvl2W71d2rF1VfwU4hsYwwNhRV6953LyT4xFXMQHXU+3OA5yHtKJvvBv2Wut1dB3BhBotW1kOPVyHHunpv+sLFrepz/tF4lq8tOzRd5sB37T6S9Svxumx4NSSo14XjnAgBbU31Rg90j4ovovW29UCKS2ax1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LZRLaIkMIif/FzPtsAE11TkuK0UT3e/5HiVi+vKfhk=;
 b=ZdnpbwKTfe57uVH1+g6RkLj3x7uQ85ScfyKo9msG6EUKg7bATDku7xc9Ym/m3lls+fIyBmB8bspdx0u+o+J7M6Sojq2rq6aLtwu0Hc2ccfPKlPowlaUT1hYE3PFRWgfH5V6zP49XeVM+6ozt9Fn/Sx8tiUaFhsv4O7auKZSHuwawTWohXuz9jrJ5hfIKieAOsXDsmWoi3bQ1qoxWb58DHN+V+f/CZH0AlxxMrUz+hZ/BncriWfWe2tE33S2lid0V364h50BC9t2yZ0Mc+FLjW7w6edekNm70rj2m755ZkPWIY5AtMw/Kr+rlhcf0BoP4oEm/mYvehehS/OXicTYm8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by PH0PR12MB8126.namprd12.prod.outlook.com (2603:10b6:510:299::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 00:44:02 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 00:44:02 +0000
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
Subject: [PATCH v3 0/2] Makefile: rust-analyzer better error handling, documentation
Date: Thu, 27 Jun 2024 17:43:54 -0700
Message-ID: <20240628004356.1384486-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|PH0PR12MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c4a59b-704d-4394-593e-08dc970b67a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zXErKiWJun8Vz6lKZ5nL1w4lSh1gGAvzxR3hKr14JDFmTkgNLD0lC3n1SQ24?=
 =?us-ascii?Q?4OAgLPaKNgnXmd9WDViWW9d9ERXjYh3efJg8+p9rhNmxEzviTh02dEPMTWpi?=
 =?us-ascii?Q?mfRih5clGcqqU+oA1tX707QyMWiv+w6S8E9ZJf4l891TPh+A165R2aFOkFQF?=
 =?us-ascii?Q?QCViZ5wtiElJRW+vSUzGVKYfCfx+n/0HtjMe2gshPoJvSmSwpuCXoEReYzSO?=
 =?us-ascii?Q?CsderYSMDLAwW48pF38vaAenQF4a1oLqsR4/tr7klZi3FfE0WTY8VAAh42IJ?=
 =?us-ascii?Q?L/+07C55LUNRR9KI/lNFmhgE8vcL6eKj/A0Nv5PrP7jwnLlOpXFpQegP2O6i?=
 =?us-ascii?Q?VArKyfL7Np6jCfGFppoTl1zhgFSF+2mOxn6zJpD3jcHROfCPZjwzFaZaVUhd?=
 =?us-ascii?Q?NFpXnBQf6Zkdf5yaeAsphk1Vq1GTRtn0k90yx9PbFc66hlBGW1F2q0Sx8sIY?=
 =?us-ascii?Q?VdgVhAklaHfEbeVLH0LTJiuGVbg4sJFiRvwRMIxPPmcEDctAKVkdRT7W5MGs?=
 =?us-ascii?Q?+lnSDCdMSvnngTqjaIyr6y/Nh9ZY8m/KszRbi0hodJBfgG3GpkOiwySiWONn?=
 =?us-ascii?Q?Mt25b4slE2aNRmvfui64QBfGGGqzwpoDj9J3BNmHkZqY6rEKVB8nptegCoyu?=
 =?us-ascii?Q?9halOH504nyFZI6qCqHJSQI0w4ZB8rnkz3aB37nedvPR+GOFCM9EJyeNJR1X?=
 =?us-ascii?Q?A1L9Ryi+5woH5qaDYpGHmD0Wel1X8tmIC8HPD7+DXs9wEtjwmAEak9hM4oU3?=
 =?us-ascii?Q?TykwpIJ1DOyV/JzIR4xhJmKMXiqVc+JqYHJtQ/dVxOL0rAi9ZwN90+SBCrvz?=
 =?us-ascii?Q?I13p+Ctm+w5JyiMtZR+yvMmVg99u2eNfVDPN3gACMzdDoT8Lkh6U6XL2beuC?=
 =?us-ascii?Q?nzjZqcdztd2amtGMyeUoNuNjC4XYSbuVWLLyHceKb2AWhet8FOVo4Sb/QdJ2?=
 =?us-ascii?Q?FSyzR43r7iZqcQjTptFWT+u+WMNRupdpHgieOFGliBMNOHv0Avpal8NxDcir?=
 =?us-ascii?Q?XtzKeOOrXyVfk0zG/W6IsYtGGiMZeht9xJgYbJ6BIDRdKSeTihaC/Z30IjBI?=
 =?us-ascii?Q?S4yoKWMvisrVgzlL8K4UXIJGIt96DsriYo1CC4CMZnxC+woMTI4N7pN1M1eM?=
 =?us-ascii?Q?ooJgog3L85mo11BvmBDfQAwOFubqeYhwJIQjmloz+Tl9VyC61piWYeYqHYET?=
 =?us-ascii?Q?krvTCqSUC3LlwVWNLW9LqM3W1am93WQIA4k2j+XgcLT6BsFyQ5VwYjVQiQrP?=
 =?us-ascii?Q?bGE/B7slXvBXtGb1R8ZzzeklLW2mQcozZZbiFp07xFuI9xzMc6g1nhjNxnqM?=
 =?us-ascii?Q?YTcmKrvDySUPdwL3TMIfamQxfk7BisHcR5gGCDCHqiMgGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebBYxR+GwjjvAYthIMAGixAbxtCn+CD6wrJDiHW6XvYDWs2LDGY+6ES6Cms9?=
 =?us-ascii?Q?wzVmLrity5fQxdAl9PYhyhszoTfC10MjqH62dF4S9o8JMLn8/YhAS4mcJ7s7?=
 =?us-ascii?Q?LBy2ZPby5CiipWanYoC5sERZs//QuIVivSShQAJGK68vPc8Y98FQhhO/Wjr3?=
 =?us-ascii?Q?Wdu7RyvpVu46G8szPVtHcgW6ZszVlb74E/OGiBi5s5U8KupwyOo9YmOWA38m?=
 =?us-ascii?Q?N6i8UT/PJPcawZK2yjIWGwDmY/D4mtksLivnvStfVjCPd+MpndTl7XpjJjwc?=
 =?us-ascii?Q?CwmVVFzkp7gs+vDybQzuXK9m0g8mI10RbWciJU/T7xouOMDV1cvnBj1x8CXn?=
 =?us-ascii?Q?2704ddTDBHy5hi0GsfLWbm/p/Xf6EtADO0hO8vF6r2m1pkU3Th7JsSUl5HlW?=
 =?us-ascii?Q?+7Yey3Jha+MM/Tawyy7I7SfrCrwhuSNAjfI/Dl4p/JEXocdN6G4c1J3ksB1f?=
 =?us-ascii?Q?T7quxx5HDvWk4vBTDmA+BnCvbG5n1SfAejMlzZyS+koRhNzYzWrTSyibDFSx?=
 =?us-ascii?Q?HqhqbBMp7v2KGzSwDcGNAuyYxqM/+Yfk0xz+8668uhPWwOee+7+R0JAddphM?=
 =?us-ascii?Q?kF2nl1yjtqss3cdRCLkBpw7ChFhnTKHnUClxDTDpNmlRSDgR0ejuERnxedVe?=
 =?us-ascii?Q?dKqPx48sAck9VLNUqm0RXseRybPkVPV30iQvOryZLDs4lNEyRgXBwAEP1W8U?=
 =?us-ascii?Q?kl/rZmh6HGG4KnNT5T9atwwmXSL79AwZnIIN8qJqmIUKW+jbVn/zj4QB01GR?=
 =?us-ascii?Q?7pbw5touYvc5wbUv6Z1TB92WTZRYy8U+iTYhyhJ7Z8yPzn5XDAxFR+qldVH0?=
 =?us-ascii?Q?i287AeSLD2W0psfspRiDiOigNiVDKZkAg5JRqZFM75rjXV7sxf6oG59X/KMR?=
 =?us-ascii?Q?7aj+2POo+1kPGDyDzZGDR5Yc/qdH7nxmYbS5ydta3QRY2edPPnHU3MwZSDXp?=
 =?us-ascii?Q?L/2iXA+cyRpiNdBfEJbznx4Mf3eTe3ePzY9cY2eUH3dQPxUbdUNZEeiIxp6U?=
 =?us-ascii?Q?swpN/vzcwT3sl5V3Bldu7fwu/mvx4mXd03xVPRY7Wg9P5symRqpJ51pQztEO?=
 =?us-ascii?Q?CMKoQS5AXgXjDf0lTUS4RzmdpZNBa74wL1qvTPH50UpWxKqpOkss8cJafC6U?=
 =?us-ascii?Q?axtPKRr0yNy7bT8V5C0wmnMhRZA0/XYSR7j6cm1LVuACqTmdBCwqFbi4hswt?=
 =?us-ascii?Q?gEl801Tmb+EoTs5Go9O8cx3elc74aFEe7Z1jErojCymNFc6uZgmt7Bujs7P7?=
 =?us-ascii?Q?ExBbp6Ft51AaE/DSia9H+CkDvJSN5l1GuDugk1aX9rU9/yJWRxQ7YpGwp8KW?=
 =?us-ascii?Q?keiTmelIfs/JCnDXryUTr+zA4pymh5FRcniO1vyXkTmUSocHDOti7RBc+6fI?=
 =?us-ascii?Q?lBpNYZmCSHLdwvOkry//Ta6RWhoikPQQxg9qkoCuDNSqIKRgue27eQ14ic0X?=
 =?us-ascii?Q?YYkNe8Tf5QHBY1QimA9+plqVin/dL+3A5rjanJjCUo1QmgyYiHHA/lTy32Ud?=
 =?us-ascii?Q?W639448zKiAWxW4yGE71KYicBIekOuGTlTqkPbtvtu6ylJM/Bgqsq6kYL8SQ?=
 =?us-ascii?Q?22IdDEbEexMnVrDWanfjMmsmhjlRnAv/04lDz035?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c4a59b-704d-4394-593e-08dc970b67a4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 00:44:01.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Fuxc4kMqwIIG/A4mgj8mbo3uWTr3DxPY/uJHhTnNmx18yJhyr77n1I7yVF0qE4NB/AbbBxr7NlI81R/wQOfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8126

Changes since v2:

1) Used wording suggested by Miguel Ojeda (thanks!) for the 
   documentation patch.

2) Added review, testing, ack tags.

Finn Behrens, thanks for your reviews, and please note that out of an
excess of caution, I've only applied your reviewed-by tag to patch 2/2.
For patch 1/2, the wording changed a lot after you reviewed it, so I
couldn't quite convince myself that the review was still fair to claim.


Changes since v1:

1) Thanks to Alice Ryhl for testing and reviewing v1. I had to drop both
   of those tags for this v2, because even though it is small, it's
   different enough to invalidate both, unfortunately.

2) Adopted Miguel Ojeda's suggestion of letting rust_is_available.sh
   report its results directly, thus improving the output, while also
   simplifying the patch.

3) As requested by Miguel, split out some new comment documentation
   for the rust-analyzer target into its own patch.

John Hubbard (2):
  Makefile: rust-analyzer target: better error handling
  Makefile: improve comment documentation for the rust-analyzer target

 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)


base-commit: 6d6444ba82053c716fb5ac83346202659023044e
-- 
2.45.2


