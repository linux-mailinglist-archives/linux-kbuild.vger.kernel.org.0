Return-Path: <linux-kbuild+bounces-13584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wxr8DU6NImpcaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13584-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:48:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AD6468D6
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=UGbI3ljx;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13584-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13584-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 667A03090E1A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC513D34AD;
	Fri,  5 Jun 2026 08:32:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F03DC4D0;
	Fri,  5 Jun 2026 08:32:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648362; cv=fail; b=s3czefFYK9lqJL39qTHZcdUKhV52LqDCPXC0qP4rhuDJIFcIoMeYarsX7CDXO+Xmh0AKfTQ+OQ+q2UiRCnbbrJsgUKXvQnTeUCz9OM/xEv+mxUeJnVQCDOktzawhC4+mtkzx2IGg91yxeLpGE7Zt7rpaLkylNCKjijUafQMa/U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648362; c=relaxed/simple;
	bh=oHBwiyeVUGFu2US2hIuH8MZXihtUqtk+xm3uzEKtHx0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z4x2FM9FYETJd/0WmC4muRpK6855WoSiT/a7Gzv0qKcVjIA78wFtRno0+OUwt+ddkvd6jdHo4SzQywqJ/Ri6GuVfPfn51Ppb3FyyqKlxrmUCy2ZlEwLszqQV63Ops0URT3sNjQT90LHzePuJdmUb6tEgDA5M/SB+zCyYEfqARSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UGbI3ljx; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1s3ZCiViTVN3PMnqTX/u6I64XsPZiztiIXKWqMRmZ5mOFblrRxY+oSZUxHxyrNplU/gDs3bpIULIWunm3M+Vh6LExzTgGcRRAaLwgwQditOHvMuTKlPkLZO3TdKgb1Q2QI/JfgTr9GrlzWVEofRTzzZtfZSokxNpLskIdHVwv4u1MrZSPctvbkR+MXypXrNXFKjULXTYYwsVxFg2FvsjeQv5vFUEZxyS2tC1biIqtfGKA34184tHZf5hgDENrpMLWzqW0SPLL+aGCbvB4EhqK3a9oODosxwGT8sbtgMVCbPffpW/9LO0j4ug+CCRZEUDbv1TP53T+ZNAoWrjn1LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POPRmwTTYShW9K+/tm4KiIs9dqHbm+0eRTsGJdjzY3o=;
 b=kVKWnEgNuFyZSaADyIT7lSj9y3sHgiQQx54Mb73ria1BP+5vl7u+1Jq6enSWOLGbAmTlMksC7K7LuNoRDnuNwRxASn77jU87X0FvyCI2Qe04PSnXTYxn2X3l1QtGqoeblHExXJWVFiVJWbqbDa15BltZuSzA+4Ndo3bEDjDe2IEilEiEFekSn0GwCv5AdVtqMu0gp8wG0tuHiOmKExoXR3SlgXaPQr925eGeqY9ARUc8Oi1SAO2m0BD1umNQ9BZZkrYrwcouDYTToNESm29hDSBk/383zqUcruQ8I7XNvrQpslj+n74uXNzVPsHUB60JK+HKtmkJ8UgqdlSmzQf95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POPRmwTTYShW9K+/tm4KiIs9dqHbm+0eRTsGJdjzY3o=;
 b=UGbI3ljxe34eJyBbhex7gDMQDaNmvuisZdiLXz99cwe+9R0B1xez+Dx4JDCQRAaDjcMo1weIFdf31D3nBj6/aK18XZPgp3V20fvSYXHyQETdDWkBkNs8npLhLZwIDVolGBTXQaQuSKs6Dx9vWGAiqAcgxn7eIdm0zLrlWnaRJC0eFfxuVMDFYqoTHz7U2g9y9NUZrCzyLk4dxg0XnZppizo+FivxIW7NU3D4Y7Zrfea98dA9ajdv1WR8dgIyx2XflbjlXs+i9167HqYKxks6Hh6X4us+sOekjIqD3jzneitciPH2Qq56ZX/seFOkDyevNxHAB87oySUb+edCJa0qvw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 05 Jun 2026 17:31:56 +0900
