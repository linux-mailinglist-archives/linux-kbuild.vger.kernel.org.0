Return-Path: <linux-kbuild+bounces-3000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A495368C
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBE431C24864
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 15:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8121AC88A;
	Thu, 15 Aug 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TCEzOghQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nh/qYU72"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9151AC8BD;
	Thu, 15 Aug 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734259; cv=fail; b=LK13AIkcmIK/kh7Dg6Dkd/V7JIKg2nWfQx5wAh9MS0Y380mu0Ts1Okz7zJ3S28kut6UEATLcdCW+QCW7OdQrggDdmv3jYk/UhbJwZd97VJlz60PbPXuOVFQKYWJ5sFWFqqamW8PYEvoUsHfgkzTYx5KX9LOYISbgVY7aa4Cn+YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734259; c=relaxed/simple;
	bh=hwSmU5Rmyh9tQPqCKeFaG0MdKZgLX95uD+fKRr9oNdc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=onAgFz3Us5uV5/CgTYcqy8qt5IOoSpOelQpWFzK9gAoqVBmgmh7M+8GKDzjZhgviRxTpMAaFOduIQZHxJJQdL6ayfAnqzIWF0petQ6ynhzNToYhinr3rLevT3vAOuaXAPV7Gmc+dbAWu2+72HdVKUA+Kzn3KY40kDiCxMVSQ98E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TCEzOghQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nh/qYU72; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEtYp3012801;
	Thu, 15 Aug 2024 15:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=My9w5M6bftpwqF
	h4Tc5eqGf0PYinHHxJ64OoGUPOmoM=; b=TCEzOghQyFhpSlgvuzF4oVcA6KqDyA
	EfpEbm4Z3Sg2edjAtjEhtTgD5n93WXakMdwCqecmB8VXM6hWjpr9I//WIuHvkOjd
	u9o3gLyElVSBVKNOIOT31wxJ30SpNbZBzOQdQaqc10KwrFVJ0c/rDD4yg/Pddla2
	r32opNZw7k2WLr3VBFsx1pKBGUY86p9sgdMnv3HQVNPWgaGuvy4oFzxfNCLT/q8d
	KMykoRPVCZu/u08uP8SBCWRsA/a/Xl//26BLMzxWoEsvr1oEIrCMmwnWggcmn9TN
	eAfDK5h9ERORzB4hkw+pXiPRkSUiGj6stC1f3UylR/1DjxrxmwZXXxaA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy4bjrrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FDebAY010633;
	Thu, 15 Aug 2024 15:04:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnb7j31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wonfgZZRawyZC0HdPaMADzlTlsogLHuwSUvrkvqsVeAmiu8xaOIAhBfo2ckcuURY1UnvGbJFpXXiUdW2zNBGD5Mt7gAQfuC4wbGzLh4JWkb5/L/kT/BPv4QxJ2Tk/4nSE9x4rpt/PGpGdHN9v73iEpTcnVY9VtOWN7DjDzgq8hxNr4pPtkbcBJjVrB3lqNA5tEP2eNPhSzWHHAD0CCEgpPdetle1IoTD9N6yq7WHa2NdANS+Y0Kk3tPQd9eTC94tQw+M9Rh7flq4rQMy6v31mY7/x5CXaATMpjTW+6AnSz1/wJt3pRaPqJdbazXSZsUnZvJCdWhevoVogF3e73TPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My9w5M6bftpwqFh4Tc5eqGf0PYinHHxJ64OoGUPOmoM=;
 b=U+QU7c3Fn6ivEfXKoB8+xflw/bZewO4DyFWww6BNDkmKzxlNNrOGr4e7vDkQPFgWsJF/a+ImNRtLzSfcT+QIDQANkLOnd3nKLllF8pO+otdtOSp3WACCDZpiIqSekdqDiG1yVO+UdPsPnWP+hfZA4O2QqcYx3Gc6IJGOfmVg4yTRMAnkZckC7+F99xrKUGuZY8lx1QX1/KE8riTIyUjxRIMCxJDW3PJ20UXrvniuFkm2fLyRRWoqChD3juCx/KXJao9DMSxJ0ZP0S0sytg2WMYhTo0Z8EJ6LHklSAy4q4L0Vd9O0jJ8sBtj5xFC1t8/jWZLiVnI1j9EH93Ni9wD1AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My9w5M6bftpwqFh4Tc5eqGf0PYinHHxJ64OoGUPOmoM=;
 b=nh/qYU72i/plM7lWKrqD+WchcFUUZyj2d3Rt/HsEIvex5pTr19AlU9cCopnk2EEu29sn468aNzbfqoL9cJnDKg+JXNpyn2BAyOdjjQN7aaXaiVOwZ8V0fVyDxBC/o/yAjP9H8GLzmM0x2jBI4RCdAFy5zOXXx3p3D6M2vaT/g0E=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 15:04:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 15:04:01 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v6 0/4] Generate address range data for built-in modules
