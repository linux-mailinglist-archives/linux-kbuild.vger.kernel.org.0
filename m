Return-Path: <linux-kbuild+bounces-11296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIPmGG57jmmJCgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11296-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 02:16:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1113235C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 02:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09F71301981B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 01:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0222A1C5D72;
	Fri, 13 Feb 2026 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h9Y03uzr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC6A6BFCE;
	Fri, 13 Feb 2026 01:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770945386; cv=fail; b=l0VSWEUqG1apOoY8v8IBXUDxRsEoah0nhlXFK9LgXNC/a+K8fCok3BeitBAy34HBCq993T/AsGUlvocnmihCg1mZhJTYpyoib6EfAJL4hr6gFErk9ViiH5Ms+8DLTEZr2meCz11xz3QB7HGUkXYCYDuFpCpmqwGvHSlNqjMbaJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770945386; c=relaxed/simple;
	bh=GdqSr4Ka0qezI51eJAvXFfGIQ/aKtR925C5mifDn/jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ui/FMMh9i6VbYFz3XEh1ZNtbrLCeQTMQBj/rSZ/4gl2RolOFlj+jdV0VchPEURoPXw3FAgSUqksqHKj3HU2OS765Qi91uGW71pPUqLL6qTclA083WjHGSTFrmQfLyaN9AEhBs/Mek+f2FiLR3ceLp1rYpgTtH5+R9uew9cxGSHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h9Y03uzr; arc=fail smtp.client-ip=52.101.85.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRxOwWJOifQQiV2AjKeg2A41deiOeJ/eWy2qDwUfp3LikzJJ7n7QgPo5ZRjFdlv1fn5sPrCNovMaqN2dT4zUENwG8ChmU2piUntqCcuTF9z0CbCfFm1WH2L96nkDUcIAsESl5GEMPfdVApfo3/SxlA1SfcDZSmpHgsq+XUVEQR82DxtOEYVQLr4EDYLebnZKgauWCKJLVaKaeJBEqTNGTfim008jt0/O6lmapcFFGRPhpw1xlgRA8g/ShOAWdshvAgMapDWcrokB/sbucx0C7+L/szUd6J5l8PSKzns1gjQdzrd+qvv4HSIhMBi/eBXd5gVEhG2iqXTMoki7dJmlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x29TuKrd4X/pAg3oZiXFrdKWf8FD9QBQoqQb3XGwebc=;
 b=vp5xwKTurs8IqCqjB6q7+N6OC3iMJA/n+nx+uWo8tVddH1QKpGFmWYdDorc8jKXvzCcGFVj2NTxqUXLVAmFH3pxCGhnBZ9nLUJidxEyjglXhofLcjgryU98/zzfv1ze/8kahXi51/l+vytpl1ugpEZXQtefTnwegfp28nOkcfhMGqQm+izZiXipGTopEjjO6LXuFL9RPP4ZVrDBx1GIG/HZDOIw3FjoqipK7On0l6p6xuLYul/6IbcA5QSMeaehR3DEEai7N/YwyPW/djhuiCG2ulY5vLcmIgdrBALM+0eyxs7lywsPFGN9YwZyXfCsO1jxB4JTbZaZ0g3HiCmXrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x29TuKrd4X/pAg3oZiXFrdKWf8FD9QBQoqQb3XGwebc=;
 b=h9Y03uzrm8RQqTuJwPjeyWnGmQrXE/sAPBiM7REUN9lU49Fy1W8snxwib1GFmn6VKzTANqud/BV4yanG7TzQkkl5i90z3MD47awSD2kxWCploBdsIPcau6OY2LCss4lW8gHRz6u1Ng0XG+mafhTaZO4DSL7gOrGjuHjIVcbw4QTPMeGNxMYcFunK1laNXkICHZGDuYbk7x+RaQ58v+jH1orTxF4+dj5xkhQSvtxNdo9F17fjQmvPu6M1XS6hMQjgTZQW/TDUi9CXlJ5baTCEt5ylYUcJ5nWuBVY7u/xOND9uyZOYWU3ShdN/qMN/HbBdNKn0YXkTRDxZjfEHyZIoVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 01:16:21 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 01:16:21 +0000
