Return-Path: <linux-kbuild+bounces-3497-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A39736D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 14:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED260283D36
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 12:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC55F17BB26;
	Tue, 10 Sep 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HkF10VhP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382D18DF97;
	Tue, 10 Sep 2024 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725970156; cv=fail; b=L7z61FPoEX37dEkYKxDYV77m3M3PfDL89NYBvxvIVQ7turWe7E7EMN62emC2ssHCxB6ORRQ2Jgbqy5SSfFJIXRPTModSWslWV8OSXPu8bNraTSwcN+TD+XUQSOPiA9AWTnDbFKSE0OOZv39kWx3psq+C6GQi5OOWSdH2bQlDcZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725970156; c=relaxed/simple;
	bh=RJTbUEQrpEi7JL9JV242l5a1M0uvUgQtoZeGFUoGfa8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rau/Jb6qO9NaWERcDps1n02hWJi/aCoc1Ivnx8+26o7WFoF22ZrdTA+z/dy4hv2CIObHQ5ryxqzY94p+jYFk6TIsWWRflb/liAsEQr6rcsO1AErLnVrBMc25/hZjXJv7okQlJy8yhPue0AVQ3ohCHI3hEmNgDdQEPEzyOz4dMnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HkF10VhP; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu872HUJplKd7hXtuM5taHJ5GZue6pQ8vPA10vBSmBqZJCW+6UrIwfJK0Uxnhnu2CtHb3HqPhyOlrcQdrrnabEsnaUtKSOQ6Odx7mqlKXvCaEUuiGlGFE70NrUitT3Y5sT40O3jQr4A3Jaj1IWj9bHa5coGunNSwJbPZCzeUowtjriAU2NeoRB4ryE/3nVV/9AUi2XNiO4W0je8Owb7tu/IPuKrTzlVoasc0vq3IZ7nP4BArDhQS7S2uTmwLqK3+lSXE0T8EQkOjfr3IRx0Rzk8G0PU22SlxsnhssiF8o0wHUl9h5Xhf3Csj4edEM4Uo8i/om3uEnFrs0hrBPRA/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8U+ltVPTcbgcHAhNrq4yoooAF4W0f3Q9A3RyQ+YZxk=;
 b=ImYjIWYQhynmOIHl8qso9JeSTPCoYo3uTRSQVHeuB5W0xCHxamq07oFFTRECR5lhO3A7vP+au4syJ+IIRFxLTZDMhD7Ao3DTsuKQTjiVuAw0uLkjsqSFkiaW5WeRzuCrjsmK4sryLgOzI+dPqTxRmpqDRUPeVif75gKA35Je/MmO9oYnsC+i9sre5Tr1+RJ6eMy0UVvQa00Gwl9eWbiMBcAENEVjicadychLBtuv0uXBZK0XeO7iqji7NCONG+JeYyiHjQWfuHYadhRVyccVrQbRNUnSpzHxDSfr0QjCJ63fjNAHv45oPRk6pdQl16fbythxfGaoAhxG1lPDuldlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8U+ltVPTcbgcHAhNrq4yoooAF4W0f3Q9A3RyQ+YZxk=;
 b=HkF10VhPTNEu/0hPu3pRIrqmN7U1UzbjNcA3Gsjn3fhHSv87+2tde2kS4gttOM3VndrqU0DeIHHIP1v2+RLWKPmT6TevaI8rPJcS4q7SBadsOt/+W+j9vCi+RA3Lu2OPNjK6S9PemBZ1ba3s7rYl55xZ8uDOqA8V7bAMYrLk5Dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB6826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:326::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 12:09:08 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 12:09:08 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Danilo Krummrich <dakr@redhat.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: Adrian Taylor <ade@hohum.me.uk>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] rust: enable arbitrary_self_types and remove `Receiver`
