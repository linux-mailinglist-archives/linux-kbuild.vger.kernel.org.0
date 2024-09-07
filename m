Return-Path: <linux-kbuild+bounces-3464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354B3970390
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 20:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43BCA1C2167D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 18:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4FF165EE9;
	Sat,  7 Sep 2024 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="srBeN+Uu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2051.outbound.protection.outlook.com [40.92.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C899446DC;
	Sat,  7 Sep 2024 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725733147; cv=fail; b=GXiMnjnEsp7mOtyc8RAQ7tXSjLjGc/tPaf8jAutYSrEwRGnf2FhKHdTBS86ozZkMfJeYkxO0R+ZppsxsFuh9LDEwuwVY3WmBb2dhC+WxGPcCKXW6zEDQGmLApgnv34GwJEPLyg+vqr6kCYVcuIEiQwmaCKBC3mm39qEUS74+GRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725733147; c=relaxed/simple;
	bh=FQqvZDd7hgT5uQJrcyacnuhbTGJnrFCKMFIOZPDeFXw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=glYB+6wCLWu5utUpLKMmeR1dXXa6vK/2JkyKoqltBI98ckUL3kHjQ6DGDfw64+toSfzpxlz3qL6fNL9bGjFyW+LuSWiizI6V9VQ4VHPg5byr+itzICnQeiScm+PBSLx7z52LS6JaaJa5vJgjrfZDZKiNLgI3bhVR6VLF5XcvUaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=srBeN+Uu; arc=fail smtp.client-ip=40.92.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4oxHwYbf6HryvWpTXV3I1nxh1gFDYrt5pC7VHopTcLS5xE5S/g+2azwMfKyQGVu7YC3ls0kazbzm7dPymjSkvJ4DBe02gvglexBCoBVkhCaBZ3G96znzj1p8pJWUd0hqcVUL29P0E86zeI0bJNiz4GSW+CaicvEA16le7fPqibjgr+9xnn13cF7hj1gBeNt9R24XjPil4eBnk1WKim77dvsORtwvm/rsC84j2r4XtXHCVFayqKz1RQGZQo8lcon81dd8d+anPvGK5kQlIx7BgqA6CLhyZxD1NplJMOTri6GzsZ/5JqxWgHhV6OHwKHEyYD+gCux0tQFxPMg1VjPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWwVb0kuuKqXV2YZ22IDGyIHW9GWaZ6tcxHLehnBkek=;
 b=OqG+qCE8OZY86YDOrjyEQwPN3ERaGk4OJQrDovdldtdhX1/S+xiSgCQugEswbyy7G/I9pmOKB+yoXcEz6ww7zm7WgZMN1gsw8Uo4znEnQeASwmvYi1sNF2S2hFN1PfzvoXW8k3I7ZJni1nQZLRNACXAzwwTvz2Q/o6Xn79j5q6rLZqv2P1DOefUokEmWfHT22gxSFxI/kw3eeydiQYb4fQ0x4jEZQttKVFYFDvVK100YmFYK4FhjBOGbxv2hg0Gk1iRnqVvo2sSVG8QLlntChYa7JX+myk/GNHs2wzvk5LiI1f/+fPVf94SdNbb+fJrSNeIhswi3oHL/iqb7irv+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWwVb0kuuKqXV2YZ22IDGyIHW9GWaZ6tcxHLehnBkek=;
 b=srBeN+Uu0OsJ9t+LFbKLCmBe7w9NGfuCNfePgIO762UjVbGBrslHa9dtL/Jv3vpu+OINmu7JXlRDsWtnrMTUUjHDraR+b5NtD18iQ6Laav7gAy23z93VPb9p5yJV/3v77htvPc1W4+eiuqG65xv4jfWk/n807B4hNz+Tw3wPYUDasQCKr/JLL4xZgkEZ86WzrICpih1uUgYW5XqgMcAQX78QM3KioAB3hZhCEWewZzpC8E+Lzf9oLE6CgKd0K2BOmgZs/cPjl7QEmHwW50HNKwXk481ToaVLvdfxiKF2KPQboYIYKX1iZN629pJsseA9pEukS/AhgGGYT1Iz0sy/1Q==
