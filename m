Return-Path: <linux-kbuild+bounces-1875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135258C8060
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8877F282A4B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B1BC129;
	Fri, 17 May 2024 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hx6RKaY+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m0PyW1ad"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0443EBA39;
	Fri, 17 May 2024 04:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920175; cv=fail; b=VV6sfJGtxA1Okd5Zajj1jcIvPHgxqoUCxKJ4zrGdnq8I4ML98poKRAwLHvC1rSYOQDWHmhbVgvoq+W/9SghEOUHGasDdHFvgYk+VP1v5yV8MNGvUmYWM/myuiituaru/x9gxBJJx0zX2uz+sLVdody/VTQtxAaukz/kJugXBC8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920175; c=relaxed/simple;
	bh=MGLSO+5OBiSAMnEkAMvW3hOCqvC4E9mi1uxuYiS2jjI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=A0qam73mAH53Nznv+Yf2KISg6g1cU0OHjCQEvxwSQ/I2MfcQYsIbZMZVJ7NMPxZB7molve6NY3TOdOd9bWS4wOiZOKbOjPrkBRBx4cM5F2NOMw+ZTK15GOYJpwkdiFccWWzWvKdOIeWlXvvbwN1TAi6FkDyukGgJSGeuG6UghnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hx6RKaY+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m0PyW1ad; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4TIcC027977;
	Fri, 17 May 2024 04:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=Yz52mYRYpGJXBE3VRqstej5mSmA+bfK0u2aivfO0DG0=;
 b=Hx6RKaY+vzRMvC0PerIYhqVTHXEVv7p0csbvtAnya2jKkzLM96QxwY29L8voTMDhvWdY
 Anen+mlmvWNOCsi9turKY3fCHBYR/70V9oJjfLiiPZ6kQ7N2fBVkODfiTTicbCUMVIut
 /rmvM6uCHHwAeQhPh/bkugL46QxtEG4O+cVqImFkgJL4v4nlGlYewWfiSfEs+MJbGsmH
 dYQRmcc5UaHVBnJTYiKa2dj32xq6RAK4VZKQN7ntfYlerkz2HPdtSUx6I7CuTidxChLH
 DqVO4B9EUm5DUvOwfOUha0jF/ow5+k5iGoRsm7Zms1PPOul9XnpSfKO38prsQ4P8KVxw vg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3t4fgx3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:29:18 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H269eg001205;
	Fri, 17 May 2024 04:29:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y4fsudn28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEF5C+JHdHh+oE8SNZdu/ifMfXx4eH0SdMayOcQJwuFTZzaH+FSpWgz4jVSR2OqMP/U/MtBCs4ncP047dsk1xzdHAhymON0+7KrQ3h4WY8iJ194J7qPDnpga79KfeL7d7AXOQ/USJw0gI4aSieHEiu+nl+8PghIIeohJx8UWZ+ebh5s0S3wI+7YP/PpSHWG1D8iX9q39qiJCXJw/G/c+cAlE+BdPDpZci2GkkeTTp+dc4U/XH0LLhHWJgQCMwah7pFAGYTDs3/EUAJ4h8PG2oliTwNRACjK5GtnVhceG+/QGhEW3vjkfTThq2dx1sR3/B9i73FhVDU/OXirXzFWqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yz52mYRYpGJXBE3VRqstej5mSmA+bfK0u2aivfO0DG0=;
 b=U3hRtw2A3/h6n2t5DbhQzhVOpALUw/tou3sTcVSceKdGK55k/RxXMNrVTjwi6YpSFe3jwJEbgC0TZdy1HBlZEXCRO+pcOXsjIFt2A3r7WVOcfNdRVKaVcE+dFYN/z2f0h1xBVHyTySAa8Zx3R2iusIrOZmEAoHf3tv/8HXjSbFjd9T8RUoRfQGm3ANBWtNPf7BjEJOxiR/Z7SYTsYeO6pzWGqYg7d2SGH9RWq+WvUUCyQijowPvvktcvm3L0pU5lfmb+PhfCl1wI0iJA417sf//9fECK5zStHuplB70QK21Ye2wl/x4lim255uxBkcDb3DgyTH1GLeklkFwSgS9e1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yz52mYRYpGJXBE3VRqstej5mSmA+bfK0u2aivfO0DG0=;
 b=m0PyW1adS0W/Z9tsAKv8R9OenkBdELfRDPNFSkyx5qcAIdoINhWts8cTJDSTYTKSxvaJEHVI0qYPhm4AlS/09miCsVHoXwJ6hid+x8R2HBcPWC1zY5Lb6+M1ZVSN59F2u0LqwPLxGhMJrlSKmFuF4q4E9QEMxQ8EYYvZo1zM/34=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:29:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:29:14 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 0/6] Generate address range data for built-in modules