Date: Thu, 15 Aug 2024 11:03:35 -0400
Message-ID: <20240815150339.1564769-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBP288CA0014.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: eec3016b-0056-4a4c-b02a-08dcbd3b7f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N2kwvpyj4OyJdzHz9pm4lYAb19D5XKwIlmkJ+XwxieR2mAzXjhLB5M3cDSle?=
 =?us-ascii?Q?01JXevBeCuPXOyrLwpDR1mCA44hUsQgvs+S/T0o9aNv9of26lL26GVhjtCny?=
 =?us-ascii?Q?8yLvyoOuAoANl/c35n+rMlbwmyV2tFyaOtb8FIj/3uoEYOs0zfkWo9KHwmRc?=
 =?us-ascii?Q?IXnOwmFSwa7/u+5dSz7UtjhFl58S7h8tpvr+mZQbk7YMael/9ZmQH/8ntWAb?=
 =?us-ascii?Q?epUGNRmVzOvblyACLniY87RCDiJJ3PeWwR/1FkpFIHNmq1Fyaj9O+sJ6NDK6?=
 =?us-ascii?Q?p3B06UOqh7Fc6ncRgBWrmsarIMBZ+kwiyJ07Xj2wHmS5cEH8JQgAKVKpYa5K?=
 =?us-ascii?Q?cyTmyVBDRZsZMQ6SzuWGfxq1bmCS87oe4kH3sLwndpSPKmWU104UYZYXHe+r?=
 =?us-ascii?Q?WNcftTFZrTqoxqyLQZSU0Ho7FVol+wk+fxsawwjEztZx1qv87q3kCfjo84U3?=
 =?us-ascii?Q?e0RFy8Q5jCJKXfaJ2+4bAaqDZruXwcVoqVZoKjC7Wkdgl/CDqO5Fz7PsN2BP?=
 =?us-ascii?Q?XGayHxfi1BSUvFabVe6MX3Pho/6NAnOkb61ioEH/jYD+IMEWYGCkRtQZv8Fd?=
 =?us-ascii?Q?WKLv77d9QjV1sLHEseEP3LqroLZ5OEA96GLViLH+YT41OQwqDMclszquHAfK?=
 =?us-ascii?Q?BrC2hSA0qiK6/1jQfOAGnpD/ULWELU0sBcST80M8BTrO44Ieqevi8hNWrX/v?=
 =?us-ascii?Q?cI/qPI8gzKpr7qo7zwJV8qQCGjwRpEsdedacH+rnfHU2yfaNlfbR0JET9MND?=
 =?us-ascii?Q?I0ZEArj1yxlev9jofd+XowbaLx56yYbu4NDjDOHZuHnteH8q3BNlpw7GILJn?=
 =?us-ascii?Q?ecPjNJwz1JLpBp7B7U15DtJjyZ9P/kiDm7cZAvfo9Fo3oxEptij+UQvpwGWI?=
 =?us-ascii?Q?bFSTsnrf+GwrSEjNnV36TbaFOo7jpp447DAZsI+Wm4DQ9YEkb29xnMs9fTIQ?=
 =?us-ascii?Q?+JP9MBS1WpiE11AZDLAuLBfM8nWCFUTfUkoePUmlYIsHA28GglwDqj/VxbmU?=
 =?us-ascii?Q?ZjDHjxCt4TVkeAGO+wxFXEuCxXW3G93GrYv0ptjivhEdTHLoCIt1+68YjFrl?=
 =?us-ascii?Q?BVOW0SFEVfxGrvEhlY0trhVft0eQaxy/g2zGcCZx8neAagS+I6c+qs+KFkZu?=
 =?us-ascii?Q?vUDf53jaHba/Ba/LMxxp6R+yK6X3DRCXC2OesMrsIzkKpBLWLfYMeg5tCYnW?=
 =?us-ascii?Q?VKpnVFtscXP9ivKYrViN5yik10hEeUsghEWnHOKEWn0Q7ut/yXi/StVYdfx2?=
 =?us-ascii?Q?Ra/kMugoB0LhQZTLZ3rues09Q6UWMkgIVIKWV2sf34HDMCoJJSFaOfygHKkA?=
 =?us-ascii?Q?Vo7tv0FShatH5ye4xDlmy38bA8OCs3p+qsWsbP0A1SWI+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eYLWVDJBte70fXCSBqIGe/qp5XjcJEuGbK4p0uR36QSoBkvOObWMngBnBpWh?=
 =?us-ascii?Q?G4wIC756jhs/JCSXBBttlrt+A32VgfwjLI8kHaEICHMZD3BnhY3ZeWjyrsGF?=
 =?us-ascii?Q?a+JfA4n4ySu1uLXhpC/93WT1vqbqOVakdvoVoEOsItVsVa+eT4Fvw0EhIz0/?=
 =?us-ascii?Q?TutSa2L0CBawyoJvn5L08dAIkaUbb370vqPh5s6+7RyvKt/OGF0UeisM7omX?=
 =?us-ascii?Q?uZBJilCMVBaUZCeI+ACBBaKieGPSHArJmUAl/0m3eGIAXkBxCMXc2Gfgg4Zy?=
 =?us-ascii?Q?9+vYss+ECKnGdxY+Dxf6nCcAwBM1X6y77LtMjUkOgGUea9iyJj5lVPc9MkWm?=
 =?us-ascii?Q?sAWZMRE1iNsSTX7S4M/nzjrcw/muCA/BCGFNyPuqlpV8UP+14dZUksAAMat9?=
 =?us-ascii?Q?zx3HBAysdg9p+WjrbzmnxOVPPE0jTtpr390DLF2XzbOivjds5xNx8EIfYYe5?=
 =?us-ascii?Q?BOwOrmJPQIMXQe8kiPHX0qRiJvxJaZCRWO5K1xd2GwevBZq+9PRvZrWLV8RA?=
 =?us-ascii?Q?o+T+wLYc2ZZT0bR/c5lEBKvadeGLCvrc3B95kund9I4/zXsKAyDh5pck7zp6?=
 =?us-ascii?Q?rCianFAkqLoYSIs+xPaUxKz6KzY1YhosqXqjYKbhejU962mhQdRUQyRAtNNG?=
 =?us-ascii?Q?0wqaUpoddZBCwAlA82yRVc3L0/tL/aN+FLJ4+MTN9k9llTDCLyenKBDVHHf4?=
 =?us-ascii?Q?ZXmJhkPVqIlyFwp+8pLUb4w9sfomf2hNxhHEpz9WKTKDAWo82uisEHM94oDr?=
 =?us-ascii?Q?81tUq/53lUm6OxDBEvlxDuqYeNl5e4hVdhPWS7WeFOhhIsbycok24KtqhNfu?=
 =?us-ascii?Q?FcPhv2LPAYZq3aYfqbKCXfNz/+ijG0yPgCwVvZZnQT/nPFAeXhpqXnTGdTnn?=
 =?us-ascii?Q?GtxOmFYeF62KuPZg3JYTU75+iAWULPgn29mWix4QJ4uz/9OnnRPkBp+NVcqK?=
 =?us-ascii?Q?8d8gZv2ro7sSEintx4tFG1u2j/5PAwVYgrQkIZ17pLp2WyV3t4UITGLBlRhY?=
 =?us-ascii?Q?SJ075BXsCHEXbGKjx+nDcmLV3FUs5xow4pKO85zVEMxWXQxRwT5czbrb7P3B?=
 =?us-ascii?Q?tWYHDZd4tQmMOvpetglvpfjL2KKGkSSSknPro0yVT+tb8moYHm5YmM6mRILX?=
 =?us-ascii?Q?vW+CJpl2rOOhN1LAKhvqN7I4GRgHFNyCsJ+rpvSv+S1pzSCCqXZ/wweqOQC5?=
 =?us-ascii?Q?ez3a821hXjpTQFCDeOcCUgWWrW4+t8+KYmS3qFWPszYcZY9DQj3OJ4YD6b/b?=
 =?us-ascii?Q?67UYrhZb9akIdeEbpc3KbPmgyHbeZpwFFHzhtVGZayZGgWtZNxp8FyQRc7YU?=
 =?us-ascii?Q?E1NqZL3Xrb526jDGmDGShpbkiEWMTjyhXDAhC0BExdJhXA9BP69sXsGt4Wa0?=
 =?us-ascii?Q?mMyYBNaRe0jWiXhpKE3aDvLIupsHVd4KDpuP7ORJkZt1uqFNMofTS6nIXHqz?=
 =?us-ascii?Q?dTxwtAbs4cnwOMCojXo1zC17GLHtweu1c8WCXifquPTrAcoU9eh/N0FHxZms?=
 =?us-ascii?Q?YFl5J8bVEnpcQu9rz8SIcrzMVpkJ+HbEihIjfglkDx4QotBI3UllmSabf5Pw?=
 =?us-ascii?Q?G5ahvMH9dPS27EoxxIKu7yGrYj4RAq46xgy4PTe6jjLYPqX4akOUzSvLF6cm?=
 =?us-ascii?Q?0LhXfrfbPSBKA/ruIgPiUqk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dYUOJ6l6JRyiUlddDAZW1i7lIrIgqjQlVu/9w7+/hC7SwhtL5Plbx+ebaOhSAO2jGBNFORGDCI0mupMelu3ufXogjIIMHA4fSXgaV1x45JmKW29+uN5HukDLXgyAa07I3L3mvN8ueMRK9EM4i4h3ZpzbACLpwBuTHh7GCJkcCHvGz/R08Uw873uf5eqtsMIiBQAztUYhCIe/jeIKWJGn5MlLM4PWqjMUcseXsIds1xcUwatNjUZg+eILqwQLvwM/fiP1GYetlbH/zDhEo4dg8iQZKSG9qgOd2moHg6PNUFfED9KhBGtDjsHI4sQAfk+yO6LhtLlPIhUKcBymyHjYU87nhItsW1TBPgb97RoGKfS06FCZEXXGMHHu6Gl6ymdaITYmBs+ks2AN3BP//ECF8WQDUsqpimRJOjwf7PpbCQkGyJWn4a8QuhatSGaG6qlLCbz2jRnBjuACC0S9I49sEreA4o89V3aDjGapeLO2qezleWyHZWnldxPwwA28fz66DtxLGfV6Xd0xP3nrIzFjMjjxOyr6C9XPO38sljYWpUcVCW9jGvgxqIDiD2K/t4qaO+lI5K5Fdg/fuFu2iYU5tL2xvVSsiYHzcVsFix3t0tc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec3016b-0056-4a4c-b02a-08dcbd3b7f39
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:04:01.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmeGXQhjz/OEb6ggflKKmmvnc5ooBadtKeKI+iVlIEqZqfsJGX2VF/ugz0oNws8yBpBcM5xE6Ni7KLSLU/DRq0cQDRzQ7bPzGMHJR34NXNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150109
X-Proofpoint-GUID: xnbSFIycHNM-3ShmzmPo_L6vIe5CmiAZ
X-Proofpoint-ORIG-GUID: xnbSFIycHNM-3ShmzmPo_L6vIe5CmiAZ

