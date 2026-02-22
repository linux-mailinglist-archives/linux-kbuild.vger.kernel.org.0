Return-Path: <linux-kbuild+bounces-11352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGEIDRTgmmmflwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11352-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 11:53:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6016EEAF
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 11:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23893011C51
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62A9191484;
	Sun, 22 Feb 2026 10:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kmewDP+p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021135.outbound.protection.outlook.com [52.101.95.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8AE573;
	Sun, 22 Feb 2026 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757584; cv=fail; b=Z/TAoOzp7jtmt5jAdqD76G4fvozlzBuQa70BDNUsSQPw3cLD1DzDmYrrUv1D5T4AFTI+qKswPJYJ2qcYLX1xY5Lu1VZYNcwh7c+4Yw1z+J3aY8irEpX7BrDJNS1I7UcuuOAstz7Ut0uBV+MSMbOwoEi3MRcx8qUtDqSQ+Zc6TL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757584; c=relaxed/simple;
	bh=kfBGpCQP8CBMOLK36bBAYSdl01+Kp6vxfVNZrXDTYok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=asv2+v3bPHWz36esQiMmiTH41wMa3BdNv7a6AL8840wMu0ylWHnODSyMMCFIc54pFLtlfZlGjZm55mf50rpVO7YfwrsnRi6XDGlAJ31Lm86GJ9Gz4M9HgkOcfH5TCd0F/8KVJFg+iOW2rXRUibjGdegAs77RLFuWHl2wlcfcp1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kmewDP+p; arc=fail smtp.client-ip=52.101.95.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2a/Qb1T8E7h+l2mYfes6gsdID/1j4QVsVoJm/MDInK0IWYseJEilL7iHjhx4oTQfNk49Pz7nhvKfwIuhaI/5JlkKYrXeQNU1CmJnW5d8Kt1e0HdNAFrRmq2oMN6u+VtCy7nDJC2UsnkG2vEKZbRspcpkuBUQkSn6kIJRcXGjtt5oE3MJxeghwMQ0CLVEGADmk8lrNx08J+tDW3GI4PamsjvbXaR55tM2OtaCwEKvqypn5hZ4Bka92v1ki4fttUmJ9tNZpjKLVIGni9IhLjXV+bbZyL5hoUVWhuQ+MfvciR2LrfLf8CyOPfxhBXs+iDlPiXqHOnZ7w5xhqidMLgHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCPqBvrCESgA2VNrdMuSg/oAKi0ufyxn+d2y2EfGIY0=;
 b=ud9OnaoP+jHEV2aGjnyYu58p+jfYLU2KRVnb9OHF6v1NVCCoVOt3LShcBS/WMfKxQG+mTfRm9KBPt6b8NWmQZCuDXhmd4V81BG5g+tWHXQyb8XnQFRmYMH6cIEA8S/sf6N3emTUDlOZsiUIm4drEi/Flshbl2JkHN2riJg2iXwPOzLw8U9uAmH7DoCbYLen5JI57oKyofvatzd3uZ3fTcDqZEk0/KLoCCoOGpBD8ovkc59tOh2FlzKDcFq6GrFyBkg0CxRt5WpxNlmtFL/GVAXy90po3PlunPcere1eTHezxVpRe6EhfrraO0mGNwu06rPifznPGNNEsHO2RlxSK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCPqBvrCESgA2VNrdMuSg/oAKi0ufyxn+d2y2EfGIY0=;
 b=kmewDP+pJ3MmUfhmtcJUR2o75Ok8aYCJaRFTcIpI/rpNc30tpKzd9CdsFTEXSId3VL4MmeitV+/vwf9vVPPaG3exhoS9Yh/Hg6G2ZYc7eBbW9SDh8pg30TiTe1TT3pxZ4aHLyWRt5GR8L7154jFY9lSyYjITUY+5sQNv6Chw/K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6807.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:349::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 22 Feb
 2026 10:53:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 10:53:00 +0000
Date: Sun, 22 Feb 2026 10:52:53 +0000
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
In-Reply-To: <DGL2ZLIOLLS9.1VOJGTUF0J091@kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
 <DGL2ZLIOLLS9.1VOJGTUF0J091@kernel.org>
Message-ID: <f7c9493821d33c7dd0dedb96d8781928@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0045.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::33)
 To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 407bc710-86fa-41c8-b4fa-08de72008b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cii5vHhEqBDEeVtI5mYKsI+2VLAJ/J2cfZ1vMAp5QnLzxobus5mzOOKTomY7?=
 =?us-ascii?Q?MNNyPEHeHP/nY/pm+Ru5+X/Rvw8/STgXDeiW3CFQCMioZvbg8DOEDd+7OyB6?=
 =?us-ascii?Q?kj7WfvJCN4LVExlMqIrvhdA5cX/8dnYtYesqKf3nC0VcAMFOrL1FG3/Zd28C?=
 =?us-ascii?Q?ck7JiZuANe/lri3ACelNZwE3Per62mQleW7CEauU6G+Wc8+uiJJh+H7iYEjZ?=
 =?us-ascii?Q?lCJtBtEBfPiXwPvb4XmLlnP+eYLXFxlZMLHWZnSnbhR4Q+dZvpUX91EJLunL?=
 =?us-ascii?Q?dg1TTglBMbsmp6o7Zuh0R7jdNr5xCrF5SOVEg8WtIR2x9y1gED7QX0nWodwj?=
 =?us-ascii?Q?Ro9QH0pdxLAtPyz3GRb54C6mauAYGkCyY5O7eeLu0Yawc4rPeE+lgIRz+NyX?=
 =?us-ascii?Q?kQ0ejYtERMeQvSPifofx+PzbxowdKOg3GpQ14C6zRY68H0c69mS71HXf51+r?=
 =?us-ascii?Q?9EICNo/j8pNXXuMjH4P6C0XueWf10m6udUnDwReVXlu6spfFg2G3dSYQT32R?=
 =?us-ascii?Q?LRfmGRe0IPcvDtpSoKN+YSKdcn+9HG7P6KY9UC2c7yXs/wxKLCc+EDysOues?=
 =?us-ascii?Q?NFcHRDWM9TJA2N4ExBnTzmvUD/hd2BPRT0ofIfnv/EjcltvN2hITfIDKCczo?=
 =?us-ascii?Q?rsHg7N0c/C3ffGaeoZOAIATgJYD/5s+mY1YRXO9+nvXQMO2HWOx0Ff3teTTT?=
 =?us-ascii?Q?L+T06qrGg8ioMH0GLHy0I7oPuCu94EZKc+GF2cWz9jJlqjaNhKD3XO2d414S?=
 =?us-ascii?Q?Nd5K5auYK0ux7YgIqKlKw5X9TrFrEV6VinB/OcJ5RniOI4HJbPCvXAYYKP1m?=
 =?us-ascii?Q?/8DhQiIuw4gy2Lfjdz8xRKJB5SBAcBxUhpH5b8lYJesRH5wDk5RmLayr+Ii8?=
 =?us-ascii?Q?IR89oy3rayP1XQygKoP1yasSEvhZfSHa9L5OLeV03ObfVIazMLSppP8vLbIw?=
 =?us-ascii?Q?kqMtcptVAphJy2eROZSyiD2tggdOh1dU8MEIHpX//gSjzFtVRBmX/TmTmryp?=
 =?us-ascii?Q?1Odbse9RrWUR81Jot+8DdK5fwMSSHwJ0FrGZStduOtskqzbfyY//h4a3gqcg?=
 =?us-ascii?Q?7RjnnnwDlA0TnD8G87Uf5hA1cmeCsMTyAnvM2jZtF3MnuG2edyy0ngNyuYdd?=
 =?us-ascii?Q?Hf4li1tdxJ52NdlbBTSeoIl7RFbFAgBY8tyM0Lj3H+GCNk6SyODK3Zx3McSV?=
 =?us-ascii?Q?SRGuNlBxyOrSJMC41FnOxnUdQ+TRjAGcj72CcL43k7+BdmEJytKKkPN4pJ3V?=
 =?us-ascii?Q?VzR9xdfBOuhjnHQWiJFlHQuOkGVZxRi3UashU2x+WpAyfNImAjjeHuOfTmwH?=
 =?us-ascii?Q?9fsCKFCs/D+S5IFIYp/Obi6grKvrkIB4HDtGGCpKO9xut5OMxsJFbJhos5Cq?=
 =?us-ascii?Q?Hg125xEKgmKWlWMBISS5i4lnAHhUFaLCDi1oK7wPGgXyC2w61/FHsol4x2b+?=
 =?us-ascii?Q?QnjnIrCLdNpCDzr2YxNaVcDh9TyJ5zHQG+KMfzGj+Ema17C6CtwUbWdzIcxE?=
 =?us-ascii?Q?xObDZe31PKH8dmV5GVIMo2zydocYTBVknKjW2ni24oSWGlRKbUKT/OR5pd7S?=
 =?us-ascii?Q?FCrvConQN/EfeKR/byw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IpXULfVlSCaUDYGQyonZmgF05UxOoQdhN9I+YvwDuafb2JZd3d87naHle1/H?=
 =?us-ascii?Q?0+tBcFTc74tUlb0oxTwY3Z7YM+xNKcGQ+FEyBEMJrHoBAMyhW1dkleMoQGoz?=
 =?us-ascii?Q?CaSPy2RePBqcCLdsTDUx4c8Q9tfBEJcHoXg9WqQNuQpDh8RDvdCIyj6JWoMB?=
 =?us-ascii?Q?629XrBXaYlfq4ixi88YCEbSIuLslTE8GPLThipPxIknknV63oDJTSBujMJEo?=
 =?us-ascii?Q?j5n+fEg6Mmd2xCnm/fYnXqsToYGBUBc/ikGBJw25SqFtZeM337VJ5KFk5x7m?=
 =?us-ascii?Q?Y4VTARGVObtovhEO6wuTRQpAWr5vKFL24bicZqy5wqRbp/5+LY66FgLP4Or+?=
 =?us-ascii?Q?Z824jhOJBMBje3z+qs9FKaXDf22P6v6NpbyuFpRn5Ud8TbHIuXHJ5ZPfUs8Z?=
 =?us-ascii?Q?rwyJcBmaDj0wiOYLzrTdNxcqs3tpqIoOO+OHUE8LC6iJ5fpVlfvVrTcUPJS9?=
 =?us-ascii?Q?XL3DwTEdlWBeWwPY7tsWHbUMHmwFstDPo1VEwACaBn+mb23Em/3CWWKGxela?=
 =?us-ascii?Q?fp8cjs4mTXRI3nfditnBjLJCM7GrGue6v0SH2HrM+wfXQ+ZIzhoXTIBmI2KF?=
 =?us-ascii?Q?qFBmFMHocxTj9psbcKTBuGrg0k1DoTUqKE++2q4Re5SCj7j3W8ER+Eh4aTlb?=
 =?us-ascii?Q?0MaW3S0CrRwr2MhgJ8wjQlDnVpcLUb4SszDfZHCRay6r5JCBwenXQdHzLSx4?=
 =?us-ascii?Q?6gl2PzJtZFF4rlA1G3yda96zHIR7XCBkG7/mBJ52uk1R5b+/1xJmsLdCB88Y?=
 =?us-ascii?Q?t330WLP4VNef8WDemojAvIUjmd6FOpKRyGwun3uwHEJDIYvcEpi7WymMSlrv?=
 =?us-ascii?Q?zdkMqwKywUEB1Ydj3TrwsJ8aLDxsTypxz5iUSQaOthJHe5BczXub2P/UVpFz?=
 =?us-ascii?Q?Gu8rfdNVDqtHr9iUjOiUnWtkgp8b6xROOQcreLfFc2eLYETt5oS+Q+QDVKV2?=
 =?us-ascii?Q?0IebYBUOpGdLcja1Qvo+s35ks8Myei5F+4G4WMaulg/Y24QLgV9XlMorlG8t?=
 =?us-ascii?Q?DoETT3gZwgXb8WHyOv27vWxOJZCtPOiafK1TaCRI2QgLZniSB4UrSyGrVJNr?=
 =?us-ascii?Q?qABHeAiJ6g2Ffd4WXrMdowQwZ13QPJCLYSTgo/7sIZShPFlDj7jO7Y3671yT?=
 =?us-ascii?Q?4kX8NUmbdX0AO+u7tBSp751L3JpVTLvWQqV4bEQVWfd1RMhToEmnGYnboZPL?=
 =?us-ascii?Q?AvaX5xmgjoas3fhD5r81O4C66aLY0BWyQXKvy2rMdvNkNd6LxujBsfmLlBAO?=
 =?us-ascii?Q?0KIeyE3jvLxlIQ4EAX57b0NWaxIYZfClXMqYzIN7yKxrmw4HzXsJxzpnNQVG?=
 =?us-ascii?Q?rXr+afOLmlLLHkInrqFT69hTw4E6jBfpF2yW0u7FwbXJQqZ93bNh2kACSpzM?=
 =?us-ascii?Q?PFewD/EbLZ+KVbkjhU2JdDeodWzZHkL8SeoFrnORAivoQ6UJsxv3If4X94ow?=
 =?us-ascii?Q?VMyfIOid+FQYg3ZWRuPBurbrJ5cIXhuW4Q5ow7TDNiK5nVCsvXGXRvDNGmJv?=
 =?us-ascii?Q?6/sQm0R3ZwSA4/Lr1xkjCkMd056DWM9Z8IQMGTq9SrQA0Ih9B8YgQBNyaRRG?=
 =?us-ascii?Q?3vekyow0Zs2FiJLAOn6ZLahf4h86ODmWZOCtIEbHyLRsUsQqPvcI7KNJYDT6?=
 =?us-ascii?Q?vRHno0snh9uPYG/QvtlUELe+j6sXaak3B1kz63vlF+vWHUxda3u2IBZFqbaR?=
 =?us-ascii?Q?7/X3wl6QVn/mwafwPajiX4lmPCtxa4WfUsBfYUSdKydMVYLkb2E7pqzrAODV?=
 =?us-ascii?Q?IcFgeFrmcQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 407bc710-86fa-41c8-b4fa-08de72008b90
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 10:53:00.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfBMsv3yRGL5Yj9pCNQnKH7x6/asnitrZh6nz5Sou8bFpZL1yiicxRvVWk8JTtK9HhPIAskzhovEX+5M0ajfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11352-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80E6016EEAF
X-Rspamd-Action: no action

On 2026-02-22 00:57, Benno Lossin wrote:
> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>> +#[macro_export]
>> +macro_rules! project_pointer {
>> +    (@gen $ptr:ident, ) => {};
>> +    // Field projection. `$field` needs to be `tt` to support tuple 
>> index like `.0`.
>> +    (@gen $ptr:ident, .$field:tt $($rest:tt)*) => {
>> +        // SAFETY: the provided closure always return in bounds 
>> pointer.
>> +        let $ptr = unsafe {
>> +            $crate::projection::ProjectField::proj($ptr, 
>> #[inline(always)] |ptr| {
> 
> By the way, how does this avoid `#![feature(stmt_expr_attributes)]`?

I don't know how, but attributes on closures passed direclty to 
functions has been stable
for basically ~forever. A quick check says that this is available since 
Rust 1.11.

Best,
Gary

> 
> Cheers,
> Benno
> 
>> +                // SAFETY: `$field` is in bounds, and no implicit 
>> `Deref` is possible (if the
>> +                // type implements `Deref`, Rust cannot infer the 
>> generic parameter `DEREF`).
>> +                &raw mut (*ptr).$field
>> +            })
>> +        };
>> +        $crate::project_pointer!(@gen $ptr, $($rest)*)
>> +    };