Date: Fri, 17 May 2024 00:28:33 -0400
Message-ID: <20240517042839.544650-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4f65ed-72a5-4bc4-1f9a-08dc7629e89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I980FwnfWKBuTPgpsyy0YA92FwitTzztJcHecy7S/Jk0/mHyqGcNzUeemPic?=
 =?us-ascii?Q?99aTuzjgtK7KXcKgSEJ9Gje0qNUi2xDNwec3ALlC0bXeDswdzm3mbe5Lzkg5?=
 =?us-ascii?Q?G/V/px4eigGahnbzS5wzIDWyJ7ZEN0u571yl6POZ3NR1KKxqmjVrm1OHKZrw?=
 =?us-ascii?Q?E1kUw0f/4J51qtRCLH9EsN2ZfY5i/nTb0EE9r3VL/snpU6LDeqoKyNDmoVRW?=
 =?us-ascii?Q?mGo0RF08WuXDVWMsutl2PWRkIRgOsswqDDb5J58R2I+sSpl9PlgWZ7MSlgCU?=
 =?us-ascii?Q?GD3uaq/vnK6dcdpto9EiTTOaPBla6izCk3zIQSG3jkOlA4nUkYUTaoejpJso?=
 =?us-ascii?Q?LzZVg/42Wx2oVACgU4qg9a+7fUKtqz+MD3f0DTm3yMabC6MbhK3IVfIuNxQa?=
 =?us-ascii?Q?q2JgNx5mIHvALCiSpqkHWM6QLPS1ZTuhJRzXh2iXKRdd8l9in53MPJi6yH0Q?=
 =?us-ascii?Q?eksS8sKC8d6gOOAvaI2JI4ErMdjagkMCCXkhDAJMxLIpeHq6mHJo4vRqocOU?=
 =?us-ascii?Q?KFfOCK32iAw72D1LMJER1TCvZelFWGlHZ0P9V9IGhPBroLyPJ+g30c+kMd/9?=
 =?us-ascii?Q?1lINuSLpUaPtl3WCbLgA8nxWJaoSt8tBnte62plpvIvg/TjxxpmCzaBpyOZx?=
 =?us-ascii?Q?FCX8dbXR6AjNRBYfrrZPw8hW/P1TvXYh3wrmdUHsStZ3lbnCLG71BDg4Pqf3?=
 =?us-ascii?Q?/pnwgonHXW/6ID2E1rbdLgCIj2TKcCkcxmpu6i9N/FAUpPVg5ICmvxESxvJa?=
 =?us-ascii?Q?Y+BcHSYOjFMCAm+jD8T52R6cGnhtp1BrkHzJxXbua3Jwdlsbd9M0YC5FC01P?=
 =?us-ascii?Q?DDPbYZO90TTNxXybuMQd/J629kcW6I8vAjJytWsLlf7TUA7iCAyKIDLPLmdP?=
 =?us-ascii?Q?Vl+RD/boAdFVV5S0wjwjGir1mAlaSt6Bfx36dfxTTQW8Q580uTQ88ZYmQK6e?=
 =?us-ascii?Q?wNHE2P+BldBpK2aDbG0PPEM4OUD9bSeFS0r24yhAhCxBjuaoICsnlMzeic9X?=
 =?us-ascii?Q?Kcr8zR28McpUA/RRoIF9cSRaGNk9JaEuXaUgF7S0vtcxS++aA8j67pU4SDb6?=
 =?us-ascii?Q?BfSpsOFSwScEDpQZexjBv0EPwkXrGFZehi2yFmRhYmojUMPjSdHsScTockkG?=
 =?us-ascii?Q?MLl8RuIbXGoRO8Xto5u4MuQr6s3ZXm6CNr0CIR+1cI2I47XF8FIC0zNi5IKv?=
 =?us-ascii?Q?8j9yrhMPidnkt9nQucX6Qh6O25jNWgIKEL+la+uAsqYtWY9UdYat5nMin9SG?=
 =?us-ascii?Q?RGFr5Y+U4upJpMmxQzRQFFxxrGWabaWHj09jCkV3aw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gy9RHjGuxeY4TxOG8HizccqHrKc13THwO1xZ8+3YQutA1wOQ00MAl+KjRF0P?=
 =?us-ascii?Q?nl51ALKIyq4Q/0LKQzoqYBYibP2hE8Rwdxa3PaJZTzUKYyA3bAAahW6CdZN9?=
 =?us-ascii?Q?SJEQx+Iud1Vi2LFdrQac4J+GcZDopkMNJ8UvQK0vD3SJjyCKPy0UVJoc6/xt?=
 =?us-ascii?Q?D1XER75QrGzWUK8lCPs+Zf1r0U79DDqC2Y+ervhTOlMLUzYx4PYXLrz0p5BH?=
 =?us-ascii?Q?MY2C3PondpmZdYuEiMzoSZ68EraM9oUehala/Z+V1CiMrjpjXJ5YN9DW2OKp?=
 =?us-ascii?Q?io0qhR4CmOOh2UIzXnPpZghFDeBDo+OTj0ZuYiGgX4ILZd3U3kl2+GtV1zlv?=
 =?us-ascii?Q?kfd7E25V6YA0oz4txkI3Oo6QmX/XzgvkA+yJ+K7kwG3V3gEshH50bAap+Vge?=
 =?us-ascii?Q?dY+enJY8qcbibr+kocWXUy0FP0OKVvRlsyxpARbREIj+fPSlZCoryrxVOSju?=
 =?us-ascii?Q?lF1ZDQV2qQiNGhPRAOBNPLQM2ZRBsYdcxMJtRpB+RgtYcKn0F/3oWUddFmr/?=
 =?us-ascii?Q?vR7eOmHfkH7/st5Q5WGTMug0mYUPqiZVvrgcU7mDicWGkHqlSfFc8ab8LBhe?=
 =?us-ascii?Q?D7YnSQggTrlyudlceIzYroFnAnGx2bBgLVnOuh+uVOprdJVkdMpp4XOwGOB+?=
 =?us-ascii?Q?mDoaBE+864DiR2nuwpTzKAib+uGxTU524VFnep24KYQabIJDVAPtoKbugSm6?=
 =?us-ascii?Q?y/WsNv+csETC8oI5jBAa9PPBguVLDgPnQnORL1Og88QEj+aWA0r3Rr94CRuH?=
 =?us-ascii?Q?OGzRprx301r1y4gLdIgZMU+nXTDSlFf5FgN15ifCmv28OuNTFIv4jS7swVKe?=
 =?us-ascii?Q?dc135PdcMw5jyN0clZk9TWVRFcJ1uW0ePIiOtR/kfQsTeV44K3EoET2uXRD4?=
 =?us-ascii?Q?H9RcOJ2Kl7Sw/Jg5jyopFZYGwQ9Hple2sQvj3TnlgmT/X3CNPTqWxmdIcu57?=
 =?us-ascii?Q?n71Bz1gy/GrmMp6kzVyBKAPwGziBPVTBIAN9Q2jMe5PdxWoyJIFi4gyIR6vG?=
 =?us-ascii?Q?iws7SwadsZ0FSbLB0aR7MiMRt07EPb1dRfJh41BnG1sIZA0ozZHxuvqw26Cl?=
 =?us-ascii?Q?i1pFPKfd0Xqn+C+wIG+3f142i2IokfTkJxjKuoAX4zKv3Re3S8mXC6muTq9S?=
 =?us-ascii?Q?+u4ylGcAkDFghuQJ0yWmXaGU8FY8iec8eZbBOZo/AXVTWTrYKbUPeeDcPA4t?=
 =?us-ascii?Q?U7xYrjIuK6yeC2U0MowZWyFH+aDLx8Uoc3kEcMfv7y2mQGBrPNHPD+/g1wfo?=
 =?us-ascii?Q?beF6w0FG5mXKXimXY9OCxxmg+plZlE5tm5j+A0Wu39Ht3B9KO5Jk3P3cqZbT?=
 =?us-ascii?Q?mjNcAFal65Qq/PAb1rfqw+ITw62m1RnILAA1DER1Z6kD4bhjfdzZMqBhbrIm?=
 =?us-ascii?Q?8ITsFClVKhyj24f/TM7kW5SZbrUiAC62SjKcbaTQvFIn9QHakR5yG+mm3Cq2?=
 =?us-ascii?Q?n4qkHON/+87/ElC9RvmBZWIbkmI/6dT4WXFdjO4Ltuyh/U+kNCf98534HI6M?=
 =?us-ascii?Q?kPXoR+0+Piem7UztgtFVv4T/1VC1NOSZSl3h7+XmpaLn8N64zQ4jJqvt36kL?=
 =?us-ascii?Q?KXRp3loDWtFRKGUc+Pfo/fUqrvzPZ2njRg9LG7IiEFvASSd3ExYYBbdMZ1bm?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d8e0vC0xRNA5padBYbdG2IwBYD9UIuHqcAfoo04XRChwO6nyIMEibWXHuzObgC9cEd56+rXxiMlLwqj/0Z+agYpVfXXi9ZseIqR9lwonogCL93aqnsgqz48RMq8mc4vj5O91s6lz+SKzSXqoB5Ff8Vd5ySDuwMBy6KOVWCB/t3jk+G3meBUGPjSO6OL+dG9ei6fi5XBZH4adyq9R1uHEhuEzaTpLhDpnrYUp0FxX8SnTWb0g6JXgxGTolmK5Ui5IW+bsV4oz9VJ4uUy0TrgOSOkT26eA5Om531h8dAShjhhLUtXjXEcZ9IG6VUEki+vx4Ub2hRs4eqzS5gCRLiWKZ6+hzXvsnptDXH7FHglYbkPSGvg4i2EG7/GLls3mpLUC1SgP6GUnpxHb0V+Tu6pypBJacGT5mtAecubqiyhO6MZiWnhhOzqaYDa3wy786oNW20X+et2lp/u9oI7LxAVLackFnSMBy/BkqEjl0jK/qYRWiwstOBsHnLNRxP+aL98c1n5d6wgj5xUIHau8xirR4MV+KA6/wYzIYu8o5FFPSkjnusYNjqjSalISprt2vJZD6fPbguq+UVmpJVgaivk2xPQDDwYh8V9adsNya5PTebY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4f65ed-72a5-4bc4-1f9a-08dc7629e89d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:29:14.8766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn55xhyVfk0xOBwQC8fQqWliwgSrLuNvT5cI872nP2A1n0tXV5ZiwWONJTuLTgoHVX2yGstByOlhBJR075zhwM3TQFd7YBcqS/HWiGE+Vok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170034
X-Proofpoint-ORIG-GUID: knifnAJUwinmqFt24psG1qpKezn5sMia
X-Proofpoint-GUID: knifnAJUwinmqFt24psG1qpKezn5sMia

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
compilation commands.  The data found in modules.builtin.modinfo is
used to determine what modules are built into the kernel proper.  Then,
vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
a modules.buitin.ranges file with offset range information (relative to
the base address of the associated section) for built-in modules.  This
file gets installed along with the other modules.builtin.* files.

The impact on the kernel build is minimal because everything is done
using a single-pass AWK script.  The generated data size is minimal as
well, (depending on the exact kernel configuration) usually in the range
of 500-700 lines, with a file size of 20-40KB (if all modules are built
in, the file contains about 8000 lines, with a file size of about 285KB).

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


