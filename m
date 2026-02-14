Return-Path: <linux-kbuild+bounces-11314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACClMGdQkGkUYgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11314-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 11:37:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DE13BB33
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 11:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09BE13006172
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38422DAFA2;
	Sat, 14 Feb 2026 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Pu1Nthrb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021121.outbound.protection.outlook.com [52.101.95.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152B2DB7B8;
	Sat, 14 Feb 2026 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771065411; cv=fail; b=mRSA4i7xjeGZoZ94VWh2wcA9BLJynwaYfkn3tecuZUIbgR1XgK9MAfW5vDccu1Dzo08Wirf7QzN32ajyB+CN7awiyaQmzpbQX4IWy7X7TYe4ulWPgH0yLM30JM20lTJNdtTIkCTQh2D/2XHhIof2x3grDrSw6XWei1EaFaPeqeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771065411; c=relaxed/simple;
	bh=65WqMCFqFXBnwWiPAmriIjKyDFdtgsJXSmODgxpiC8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=b9QqOM6OfusEhqHpXGb7IHqG/PVTGu0I1Xl45GHUS8/7oRgnl8BVARNFfrP5B98c1u/zO1boas+H6gZi/WSl9xw3ssClg+oQALBJMgHltQdiUfJ7azGTC8Y/lazzigO8uKu/IxINIJ0TnYlKXE1vh2XUzek2UVFiMtCNut5C+UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Pu1Nthrb; arc=fail smtp.client-ip=52.101.95.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhcWqbYtJewSNhldSuzvAjvMzqjKj5InJCqWIJcFXVltrNgMsto+IoufIVSWwiu0pGe/cFs9CX3x8xxcK4idcZui3eoYbjkC6eTv2MuV1DpQc9WQTGAvrCvBY9EOFavfNIU80IA0uAmCpXjYushkX0TgimBFTRpZAEFcnPb8JB9d0NEH19BkntrMnNSgtbNRG8srkPdRePkJmtxYveCofydNS30HjDbkD5BViI3XnHTl64pOEPmfOvdOXhfq7GcVs8lJithW88e2UeGBzBkVsJ78PxMV8mYT9qI3/pI2Xj8Vgq96miR8gacf8Zg5eJ6LhK5yK12+WRUPwhEP5o1yXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vgr5SeOgLyozWGCIR6to3XpVsDACg3u/8mh3C6jLpFs=;
 b=Q7h1XXd2x0u1IhPuMV4hsYaWEJOj/ujvZbZKAe7ss8pp93Ewqwwa3gzM2QtnfiRVW+N4JXo6da5UgVsD06b72KbbJm2Nd0TmoSOJt78qBpooKo2vQQ/hnWqzePuo2MiMMUslwJ0KZCe6nZIIYd6uDCGzrRDCOp0Lcq1furiOD8khta+q90XTZJ4DAkvXVKRMzGj8xJCK3OOaGgqjbBhmncwoDbBtSR7Gsn2+t2hOOkr6C2VvQFu7ZXPfTZm91zE4WgftcovzTRiYkaGJXiIvewrluIF07myawlVDbaC2Q5GT3/hKI7kYdBniR8EE9q04VAIgNW8qx8OZowY/ZBDTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vgr5SeOgLyozWGCIR6to3XpVsDACg3u/8mh3C6jLpFs=;
 b=Pu1Nthrbk1WL+PRWfryrq7fS4K+aGV9hRGU5C4TdZOjFw4R707FmDgAeVmtzVuc29Ir+FzEcDzrN5XZlE7qgpxZi0TgmdFx5kZBs7aAJgBxskErpm/wJ7ERfaRSjdXhdJ/LtR+tcZl0qTeZuDOPtW7BArSLfGKSpgFsQ90NVBtY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3699.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 10:36:43 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 10:36:43 +0000
Date: Sat, 14 Feb 2026 10:36:42 +0000
From: Gary Guo <gary@garyguo.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/4] rust: add projection infrastructure
In-Reply-To: <DGELDM5523KS.3EY7C7X5PC1V4@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
 <DGELDM5523KS.3EY7C7X5PC1V4@kernel.org>