At build time, create the file modules.builtin.ranges that will hold
address range data of the built-in modules that can be used by tracers.

Especially for tracing applications, it is convenient to be able to
refer to a symbol using a <module name, symbol name> pair and to be able
to translate an address into a <nodule mname, symbol name> pair.  But
that does not work if the module is built into the kernel because the
object files that comprise the built-in module implementation are simply
linked into the kernel image along with all other kernel object files.

This is especially visible when providing tracing scripts for support
purposes, where the developer of the script targets a particular kernel
version, but does not have control over whether the target system has
a particular module as loadable module or built-in module.  When tracing
symbols within a module, referring them by <module name, symbol name>
pairs is both convenient and aids symbol lookup.  But that naming will
not work if the module name information is lost if the module is built
into the kernel on the target system.

Earlier work addressing this loss of information for built-in modules
involved adding module name information to the kallsyms data, but that
required more invasive code in the kernel proper.  This work never did
get merged into the kernel tree.

All that is really needed is knowing whether a given address belongs to
a particular module (or multiple modules if they share an object file).
Or in other words, whether that address falls within an address range
that is associated with one or more modules.

Objects can be identified as belonging to a particular module (or
modules) based on defines that are passed as flags to their respective
compilation commands.  The data found in modules.builtin is used to
determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