Date: Thu, 12 Feb 2026 20:16:19 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
Message-ID: <aY57Y9WorBLiJR8E@yury>
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206171253.2704684-2-gary@kernel.org>
X-ClientProxiedBy: BN9PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:408:fd::14) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d4235e-2139-4b62-2ca8-08de6a9d7f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2jOun60rZ13L9riur//PNkf6sDcw7U6ga+dBvIflJcRLJd+ltWYvP6HotmE?=
 =?us-ascii?Q?Ak7QmxYtm9CTv+BopubcXbHkUEeM6y13/yqFtSew9QXZCTFnpCGUy7zkoTj+?=
 =?us-ascii?Q?VqosdB2VNkQOAKWKQYn9xkM8bUnrzl8Epbe7CwHUp6NJa4lYIxq5NZb4P1sm?=
 =?us-ascii?Q?9VMJdkf8qcU/CZWi0IiI/91NgrX1m+IUSqENNCa0/A40Ia04yrWylZaOD75S?=
 =?us-ascii?Q?ifc+DRXFr9WyWoqbKF2kG40v6fV+U46r+bSXfVvFI0mg4hPgnubARmpC5gML?=
 =?us-ascii?Q?pidHYSRwBGlUy+WQWjEibfI17ODmo8ZDdmgRjwzsRIq2M8wsn+PvvqTpYjP8?=
 =?us-ascii?Q?f/bRhzX+96osAL2GlKna48H7ztXXPUH9CRpb/QSZvDV931CiOT7IUugVbVUw?=
 =?us-ascii?Q?EEz4+/dIr+av2mf4W7PleRThqY/ywc9slA1d2RXWYsakdZxK+IMBOGLbxCpj?=
 =?us-ascii?Q?nw+b5SUpXMYd6TCgHOXmlwMnRFAmTD+KJGLufG19MsCHOum5WG60PVBg5Ehf?=
 =?us-ascii?Q?iWiaYo45aowJJZ9HT1mzRt01k1Y/tCz6YBB5W0PoGe4kKQ5HUmqxIVnk0YQI?=
 =?us-ascii?Q?DhMQhQ37Mv4nO2mbEXfhpa5IhA6EsebR01pz0gw9w3P/sMeWJqb5Hau1iM7y?=
 =?us-ascii?Q?c1Js36+gAEBSK/TCSecKk7w/m0kJ0PQgtbOayGuzFA+SjKKQepQbFeGJBcd5?=
 =?us-ascii?Q?7ePoGwf0a5K0snhkkWlHVso9aUkuO0AcCceqEs5cYkKMpip+TXVwBkbUl3WG?=
 =?us-ascii?Q?3QLSwdv4ZdgsYl/L1Uy6FAM//58ylSCbAB78p81tU9Sh4Kd24k5PSCaDpcJM?=
 =?us-ascii?Q?hWwbuLNf4okWtckEfrZwwXrqbTHGTX3nZ5lLxWBTdE5ewKxnDrX9HI/nzDM1?=
 =?us-ascii?Q?hI4BY1kJ1nqtKIrDB+JLyQRdqu71WR3WIgZ/xDnyu083Elf34Koa/KvKvfCH?=
 =?us-ascii?Q?2QOdUmtbvVmudGqfRPe8+d4oAy2BP+oSBzNfq/g+THXkLqadEcIP/1XP7DYT?=
 =?us-ascii?Q?O3mFekBuA3eZA2+JU56+GHZk6qiJ02RgLEGX1A+ssp4FhoBxuqDVw5OuTMc6?=
 =?us-ascii?Q?iYBSwMgVhL/DurEqCOhv3fz0eqyI+i1DGpTkUOJGNhWmuGG1GE/qVLwkf7s4?=
 =?us-ascii?Q?O1gAC8qvaAETM3FUdtT6EIB5zssZCQZeCqKLAklTmhtWOnwyhvrsQe6PmVUs?=
 =?us-ascii?Q?YZ17lLBugieAeecd+CvUKkUhZuycln0FjqeNdmDIcZsxQgjoFTS27vN2L3v8?=
 =?us-ascii?Q?GoYjGY6qbgRCxJPYt/z8sm9goAoRxqMdr4RuPVnOnEDuSHo+soLK7sudHlBA?=
 =?us-ascii?Q?/lAsojwrKEPbQlcdkWrySLMJ7FdRX3Ii4yJ689ARV5xVe2ensZfz3kEaScbL?=
 =?us-ascii?Q?fKk5lGzbILj3FtCr2ne9N+Gl3RiR2Np9qbKKg7SmxDQN1idg4FMaoMgF8OFj?=
 =?us-ascii?Q?pRYwR10tUf9UHJ+p7wJgUpb3QFUeQ7JmkcVUNBJj0o86VBgEoVsSAHs2R2uZ?=
 =?us-ascii?Q?f2BiOgg0wDlS/9JPAe6u6hxy1ZRpax9X6+ELjdTnzUr+9hVWbPBe/ZfQLi6n?=
 =?us-ascii?Q?X93elURwMqWvmTHi5ik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQjguTuj7+9ykQUEEnIRi4Bm5lpISElNyNhajk/p0a7UDHuDrNEsvEWUB6EM?=
 =?us-ascii?Q?DdMMQU1F4cAJmU2LtIB21HGeEV2OtLtL5lNf2STri9N0fFdPI8U54P0xyzGz?=
 =?us-ascii?Q?0klnwpvzFLK/F37ogev2qlCtTynm9EA0LIcvUaeDolV2DPkyDLEKCUUaQSDR?=
 =?us-ascii?Q?/te/x35tqkn1Go+cZxkduRSwqqLmcMWYPIYPnR367FnosuNvDV8sLhqEBo0v?=
 =?us-ascii?Q?mZIWSx1FrlhtyUdIqK04KI3cUms7a2q7ug0c4Dx8I5lOORbz/hBt5fQkGhO4?=
 =?us-ascii?Q?0m9kQaOQTtoaVDKx6QhGyLHIRXwxXMXHLH3FWgbu4XDI/L0Xho0S8IIkpwpA?=
 =?us-ascii?Q?EH6P621OO1Pd4qB5twpL8pJNIK/GW36XdoI5I2HfWPZESNEvacUIXtN0LuMX?=
 =?us-ascii?Q?5o3w4fnQyd78yr/Me/KECVnVvM7twbJ/fANgRr6sA6cCoqLhz8sS4DKmwhEr?=
 =?us-ascii?Q?ERQrEzbaj3AmeIqfyHr9BfoN2B5x8eJinngImoN9ahH+4PE/Ba81MVQFYYeE?=
 =?us-ascii?Q?fKYEo2nl/Gt+ypoZUH8Mh2vOdMiEKItnjDqYfAqX0+aXS1xKmraSRiWjlL/p?=
 =?us-ascii?Q?h6uLGusKdMj/XEge1LK9gblAg6N+yktj3BfPYOFLeyjaS7veOm4ZibzfQYg0?=
 =?us-ascii?Q?IwRdUbqBWK7dDcN8M6IxqLfhx7JRBx86+3vMGoKY7UVRN+tZg1MhymAets9o?=
 =?us-ascii?Q?M6B0jsvFMAHbhg9tivlIgLbV1gLo/bsMvKpeGczWSf2kERnkyi/Jqev+ZYiX?=
 =?us-ascii?Q?X7F+4/y+UsbdGR2NWGFcqker4vaTdMb1QyWF4c4O/N2Rs9bKvjx39IiI0Sso?=
 =?us-ascii?Q?izTxRNNMEcHMA5lrd9uwhGO0jcZIz2R006LBCzDaD4TQavnIJwWXG7VvD93t?=
 =?us-ascii?Q?5GKyM5tMvTA0jN7hKuPw37ZAux1+dtpu6I4JksbFqDyqGQQlDJTJR0X6LEHx?=
 =?us-ascii?Q?qmpr2CEeTsmwTw7FeLKbqdzaBzHTWCo+s/+NvZb5fh3UO2GiNy8FfBRkPmlJ?=
 =?us-ascii?Q?BXp+3lfGUP4uN90a0lGMfFzacxZAn9nsxg7sxzBYNelHeXhymeXOrl8TdocY?=
 =?us-ascii?Q?/qhUeKmm4NLWrjvr2N2ykqmM75d3SyTHNU2GqyklkP72aXJCQH8X+dOEOQf3?=
 =?us-ascii?Q?KTP4bffMWOqKmOMt/yE2WmUdeb4p2yDsUmlDO3jJ7pjmhcsA5t/AwHN0Kt+q?=
 =?us-ascii?Q?ueX2f0qHxVAJ9EM2gPZw8/6ZE4Sw+gPMqA1bgUFF5u4pnPcKkdbhEGDvZU+Y?=
 =?us-ascii?Q?SqsRKIqUu98NCFtuoMU/DZBX9sGhGZkZ45aEfNL9mXPn6VVS2BS3Ffzd4HVC?=
 =?us-ascii?Q?KuRBtB5gQQHLWpA+ot+qg+Ji0maMwH2atcSLQd/2ToVBVvH9og5emu04Kaoc?=
 =?us-ascii?Q?MCRmuTvONe3Dz4KidaTf4EAg4Q3dBqOfLj0YZnCggbkGoAFepcns38MnCGcl?=
 =?us-ascii?Q?V4tKlLGjc088L/FJt2tNWvwuK9YOi+GCdGHTKFMlO725SqtXgdBQsanVx0Db?=
 =?us-ascii?Q?0dnzeaTBg5K6pmMIlavF/CWdK0JMGWYofl4223/AlYlhOQEZ7b2gD+n/uP15?=
 =?us-ascii?Q?BzKMjn14btZ+Kobq6T2NRsDCayDkj0p3paGPywfYuHO7ghATEQaOuOqLOsWI?=
 =?us-ascii?Q?99B1JynGvfqNV8lyfuZ5y/yb8B7mSDOpyHpiHZ8c2Wm53nDP++PL8vx10JVf?=
 =?us-ascii?Q?6dwDgfo10fxZnirHJF+ZYwPpFfsovyz22hLsMYR5go/MKuamJbAr1Z5jM2DX?=
 =?us-ascii?Q?fdzVlIK9wNt7XZ2VmUbUvS9bLUgO+caXwSv+wXYSaxdkYzkff8pv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d4235e-2139-4b62-2ca8-08de6a9d7f8d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 01:16:21.7477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0SQBjjL6ju8mzVjgbz9e+Xehn8hkOfWjsitf4qhDpA9wRIub1zSi3xWu+Y7LfaixvQJJjmBYnpMeOOipJO80g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11296-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,garyguo.net:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1A1113235C
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:12:50PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the feature
> for old compiler versions that does not have it stably.
> 
> The `build_assert!` doc is refined to recommend it where possible.

