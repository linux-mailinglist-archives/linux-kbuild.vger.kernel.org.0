Return-Path: <linux-kbuild+bounces-6361-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2CA73E3D
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Mar 2025 19:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3877A189A8D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Mar 2025 18:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379BB1C5D44;
	Thu, 27 Mar 2025 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smartmatic.com header.i=@smartmatic.com header.b="kquW9MrP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2095.outbound.protection.outlook.com [40.107.93.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885C321ADDE
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Mar 2025 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101900; cv=fail; b=Vm1rPUw7zgMR7zJmhP4Ku2wYGaqJ87VGnW0eU6aciRsl0UB5Wn4j5+o4c9sp72GDGlp/JL/og4w0ITWHzWbDaGtjM7eyZF8c+qKboRcpQ21OuB6YoRON9mSXDYkLHSpLvwbsxLWMqeJDcgRO3y2I25eB+URrBeszLqpRdd03+3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101900; c=relaxed/simple;
	bh=vLrQNk1oEhF0dIuyRwxVYUl1enfdF28ZlASpqYSEwJ8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pYyOpdtyWksMhvqxN78pTo4JgG34RChFFl2Zd2YOcqfBIHQTl7htiwIIQtLYVGoWzwlucNvXMzALZXmDuDpdSlcvGBo7InNAaDSs/wxQmHOLGwXYsTQBeye/8JS69nzFk8ZKM4ek66WtwBJ9dPHgXsooZ1atfdjNCio/6D0DFQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smartmatic.com; spf=pass smtp.mailfrom=smartmatic.com; dkim=pass (1024-bit key) header.d=smartmatic.com header.i=@smartmatic.com header.b=kquW9MrP; arc=fail smtp.client-ip=40.107.93.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smartmatic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartmatic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpwV9T8VTUNSZQRq4yoM1P7tEkCsHaTncmsM7bndNsBg7HwbLvMKJvT12KuijdTRhD8d17N9tvhWI/jwzh4jazpEFhtrmnKg+3sNigNj1eVkMwvjZfYYudVmBVSNJl67Fvi179joZ5UxkcM4lFOhO0KCTDxBOm/KrlpbIwV1gh9xLgTgUZnyd3vg9kKxvrINbn0szrbenxW4VxAcOdmKtcG/8319Nnu90aCkqCj+oxGpZ4Q0GffSyDbojSAqup1HI4MG/a/0dhwtp3AZfB/AEMLG6PeGhg5hSmlSkJdN5KlDIeygYcIa9TlW4uazU74dDw4W0CnyDb1UQFiVSc8Uaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRSapM8LDG/VYObnuOYaI1t2vxneXmkj4ptruiGx33I=;
 b=bn2vq12RQmBSL/eVs68C9VWw/8gigx6jM9Reb7bIy5qvvT4jhx7fKV+2FBg2GLYwYXQlQTB2i/rUmXPBBSqgDkLjMH42lplIB2rayA8hcT8n+UMM9M2VcPLh/o5oRIDCv3xd68wFKX+0R0N5+hJlyAVks3HoYn9FsiFDDGnXBu2NeS8+sSQ7R742dzXe9DKuVny/r3OGBaMf/ZodJlUA5/hINhcPMZaNkmwv05eXaBBGQ9pIfDMDEdT0jKZlcqwVFdkxjubZOoBrN1SyiGxkAyuJUeuuxS5nrA9hT6csUooOWSGVu5sJswZYaM0L+shyMZnVpj03keDKTR+IfUS3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartmatic.com; dmarc=pass action=none
 header.from=smartmatic.com; dkim=pass header.d=smartmatic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartmatic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRSapM8LDG/VYObnuOYaI1t2vxneXmkj4ptruiGx33I=;
 b=kquW9MrPBMbPiXsV+b1R/UNpC6dJ5iNbcsl+ug7jDIM5baCAcVfKmAmG77FafNrI9O7gtQud0+L9++kBSPxF/70MHu4c02hie200+QZmH0mntcnqj/2jy3aa7/ap/Q9jmnJyCL5DliowIbnXEUOkGYSA4p5p62/C+TdPBHSOUJw=