Changes since v5:
 - More improved commit descriptions to explain the why and how.
 - Removed unnecessary compatibility info from option description.
 - Added optional 6th arg to verifier to specify kernel build directory.
 - Report error and exit from verifier if .*.o.cmd files cannot be read.

Changes since v4:
 - Improved commit descriptions to explain the why and how.
 - Documented dependency on GNU AWK for CONFIG_BUILTIN_MODULE_RANGES.
 - Improved comments in generate_builtin_ranges.awk
 - Improved logic in generate_builtin_ranges.awk to handle incorrect
   object size information in linker maps
 - Added verify_builtin_ranges.awk

Changes since v3:
 - Consolidated patches 2 through 5 into a single patch
 - Move CONFIG_BUILTIN_MODULE_RANGES to Kconfig.debug
 - Make CONFIG_BUILTIN_MODULE_RANGES select CONFIG_VMLINUX_MAP
 - Disable CONFIG_BUILTIN_MODULE_RANGES if CONFIG_LTO_CLANG_(FULL|THIN)=y
 - Support LLVM (lld) compiles in generate_builtin_ranges.awk
 - Support CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y

Changes since v2:
 - Switched from using modules.builtin.objs to parsing .*.cmd files
 - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
 - 1st arg to generate_builtin_ranges.awk is now modules.builtin.modinfo
 - Parse data from .*.cmd in generate_builtin_ranges.awk
 - Use $(real-prereqs) rather than $(filter-out ...)
 - Include modules.builtin.ranges in modules install target

