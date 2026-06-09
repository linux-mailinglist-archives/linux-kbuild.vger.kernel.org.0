Return-Path: <linux-kbuild+bounces-13660-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bFRIC4tsJ2r1wQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13660-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 03:29:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503365B9EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 03:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Kp5Wh4mu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13660-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13660-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CFE13010BBA
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 01:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240D0301468;
	Tue,  9 Jun 2026 01:28:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09DE258CE7;
	Tue,  9 Jun 2026 01:28:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968533; cv=fail; b=Yrdgrce1nFigSIZN/zRP5YN1fiu9adFPPHLlen5NIonymvJEutdV0UdY3IukRdhPrnTiOJoz5Jk/PD4BEq/vU7Wu0tBABFQlag/H7MKrO7W7e7EYvsSqk05VoCi4dzWeL6DC66yJCb4nSjcLuDDlKp7/1QJODtMrkQ2bs16eLHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968533; c=relaxed/simple;
	bh=TXTkTEL+vtrK5gYmNwi2VyfA+DGcC1Apm81QkrT+Q6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VBDqFVwQojFqPPVpH8PG8kbGxGY7YMTDIMEzvqYxA93ZQyvSd9tHsVjD22F62EimnA5LxJyjabapu/0/365wqRvSlmStvh9oFNDoxXvYJojYP2tfd+aRjTG5WjpZgS+hrxD+enyHPI1CLS6Vfj8XyikJNONDObPGyoEX0nS+3Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kp5Wh4mu; arc=fail smtp.client-ip=40.93.201.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwV2uky+oMSZPavf95A6kxBmnkUbDudvgq5d5XbgPGSNP/rJvRJHMVNgSlrOvDJzb3Bl8T9HRD1yUiR7LwnpznNkLwdgFkBQZBUAJgHFLJdVmEWdYiTWTuAa/hJJc87Jjey+cuAanuKAT5TLMkkkKZTfAbrs10LuTSrtYH5gY7XwZYM3KkzBYqhAbxt1HQbU4wYddP0EWuda3ud+kUGZpt7gHpKRnvYMd0IFx0GMhifzzM3iQ24a75rtUvfGQe9aXNqWH0okaEzsY1rERG6xECkHISyGkSShoTEJ0DOtPbpJJqhvKbfz346fxF87Ppd4G+5x12d7vB0Y4uaBUoTVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKF5JVP1TMnh6S+BvQjRfCOcJKfCaHchTL1MnlCSbjU=;
 b=g8Jz3+BMS1/dytcAsI7wOuikwPHG0kiOkxKHqaZfUdLoHe74JZH3jbqgj711zn+kgVVg2VzZHJnCsrI4tLtgXmor7nENzv//aqyqYTcOHE6p/AEYbnfsHlfFrUcpVeXF5ihAB3L+6FFz0zvRfe64+y7nKPAjRZ+kXPCno4RAI/t9keP0BsbwXEBND3XmaMvBfhRcxX1xBv1yXrAMYoecHZsrkAuUgigTru5Z327ln3Zqlp5Z/gw78t8pZEka98gsYn4hp8aSIC6YnyfLa+V9QnXGbtdmrGLoAViOT5EgO7cyTbQQdD05abVH0gvA7DopgpnUxMzKmikeWzuANcMW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKF5JVP1TMnh6S+BvQjRfCOcJKfCaHchTL1MnlCSbjU=;
 b=Kp5Wh4muSIZYz92ynyYgBx3qV+04F74C+zs/GMUkQPfd6pvvLY4VU/5tkkxmcuUVtCJ4vdh+az20PzRKdJkx7t5DjLaEBs32oCGLmVRPTJRIgy4449sqLdORWNtr6MxRKimzkTwwIMQvZ31DaJPl2nFWXIWBrJaycFLEaJv15z8=
Received: from DM6PR12MB2972.namprd12.prod.outlook.com (2603:10b6:5:39::31) by
 PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 01:28:41 +0000