Received: from DS0PR10MB7317.namprd10.prod.outlook.com (2603:10b6:8:f8::13) by
 IA0PR10MB7206.namprd10.prod.outlook.com (2603:10b6:208:402::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 18:58:12 +0000
Received: from DS0PR10MB7317.namprd10.prod.outlook.com
 ([fe80::2747:e591:541c:b7e7]) by DS0PR10MB7317.namprd10.prod.outlook.com
 ([fe80::2747:e591:541c:b7e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 18:58:12 +0000
From: Richard Bastos Higuera <richard.bastos@smartmatic.com>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: kbuild: deb-pkg: Does the deb-pkg target discard multi-core
 compilation options?
Thread-Topic: kbuild: deb-pkg: Does the deb-pkg target discard multi-core
 compilation options?
Thread-Index: AQHbn0m/U7O3niPBPEiFNilT5IY+FQ==
Date: Thu, 27 Mar 2025 18:58:12 +0000
Message-ID:
 <DS0PR10MB7317103847A838A01154D836EFA12@DS0PR10MB7317.namprd10.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartmatic.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR10MB7317:EE_|IA0PR10MB7206:EE_
x-ms-office365-filtering-correlation-id: c52692ca-a2e8-4556-cb1b-08dd6d61529b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gTbG7FGd4HD7zR3rvMoSL5Hx7FnpI8erd2AKJcuwxpSLBdpnwswp6K9UTA?=
 =?iso-8859-1?Q?NmcEQ8u7S51/Kwapw9yR7oCCZyGeu6BnfJH+44TFoj86JpRVLllALBz2Tz?=
 =?iso-8859-1?Q?Eoin3DOx98I103uDrZexVHDrNFXi7sIOfHmDf8vDS17QfXbMlPWblAIyxR?=
 =?iso-8859-1?Q?QlNR0/rINf57yLMOpNH21Gx8Z3r0a+tbJ5XEjvT14XSNx2HCo27mebYE5O?=
 =?iso-8859-1?Q?vkr6cBRnZbrnRNLSh7DH32hzK01EEUg7UjDt+U0ab7EeYKXyVkuSNvHP3y?=
 =?iso-8859-1?Q?d/7pKVHIeEBKKd1gKzNDZvia1CxuIb39X8/BkPTWuKP3S0beeyijDTb93X?=
 =?iso-8859-1?Q?XvF4R/D1vWUPVKDMW+U/zbBzN+cjauQVz8Kqk9ESWhsHuPTOgeGc6FOihy?=
 =?iso-8859-1?Q?yY1FEarKKmghlDdeGkFhbduPj80IjTW0+WVfsn5q4LiaBx9n51juEMsQ9L?=
 =?iso-8859-1?Q?dXokOFs0eeaxbgxlruJRKG5CHlMb03Mhk7DDqtDZBKYS2aj2M4XHcT9XsK?=
 =?iso-8859-1?Q?5UdRMK4THnJbFxRDZNwWEJDcHjLWOFKrVJKBJvB1/yLiFE+aqjLAgc0IdG?=
 =?iso-8859-1?Q?SGXDgTisnAytyIXQQTIJGI6/xO/v3m0XUTebQyZZR1tVseqXu3i8e9rqVP?=
 =?iso-8859-1?Q?fPOpaqGVy9Y7ab90xpeklvxHru1GlVrQ4crCtgYIzb2oTsZjcMehvI+g/X?=
 =?iso-8859-1?Q?sSPUAuWc2d91IylI2WRWH07iMCnTfwAQFoQGX0ubJN/X6GhcjRvPOgcLbz?=
 =?iso-8859-1?Q?sLIn24UsvNZYS4P0Mik0f7NbEqh/0UpTmqhHyhIobKUIktgZ0MIGXsmO53?=
 =?iso-8859-1?Q?RTfYoFBavYD+Jyd/fiRFk9Y1e4OKzmKknJHbPcf0zULkOYFk6DBxRyhbcf?=
 =?iso-8859-1?Q?VKKIGfSzahUI7W0R6veUn0caeEDFeCUDWitBD9UDZ4Xfo5O12lrBAiTGl3?=
 =?iso-8859-1?Q?4pQ5J/6Rjada/jjT2D9KWiMa11PLX0S5XMkS9yIzp4Vf1PxfWayOrSdZde?=
 =?iso-8859-1?Q?gpsk+HEw9DorzXe2cPcRv6B1V0hemZ5J1othktgKVhddbHcV9sTjM6DKPZ?=
 =?iso-8859-1?Q?g8dsQklcOjEJ1m3ukhbmBjjCyg727hMQG8mdSsvBlTrEQalRWYyzL8xvm1?=
 =?iso-8859-1?Q?e+xfuzNslmUVgeEyE8Rf3POrE3EJw8yeO/80xNbpf3Y4cM49VQmxLL6vQj?=
 =?iso-8859-1?Q?GQHsfrMnOk0xRxPSbWejn4ID5ZxxJIZGaY/SRt+jl4q4FmdpF/xUmFBHKn?=
 =?iso-8859-1?Q?C3Rod4HUR7E37dNi+AKVPo+3YDHo6+tHrHn14WGc8pkKc7NPxInJnd0mVR?=
 =?iso-8859-1?Q?uRwJkxw0DSp5YPnHnQwYSGn5yC/3i2R04c4z1ZbNia+7cFinpcXAnxEUtp?=
 =?iso-8859-1?Q?8h+xFNKAkcrPbYQgmnTPEpUAtTzjw19WiqtL3ixtMruRqu6FNnKwD0s9ow?=
 =?iso-8859-1?Q?iD8Z7HPnjeE4zaS/R7D1H8WMVkWCpqLQDxFUYWNTq90npoqNLTAjVRdS3X?=
 =?iso-8859-1?Q?HsNE8QL2inyYjKBa4RB/AI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7317.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gTXOCRUvFpd8IdvDjlx/0PAQNKqbRSqpFB+tUn1myeT7jNsZhzQbORTL0b?=
 =?iso-8859-1?Q?D+HiiMi49duCWevMB2FtxTxrGzDDJocoCs2yjVz/SQ1ZBVRXTdxOrp9Wxj?=
 =?iso-8859-1?Q?lu5f2FTVB1Lu4oRbWdBjUkJ3DPbNVIp8boelETb0cIq6QZtiAJRp6QWXTK?=
 =?iso-8859-1?Q?E8acOsQk5+hAydHgYbugsFGJbUhYN6tRWVaQMS3T2bYk87E/qqHeWgGkoY?=
 =?iso-8859-1?Q?BRgjZEofBuOLm7iEdXEcDYDZDpGCDoMO3u9+g3LP+uwxWg/TqzPZlXnZgz?=
 =?iso-8859-1?Q?jYsX+B3JM0a7ejtqYDL+IuT5m7uXptCCzIe5vXq7eBc/IRkR3irlMOeIQa?=
 =?iso-8859-1?Q?bHObNdubz5rBCx51aRuhzxGxDhbPUtsn182jdmyjtqG2vvTHR72At4SsfM?=
 =?iso-8859-1?Q?BueilntBYqiMkdxaQ6AKX4zCicWKhmDjChcQv/yu4DBPG93Hh/Hs4UxTda?=
 =?iso-8859-1?Q?Y9mqPvNJlsiwVvQjLHEh4Abdk6jVU6GOuO24N7wL+JUqnogrzB1RtgLNyC?=
 =?iso-8859-1?Q?LQkbbidnov2XdB1hCpPCDIq+1NL5/L+EPKcAJ2ySPd49+TKciQdkD5Gso8?=
 =?iso-8859-1?Q?rM5EGUKGD7T2eSPrjm3esoVqrMdleWyq1Dm0SY1qO1OZSsi0QPAWC4q0pU?=
 =?iso-8859-1?Q?7Gy5aqC9/y7pRDlJsmmO6KZSqXpmFguf1OP9pOaecsGDEA6D7Vc7e6FUad?=
 =?iso-8859-1?Q?tqnpGSjD5Ly9nbtL0uFlmL5ztKBn/7sgkR2h5VJMkWJxNmtewIardBgP6V?=
 =?iso-8859-1?Q?lSQuzvpHyo2DjoOebTvv1CRfSF96UzLG2YuQPm+jgZnM9YMrOgo2f8pf2P?=
 =?iso-8859-1?Q?VIBH7cAYUfafMQoIYFa8QgV2H+V23h7WGa5e5HbK0geaWpIdYey7Vyr5O/?=
 =?iso-8859-1?Q?rk9a0/QJ24kKwQyl1pPWHagGvdmxSKyZNC9kYrSo6c2yzzOo87x4ql3AIk?=
 =?iso-8859-1?Q?ReZ9RlGbb+Epu4XdhhTCsTQZzWBdhnvSFgU3v6EJ6jTtHsLVfHQJpfq6DB?=
 =?iso-8859-1?Q?FsKhc7VdBykEReTiibQZHo8QmpYtHjJwMBtfvKnU3rITjDZXd3XSGfvOhS?=
 =?iso-8859-1?Q?e242gFGiq6tBqnvtpNcrEFAdEzhbYagvtpCWbcWIJMSXAAhO6Er23fvU78?=
 =?iso-8859-1?Q?gZ8ch4yDazE2bqc2bzqS0VLCD4ceqPwdYNanj+UOIxYhMxLGY2uKbTmZHW?=
 =?iso-8859-1?Q?KVhqVmyDEjTHMfsw3Exg0DzwEwd0X/MVmGKOnqdOx+qkNoZUr0qKCVPHLQ?=
 =?iso-8859-1?Q?FO3MKsAJds/HtFttU7XWZoIZBx29bC3i5YX4k2ScgZY4gkBfgalT9wV8pn?=
 =?iso-8859-1?Q?XQjRj9l+jSg95Jl0ue9JnTkHztGp5dFvfgnyUEJtHO/Bv6nR5fAUKPwGjn?=
 =?iso-8859-1?Q?zd4NPWesQlvSwaktM64YFB7DZlQjvx63nPKD0PiP3mzW2+fQ1O1GP53r2C?=
 =?iso-8859-1?Q?3U5Pxmtpg7Cuqj9cTaLd+URYe19919wCMdXNZs7VgbzqDC+DGl1I6aidpw?=
 =?iso-8859-1?Q?jBEQkar+i32q2PUt3tVqJTrAUAI3WvnfC48i1Ci7He2RDQTEac7hETd1Mo?=
 =?iso-8859-1?Q?joZVPRoory4OXUNGh1s+yzg2HdySsgG8DGPnup7kEp7kZEpuAC3lvpLgRw?=
 =?iso-8859-1?Q?9KBvDoy5eUZ26oYy8z7ncv7wFg1dX9GaeAdvRUPm9gfP1bV64Vmp0rSw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: smartmatic.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7317.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52692ca-a2e8-4556-cb1b-08dd6d61529b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 18:58:12.1267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e15726ad-b237-4237-9060-d8223aaf1dbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XweacUcLOuSIHLz4thdjFMsot8eaS2KjMuGEeNbi6A/DHh/Wr0x5biQpNAe2+qzz4+kUJ7b39Uq2M/pKoFLAS3Wpr+FbMqU7OZ3yGivNf3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7206

Hello.=0A=
I'm using the deb-pkg target to create Debian kernel packages, but I've not=
iced that the debian/rules script executes the compilation using only one c=
ore. Is it possible to enable multi-core compilation without patching the s=
ource code? The procedure used to test that was:=0A=
=0A=
make prepare olddefconfig=0A=
make -j $(getconf _NPROCESSORS_ONLN)  deb-pkg=0A=
=0A=
=0A=
=0A=
Regards.=0A=