Changes since v1:
 - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
 - Moved the config option to the tracers section
 - 2nd arg to generate_builtin_ranges.awk should be vmlinux.map

Kris Van Hees (5):
  trace: add CONFIG_BUILTIN_MODULE_RANGES option
  kbuild: generate a linker map for vmlinux.o
  module: script to generate offset ranges for builtin modules
  kbuild: generate modules.builtin.ranges when linking the kernel
  module: add install target for modules.builtin.ranges

Luis Chamberlain (1):
  kbuild: add modules.builtin.objs

 .gitignore                          |   2 +-
 Documentation/dontdiff              |   2 +-
 Documentation/kbuild/kbuild.rst     |   5 ++
 Makefile                            |   8 +-
 include/linux/module.h              |   4 +-
 kernel/trace/Kconfig                |  17 ++++
 scripts/Makefile.lib                |   5 +-
 scripts/Makefile.modinst            |  11 ++-
 scripts/Makefile.vmlinux            |  17 ++++
 scripts/Makefile.vmlinux_o          |  18 ++++-
 scripts/generate_builtin_ranges.awk | 149 ++++++++++++++++++++++++++++++++++++
 11 files changed, 228 insertions(+), 10 deletions(-)
 create mode 100755 scripts/generate_builtin_ranges.awk


base-commit: dd5a440a31fae6e459c0d6271dddd62825505361
-- 
2.42.0