Received: from DM4PR14MB7276.namprd14.prod.outlook.com (2603:10b6:8:186::13)
 by MW4PR14MB7458.namprd14.prod.outlook.com (2603:10b6:303:22c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Sat, 7 Sep
 2024 18:19:01 +0000
Received: from DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d]) by DM4PR14MB7276.namprd14.prod.outlook.com
 ([fe80::744f:71ea:aec:9c4d%4]) with mapi id 15.20.7918.024; Sat, 7 Sep 2024
 18:19:01 +0000
From: Felipe Alves <felipe_life@live.com>
To: "aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"masahiroy@kernel.org" <masahiroy@kernel.org>
CC: Felipe Alves <felipe_life@live.com>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>, "nicolas@fjasle.eu"
	<nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: [PATCH] rust: error.rs: Remove dead_code marker and make
 from_err_ptr, from_result and to_ptr public
Thread-Topic: [PATCH] rust: error.rs: Remove dead_code marker and make
 from_err_ptr, from_result and to_ptr public
Thread-Index: AQHbAVIac1ken70rvUuV8u3ED48WGQ==
Date: Sat, 7 Sep 2024 18:19:01 +0000
Message-ID:
 <DM4PR14MB72760296911674F92C7A6C01E99F2@DM4PR14MB7276.namprd14.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7x6GlL97dhlrfzVmUGmezja0aETR8ic3FV15Kcdy9A98Qi+0iUIChf3gQLiH7P+Z]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR14MB7276:EE_|MW4PR14MB7458:EE_