Date: Tue, 10 Sep 2024 13:07:01 +0100
Message-ID: <20240910120721.107877-1-gary@garyguo.net>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0363.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::21) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c45351-b94f-47aa-c8da-08dcd1915f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RnxxJ1D+76GficdtK7pKmF1WFOgvmTh+VJUtlhV+MqlZeQld8kbgQBPHQZ/K?=
 =?us-ascii?Q?LGaVaF7niIG5orIoly8OIaJ98ly2IqubTIoqH66Lz8KCMxMEJvH+Ea/oMMvH?=
 =?us-ascii?Q?cZLQOb/8y2qxdlsC0ws/lQmJft8AXbED5VY0DqDyCLzrVipKsh6fLqFVSXWz?=
 =?us-ascii?Q?RiP2Ox/Cm+ZhOmsY7SsoHt/pUwUVo/eEXcxTsrJadRp0mYxVAJj/b1KW0P5k?=
 =?us-ascii?Q?lDpLnzbubvFg4miPa53gWNy/Jt+uTrexMztDoeMSe/6WH9Yk0PCZNXJrIfh8?=
 =?us-ascii?Q?aSql6Xyexe4IEKhZ7FWr2F/AxAK5vm2n7xWAgqnBQ+IWXc+tEpSLROXVRqAh?=
 =?us-ascii?Q?UWuP8A9cvi9EzuMvr6zGoq0gaMAuB6Wx4RsbXSKt6f+/Iu0fc7Wz5s1NmxTg?=
 =?us-ascii?Q?XPWbynv/a3qEucumjchaa7HlAwS2/4GiDKEso8/XncvPjKvOmmBwazXnWjGo?=
 =?us-ascii?Q?CUpxAVLOL2vd2h7hKETVYDtycUKTtC3QS01IWF1NcZKPCX2mEXd4iqqExIQQ?=
 =?us-ascii?Q?vt6FIM0q53rgm7Z/nVjJhkRPEDExFzr6DCcO+44DSrTxTY+1Wgc+GVE8UPwF?=
 =?us-ascii?Q?UakxEQpgrwccjB3iYtps5FBM0VxVoU2f88K57SBmaskc6chMUOhj56U1lbCq?=
 =?us-ascii?Q?DFwmGWRovNY09JUP1nKwpJWx2rdyVrpKLvfOooMPmgtf7wGNHYbT3U4+COdV?=
 =?us-ascii?Q?v9iaxH9G+ehc7p91HB4PcynnjnyTfjeeKavmyjJ2BgKtrNpDR48srzZOwKmt?=
 =?us-ascii?Q?o9YMOfFdnjRgtV0pPqEWBT1gNydiEHeuw3m/IRGfELzaB+0PyVpLG6ivYpe4?=
 =?us-ascii?Q?w0KhFiwNP2vzDSUsrLGKKn1oX5WSaPcPhMsHiFjqriOw+ZTFDsQkwxNgvmTZ?=
 =?us-ascii?Q?FVRyb9WxSpIjZM8sdCvbvMllfzOShn6BIkLAY9bzrugZlPR5Eidg7hytbmxN?=
 =?us-ascii?Q?puz77hlFS0YMNWMVRxqP7BV1pBMwAxSkwNOOCRBb42qp3/1+pnqz95cNfX7b?=
 =?us-ascii?Q?J4aTS+L3waXXRBEkROCQf+VmDX36bCU79Dt0MBv77t96XY/2bYIudffa0gO3?=
 =?us-ascii?Q?b/EMYL/lG1h4upWVicol7guUIp7XY9LNWzGGoYIP9ptMerRJiNOwqep+lWHZ?=
 =?us-ascii?Q?qx3j2VoNoWYPk4LtcKbK3fzDp+U3OjrbTMcrxmND4Id2qGlwAT1DhYz3SFy8?=
 =?us-ascii?Q?Xauu0Icm6q9kNvbQUO4v0m0NAa17N0uCSQcEBsfQ1fVwzv78fgikga2SGNez?=
 =?us-ascii?Q?tj1DQCGBrh2oZXCpFjNb3cqFwBh1M4UJe+IuTJE7KBZ4EB4vEyjAIVEOJFg9?=
 =?us-ascii?Q?HoHqOoQXcO18YPpZV1gXXUB5NJJn7d4onB+t6yLmLZBroC7oSEHfumzxq8H8?=
 =?us-ascii?Q?vX7uXPij85TVx6tuoYpBeUOVuYRPZUUT85aagQDviejuZwHVbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjserKxlUjhmJKLmKDe7Jl76rcTUzGwA51gnYuLlO84Av2L+ERqGYiITipg/?=
 =?us-ascii?Q?zTK0/UpjVAcFt1Jf+8OQ3VitoNXWyAfHriChbhWf7p+iiyTpMcJXUxg12h9c?=
 =?us-ascii?Q?fuYHoPgYxEAq0hmR/2T//02WvsG4zkLzH6A9j55RVzUNbfa8X2MkjUdNxZdT?=
 =?us-ascii?Q?c3JF7abfXlSrE2mSwEtPNv2opQYWgvri2cD8ov4oyJOBrWKe2OUTZaSiwzHo?=
 =?us-ascii?Q?EtVTr8lqBrJjhMdSjoo0xpNOAP0zR1tbF+lKtWkOQQ12I96CDDhSMpe1Zy5S?=
 =?us-ascii?Q?349QlcEMNjvV6wpwyp3UNFXxT1wCsLQsEWP7siS8HQtzJnv/l92yDsK8ioMn?=
 =?us-ascii?Q?Hk6BycpPuclJUXYPVO/pJJ9mWKHTgPSAKDDoFUcdmza23fg2mswPoxLbCNsB?=
 =?us-ascii?Q?99lKZ6/1iU9PlYQ1fUXtSzggLT1U5IQKABwQfqY8IZW+NlIGLEKl/aFZaZQf?=
 =?us-ascii?Q?qLJqYUee8GEEBzF/jHo6oro8IL1XTCT3OyF0uYS1CXZHotNYM4fTCF21e0Ao?=
 =?us-ascii?Q?+pJRztQBomhTVVqxl1zvh2vBZaGQJycXuCUfyQ6fF7rhWiJD3aJL0DREN1gz?=
 =?us-ascii?Q?M+t/LBFQro+6eiYJUhgOHICoS3pkDBkgD292CsxTLBLdHc+Wu0IKxu/ZUndw?=
 =?us-ascii?Q?S3nO/QftnzKhykX7/1+uC3q0ZsopO12QbGj8H8k/yhmVCY9Y0bKdb5HI/FE3?=
 =?us-ascii?Q?XfjEX/Khv/WtvHGQOZWtRsDGxDOuE7a2OpX6QP70zDduOABpU6hqAA/pVAcK?=
 =?us-ascii?Q?y3KTX7UAkvjueYrWLc3eDQ1xp8yOm9KS840PIOcSrdAvqfw742KpLRU3yppY?=
 =?us-ascii?Q?b/wlkMvr/M+8BeMDOsDcc9p6vGYCzhDpn+WXjauAKPgHHBzMHpldzCfw9oAL?=
 =?us-ascii?Q?4Tp39/ObWKaGwLwbakTnOTzTJ9eGv7TXKZHbJBadyeammD0yc6lWIIBUg3Xd?=
 =?us-ascii?Q?5+d69pGE2Bx0OAUxg1duynVpuXanxKdPFuC2bZWWXllXAeU74zYmL78fEOj9?=
 =?us-ascii?Q?y5IcBi2/1mcLuj/Zn6k3rGIsO1bvUNP9KpkNEBHcCmnxQ2vRLljdeUU7t/fS?=
 =?us-ascii?Q?p1lpEtfSq0ghWY77aorsUWzawzmuiUd5B8OpktZUMVK8e/EDlole83lK/Rxf?=
 =?us-ascii?Q?S8HLWBfrbWh7kLTZITwVjMu45pQcP+fXYQJpUylnoSRITQIb4VWELUSO5M/P?=
 =?us-ascii?Q?XIkql7Ch9pdAu/ImmyniYIsx1bCVtAbtfwsleJB5Uh6zyyk7TrC6GQ+RhWCP?=
 =?us-ascii?Q?8Ro40608PaGqusGPnRj6+EqWITd834S03scce8dG0V+GWuJjAdHNBHiRL3oo?=
 =?us-ascii?Q?GC4/OMpbySfclre4CZ8DpgRB6iCW/qTSUqv+NwjWeaMiQfxrHlcPSLXJZD0G?=
 =?us-ascii?Q?g4irICDgvhimZR3fuQtNKf7O0THSf6Sw3lfe9/rA3dLgxDWOyXAoczGFRJ0q?=
 =?us-ascii?Q?T9reesh0qbbBGo7ZkhdDlwSZP5I7wWNaS23inqjghCag9Gx3+MG8j4/mjvNT?=
 =?us-ascii?Q?c2GBYV1cNKQ1o0Qq1XISdppdI/oy/3KJph/NGg7OjlOOne6aAjJ4G1TNK47C?=
 =?us-ascii?Q?NNY84Ou0ofzejA/oHwCP+E/NC6IJObU8/tKcvKWn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c45351-b94f-47aa-c8da-08dcd1915f6d
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 12:09:08.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaavHlCCf3Vbkl9yGatdXXIXUrqLf+JD8/uWNQsCp8PI3MGCLVB3lx0Z/+GjTPKak7OohAGJscCibezY5QcenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6826