Received: from DM6PR12MB2972.namprd12.prod.outlook.com
 ([fe80::574d:7c2d:4d0a:855e]) by DM6PR12MB2972.namprd12.prod.outlook.com
 ([fe80::574d:7c2d:4d0a:855e%6]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 01:28:41 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	"nsc@kernel.org" <nsc@kernel.org>
Subject: RE: [PATCH] kbuild: normalize paths in quiet compile output
Thread-Topic: [PATCH] kbuild: normalize paths in quiet compile output
Thread-Index: AQHc9xSZqJMdlj+mvUiyB+P76+sksrY1OKaAgAA3q5A=
Date: Tue, 9 Jun 2026 01:28:41 +0000
Message-ID:
 <DM6PR12MB29729B9355DAB5D0C7D9C125821D2@DM6PR12MB2972.namprd12.prod.outlook.com>
References: <20260608070039.4069917-1-kevinyang.wang@amd.com>
 <20260608220859.GC2340474@ax162>
In-Reply-To: <20260608220859.GC2340474@ax162>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-06-09T01:28:13.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB2972:EE_|PH7PR12MB6905:EE_
x-ms-office365-filtering-correlation-id: 976fe3de-8acd-4c3e-9191-08dec5c67064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 YUA4pCJz5BQrqddETsPFADgSsqyArxqiJAl+BF0UhO6f3E3e3Mg5Ti8ZzWrnlF8Hg+fhWbaZbXaFz5q9EHlu6cFnGqxt+zCfz27nHdnzTTq7iAm+gZmC0z85LuLhIV41RlWka5cr+GM/fEMCCmf7w2yoF+Xd0yrccvgzeV8HKX68XqZsXMeObJJ1CtqtACDls90102Tjj7r7tm0ztYBR47AuwOHMiKm68J/HSYl0u1pRkJVCxVWvhbCdMtH7/NcLOfiO2p8KSTOuz4bbtYU5cZz3L7BHzczYDCB7SNqSGl9hQNEZl/5Q/eP+nxmJtguIVL6oI1J36pBPxdeClk7RICJjAF4CkDyCbdE5p2r6bOV1+B/uFBFm5Dwof4gOWDD2IAlfREepVKWQ+k2Ot2ZpUjHkKgePgbURvUFsG8Isr+NTdyWNshJJsv6UnN847zS714LBSMpouHsrTWshUQ03DwT60zNinOwbJzvvKd8ezta4pkBxz3m8j6YKpGEuz/yrj+Zus8gSl7gir2i95d/df4rmUwGDNHRVmEwiAxPay8xYJ6GnNYfzzRRQPaluZZHSAMFy4hIlvppemycmri2TZjMyOG1j92z7rsn1BkuIscpkQSU4c7uv/OssWVANWQ48q6KLVDdZ5ttwiwnB+u6WkxB3yc5T4kjSbJR72QkM8BV5DOQ2CnPdEoL6QvS+mF/rlAg3DjRcJX6zPJpjucrtoaS2bQaYzI8LvmiuIyjGzHxIK3sgUSZfMpWgtAnbf1Un
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2972.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H+7/5xYMr72M0Xoa+Jjgctkvp7IjmJUqmI9XcK24yDimpgnLY4AKotKH0CX1?=
 =?us-ascii?Q?l5rm4lV4YPoYGilPNqMxZIyVyMv7ukdkQmFd3le6p/G6KMFpqhvCpOZFzWQG?=
 =?us-ascii?Q?9o04e0R2EO778ZOuMIscvxI6lJ/N4qfQZGa2yzdB+ORyFZ8dVskcq6XGXBr9?=
 =?us-ascii?Q?gGn6TU02/gDFYZ5l6nlT9evWMKiYWN8gRng6BOb5JNYFUOb2NVl/6rXPXIAT?=
 =?us-ascii?Q?Ka4islx1xtkoSSHG6WaG1X8iZ36d1pQbdwM3cKUGI+QONCOGR4Hc2PK9Hk0S?=
 =?us-ascii?Q?cqWg+ZwRRB759xpR5hSr/q+aXQjh+9qF0j0oFCmRf5el3AN8iu4t33Y8pzex?=
 =?us-ascii?Q?vBs29vnfAUDb5oN7rD6dHTxs8/qOqCKje1zIg9BF4E0ziQP80bFqdcZ7P1Zl?=
 =?us-ascii?Q?gzAAQNcg0H1idVkXJlb7D9yefMKUqCWczKaQuyMbSTSuAeIv7SsOSiScrK5K?=
 =?us-ascii?Q?C3H2QQAvFJNN9J6guOXmNslopMUHxvoUSMWZQfgiRRECXbOLr2IvYLaRWE+9?=
 =?us-ascii?Q?1i3WY7A0c+s2+AmABoIT9n3Y+qdxLdNVLcwdz6ZHKxY3dsjsNq2vpZaLJhjh?=
 =?us-ascii?Q?EyOPznVtYTfbf3ZkgsQhQBcDPV09QoEdsgwWbx2P98aluM+sGoEwZGoLAD4b?=
 =?us-ascii?Q?TC0PDj+YREppsE0WjcfB22+TlSf8JrfwyFhKbtKpFKC71v3cHCFpVbO7+wxI?=
 =?us-ascii?Q?ja9VXpdpaMVPE36QEInhG+tFlvRiZkraIXuEyQvXuAb6MnUoK+iH2qmzyeR/?=
 =?us-ascii?Q?K9Gk4hUyl+ePxmlNpvnOpZwy5FpjQdiLRR0n4gCqbN1Lom3musAlRFRvT+1U?=
 =?us-ascii?Q?Jk2f6gg2ei7RjVYnCe/huIl7goZ23XccIZb5VydXTq3exPf6mSH6/YUd+NVJ?=
 =?us-ascii?Q?I6+ihtLz7aKoPfJpkqbGti9v2GOjHCiOydOS/fkZSJbsM9+4UZRIAiaQLw4O?=
 =?us-ascii?Q?nuAncMJgG7WJ5LlpQsyyrw0fGixAkXVJjLFo+D9X4jRH1PA0HEsy1Yh5nCaY?=
 =?us-ascii?Q?gsSfPeWfPiX/xwDOoFld+iL6dHdeucXDiFEZeJTtadt27OCTbSgfNQIHOpI5?=
 =?us-ascii?Q?SP3jh3ZyenqvvDyTA6ME0cRckvxLw0hz4c/UboBckKAlvFLoXU2/S3eeP1wU?=
 =?us-ascii?Q?FyYu/tAiYeS/+92hXQEetiAZrnA1ojevkjrEELJvCkWL+mgI1rcB71MqErJI?=
 =?us-ascii?Q?+sISjDDwM7TvjmUXjig3wR31qacK8kIBbyOmQ2O9sPjgZNjfUF5NBL6k07HL?=
 =?us-ascii?Q?soAQAu35Bfn004/SHijQlv04N7F262UAqHbDXF0szzJ9LEexlaf3dQxUSbuD?=
 =?us-ascii?Q?FrxGBWTibyMYCrXvgEOBht2oESTpZH0v26r5TDMzsuWhSpfPvGhBtQ4Svcuy?=
 =?us-ascii?Q?gXMpraX06p0B2iZa9ah2P1gre7cTsxxqcgk0g088+qyw3mbV/Ht1rugDohee?=
 =?us-ascii?Q?wz1J4mf82xtrnEgotF6eqWRMVNe/rshbiwGELWff1EAhvmu2AN/phKG3bOe9?=
 =?us-ascii?Q?WcwibDOd7u0oaRF/k7kRTMQr5S+3fjRXMb7h7A+SpkbyKe01vj2nosd+fdTt?=
 =?us-ascii?Q?so/jEhPPcA1RkevTWKPZ0nvwB4/cPMo/M/UKZKrfzwTRw5WnUejYMdjhNdSW?=
 =?us-ascii?Q?gKXMHEqKyMuCjZexVb/RMCH4/SVXjn+oMEq5StD5ft/lUAvKVnyG8+eJaRsP?=
 =?us-ascii?Q?utN9kU3InuBgSq6oeO4BFQgB/BKoFt/v38+kJrX8TIIkb7NI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2972.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976fe3de-8acd-4c3e-9191-08dec5c67064
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 01:28:41.2986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYQcQ6gjeeE2eQxq3+SSDnCYUdKmT3ahsPcev6Pauzq97RQ1d9njDj8uN1nXk85P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13660-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nsc@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[KevinYang.Wang@amd.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[KevinYang.Wang@amd.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6503365B9EE

AMD General

> -----Original Message-----
> From: Nathan Chancellor <nathan@kernel.org>
> Sent: Tuesday, June 9, 2026 6:09 AM
> To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
> Cc: linux-kbuild@vger.kernel.org; linux-kernel@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; nsc@kernel.org
> Subject: Re: [PATCH] kbuild: normalize paths in quiet compile output
>
> Hi Yang,
>
> On Mon, Jun 08, 2026 at 03:00:39PM +0800, Yang Wang wrote:
> > Composite objects may contain relative components in their member
> > object paths. This can make quiet compile output include noisy dot-dot
> > components, for example:
> >
> >   CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
> >
> > Use the existing normalize_path helper for quiet C and assembly
> > compile output so the same target is printed as:
> >
> >   CC [M]  drivers/gpu/drm/amd/amdkfd/kfd_module.o
> >
> > The actual compile commands still use $@, so object paths, dependency
> > tracking and generated files are unchanged.
> >
> > Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
>
> While I agree that the dots are ugly, I do not want to take this change b=
ecause
> it makes it harder to figure out how to build these .o files individually=
. For
> example:

Got it, thanks for the testing and explanation. I see the problem with dire=
ct single-file builds now.

Best Regards,
Kevin
>
>   $ make -kj"$(nproc)" ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-linux-
> mrproper allmodconfig
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
>   ...
>     CC [M]  drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.o
>
> works for building this file individually but the normalized path produce=
d by
> this patch
>
>   $ make -kj"$(nproc)" ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-linux-
> mrproper allmodconfig drivers/gpu/drm/amd/amdkfd/kfd_module.o
>   ...
>     CC      drivers/gpu/drm/amd/amdkfd/kfd_module.o
>   In file included from drivers/gpu/drm/amd/amdkfd/kfd_module.c:26:
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h:46:10: fatal error:
> kgd_kfd_interface.h: No such file or directory
>      46 | #include <kgd_kfd_interface.h>
>         |          ^~~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
>   make[7]: *** [scripts/Makefile.build:289:
> drivers/gpu/drm/amd/amdkfd/kfd_module.o] Error 1
>
> does not.
>
> > ---
> >  scripts/Makefile.lib | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib index
> > 28a1c08e3b22..7d1589d993a8 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -239,7 +239,7 @@ ifdef CONFIG_LTO_CLANG  cmd_ld_single =3D $(if
> > $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o
> > $(tmp-target) $@; mv $(tmp-target) $@)  endif
> >
> > -quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $@
> > +quiet_cmd_cc_o_c =3D CC $(quiet_modtag)  $(call normalize_path,$@)
> >        cmd_cc_o_c =3D $(CC) $(c_flags) -c -o $@ $< \
> >             $(cmd_ld_single) \
> >             $(cmd_objtool)
> > @@ -254,7 +254,7 @@ define rule_cc_o_c
> >     $(call cmd,warn_shared_object)
> >  endef
> >
> > -quiet_cmd_as_o_S =3D AS $(quiet_modtag)  $@
> > +quiet_cmd_as_o_S =3D AS $(quiet_modtag)  $(call normalize_path,$@)
> >        cmd_as_o_S =3D $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
> >
> >  define rule_as_o_S
> > --
> > 2.47.3
> >
>
> --
> Cheers,
> Nathan