x-ms-office365-filtering-correlation-id: caea46a7-9300-49fc-c583-08dccf698c75
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|15080799006|15030799003|8060799006|461199028|6092099012|440099028|102099032|3412199025|1710799026;
x-microsoft-antispam-message-info:
 nvxKjUoaJTZY81zlFkePgIAvngj2NsdNOFcc/t7FGghoM1MN/HWR+A/211LNsAAbw5pWntUtn/Uu9uNseCr7Xhrs6xb21mBjG4Cltc36MAeKjFOzdiGcgF/zf+j+3GmoeYVchnwHMpGPHx8uG+EMiDzfd0BEZjWcJC/mR5QX9rp5z6wwfWSfDvvF7BdEugCCnfaf5XYB1kBAmxlQJ5zPC7C+zHeSkke0pu/oUG/yb8L6PI2qdL7XRs+Gtzmtarqqc4ZvbpGFX7CNB35+ovi1pIL2usRaJXkGGeDf7a2S/tejGWnDjymF92sj2HrMoyjMP6vk12K3dI0tjwwEbjg94jIG9IJjTKxzaWbEelXVVSLBgY2AGR+tDcUCOtVcpSExHr6M/gOKZFeqnzQQQjxSIdLk6awjhszfQpXWJQJ6wuVusmBP9/xAyaBkH/PQSg79h/i9S0o52hLpaaTW4ROQqqKECVqQt2LMzInKyOLkrUgXIzOiL351J0Bk6TuzaJZmxmISRmGknn8Esv95haeUELNHWeOdq5L+fmtEBFnS8u2Px+/c8vbzzfdRy4ckAaMx5B00bj1AsDFSuRxVpk5KDUoc6gkPIL+HftkVmUqOLprIPEuSK6gKxp9MQAcYG2eqYk+SYav+ApaRnarDBs80FMz2NPL4APy2g+mYojRtslvRvcYaGsppXJ516KgRO2IgaHs78qLD6LBbeCmVCfETBJsft6cBw/wM/oE7G3xgbUSHb5NCQ2iPLM4rChNVdYabKOFbgHrAKiek/+COsZ8zlQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9gI8vf+kV7dYmtM24KMkfSpI3bkM5+9tLa9x7yAuuaiFEyT2merCM4L4dR?=
 =?iso-8859-1?Q?yhYkdUN2TSbW/DQZXCWW5Xs4T02+2BUhX2cjtwlBApA3nhx8vNzCC1eH3L?=
 =?iso-8859-1?Q?qlyscVQpJXYWsVfBTAxAHfDTQJLUhhblk7h/14k0dfnxc83R/H1cvhlfO6?=
 =?iso-8859-1?Q?edbHtB0qK9ZQ6snbw5xEctuBQJn7xIYD86bV4hu9oAnOPelbPoe0JrVdtI?=
 =?iso-8859-1?Q?cGSPiE47h5jTp0cmJ4PxKXIAc8TOHs4fcJgoxm3cYECYB2s9TKeGn/E0jD?=
 =?iso-8859-1?Q?MrnArSgIG+w47FBdcPIwWzRIKSaXL5q+XfI+D+LKhsJeCAifFBp8KsMFF3?=
 =?iso-8859-1?Q?m5HQEZzIk5fD4zgnswTHLO+18P7184abnm5A1SOE7NMj1rhU35xMo/JPte?=
 =?iso-8859-1?Q?KjTM3scC5ExJSRiUh7sABHvo4yjBx26/OqG3RC8ZkyGRyQP3m8lHV+n9AE?=
 =?iso-8859-1?Q?7i9G3gZTS+7aibaSJYEMJYC0oXF7zzahsqHB9RLTX7XyT5J44S2IkGpswj?=
 =?iso-8859-1?Q?UdiBIsopMRD0uO2M/jKgspndnRrG2NTtyE3xv8MBdjBoEvpqIrmb8qL2w2?=
 =?iso-8859-1?Q?tMOHrITpwbtkxNrG+0x8oOH5yedgDHSke7vAuCzGY9AVBds8+wS2VbVuYN?=
 =?iso-8859-1?Q?+O2wZrZo969+2sbKqBn4qaw1RQs4QxrT0k2Ou7AXbms7fgWzzAyKhm8/Sg?=
 =?iso-8859-1?Q?Da857EO7pqY0WWnN1TPr1NFQSLmTDou6+1e3QI58saZBIVjtz52pJzrF/W?=
 =?iso-8859-1?Q?DjtzuWk+fPbaSOki0Q2uZE8aJBKhnfPw9HCMHLsn7rzriJhKJcQ2XCwu+R?=
 =?iso-8859-1?Q?lmr9hfKFYFThrG08/qKhE88EubGvIuh4bxFmIP3ABVvByDvnRhoHsWc2jt?=
 =?iso-8859-1?Q?tkQKZYHJFYp9mjUL0hNDMxd+Gc/kiivPZC+xHJDiMrbuHZjMXYuT8ai6cM?=
 =?iso-8859-1?Q?D53L9IY93/n3pWGTsJEGd5OzkUJdvp4MDGeTSld6fBe+qdkOHHSMI/aqC0?=
 =?iso-8859-1?Q?lC3pW+eV6YUee2WUkbRHBYpVQLZ9rJQjdcQaeIRUCln0H8Yvtt3cayeuvj?=
 =?iso-8859-1?Q?veb4vnrhkL2nKKF5UeqlSu2o9zvIB0/tcWLMa1orlPdC82jDJFbKUUMQMC?=
 =?iso-8859-1?Q?XQwGCo2Xl8zODCFrqmMeaQVY0xfvvcRVjQBkwbALqsA7xy/Y2dZCXZHAuA?=
 =?iso-8859-1?Q?8RLbQg6xNyDDGmfiu9gJd6AMsudF17RfJhZerCTGUiq97AUZEkZTWlOapq?=
 =?iso-8859-1?Q?Hf8FM+h0hU9B/ofYMnWn1k9Gzl55DKS4z6OI2Y/L5UWcHxvrdso8tRARb3?=
 =?iso-8859-1?Q?hR9zejOhixGJsK1/SCCqXVDJ3MnlV/lZIkd7xGZAHIPtV7I=3D?=
Content-Type: multipart/mixed;
	boundary="_004_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-e4812.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR14MB7276.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: caea46a7-9300-49fc-c583-08dccf698c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2024 18:19:01.4790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR14MB7458

--_004_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_
Content-Type: multipart/alternative;
	boundary="_000_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_"

--_000_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2 Mon Sep 17 00:00:00 2001
From: Filipe Xavier <felipe_life@live.com>
Date: Sat, 7 Sep 2024 14:50:33 +0200
Subject: [PATCH] rust: error.rs: Remove dead_code marker and make from_err_=
ptr, from_result and to_ptr public