The `arbitrary_self_types` RFC [1] is accepted and the feature is being
worked on [2]. As part of the RFC, a new `Receiver` trait is to be added,
and it will be automatically implemented for all types that have `Deref`
implementation. This is different from the existing `Receiver` trait
that we use, which is a custom implementation that opts-in a type into
being used as receiver.

To prepare us for the change, remove the `Receiver` implementation and
the associated feature. To still allow `Arc` and others to be used as
method receivers, turn on `arbitrary_self_types` feature instead.

Cc: Adrian Taylor <ade@hohum.me.uk>
Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
Link: https://github.com/rust-lang/rust/issues/44874 [2]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs      | 2 +-
 rust/kernel/list/arc.rs | 3 ---
 rust/kernel/sync/arc.rs | 6 ------
 scripts/Makefile.build  | 2 +-
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f10b06a78b9d5..35a65a085bce5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -12,10 +12,10 @@
 //! do so first instead of bypassing this crate.
 
 #![no_std]
+#![feature(arbitrary_self_types)]
 #![feature(coerce_unsized)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
-#![feature(receiver_trait)]
 #![feature(unsize)]
 
 // Ensure conditional compilation based on the kernel configuration works;
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d801b9dc6291d..3483d8c232c4f 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -441,9 +441,6 @@ fn as_ref(&self) -> &Arc<T> {
     }
 }
 
-// This is to allow [`ListArc`] (and variants) to be used as the type of `self`.
-impl<T, const ID: u64> core::ops::Receiver for ListArc<T, ID> where T: ListArcSafe<ID> + ?Sized {}
-
 // This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
 impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for ListArc<T, ID>
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3021f30fd822f..28743a7c74a84 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -171,9 +171,6 @@ unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
     }
 }
 
-// This is to allow [`Arc`] (and variants) to be used as the type of `self`.
-impl<T: ?Sized> core::ops::Receiver for Arc<T> {}
-
 // This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
 impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
@@ -480,9 +477,6 @@ pub struct ArcBorrow<'a, T: ?Sized + 'a> {
     _p: PhantomData<&'a ()>,
 }
 
-// This is to allow [`ArcBorrow`] (and variants) to be used as the type of `self`.
-impl<T: ?Sized> core::ops::Receiver for ArcBorrow<'_, T> {}
-
 // This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow<T>` can be coerced into
 // `ArcBorrow<U>`.
 impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 72b1232b1f7d9..56b8c72687255 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -263,7 +263,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := arbitrary_self_types,new_uninit
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
-- 
2.44.1


