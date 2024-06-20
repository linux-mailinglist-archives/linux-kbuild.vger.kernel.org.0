Return-Path: <linux-kbuild+bounces-2229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65F9113D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 22:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 098621C21CB4
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 20:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B37691F;
	Thu, 20 Jun 2024 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rlglWYuj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCD474E3D;
	Thu, 20 Jun 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916941; cv=fail; b=tgJpKHy8jNoau/DNfkPiGBygTGiIqYDUjqGNpLZWCQG/iI+dNrCAqVR7iSms5WLoRDb1CJYCQXu9+S/RytF3l3voUMRAcz+twDarLUIsVByEeAY215wBcrkaRAz3Guv2vE6MNkYqT5NTECG/aA58/zrwF04cNYP7hn0/iNYQblk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916941; c=relaxed/simple;
	bh=TwR/TyFcHmduH1fgy35WYfE9GArGTHl3aHPdk/pUQyg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OwC3EUeu9ubdymRfeBnKepF8T7qwU7ACschkpxE+NT5rr8MB5ZnyN5GYeu6cTkFRQCXNsDkQdmZPu99x1obvwFxYPNtlu/3t+UwuIWABiDNeDUI6Q92CqJA+TSFjKedF1WNQOgwjxsFJaiwMj/YkQ0uy1yTJtQkuL5QMCqvTDxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rlglWYuj; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpFVLdq1k1omJyxb3NJubpvWb5YQyfy99dxetIRVeZ3rpXGHOca/CS19XhrYj0b6qqOXIdGmyVd8Gt2t9Gz27MRNXdcramaISg0Kku/hLwFUhGSG9A2aiLknSQMFTkezwlSfuxpXgBiYc2Puo4DDCyak2p3Y095sf3dBtzJn+CqIVNSuNacYBjjuzfEkJ4sFSLag6YXn5N1DAY6a9TSzThBBGuddw0+58WVbuSeXGJ5RkRDUVLhSqwKVnWuX17uEb8j5CPJp+BpyvtA0JH+1vXMG68DnuE9C2ye/NHvz3BBitde1LyOCkADHx2YthWXRpg9LjJwn+Q5IbMEGaO8DuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q+HkKjqxo6Pj9emwMiPZR4Y8yvE9ZqyYvu72pDV1t8=;
 b=XeY4oR1XaC+Aj0sCalA4+vzkNGlXdVbOwqTvpxpypQSN2hX4J0uGl7S0bzk1lDlGlX96mKqUUBwura9ro3lOAfK3Fn52++3A0pjQ3LyxJj33qxO4hCvZRR7zDnTUegcyJfGN4pwukT4KEom4OX7fNaT2KG5uGMgeTrLaEEvQXpZiJr1mZnTNWJUVpxKVHjSA9mrVOC/lQaa80UMHYe9uqHjN7wRtgvJYRpVwCqibQMmFRaLOTXfsFYcaaCJmBIP0YsXhJ7o2Ow1alh4FxlOP952qho8w9WKvajM/E3wLJx62x51190USx1fhjgp2zlNuhjPAlN3BzPcrmf31ShH6lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q+HkKjqxo6Pj9emwMiPZR4Y8yvE9ZqyYvu72pDV1t8=;
 b=rlglWYujQChIGixqFrHEIbwa6ua3L+h2hx1kPSgq3GmHIwX4bCEibUW9FpWDe/tr6BEJlqw+QLhtIUbTyBVSsAb8AV11uujUAZXMCkIZysqosA0Sd4Yjtko+AbNc9EGx6pZwaEU2hhRPiyUEU1OiHugV0ystsqGVKOxA24ox4Uvpva0td+Ww8/TlLrcg6p6Gg1KYA1eXyCz/4XV/BWDQ47JVJgN14Ymc2Sy+5al1HEnIbliOv4LvDieWbqqPs0/Kj68XOLH/+wwXymFRDzONAlWuKH8LtPCgvTMq3YJkN52ddLVhxLbeUZ7Y1bLl7rgShYtLXMviqawXZucioxUI0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB6725.namprd12.prod.outlook.com (2603:10b6:806:254::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 20:55:32 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 20:55:32 +0000
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
Subject: [PATCH v2 0/2] Makefile: rust-analyzer better error handling, documentation
Date: Thu, 20 Jun 2024 13:54:51 -0700
Message-ID: <20240620205453.81799-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.45.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:74::14) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 7051d87c-ff7a-464f-a300-08dc916b532d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|7416011|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HxGlP7NgVipA0Q3EXrOLOhlVacyVaWBm6qTIQ9M0hZLS4AHsFHAY80VQamR7?=
 =?us-ascii?Q?GqfBZPHxT2T06j1zP+A2UuXN0gVNi2mbQ7jGop23jnU9YD3AkvM8heVyYVOX?=
 =?us-ascii?Q?i1FaOMwLKGL2fNpk8y2rJfoj6ehQbgYgbnLUa8w3EBhdvNtcIGdHtxsRydkJ?=
 =?us-ascii?Q?bBiRPYYwAZBrKB+g3YWm3++b4GGjcYFFiZ8T4M5DWCSEbDAuklk3YK+oOvG2?=
 =?us-ascii?Q?z1HqQwZJUDOPpFpG0/uVna4TuKHGA7RbG0FrhE3i46McMSTFrLStP7OZLqR+?=
 =?us-ascii?Q?1XydcNTSmcqRARRx1cRF+Qap+6pfKrcMt8KltN1Ho9awqTfiYgefATDFbN98?=
 =?us-ascii?Q?DlxJuBaou7Pd8o+B+rdiJInMFR25bBlMwqP9gkO39QNM3CkGKMTKddWWocmA?=
 =?us-ascii?Q?Fi1uIdYXf0G9rWrkYDvVoEnrtUg0GVxtcIDPq9WoZL96XcWSwWDwNW+Zqavr?=
 =?us-ascii?Q?gUanWDIqBYvcFVeWTw1ugeYxavuyhXQ9YaCF3jHM8DtWsu3khLsLi26OYp67?=
 =?us-ascii?Q?r7MqMrgMAVMbZDstJFvjO+5GU/Keb8UlSk3TYzEx/mCctlT7xr096wD0JJCK?=
 =?us-ascii?Q?aWsDJoTYzMfe62Z0vHrLepv7FqCBmY2/SxM0VJNC64gvOxjhiQDBnTxr5lJL?=
 =?us-ascii?Q?Gfu6siV+ZRiDdeKRMqjYAAQAFjM1X4BlcWi7m6UJvxfMZ5mcuDXNP5hmhltw?=
 =?us-ascii?Q?1BRjYRaI87kij+Mr0G6trm6mNFbzBir8ZbmFlCKE2bXzuvdzEnnqHDwn/nLx?=
 =?us-ascii?Q?qtRKZp7R2I4VCs0XxaN9uqZHywNtDBnXEKw4fzYOuxcJYL7UXmpcNTsGpQ2l?=
 =?us-ascii?Q?Z6fVhEDO2Opd3/JHywmaArAgfds8BuLE1UynAkUtEqogKyeDHoJHu55lbVaH?=
 =?us-ascii?Q?YpJaUBWNwcmM+2qZTJUFDBAD23cKY0pwR8eldVmv03r3M2z28qPRJYaRkdzA?=
 =?us-ascii?Q?GSrJW7aO22toIBovEtnoXD4NMHmnaTD3oO2adAxRNYL3DBp2pHFeVOXpnThF?=
 =?us-ascii?Q?lscJYIhd4HjztG8j+hNbVcpa2dd0JyBMqeSZBmT9CIX/JGgsbIanpOO421oR?=
 =?us-ascii?Q?qWqaVgkct1yHx0xj1C9AJZbIXFSksBtTUCRxuUX2JRoGDPj93qJ3OKDYQfb4?=
 =?us-ascii?Q?UpDXhjXUUu4EzN+aEMQ8Ag5ZaPQGPB9jzFuhBzJKvVwmat88Cx58whMmhBop?=
 =?us-ascii?Q?HmeCiXWvikEHdOeHWmnLx+LZQ7qh6wTEp4UgSSYKU6pV6gMVQwbNJbwCUMsG?=
 =?us-ascii?Q?HzLWg0t7LPxkz9Pr6/M2+dgEfZVd5xkso+RsDGoK4Ef4eVe7+Y4JbZSkciB6?=
 =?us-ascii?Q?dYfS+U2LqmMl5zbUVnVUexbi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lEFu3hXoV54BG37bqLn98K0agaDd5K3oSFGD9yLN+HF1BN4OAf7Yqv/oW5oL?=
 =?us-ascii?Q?JmePIwejiIgS9zarxb4wg8liNStTeqF0oZlly5BubULv/jsY23ME4+yWyCy7?=
 =?us-ascii?Q?NP6bxMsbLKERxXBo5K1OmkxFdzn6xNeHwQ8owGdP5Th1jU/g5hcL7qVedR9G?=
 =?us-ascii?Q?xOoMIhusjJ6ppDW/E9h/KpUlmLLegfKIxdrDEXn76TDJjuqkeyfu/zb3jFW1?=
 =?us-ascii?Q?PlnsPNg605AXXg5D6Rrt4b3AaHdzQXS7yTIkwfYrZeBMWuC4NMviHlOiHRy/?=
 =?us-ascii?Q?/YTNfgzU5JytrZn4pAqfkkX/+7a/NqIyQAl2UFIy0EOfRzAw8oml66RwHLTu?=
 =?us-ascii?Q?eoWrJY8TXqsfOH1gHeAUZjDL0BjnPTe1syrrX1i/71md0ROa3OT60/ai7m2c?=
 =?us-ascii?Q?Si1c88lNcKGRE3tlUbunfL9O7I1fuLlOHS0xZGygttmw/LNEgKy8s7SiR1Q2?=
 =?us-ascii?Q?xYYgo3iiZE06HlVvA5d4JMKMWnt5jTsM1Q2BKHz2hCKdWtHgFOFZj6Kaj8UK?=
 =?us-ascii?Q?C75ImhNWaEiiE6WpUyC39t86lnxuJiyZ4owcjKIHQsmXkn+AbyCBDjLPgBxl?=
 =?us-ascii?Q?N6g+LKMIVHcB0yfXgmkGtOan4L+ssCj7f2bxJOk6759UHtlVOCMGP2fMRD5B?=
 =?us-ascii?Q?bki5WgNvAu80of92KLYW3CXuRyBPAvK7EBPxLHXoUQBTw3bIm3aepnbFOv0W?=
 =?us-ascii?Q?M3js/JF9My3DHUHqatk+xFxcsUGos1rGWcZifgActay0oHcqPgllEwmkEEeN?=
 =?us-ascii?Q?CSDL8RyETE14ncdG7g1FoV0ypb+27ZraQlq9G05TwSa+h50m2e8NERh0q4lo?=
 =?us-ascii?Q?kO2XLhBNCwdukivUJz5M1wqhw4muroBHawGi+z+6CkEDPjrpPrQNFgYrGOk8?=
 =?us-ascii?Q?cZmSzbo61O9Br7SvN9YI7WPE0bc+J/sAJxNfdpcRR8GBzGO6/iBQTVirZfQg?=
 =?us-ascii?Q?6u4zjrRnghg29ixLvX9W5z2Zlide4uguUVBpIyVXLpVazZrfQlRnBZ1hFj5Q?=
 =?us-ascii?Q?olFGBXV9pBqHtdf7A8Snjji23k9PYDb1roCNFoxWPyBzY1FcomAJDvdPn8YG?=
 =?us-ascii?Q?ZT6lcPz8edTWkL05sYA0tgN+y8PvcqfLC46hWUi17YOEeMOqKreZ0L8/ZfeX?=
 =?us-ascii?Q?IWSVsoe91zEJI71Z/o9N3m1K+Mq4Ig+FY/dibvPztla4bWZT61/MF7GwTpFf?=
 =?us-ascii?Q?zhaiBzAKNcMPrtzJexU/Gm7ySPov06opOvJy2DA78ZylySaxg+cgAzvyp2ft?=
 =?us-ascii?Q?5DWuFt1H+v0x1z8/xLzipHHU99pOS58+HQiOAoY+lyVgo4EHhQlMKlOl/5ID?=
 =?us-ascii?Q?HFrcheeaYZTWGAQxEPqDiaMQpaz9xbNyVFHbtRjk8RoCuF4aIwzjEJMGU9eM?=
 =?us-ascii?Q?0jraooCV1GvjFnBcDOE2FoS3uOhHkkNnAvqccYMXTtoFoZOlmboQRKFkehyZ?=
 =?us-ascii?Q?nCT5KllSozqiUImG4nKMOAAdDJSsTn/he9YixyRNcXgeisqHgvyuohQ4tQ/l?=
 =?us-ascii?Q?Vd3BhjJqJFOtvYUW5esQbaPZGc1kYQupvLWsTvNJfXH+eHTH7kw3xs/iUrYi?=
 =?us-ascii?Q?uinsmFY+Rz0H6zZq6cVNxxHejK8fEx228r/1wZQjKjLoWOW1og1O/ihXm3gg?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7051d87c-ff7a-464f-a300-08dc916b532d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 20:55:32.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7oNFVfNVO+Z23wiOf0cE85/8bGRpUv8rRIif+ZNG63RVyU89nEYOFrzA2jmHX0jKMeZ2i3/gJEjfcATOwQejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6725

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


base-commit: e5b3efbe1ab1793bb49ae07d56d0973267e65112
-- 
2.45.2