Remove dead_code annotation from from_err_ptr, from_result and to_ptr funct=
ions in error.rs file and change visibility to public, making it accessible=
 outside the kernel crate(issue #1105).

Signed-off-by: Filipe Xavier <felipe_life@live.com>
---
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 6f1587a2524e..ecfa6aa41034 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -133,8 +133,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_stat=
us_t {
     }

     /// Returns the error encoded as a pointer.
-    #[allow(dead_code)]
-    pub(crate) fn to_ptr<T>(self) -> *mut T {
+    pub fn to_ptr<T>(self) -> *mut T {
         #[cfg_attr(target_pointer_width =3D "32", allow(clippy::useless_co=
nversion))]
         // SAFETY: `self.0` is a valid error due to its invariant.
         unsafe {
@@ -268,9 +267,7 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
 ///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(pde=
v.to_ptr(), index) })
 /// }
 /// ```
-// TODO: Remove `dead_code` marker once an in-kernel client is available.
-#[allow(dead_code)]
-pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
+pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
     // CAST: Casting a pointer to `*const core::ffi::c_void` is always val=
id.
     let const_ptr: *const core::ffi::c_void =3D ptr.cast();
     // SAFETY: The FFI function does not deref the pointer.
@@ -315,9 +312,7 @@ pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*m=
ut T> {
 ///     })
 /// }
 /// ```
-// TODO: Remove `dead_code` marker once an in-kernel client is available.
-#[allow(dead_code)]
-pub(crate) fn from_result<T, F>(f: F) -> T
+pub fn from_result<T, F>(f: F) -> T
 where
     T: From<i16>,
     F: FnOnce() -> Result<T>,

--_000_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"background-color: rgb(31, 31, 31);">
<div style=3D"line-height: 19px; white-space: pre; font-family: &quot;Droid=
 Sans Mono&quot;, &quot;monospace&quot;, monospace; font-size: 14px; color:=
 rgb(204, 204, 204);">
From 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2 Mon Sep 17 00:00:00 2001</div=
>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
From: Filipe Xavier &lt;felipe_life@live.com&gt;</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
Date: Sat, 7 Sep 2024 14:50:33 +0200</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
Subject: [PATCH] rust: error.rs: Remove dead_code marker and make from_err_=
ptr, from_result and to_ptr public</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
<br>
</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
Remove dead_code annotation from from_err_ptr, from_result and to_ptr funct=
ions in error.rs file and change visibility to public, making it accessible=
 outside the kernel crate(issue #1105).</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
<br>
</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
Signed-off-by: Filipe Xavier &lt;felipe_life@live.com&gt;</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
---</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
index 6f1587a2524e..ecfa6aa41034 100644</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
--- a/rust/kernel/error.rs</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
+++ b/rust/kernel/error.rs</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
@@ -133,8 +133,7 @@ pub(crate) fn to_blk_status(self) -&gt; bindings::blk_s=
tatus_t {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;}</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;/// Returns the error encoded as a pointer.</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
- &nbsp; &nbsp;#[allow(dead_code)]</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
- &nbsp; &nbsp;pub(crate) fn to_ptr&lt;T&gt;(self) -&gt; *mut T {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
+ &nbsp; &nbsp;pub fn to_ptr&lt;T&gt;(self) -&gt; *mut T {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#[cfg_attr(target_pointer_width =3D &quot=
;32&quot;, allow(clippy::useless_conversion))]</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// SAFETY: `self.0` is a valid error due =
to its invariant.</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;unsafe {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
@@ -268,9 +267,7 @@ pub fn to_result(err: core::ffi::c_int) -&gt; Result {<=
/div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// &nbsp; &nbsp; from_err_ptr(unsafe { bindings::devm_platform_iorem=
ap_resource(pdev.to_ptr(), index) })</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// }</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// ```</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-// TODO: Remove `dead_code` marker once an in-kernel client is available.<=
/div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-#[allow(dead_code)]</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-pub(crate) fn from_err_ptr&lt;T&gt;(ptr: *mut T) -&gt; Result&lt;*mut T&gt=
; {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
+pub fn from_err_ptr&lt;T&gt;(ptr: *mut T) -&gt; Result&lt;*mut T&gt; {</di=
v>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;// CAST: Casting a pointer to `*const core::ffi::c_void=
` is always valid.</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;let const_ptr: *const core::ffi::c_void =3D ptr.cast();=
</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;// SAFETY: The FFI function does not deref the pointer.=
</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
@@ -315,9 +312,7 @@ pub(crate) fn from_err_ptr&lt;T&gt;(ptr: *mut T) -&gt; =
Result&lt;*mut T&gt; {</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// &nbsp; &nbsp; })</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// }</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;/// ```</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-// TODO: Remove `dead_code` marker once an in-kernel client is available.<=
/div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-#[allow(dead_code)]</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
-pub(crate) fn from_result&lt;T, F&gt;(f: F) -&gt; T</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
+pub fn from_result&lt;T, F&gt;(f: F) -&gt; T</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp;where</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;T: From&lt;i16&gt;,</div>
<div style=3D"font-family: &quot;Droid Sans Mono&quot;, &quot;monospace&quo=
t;, monospace; font-size: 14px; color: rgb(204, 204, 204);">
&nbsp; &nbsp; &nbsp;F: FnOnce() -&gt; Result&lt;T&gt;,</div>
</div>
</body>
</html>

--_000_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_--

--_004_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_
Content-Type: text/x-patch;
	name="0001-make-public-functions-on-error-rs.patch"
Content-Description: 0001-make-public-functions-on-error-rs.patch
Content-Disposition: attachment;
	filename="0001-make-public-functions-on-error-rs.patch"; size=2029;
	creation-date="Sat, 07 Sep 2024 18:18:55 GMT";
	modification-date="Sat, 07 Sep 2024 18:19:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5M2RjM2JlMTk0NTA0NDdhM2E3MDkwYmQxZGZiOWYzZGFhYzNlOGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGaWxpcGUgWGF2aWVyIDxmZWxpcGVfbGlmZUBsaXZlLmNvbT4K
RGF0ZTogU2F0LCA3IFNlcCAyMDI0IDE0OjUwOjMzICswMjAwClN1YmplY3Q6IFtQQVRDSF0gcnVz
dDogZXJyb3IucnM6IFJlbW92ZSBkZWFkX2NvZGUgbWFya2VyIGFuZCBtYWtlIGZyb21fZXJyX3B0
ciwgZnJvbV9yZXN1bHQgYW5kIHRvX3B0ciBwdWJsaWMKClJlbW92ZSBkZWFkX2NvZGUgYW5ub3Rh
dGlvbiBmcm9tIGZyb21fZXJyX3B0ciwgZnJvbV9yZXN1bHQgYW5kIHRvX3B0ciBmdW5jdGlvbnMg
aW4gZXJyb3IucnMgZmlsZSBhbmQgY2hhbmdlIHZpc2liaWxpdHkgdG8gcHVibGljLCBtYWtpbmcg
aXQgYWNjZXNzaWJsZSBvdXRzaWRlIHRoZSBrZXJuZWwgY3JhdGUoaXNzdWUgIzExMDUpLgoKU2ln
bmVkLW9mZi1ieTogRmlsaXBlIFhhdmllciA8ZmVsaXBlX2xpZmVAbGl2ZS5jb20+Ci0tLQpkaWZm
IC0tZ2l0IGEvcnVzdC9rZXJuZWwvZXJyb3IucnMgYi9ydXN0L2tlcm5lbC9lcnJvci5ycwppbmRl
eCA2ZjE1ODdhMjUyNGUuLmVjZmE2YWE0MTAzNCAxMDA2NDQKLS0tIGEvcnVzdC9rZXJuZWwvZXJy
b3IucnMKKysrIGIvcnVzdC9rZXJuZWwvZXJyb3IucnMKQEAgLTEzMyw4ICsxMzMsNyBAQCBwdWIo
Y3JhdGUpIGZuIHRvX2Jsa19zdGF0dXMoc2VsZikgLT4gYmluZGluZ3M6OmJsa19zdGF0dXNfdCB7
CiAgICAgfQogCiAgICAgLy8vIFJldHVybnMgdGhlIGVycm9yIGVuY29kZWQgYXMgYSBwb2ludGVy
LgotICAgICNbYWxsb3coZGVhZF9jb2RlKV0KLSAgICBwdWIoY3JhdGUpIGZuIHRvX3B0cjxUPihz
ZWxmKSAtPiAqbXV0IFQgeworICAgIHB1YiBmbiB0b19wdHI8VD4oc2VsZikgLT4gKm11dCBUIHsK
ICAgICAgICAgI1tjZmdfYXR0cih0YXJnZXRfcG9pbnRlcl93aWR0aCA9ICIzMiIsIGFsbG93KGNs
aXBweTo6dXNlbGVzc19jb252ZXJzaW9uKSldCiAgICAgICAgIC8vIFNBRkVUWTogYHNlbGYuMGAg
aXMgYSB2YWxpZCBlcnJvciBkdWUgdG8gaXRzIGludmFyaWFudC4KICAgICAgICAgdW5zYWZlIHsK
QEAgLTI2OCw5ICsyNjcsNyBAQCBwdWIgZm4gdG9fcmVzdWx0KGVycjogY29yZTo6ZmZpOjpjX2lu
dCkgLT4gUmVzdWx0IHsKIC8vLyAgICAgZnJvbV9lcnJfcHRyKHVuc2FmZSB7IGJpbmRpbmdzOjpk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldi50b19wdHIoKSwgaW5kZXgpIH0pCiAv
Ly8gfQogLy8vIGBgYAotLy8gVE9ETzogUmVtb3ZlIGBkZWFkX2NvZGVgIG1hcmtlciBvbmNlIGFu
IGluLWtlcm5lbCBjbGllbnQgaXMgYXZhaWxhYmxlLgotI1thbGxvdyhkZWFkX2NvZGUpXQotcHVi
KGNyYXRlKSBmbiBmcm9tX2Vycl9wdHI8VD4ocHRyOiAqbXV0IFQpIC0+IFJlc3VsdDwqbXV0IFQ+
IHsKK3B1YiBmbiBmcm9tX2Vycl9wdHI8VD4ocHRyOiAqbXV0IFQpIC0+IFJlc3VsdDwqbXV0IFQ+
IHsKICAgICAvLyBDQVNUOiBDYXN0aW5nIGEgcG9pbnRlciB0byBgKmNvbnN0IGNvcmU6OmZmaTo6
Y192b2lkYCBpcyBhbHdheXMgdmFsaWQuCiAgICAgbGV0IGNvbnN0X3B0cjogKmNvbnN0IGNvcmU6
OmZmaTo6Y192b2lkID0gcHRyLmNhc3QoKTsKICAgICAvLyBTQUZFVFk6IFRoZSBGRkkgZnVuY3Rp
b24gZG9lcyBub3QgZGVyZWYgdGhlIHBvaW50ZXIuCkBAIC0zMTUsOSArMzEyLDcgQEAgcHViKGNy
YXRlKSBmbiBmcm9tX2Vycl9wdHI8VD4ocHRyOiAqbXV0IFQpIC0+IFJlc3VsdDwqbXV0IFQ+IHsK
IC8vLyAgICAgfSkKIC8vLyB9CiAvLy8gYGBgCi0vLyBUT0RPOiBSZW1vdmUgYGRlYWRfY29kZWAg
bWFya2VyIG9uY2UgYW4gaW4ta2VybmVsIGNsaWVudCBpcyBhdmFpbGFibGUuCi0jW2FsbG93KGRl
YWRfY29kZSldCi1wdWIoY3JhdGUpIGZuIGZyb21fcmVzdWx0PFQsIEY+KGY6IEYpIC0+IFQKK3B1
YiBmbiBmcm9tX3Jlc3VsdDxULCBGPihmOiBGKSAtPiBUCiB3aGVyZQogICAgIFQ6IEZyb208aTE2
PiwKICAgICBGOiBGbk9uY2UoKSAtPiBSZXN1bHQ8VD4sCg==

--_004_DM4PR14MB72760296911674F92C7A6C01E99F2DM4PR14MB7276namp_--