Message-ID: <60bb58cecdef3ec4cda77cfad5c620ed@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0610.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3699:EE_
X-MS-Office365-Filtering-Correlation-Id: e6afdedd-8e97-4dc4-7606-08de6bb4f20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DtIZPcurXMZt+skVUC4ToPKZdKfok2SuEVR31GCJtVOE5ZwSZsdqZOFM39sf?=
 =?us-ascii?Q?jfYboQomIrEDdia/Rz4Cb0zTFcRcWmBJc/pGAJk5nWh1SvIyFu7r408i7ox3?=
 =?us-ascii?Q?M4MkM3X9p0Ez6JSsIH2wh2AktFxIw6P8BygysDJWh84tsL5UVtjRnNXEDwGB?=
 =?us-ascii?Q?tdsXw1OqEBJkNdVbvaSm54zgu1/1kKTkqxYjbqHFrwz6ydlX89v3Psje+jnc?=
 =?us-ascii?Q?jfPaVavHpoJgVn3vtq8IfjvFBWwZLkAuuTFOnsLG9VFqWRSGkUIhIG68qUb8?=
 =?us-ascii?Q?5gDexLdB9+DMp/lSZrB1daVi9P0O89U7CmsqoeDA9BBHCQqk6nDezQxsaNYb?=
 =?us-ascii?Q?2Ojl9KvvrThb7MIQVw1fxIDIAsZmBuWJvjTjXYoweXVnc+KI31UU4rDem7yc?=
 =?us-ascii?Q?FC4gR/uR89m+bC6a48uWkpb211Kw5IcIn1P1EJHxwGHi38Z0dAtDYomyjh4j?=
 =?us-ascii?Q?J3LprCSF6LDScZYvsaHzFdu54Gk7D66aAex6ItGvlNBLDBTOaZ81jA3FyVXI?=
 =?us-ascii?Q?ImHrGCDYyu+aRM4e35Xcwzbytz+/okKFRrd9gzD0qE/6OZHM3iKP+bVYaa8I?=
 =?us-ascii?Q?lBeKelq+PXB3t2dZxNQi+/aAYEzVDPqC4DesrrBgV+4PJ03oTiy9ZOrh58S0?=
 =?us-ascii?Q?Z9+0Ie5VPXxFYRFKq3/+r2WL9IqvCEY28Td30YmiBq9p+OABzDcPaPerCRI9?=
 =?us-ascii?Q?rUesNY0Vj7TCqreE4R1jqd5S0g/VCMRRY5Vfmi4JdIrXQiSgoHVtoY29AzOW?=
 =?us-ascii?Q?hvutGR40vnVpSU5ixPnnYTvaUXmL7XH8wQZCAzj9kTbbdaA3h2LMqvBnMyBR?=
 =?us-ascii?Q?Roll9/OktCa1yJp567ZgYkh7t/LaYqAKyRdUc9Nk4AKEkhEVYn2EqpQ6ei6b?=
 =?us-ascii?Q?DgOZVRoUMmdC0WgzESCW15NdWJiD8UWpdyuMOAaumJJqwzEZLqiGBbVInO7+?=
 =?us-ascii?Q?0aonT26GHKhTpaDh+C5q1KpxBZBNMhylAaaZyOK2UAf5t6Xas04LOCSPTFqy?=
 =?us-ascii?Q?RoPh9JvQ3zlOMxqLvHMlQ9fFg92Yq27EWVBW8wg0PfyzvZ+0qkRQ4txToumG?=
 =?us-ascii?Q?/05eifWOlVqP3ZqWWJrQZBe9Yyn8xXnnrswfXXPry6F0CEhGBGZmFZAloPfE?=
 =?us-ascii?Q?zwHlhnD8e49pWTWv+qGnr7ynLz1mG2ibyWB1OkNNNMsb2jxP2PTRZv9oU2Ow?=
 =?us-ascii?Q?l3Vcp5jTp/wmPKqHegI6wxZpopYMk/V55ZLK9ugW5y87Ou8lwW/GcsRzmnSL?=
 =?us-ascii?Q?KNtufLakx4TML2bcB4CWFs61kMpcOXvPBGOQeksLi9bwat/sxtgmNbcyrcj4?=
 =?us-ascii?Q?IXelzl6XVcs5isB0nWxexilmqqWs1sQRiPrd9d6vvhoqYljxvoox9tYBsNZA?=
 =?us-ascii?Q?1519dMFe85WOm45hHM3oSyUjdgAYhhK0XvlQHOSO+7k3avd4OC86gnJrjB8f?=
 =?us-ascii?Q?N5dA1GHsrc9oRDiArHrOA7INWk1bDoUIpliDTuCFcUI6fh8bT7dlZTtjkhvX?=
 =?us-ascii?Q?eRs5TizolcLO9a7aKjkMPXlWze9H4EYQv5INYwtDkNZzk9myrlbgy5/WgFOo?=
 =?us-ascii?Q?7abUzgaFLcWS6SLSc4g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AZUHpgWfz7ZhPEhLilNrFl07fGYFHADeO+SVuPVRlNg7b9rlD1csvoRIh4SX?=
 =?us-ascii?Q?ydzWzBdHSXoV2g81h1q3Kv/qeOneYr0tL7HMZgy0Ryh1n0WDgOgVTA6XG8fk?=
 =?us-ascii?Q?UHBSz+h2YG1hHErWIO0gvWNDKuT8F+VhipKXkoR+gB/4IVZyvQ0K8cENhYOM?=
 =?us-ascii?Q?/OjooYYE4jFYFnydeVlMyR1QkVnRqCAsWp7uO51g3/3KKuNwtqsdHghBG1NB?=
 =?us-ascii?Q?MK4iJConicSmsMrzCS9PZdaF7MhJmTu14Uc0CCQLhPyDx03jqM5hskFpdKCR?=
 =?us-ascii?Q?OTAELnCAwdKeH2yBZvOyyXGaKJL0Ja/K9V3kEQT+Sy4gXDjytD95zQ85jPyJ?=
 =?us-ascii?Q?vdZ1yzJmPIjJxnGqWLKMUCvO33LMWdiWM+fwGXpEp+d8TijCMswSIsQMAPny?=
 =?us-ascii?Q?LZ1yjivNPivBPEX3ewUK8l7AAoGYm9qSwGqTFrfJdA8cEBJtZUKvGvlzvYk4?=
 =?us-ascii?Q?zof8QGC+EHmk4GAgp0BYclJ9mMybDL2luFEnSW3T0X8qugDi3ltRM5XRijoo?=
 =?us-ascii?Q?izkdDpmddfjKApv+wYBKwhphCal5vUycn2aTAdHh+EbXkeU3Egz8AE56HpAO?=
 =?us-ascii?Q?faS9BOrTA/tD1pxJCoeWdhPjFWC8+c6o4ss07YvHuEE+cevuMg1fZ4aZxEwq?=
 =?us-ascii?Q?gcocQEmyMmH1nPDQi3VRwx/LevEDEnqj05oBreVHRI1siQczhjKZMSf/TqO/?=
 =?us-ascii?Q?OeyxhdUsONi6HOVUStYlcHhDs0UUme8WEkgzxIde31snS3w1XVSwAmAK9hJS?=
 =?us-ascii?Q?X2DbBCpY4ZFy6hAPTiYsE4qgiaeifnD12o2dcPa9+HkOkGXFCAGqS7aVcvhh?=
 =?us-ascii?Q?dR5TjVlc2ZdkWiwhrX12DSFO05TuxLE0NpO9mbOe0POwDKodiTxcud2oTjIZ?=
 =?us-ascii?Q?909j71EFjlu9Ln1qXgHFuVM3aoFIzu6HOFD8RXuodtu2XAGY4OJBtvEB9Cig?=
 =?us-ascii?Q?qW3dWlM9FdEbxFZCAaJ7Qt/tquZGi/F6YGOMLTMVX7rVRZiBKy4EvqaWMxqK?=
 =?us-ascii?Q?r4bTAdaZz1F5JbhEypbKMQenz06Gb5oyioyBZUzH6PyZ1hjz17OTbb8jZg5c?=
 =?us-ascii?Q?/A6Q0SCYWLhYaUmaBbWxfXjX1gnpWIqxNsYgG/Ib50NSxmPxgChGUVG3ptap?=
 =?us-ascii?Q?XWHNVOf9SQbqlwgfH5Fve3OS/behsiswb6wIGS4Raux/K1sFlQpVRCK8lz37?=
 =?us-ascii?Q?4OFbeu9kVGhcRjUh9NYpPmtURhW6XayfS2FvAWqr2f/fc6Uy8LwpoZS8W+nO?=
 =?us-ascii?Q?thqqBwPhvOMrN2Xah12dYPjlXKwCgI05l7PadLOYi4qsWF0g6CVYKARFHYSU?=
 =?us-ascii?Q?df6m3G+HL+E3LhdbtnOJDFLg//r1GjQf8ufXLfES5V31hxFxjZv+MdAHjo7y?=
 =?us-ascii?Q?XqTeBdgyz+Xp1ENgedAk8tkAIZwqMtXYPFfLSBK79tOKYpJFKNc5FxY3Ud2g?=
 =?us-ascii?Q?QfGGSEtgR3aqTH2iwlpOr3UJXED65q9/xtuSt4Zhw5j4+fldZ7d2KmGPSO4G?=
 =?us-ascii?Q?xLYfoGBdZ9z1xYbaPQZPbkPhUC/xq3qW0s/kydQr7n3jInPM/KxtsMs5i1c8?=
 =?us-ascii?Q?zOx5Y6GwUy+C35SKINCzTuVdwSmAVhY+PRM7FqLp1bI78D/08rD7Go12O2M0?=
 =?us-ascii?Q?kwmKvfc7FlejitFhyFrwUVZoF1K8YFu45C6w3cFM1T3IDgEkOQQkFahjiP7m?=
 =?us-ascii?Q?JYtW/KhPhW1I9sDs0XUd33rh4eXGnqmHnHcPAqdBU5nqhdZA3J/XKHd3/HjT?=
 =?us-ascii?Q?JprQ/Pk8Fg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e6afdedd-8e97-4dc4-7606-08de6bb4f20f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 10:36:43.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqFwrCAAuq+jhVcOQ8A1UtBex8zYBFgNUfdXkTRJWGTZoZbJHDnZ/u8ozYqU1XxNllGpSf1CyOvlDsYMU/48bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3699
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11314-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,garyguo.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 233DE13BB33
X-Rspamd-Action: no action