This is a good place to actually explain where this thing is possible.
 
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
> 
> Two users that would route via the Rust tree are converted.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/build_assert.rs | 55 +++++++++++++++++++++++++++++++++----
>  rust/kernel/num/bounded.rs  | 24 ++++++----------
>  rust/kernel/prelude.rs      |  2 +-
>  rust/kernel/ptr.rs          | 18 ++++++------
>  scripts/Makefile.build      |  3 +-
>  5 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
> index d464494d430a..e40f0227e1ef 100644
> --- a/rust/kernel/build_assert.rs
> +++ b/rust/kernel/build_assert.rs
> @@ -41,6 +41,45 @@ macro_rules! static_assert {
>      };
>  }
>  
> +/// Assertion during constant evaluation.
> +///
> +/// This is a more powerful version of `static_assert` that can refer to generics inside functions
> +/// or implementation blocks. However, it also have a limitation where it can only appear in places

"However, it also has a limitation", I guess?

> +/// where statements can appear; for example, you cannot use it as an item in the module.
> +///
> +/// [`static_assert!`] should be preferred where possible.
> +///
> +/// # Examples
> +///
> +/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
> +/// Use `const_assert!` in this scenario.
> +/// ```
> +/// fn foo<const N: usize>() {
> +///     // `static_assert!(N > 1);` is not allowed
> +///     const_assert!(N > 1); // Compile-time check
> +///     build_assert!(N > 1); // Build-time check