Subject: [PATCH POC v4 6/6] gpu: drm: nova: demonstrate interaction with
 nova-core
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-nova-exports-v4-6-e948c287407c@nvidia.com>
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: 27099550-226b-4796-1d8d-08dec2dcfc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|6133799003|921020|22082099003|11062099010|18002099003|11063799006|56012099006|7136999003;
X-Microsoft-Antispam-Message-Info:
	qGCeYI8Tn05C2zXJWfv7JybuF5S6rjZeNs80p5+DlN/e/jZw7u/xGkfqNcqKxgypAuwKuYVQkvg4wNabZe4Nj9tAbIc83B5OOBF0yDWZDt5EZuKtt/R12cqlYZ2jhumvhEWg03uThyJdwG9zPbHJgKzBNzyjU1M7lWb4fu8zBnx1qAd3M5mys+WtpAhcJTWGWRzTIPoaBQf/uxGfIeHZ/AHowkeRwocF51B+07w9eCc4mD8F5WA0HsSpo+QI34HGZfdXoM956mjtHFrZkHkPmAh2mN+6BYdCNzeNnrO6W43ZdDTUz+P15zpY5EOM7qsIdCd/V07NbGixaZfDminmjwhsYxmPYpup+jU5uE2mmwre8e4TSlG/HS3f3Q9ZLx6Mz1ABx1CYrOkBE+0jPtXgTnxkSA2kUZmwFnzUWY/uq4ugGMHqELcDBqDnn3nE0457I16zM1o4FDxRLAwkOIKNGvxKaDThdy7mKFkQXcZTE45z7ANB7cG0SHe0ewuSXWpzywF1faslgTE8qgveyIDa3MHrwKy/RncPIwa2KDPo4sjAUFuUqMaIu9xd2ckrSb2YL0oe1eVglxuTs8d8r5TLtshVggVDbnCXAcdMUT1ILSWGUU+QWTpM5Rjpi9FtyqCJlcyJsPHrSbuar0LBRRyyft5lgXGfr+VNyjTCSvxlBdsaj1r0FWuYOg2K227bNEL62Vw++R16W8BlOMfPXbDXmDNQjvS2PeFULfwoGTKuROQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(6133799003)(921020)(22082099003)(11062099010)(18002099003)(11063799006)(56012099006)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3l4V093aUEzOFRkMlVCcExLc2p1bmVrRC9DZFZnUDROTEhaSGRtM3g0Q0E3?=
 =?utf-8?B?QTE2T0xnay9DWDBxeGgxVGZsV0M0RkpvcHA5YU5QRjUwZmVrMFBLLzIzR3lk?=
 =?utf-8?B?L0Zubm5jRkZmLy9VYU9xbFF6cVhoTVE1ajV6ZVF0UXdURmx3Z09aalRHTEZT?=
 =?utf-8?B?RHh6RFpGUzBnTG1ndkVNeCtYYXVjK2JXTmZ5QTZuVUx5UlViZjlvSjZJajZn?=
 =?utf-8?B?N2RBd3NiM2lFWU1yck91Q2kwejJBckdVVUpEYWJLaEFjdnY5a09NQ3Y1dFAv?=
 =?utf-8?B?eVV2NmFvSlgyTFcvL2dVb2c3VStiMmwwdmx5Smd4TkxtSHd5bGxBcDVQcHB6?=
 =?utf-8?B?TTdPR0I4Qk1vRjhMbmh5UzZrempOQ0Q3T2ZGUmJqV2YvbHQ0ZWV3MFQzdHgz?=
 =?utf-8?B?Y2tqM0xXYkVZeWlmWG50dndiczVQVXZvYUc1T0VNYVltc0RHTUF2c2prWmk4?=
 =?utf-8?B?WFgvV3I3dFJQN1ZnM0Z0WWM4OUFvc3RZSGlXUjc2UFVWeTJQZCs4WGJETldr?=
 =?utf-8?B?UDRiay84emlrNWVZcFA5OGtKQ0VIbEhTRllkbUVoVDV5TnBNVHJvMHUraXpX?=
 =?utf-8?B?Y2JsaC9IUFRpSE85UjFsRS9hZmdyY3N5WmxxVkZGcGg1aE5mVFNxVGpSakpu?=
 =?utf-8?B?TnJFaFFMNzZaRzBiWVhic0VnSzVPdXZiN1hFelp5d3ZVMks4eUV1VzIxKy8y?=
 =?utf-8?B?S21Ib1JmWlY0TkpiTXMvTTI3c3VNYUgzZENHUGFIbWdaV3k1dktWeE1WclZN?=
 =?utf-8?B?KysvRno5dmc2S0ZMd0hnRTBLOHZuR0tNaG1PRnZub3dWRVdRYnhVVTdMb2ts?=
 =?utf-8?B?TWJzcGs4RW1xUlFzSlBIaFJ6MUNxMkNCQTJIemRYc3NmNlhKSXp1MGpXcUJi?=
 =?utf-8?B?OWhrazdYRWJIVHRIOXdnTzE4aTdUU0Q5L01iZUl4ZXQ4NlpkSWMrVUZsc2Fu?=
 =?utf-8?B?TTdnc1VtYVZZVmp3UEZ5NEVkVmtUZGxqanhWSXpRTytESU5TVWl5L3FQbU55?=
 =?utf-8?B?bzNUYmJRaUoxc3ZESTAwRlNuQVgxdmNaS2VTb29qLzV5eEJVdVNMaEZLa0Vr?=
 =?utf-8?B?TXhDWHcxWWpsZXhCVzZ4emNEclpnejVRQS93N0pPa1BzMDdEdlNydEFFeGFz?=
 =?utf-8?B?TXBWOVRmRjNVQ01sRkV3SGFYWUVrQklFTG9LU015bmRoaDFIU2x3Y0REMWhC?=
 =?utf-8?B?OXdLWGxrYXdvbmQwZzY0NXVpWCtQbDgvOEYvcWwrWXFIQ3YzZThBVk1Sd0k1?=
 =?utf-8?B?UkpYUyttcy84MjlkYVZBK2dSOWxHejFCcDUzM0FKMDJTWXZHK0dKcUlucktl?=
 =?utf-8?B?eGpVYUtXWmJBVzUydkdxd1VpK0Y5ZWlnRG4wS3NPZGN3b2NWOXVmd2o5MlFl?=
 =?utf-8?B?K2tsT2piakIxbUVhMFVtVVZQN2lOS3crcW4ydDh2R1hhU0hYVExrMmQ1UEha?=
 =?utf-8?B?MUxrZExhdTg4WXRjZmRscmJqUVRDWC8zSkFOaUpqZENocVVGVmpZcVpsNUky?=
 =?utf-8?B?YkZMcXRBRzFuaDBueTlPTFlSQnhzc0pvbTNDNEpYWGJzWHlzMWxDZDlSWjFa?=
 =?utf-8?B?Z3djS3c4elJqTGtBL0Nlb245YldBYW03WmpUa0dUdG0zeVhlWWtueEtSUXF4?=
 =?utf-8?B?YkNISjlrcHNQVWFVQWRMVVFIN1NWT0RUYlpUajhOZWtjcDVUTHQyak4rdnhO?=
 =?utf-8?B?TjRKcWlYcS8yUGc0OVR6Q1FsQ1ZudnVBUHYrODkwRFVONjhuTGJJS3FaTFAx?=
 =?utf-8?B?N1JyajRDSmorWFZRRVZGRUg2WmlGMkZSSmc1WWM5SHlVeWlZYkUvVzZOakIx?=
 =?utf-8?B?bnB3c25KbWRFWENoVWRxNnhSMStkVFo4RVJ4b3Q3NkROb1haNXNpcU1uZUEz?=
 =?utf-8?B?TFR3eldjeXg5NkhSdi80Y2U0MnhCQytFbFVJeTVzUVRFU05ITnBkaW5wYVVJ?=
 =?utf-8?B?UG5VZ200RUlMdkV3L1pUZ1dENmhrSmZvWkxENUhSSy92elFHNGd5ZXFGc2NW?=
 =?utf-8?B?N2FSM3hoMm9Ra2VIWjcrc0gxOHdmckg4eXByUFBmY0cvbXRHNW1PRUVWTkov?=
 =?utf-8?B?YXRENXY2Q1dMc0U4VE81MDZFZTJuTjJxRFVrU0dteUFScDRZRnBBZ2diYzFR?=
 =?utf-8?B?VFJwS0Vkdmo4WS9FK2Y4WjllRWluOUVDdnROcGx6Q3Z0MHhmN1cxYzlySm95?=
 =?utf-8?B?OGhTS2hPNXZBNmc3cFAwdGxkRXYvMldNeHczSjVnU0tYeGVkcFBZa3crRDIw?=
 =?utf-8?B?b0wvaWpWTDBvOHFvVmVwTXJmb0xadFUwRTlwKys5aXNiVkFOcVFjVzlhTUI2?=
 =?utf-8?B?Q250ajF4VlZvVy9oVUJKZTBmaEF5bVQ1Q0FraWt4SWNFa0N0TnRvSS9zZkZY?=
 =?utf-8?Q?9BooSqcPYtUnXxGfRe/D4CW+OGvwxPwc2D04knJ4haKqz?=