On 2026-02-14 09:53, Benno Lossin wrote:
> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>> Add a generic infrastructure for performing field and index projections on
>> raw pointers. This will form the basis of performing I/O projections.
>>
>> Pointers manipulations are intentionally using the safe wrapping variants
>> instead of the unsafe variants, as the latter requires pointers to be
>> inside an allocation which is not necessarily true for I/O pointers.
>>
>> This projection macro protects against rogue `Deref` implementation, which
>> can causes the projected pointer to be outside the bounds of starting
>> pointer. This is extremely unlikely and Rust has a lint to catch this, but
>> is unsoundness regardless. The protection works by inducing type inference
>> ambiguity when `Deref` is implemented.
>>
>> The projection macro supports both fallible and infallible index
>> projections. These are described in detail inside the documentation.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
> 
> Cool work!
> 
> I was wondering how you'd make this safe and general, but just having a
> primitive pointer projection macro makes a lot of sense. We'll have lots
> of projection macros that use this under the hood instead of a single
> one. I like this as a stop-gap solution until we have projections in the
> language.
> 
> I have a few comments, with those addressed:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 
>> ---
>>  rust/kernel/lib.rs        |   5 +
>>  rust/kernel/projection.rs | 269 ++++++++++++++++++++++++++++++++++++++
>>  scripts/Makefile.build    |   4 +-
>>  3 files changed, 277 insertions(+), 1 deletion(-)
>>  create mode 100644 rust/kernel/projection.rs
> 
>> +// SAFETY: `proj` invokes `f` with valid allocation.
>> +unsafe impl<T> ProjectField<false> for T {
>> +    #[inline(always)]
>> +    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
>> +        // Create a valid allocation to start projection, as `base` is not necessarily so.
>> +        let mut place = MaybeUninit::uninit();
>> +        let place_base = place.as_mut_ptr();
>> +        let field = f(place_base);
>> +        // SAFETY: `field` is in bounds from `base` per safety requirement.
>> +        let offset = unsafe { field.byte_offset_from(place_base) };
>> +        base.wrapping_byte_offset(offset).cast()
>> +    }
> 
> There are several limitations with this impl. I don't think we can do
> anything about them, but it's probably good to list them somewhere:
> 1. We do not support projecting fields of unsized types, so `MyStruct<dyn Trait>`.
>    (note that slices are supported with `ProjectIndex`)
> 2. Since this creates a `MaybeUninit<T>` on the stack, only small `T`
>    are supported. I'm not sure how much of this will be optimized away,
>    but it might be the case that it is not. Projecting in the same
>    function call stack multiple times might result in overrunning the
>    stack pretty quickly.