In the other email you say: the assertion failure mechanism is undefined
symbol and linker error.

So, maybe:

     const_assert!(N > 1); // Build-time check at compilation
     build_assert!(N > 1); // Build-time check at linkage

Because compilation is a part of build process, and referring them one
vs another may confuse. 

> +///     assert!(N > 1); // Run-time check
> +/// }
> +/// 
> +///
> +/// Note that `const_assert!` cannot be used when referring to function parameter, then
> +/// `const_assert!` cannot be used even if the function is going to be called during const
> +/// evaluation. Use `build_assert!` in this case.
> +/// ```
> +/// const fn foo(n: usize) {
> +///     // `const_assert!(n > 1);` is not allowed
> +///     build_assert!(n > 1);
> +/// }
> +///
> +/// const _: () = foo(2); // Evaluate during const evaluation
> +/// ```

This part confused me the most. But after all, parameters in rust
are never constants, and even if foo() is used with '2' only,  it
appears to be a non-constant from the const_assert!() POV.

Seemingly, there are only 3 objects in the language that can be
specified with the 'const': functions, items and generics. And
const_assert!() makes sense (doesn't break the build) only for
them.

So, the difference between const vs build assertions is that const
version is only applicable to a certain type of objects and is
supported by language. Contrary, build_assert!() is not a part
of the language and in fact is based on a linkage trick, while
allows broader set of build-time expressions.

And altogether they make sense and even nice.

Can you please consider to add the above passage to your reply in
the other email, and place them in the documentation?

With that (or without),

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> +#[macro_export]
> +macro_rules! const_assert {
> +    ($condition:expr $(,$arg:literal)?) => {
> +        const { ::core::assert!($condition $(,$arg)?) };
> +    };
> +}
> +
>  /// Fails the build if the code path calling `build_error!` can possibly be executed.
>  ///
>  /// If the macro is executed in const context, `build_error!` will panic.
> @@ -74,7 +113,8 @@ macro_rules! build_error {
>  /// will panic. If the compiler or optimizer cannot guarantee the condition will
>  /// be evaluated to `true`, a build error will be triggered.
>  ///
> -/// [`static_assert!`] should be preferred to `build_assert!` whenever possible.
> +/// [`static_assert!`] or [`const_assert!`] should be preferred to `build_assert!` whenever
> +/// possible.
>  ///
>  /// # Examples
>  ///
> @@ -84,24 +124,27 @@ macro_rules! build_error {
>  /// ```ignore
>  /// fn foo() {
>  ///     static_assert!(1 > 1); // Compile-time error
> +///     const_assert!(1 > 1); // Compile-time error
>  ///     build_assert!(1 > 1); // Build-time error
>  ///     assert!(1 > 1); // Run-time error
>  /// }
>  /// ```
>  ///
> -/// When the condition refers to generic parameters or parameters of an inline function,
> -/// [`static_assert!`] cannot be used. Use `build_assert!` in this scenario.
> +/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
> +/// `build_assert!` is usable in this scenario, however you should prefer `const_assert!`.
>  /// ```
>  /// fn foo<const N: usize>() {
>  ///     // `static_assert!(N > 1);` is not allowed
> +///     const_assert!(N > 1); // Compile-time check
>  ///     build_assert!(N > 1); // Build-time check
>  ///     assert!(N > 1); // Run-time check
>  /// }
>  /// ```
>  ///
> -/// When a condition depends on a function argument, the function must be annotated with
> -/// `#[inline(always)]`. Without this attribute, the compiler may choose to not inline the
> -/// function, preventing it from optimizing out the error path.
> +/// When the condition refers to parameters of an inline function, neither [`static_assert!`] or
> +/// [`const_assert!`] can be used. You may use `build_assert!` in this scenario, however you must
> +/// annotate the function `#[inline(always)]`. Without this attribute, the compiler may choose to
> +/// not inline the function, preventing it from optimizing out the error path.
>  /// ```
>  /// #[inline(always)]
>  /// fn bar(n: usize) {
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index fa81acbdc8c2..54d0ce3ba595 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -255,9 +255,7 @@ impl<const N: u32> Bounded<$type, N> {
>              /// ```
>              pub const fn new<const VALUE: $type>() -> Self {
>                  // Statically assert that `VALUE` fits within the set number of bits.
> -                const {
> -                    assert!(fits_within!(VALUE, $type, N));
> -                }
> +                const_assert!(fits_within!(VALUE, $type, N));
>  
>                  // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
>                  // `N` bits.
> @@ -287,12 +285,10 @@ impl<T, const N: u32> Bounded<T, N>
>      /// The caller must ensure that `value` can be represented within `N` bits.
>      const unsafe fn __new(value: T) -> Self {
>          // Enforce the type invariants.
> -        const {
> -            // `N` cannot be zero.
> -            assert!(N != 0);
> -            // The backing type is at least as large as `N` bits.
> -            assert!(N <= T::BITS);
> -        }
> +        // `N` cannot be zero.
> +        const_assert!(N != 0);
> +        // The backing type is at least as large as `N` bits.
> +        const_assert!(N <= T::BITS);
>  
>          // INVARIANT: The caller ensures `value` fits within `N` bits.
>          Self(value)
> @@ -406,12 +402,10 @@ pub fn get(self) -> T {
>      /// assert_eq!(larger_v, v);
>      /// ```
>      pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
> -        const {
> -            assert!(
> -                M >= N,
> -                "Requested number of bits is less than the current representation."
> -            );
> -        }
> +        const_assert!(
> +            M >= N,
> +            "Requested number of bits is less than the current representation."
> +        );
>  
>          // SAFETY: The value did fit within `N` bits, so it will all the more fit within
>          // the larger `M` bits.
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index c7e91b80d301..75c52b5879e3 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -29,7 +29,7 @@
>  
>  pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
>  
> -pub use super::{build_assert, build_error, static_assert};
> +pub use super::{build_assert, build_error, const_assert, static_assert};
>  
>  // `super::std_vendor` is hidden, which makes the macro inline for some reason.
>  #[doc(no_inline)]
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..0b6acd112c4f 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -2,8 +2,12 @@
>  
>  //! Types and functions to work with pointers and addresses.
>  
> -use core::mem::align_of;
> -use core::num::NonZero;
> +use core::{
> +    mem::align_of,
> +    num::NonZero, //
> +};
> +
> +use crate::const_assert;
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -38,12 +42,10 @@ impl Alignment {
>      /// ```
>      #[inline(always)]
>      pub const fn new<const ALIGN: usize>() -> Self {
> -        const {
> -            assert!(
> -                ALIGN.is_power_of_two(),
> -                "Provided alignment is not a power of two."
> -            );
> -        }
> +        const_assert!(
> +            ALIGN.is_power_of_two(),
> +            "Provided alignment is not a power of two."
> +        );
>  
>          // INVARIANT: `align` is a power of two.
>          // SAFETY: `align` is a power of two, and thus non-zero.
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0c838c467c76..204e58dd1bb0 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  
>  # The features in this list are the ones allowed for non-`rust/` code.
>  #
> +#   - Stable since Rust 1.79.0: `feature(inline_const)`.
>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> @@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
> -- 
> 2.51.2