X-MS-Exchange-AntiSpam-MessageData-1: VHjUZcRp2exE0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27099550-226b-4796-1d8d-08dec2dcfc49
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:31.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cszuPWt/ZJEb7/tpLLaAeh3MizcDZXjhdTQc3rr+2sltci59sUJM3GZ0+64HHFJU6nUiY+bDuqZFWXxUR2x9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13584-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A6AD6468D6

Export a few items from nova-core and use them from nova-drm in order to
print the chipset of the GPU being probed.

Some documentation items are added to make Clippy happy.

This is only meant for demonstration purposes, and won't be merged.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     |  9 +++++-
 drivers/gpu/nova-core/driver.rs    | 59 +++++++++++++++++++++++++++++---------
 drivers/gpu/nova-core/gpu.rs       |  9 ++++--
 drivers/gpu/nova-core/gsp/hal.rs   |  2 +-
 drivers/gpu/nova-core/nova_core.rs |  4 +--
 5 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 48933d86ddda..de1ad7032b6c 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -9,12 +9,15 @@
         ioctl, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::aref::ARef,
+    types::ForLt, //
 };
 
 use crate::file::File;
 use crate::gem::NovaObject;
 
+use nova_core::driver::AuxData;
+
 pub(crate) struct NovaDriver;
 
 pub(crate) struct Nova {
@@ -60,6 +63,10 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        let aux_data = adev.registration_data::<ForLt!(AuxData<'_>)>()?;
+
+        pr_info!("Chipset from nova-core: {}\n", aux_data.chipset());
+
         let data = try_pin_init!(NovaData { adev: adev.into() });
 
         let drm = drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5738d4ac521b..a214860f20de 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Main driver module.
+
 use kernel::{
     auxiliary,
     device::Core,
@@ -18,18 +20,36 @@
     types::ForLt,
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Chipset,
+    Gpu, //
+};
 
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> = Atomic::new(0);
 
+/// Data passed to the auxiliary device registration, for the sibling driver to use.
+pub struct AuxData<'bound> {
+    gpu: &'bound Gpu<'bound>,
+}
+
+impl AuxData<'_> {
+    /// Returns the chipset of this GPU.
+    pub fn chipset(&self) -> Chipset {
+        self.gpu.spec.chipset
+    }
+}
+
+/// Driver-associated data.
 #[pin_data]