I've verified codegen and haven't managed to get this to actually generate `T` on the stack.
LLVM always figures out that the offset is the only thing that matters and optimize away
everything. `memoffset` crate also creates a temporary `MaybeUninit`, and given that it was
very widely used before `offset_of!` is stable, I think we should be able to rely on this being
okay even for large types.

Note that I've taken care to mark everything `#[inline(always)]` when possible, even
closures passed to `proj`.

> 3. The `wrapping_byte_offset` function generates potentially worse
>    codegen when `base` points into a real allocation.

I'm highly skeptical that we'll lose any optimization, but this is indeed
a possibility in theory.

> 
>> +}
>> +
>> +// SAFETY: vacuously satisfied.
>> +unsafe impl<T: Deref> ProjectField<true> for T {
>> +    #[inline(always)]
>> +    unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
>> +        build_error!("this function is a guard against `Deref` impl and is never invoked");
>> +    }
>> +}
>> +
>> +/// Create a projection from a raw pointer.
>> +///
> 
> I'd add a paragraph that explains that the pointer does not need to be
> valid in any way. It should also explain that the returned pointer is
> only valid when the original pointer was valid.
> 
>> +/// Supported projections include field projections and index projections.
>> +/// It is not allowed to project into types that implement custom `Deref` or `Index`.
>> +///
>> +/// The macro has basic syntax of `kernel::project_pointer!(ptr, projection)`, where `ptr` is an
>> +/// expression that evaluates to a raw pointer which serves as the base of projection. `projection`
>> +/// can be a projection expression of form `.field` (normally identifer, or numeral in case of
>> +/// tuple structs) or of form `[index]`.
>> +///
>> +/// If mutable pointer is needed, the macro input can be prefixed with `mut` keyword, i.e.
>> +/// `kernel::project_pointer!(mut ptr, projection)`. By default, a const pointer is created.
>> +///
>> +/// `project_pointer!` macro can perform both fallible indexing and build-time checked indexing.
>> +/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
>> +/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
>> +/// `OutOfBound` error is raised via `?` if the index is out of bounds.
>> +///
>> +/// # Examples
>> +///
>> +/// Field projections are performed with `.field_name`:
>> +/// ```
>> +/// struct MyStruct { field: u32, }
>> +/// let ptr: *const MyStruct = core::ptr::dangling();
> 
> I would only include one example that uses `dangling` and for the rest
> just define a function that projects a raw pointer.
> 
>> +/// let field_ptr: *const u32 = kernel::project_pointer!(ptr, .field);
>> +///
>> +/// struct MyTupleStruct(u32, u32);
>> +/// let ptr: *const MyTupleStruct = core::ptr::dangling();
>> +/// let field_ptr: *const u32 = kernel::project_pointer!(ptr, .1);
>> +/// ```
>> +///
>> +/// Index projections are performed with `[index]`:
>> +/// ```
>> +/// let ptr: *const [u8; 32] = core::ptr::dangling();
>> +/// let field_ptr: *const u8 = kernel::project_pointer!(ptr, [1]);
>> +/// // This will fail the build.
>> +/// // kernel::project_pointer!(ptr, [128]);
>> +/// // This will raise an `OutOfBound` error (which is convertable to `ERANGE`).
>> +/// // kernel::project_pointer!(ptr, [128]?);
>> +/// ```
>> +///
>> +/// If you need to match on the error instead of propagate, put the invocation inside a closure:
>> +/// ```
>> +/// let ptr: *const [u8; 32] = core::ptr::dangling();
>> +/// let field_ptr: Result<*const u8> = (|| -> Result<_> {
>> +///     Ok(kernel::project_pointer!(ptr, [128]?))
>> +/// })();
>> +/// assert!(field_ptr.is_err());
>> +/// ```
>> +///
>> +/// For mutable pointers, put `mut` as the first token in macro invocation.
>> +/// ```
>> +/// let ptr: *mut [(u8, u16); 32] = core::ptr::dangling_mut();
>> +/// let field_ptr: *mut u16 = kernel::project_pointer!(mut ptr, [1].1);
>> +/// ```
>> +#[macro_export]
>> +macro_rules! project_pointer {
>> +    (@gen $ptr:ident, ) => {};
>> +    // Field projection. `$field` needs to be `tt` to support tuple index like `.0`.
>> +    (@gen $ptr:ident, .$field:tt $($rest:tt)*) => {
>> +        // SAFETY: the provided closure always return in bounds pointer.
>> +        let $ptr = unsafe {
>> +            $crate::projection::ProjectField::proj($ptr, #[inline(always)] |ptr| {
>> +                // SAFETY: `$field` is in bounds, and no implicit `Deref` is possible (if the
>> +                // type implements `Deref`, Rust cannot infer the generic parameter `DEREF`).
>> +                &raw mut (*ptr).$field
>> +            })
>> +        };
>> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
>> +    };
>> +    // Fallible index projection.
>> +    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) => {
>> +        let $ptr = $crate::projection::ProjectIndex::get($index, $ptr)
>> +            .ok_or($crate::projection::OutOfBound)?;
>> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
>> +    };
>> +    // Build-time checked index projection.
>> +    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) => {
>> +        let $ptr = $crate::projection::ProjectIndex::index($index, $ptr);
>> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
>> +    };
>> +    (mut $ptr:expr, $($proj:tt)*) => {{
>> +        let ptr = $ptr;
> 
> I'd add a type ascription `let ptr: *mut _ = $ptr;`
> 
>> +        $crate::project_pointer!(@gen ptr, $($proj)*);
>> +        ptr
>> +    }};
>> +    ($ptr:expr, $($proj:tt)*) => {{
>> +        let ptr = $ptr.cast_mut();
> 
> This allows `$ptr` to be a random type with a `cast_mut` function. How
> about:
> 
>     let ptr: *const _ = $ptr;
>     let ptr: *mut _ = ::core::ptr::cast_mut(ptr);

I think `<*const _>::cast_mut($ptr)` probably would also do.

Thanks a lot for the review.

Best,
Gary

> 
> Cheers,
> Benno
> 
>> +        // We currently always project using mutable pointer, as it is not decided whether `&raw
>> +        // const` allows the resulting pointer to be mutated (see documentation of `addr_of!`).
>> +        $crate::project_pointer!(@gen ptr, $($proj)*);
>> +        ptr.cast_const()
>> +    }};
>> +}