-pub(crate) struct NovaCore<'bound> {
+pub struct NovaCore<'bound> {
+    // Fields are dropped in declaration order: unregister the auxiliary device before dropping
+    // `gpu`, and drop `gpu` before `bar` because `AuxData` borrows `gpu` and `Gpu` borrows `bar`.
+    #[allow(clippy::type_complexity)]
+    _reg: auxiliary::Registration<'bound, ForLt!(AuxData<'_>)>,
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(())>,
 }
 
 pub(crate) struct NovaCoreDriver;
@@ -78,7 +98,7 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            Ok(try_pin_init!(NovaCore {
+            Ok(try_pin_init!(&this in NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once available.
                 //
@@ -86,15 +106,26 @@ fn probe<'bound>(
                 // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
                 // stable address, and is dropped after `gpu` (struct field drop order).
                 gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
-                _reg: auxiliary::Registration::new(
-                    pdev.as_ref(),
-                    c"nova-drm",
-                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling. For
-                    // now, use a simple atomic counter that never recycles IDs.
-                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                    crate::MODULE_NAME,
-                    (),
-                )?,
+                // SAFETY: `NovaCore` is dropped when the device is unbound; i.e. `mem::forget()` is
+                // never called on it.
+                _reg: unsafe {
+                    auxiliary::Registration::new_with_lt(
+                        pdev.as_ref(),
+                        c"nova-drm",
+                        // TODO[XARR]: Use XArray or perhaps IDA for proper ID allocation/recycling.
+                        // For now, use a simple atomic counter that never recycles IDs.
+                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                        crate::MODULE_NAME,
+                        AuxData {
+                            // TODO: Use `&gpu` self-referential pin-init syntax once available.
+                            //
+                            // SAFETY: `this.gpu` is initialized before this expression is
+                            // evaluated, lives at a pinned stable address, and is dropped after
+                            // `_reg` (struct field drop order).
+                            gpu: &(*this.as_ptr()).gpu,
+                        },
+                    )?
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b3c91731db45..bceed4652508 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Core types for the driver.
+
 use core::ops::Range;
 
 use kernel::{
@@ -35,7 +37,8 @@ macro_rules! define_chipset {
     {
         /// Enum representation of the GPU chipset.
         #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
-        pub(crate) enum Chipset {
+        #[allow(missing_docs)]
+        pub enum Chipset {
             $($variant = $value),*,
         }
 
@@ -203,7 +206,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 /// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 #[derive(Clone, Copy)]
 pub(crate) struct Spec {
-    chipset: Chipset,
+    pub(crate) chipset: Chipset,
     revision: Revision,
 }
 
@@ -267,7 +270,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 pub(crate) struct Gpu<'gpu> {
     /// Device owning the GPU.
     device: &'gpu device::Device<device::Bound>,
-    spec: Spec,
+    pub(crate) spec: Spec,
     /// MMIO mapping of PCI BAR 0.
     bar: Bar0<'gpu>,
     /// System memory page required for flushing all pending GPU-side memory writes done through
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 04f004856c60..5f2d4a0c25cc 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -36,7 +36,7 @@
 /// The GSP unload code might run in a situation where we cannot load firmware dynamically (e.g.
 /// because we are in shutdown and the file system is not accessible anymore). Thus, the firmware
 /// required for unloading is prepared at load time, and stored here until it needs to be run.
-pub(super) trait UnloadBundle: Send {
+pub(super) trait UnloadBundle: Send + Sync {
     /// Performs the steps required to properly reset the GSP after it has been stopped.
     fn run(
         &self,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 9f0199f7b38c..77f647b8862a 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,12 +13,12 @@
 #[macro_use]
 mod bitfield;
 
-mod driver;
+pub mod driver;
 mod falcon;
 mod fb;
 mod firmware;
 mod fsp;
-mod gpu;
+pub mod gpu;
 mod gsp;
 mod mctp;
 #[macro_use]

-- 
2.54.0


