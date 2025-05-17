Return-Path: <linux-kbuild+bounces-7142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4FABABE7
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 20:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4956C3BF33E
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 18:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473A817A5BE;
	Sat, 17 May 2025 18:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sExcSeeG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6302F43
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507373; cv=fail; b=ca6hSCiUEh9aqulk3W+oV9KQMjZfciCTfItVctO+1m4xrhlDGWO2CVMWGNgAvVsT5Xqf51MgRPpdZBSZJ8ZRx/9WA2WRMC+3NSe93vA6j2yXAF/9SnqOqk5y+aQnVGFFxnnxiQgsGdY4FtkBCWkWIIlKUW0dz2E2VTGLG60Wzpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507373; c=relaxed/simple;
	bh=FgKopEfodDYuGwdhKaGJ5u0lkmChyf3AF3zSaAFmjRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qsaoIDN/NO5gSgz8QwaA9YQ9zq4XzBppn7NBK24Pey5iVy2gdv1wwZLGf9bkSwKwIjpM5ATez+vy8NSheUp5/Odnk+IdU+gNCFdeI+oAC5ShIpp6rvhBJ1uiNWlCMX2ZA+mgvYHzffw5RG5HkLgEqX7QKbKBj4XYH/zTlWeQu68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sExcSeeG; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chyMWgwci5UEkjTMVO36KB8vdykHv4HU3Rdkm9j6kKLzvf9q4bv85oe+KSSL4MDyQbLEN/1/KUkRmnlEsRcDShs/9tYwDTnLctwdK0goCxQkCsSLtqhcqh+z/C3d5Dn0gxOffqzkK0oFHlbVawBNXV7IXCxcFbkbYtaZ3yanY44hrQanpiqPcZMgOd2y6FQaclRKPovmb29OdrhCRaACHgR0oD25WsQy9IsyG5o/owbtlT6NDA2H/C5gqYjDW9qlvOF5LY/Pnfp1xmVEBi9yKcDCuKpGSeEYp/mmCtam3kKtzu3muciU/tgCJjgWCSmwbCrxg2YqTUZLUSiQOfIrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tWARhkabNZj+bySMdQXr/7BxAqCDAQZDAUPiJnlv5M=;
 b=r1R/MzmIcM6z0hAByti2wNATdbkBw2eI2IWsfZdObDb4z8bnQ+6qiS3yUq2P7lmdzltSbTCV7AnnwL8dX3fNUmzDysAtdQnsAkXxdP4QEAYux3rEl1QcRQ9LTkPCGUfSekn0ZsdKxDJlE5v7CIas42wnhq+zchw3l41OmCRVD1owvRT82Hm+xiLqT0oVCZoJl1NCj1RtQ8rRui2VQzpUFC6VMUDG0TkOxkfxlXQacGz0dMlEsyu9sfjdX3tXt06Tu9HatwL3dkPdCSKkuAyosDwTrf2IA1ExejQLwj+AKwcAiW1yqwByP++Bo9AZ9+Z26QyB3u1GkmbG8cIEiFeVwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tWARhkabNZj+bySMdQXr/7BxAqCDAQZDAUPiJnlv5M=;
 b=sExcSeeGVsm1s2lZDMUaeHb0WzkU7zzq8M0xSK1i2j4Pta3NMjFIEvEkdvt4fNkSyBPcweWFsQTpLtSZJMKzND+gutprLCK3EYgxewBtZ99rMH43w2EnIUfGTTms1G/CEFdNtRXkJaLC8ec5bTIkUFY2KJGBLoXphVd6bBpoPbpN90oUjy6XdCbfsYvsa/vCMI2Pu3jE+JIca6S4ulmQF9QAzDj7hd08NE2oo3qrOwTHgZins7IRANcDJt0ki7mvzIdsqx6Bfj+awbD+GRwcS7zxwUWWnsvpI/L4BulFP+fx1Hr1lCraTLihUD0DH3kSd5ut1/s19y4fsFNvyjz3Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 18:42:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 18:42:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, linux-kbuild@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Isaac Manjarres <isaacmanjarres@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: Kconfig for range is being ignored
Date: Sat, 17 May 2025 14:42:44 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <438DD530-00EA-4F7E-9CC0-A1274400DD84@nvidia.com>
In-Reply-To: <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaeb0d3-ddd9-4dfd-d963-08dd95729e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmFFYlNPSHFwMnZIU2QrZXdQVmk4enFzY1JCSHBxQStBbG0rNDg1Wml0aFZs?=
 =?utf-8?B?QXNHaFZYZUNQUFVUdk5pZkM4cGIxMXdVOUJHaU9aU3JidncrRHh2VS9GeFR1?=
 =?utf-8?B?aHdpaHpmNkJIRE15SVFWMWxhb1I3KzMvTmJ2cCt3Z2dmbjRLS2c5SEJLRjFV?=
 =?utf-8?B?ZjdrQ0xwRnJ4U0d6bmRqNFUrM0N5K3lhb1d5dlVQQ0RZaUJIQm1DcFdiSWlV?=
 =?utf-8?B?MDVFWlNmaW1oczJMNFZTUnlnUWk4cWRYODBiOFZYTGNsQ1pUZnc3Vm5tMitZ?=
 =?utf-8?B?ZFRVQnJGR2EwUkVFdGpISmxUZmg2aWJQck15MEZHYmlTMXpTcXVra0xDQllr?=
 =?utf-8?B?NzVyUGk2RG9EK1VTVS82R0VIdldZYlNaeXdkQjE2YmdvMnRkUXlON3RselZQ?=
 =?utf-8?B?UTl1S1JmV2lGK1hoSVRJU3duMHh1NlFFcVd2VFkvUnBoMjRjd0JjaUVkVFZj?=
 =?utf-8?B?ZFBaQ01pVURRTFJQTkoyNUZVTTlJODltaVZMdnlSdDVaZmJZMSsvYXE2UnZZ?=
 =?utf-8?B?bzVybG41OWN6dG5qOHVIQy8weFRodjFGT1FubGtETFRhOHRKd2QwYk5lMzB1?=
 =?utf-8?B?TFBBb2F4ODE2WlRoeXA3dGx3MnVqQWpuMWloVHZ5RTYrT05VTnY0eEo2VUtp?=
 =?utf-8?B?RmFUb2hrZzl5dy9odFZqRFRuYlpCYVN3Z0pNZCtZbXVaQTEzNkFDZGxzYXpV?=
 =?utf-8?B?TkdqTkNFR2hQVG12dmtXcmhxT2F0cXpYMEZGTVJ1b2hXQ0g5UW5kTmpTVklZ?=
 =?utf-8?B?QTh1ZFZSYUxZQUcvUy9OU09HUkJQNHhpc3k2YVpEeGZ3N3BHeFZRWkJ0eHFj?=
 =?utf-8?B?QXpEb3ZSMjdWVGhjYWNObHJGSDZTZWxmYVVEcUR5QVdtUTZDaWFkWHVzWHVx?=
 =?utf-8?B?SDd3TUpnMnZWQXY5Z24rMEFSQ3hYN1ZEZHZ0TTdUd2p4bUxUZ0x5bDZFUzRS?=
 =?utf-8?B?TEJWTjllSTgvT3RwQndxeFZ5cENxcFE0R2VRSHp3enVoUE1NeENMNko2bmVR?=
 =?utf-8?B?M0xEREZBTnZCRkRwMHJOQ2l1T2IxMjFsb1ZrbDFUM0NtWmRkWVMyZDJEWlM0?=
 =?utf-8?B?RGxFREwrRVFUWXFDRVU5YkxYcXVXLy8wWXdUaUJUb21SSzhwOFNQcmFqamVl?=
 =?utf-8?B?QmdLWkRvbGg5WjgrRkQ2WHJtMmZ5ZHVRSnRzY2h2aWNBTDFqNFRkNm5CQ2sy?=
 =?utf-8?B?dFVzZytUOG84alIydGFRRytSSXN3aUhFUHZGL00wbW9vWHZ3SUhwVHRiWXUx?=
 =?utf-8?B?TEp4M1U0Z0FpdmtsbTFMbkE2MmppdXBzdzhjSmJ0amx5SmRrS0hwOGtqVkJp?=
 =?utf-8?B?ZnUrcWEzOXo1UGVPWHdQalVVS2ZVUjB5TnVISXNiakYxL2hjbHF6Sm9qY1JG?=
 =?utf-8?B?ZUtpUERlYmx4eFFlOWZPNjFsblNvWnZPNkFRQmxBTFVTVW5Xd2hUbzFQRjlK?=
 =?utf-8?B?VTUybDBNWGd4SFFId2FZQ3N2ZmkwZUxJNFZrSHJ1SmlrcVRYR21mc0ZmSkhn?=
 =?utf-8?B?Y216dUI5QWxwQ2FxODUyR3NMUVFBek9lSzJJKyt0R2l6aEtkcXo2bFNDYkdk?=
 =?utf-8?B?OTlnR1dqNmtqODFQRmQxMm9yNFlzUlNneDE0U0ltV0FmVXFoOUlNTnVYTzJH?=
 =?utf-8?B?SWVNbGpHOFRCRkZrNlZWYmpUaUNBUEtGT0dxaUZjNkJKOGp0QWcycnowL2xD?=
 =?utf-8?B?RUxDOVErQmFsY0FkUm5YQkxPU1lrdVBwS0hWTGRodWpaY2l6aTNVR0FhYmdm?=
 =?utf-8?B?Ulc1b2NMcHJ6NGRnUWJFQzhGWktvbml2WnVxUGVYTS9MMHI0NWF0QVdvYnJw?=
 =?utf-8?B?NzhQYnNaaFYzdkFDZS9aMkg4THh6Q0h0VGRha0hKdVRXWC9GRmZPeGo2RDkv?=
 =?utf-8?B?eDFCZURzcjAvUnl4eGt4bnhQRVI5Kzl3MkNBQmpLa1hnSEpEV0JhWjVuRm42?=
 =?utf-8?Q?th5krUEIDhk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dURnQlpkWmJiaE9RZnliYk1BaEtpNE1HVXBTTVZrWGxaaTZIeW4xaTJSQXRN?=
 =?utf-8?B?L1RDMG5qaHZzQVdKcUVzaDBPb0RjN2t1NWU3eEp6RmdBb3ZjNDF6aVUxckd3?=
 =?utf-8?B?KzNOY1RsUDRZK2dGbUN3RmRMaWZnaXJqS0JDcFdoaFBqZW1FdGZaa3FzdGNn?=
 =?utf-8?B?U0tiaG40cmZQbEN0Y2o2cHBhUVBOMnMwaWpXdWd2ZzVUUnBJSGhKdHYybWEr?=
 =?utf-8?B?QTJwamtHSkw5Tk9nWHJmVm1hclBNNThEL2N1MlpjbEplemVCV2dhSllqU1Np?=
 =?utf-8?B?cXNWczZKZ01xdUpsbXJQUlZ6VUMxWWtBZUJmNHVlanBiNC9QbThGL0ZKVTU1?=
 =?utf-8?B?b2tLaDBDRlQwUmNka1FmQ0VEWlJWeTJVdElRQmhKb3hjeTd3MmtIUHpmQWtu?=
 =?utf-8?B?dHhKSlZOeE5VVTl2Mk1oRW4wUkhzQzZhT2hFdkZhd1dQdUEvN1JnSVFLQkVB?=
 =?utf-8?B?N1NnbUhJdHgxdUFoQ2h1SWIyUGx6NllYcVhpdWtodU5GdUZXcVVBcFM5a0hW?=
 =?utf-8?B?eEZKSEV1S3lRa2JzaE5PTUYwSlNZT0o5bGdONjcxTThpcTQ1Yk5UVmUvWTY4?=
 =?utf-8?B?d1Y5NTZnYWtIamVKMlhTNkVPdW1nOUlwMU82dlpldys1SStOZndaRFJvWEE0?=
 =?utf-8?B?QXFWbWYxYlZ4L0psdkNYeW1leDNuMDhMbHZ1VDV3czhNUEVMY1ZZMEUrMUd0?=
 =?utf-8?B?bU8rOExOSkJudzM0U3R2aTNwVEtDaE1ZVlJUSy8xRUdqd1VaRkVsdmZLS2hS?=
 =?utf-8?B?SzJzYVF4SlZ1emFxNWZWL2JsbzI5QWJqUGI4M1YzYVUvWmd3eGlBejVGdXRM?=
 =?utf-8?B?MjJ5dENURmw5MDBoN3Nic3JPam1yd3M0Y3pzbTNlNGNvY0NWYTBYWC8rNU5a?=
 =?utf-8?B?Vms0M05jbFI1NEQ1SjluNHozeWZMU0xkVU9kbmNZQXhMdkVLMGVJUkFSRkZL?=
 =?utf-8?B?c2tyUlJ2eTB2TVZZeEU4VXZLU1l2b1kxamdpcVhHYTZZOEc1R2xocEdnbXNu?=
 =?utf-8?B?ajlBREhhWFY4ZExDZkdwNlBFNkFYb1hNdk9TRmpzc1JvV2lFZlVLWVVWT0Zk?=
 =?utf-8?B?dWMzS2RwWGRPNHpUakRYcVlnbUkxUWoxYXJaUDVXcmhiWHp4Z0E1NkRBZXBF?=
 =?utf-8?B?MWJyRnRzRnBKQVNNM3NBaUxSQXFEWjBPS3ljd1RLeFoyZUs0WGRVdGxRdjhB?=
 =?utf-8?B?WEJHMURpQ3JITnJrZ05HMVpnT1AzMHBsVU1xNm9YeTFHUWJpS1V1SlY5UFJY?=
 =?utf-8?B?U25janBXb3dLdFNmNHZLVmJzNVpEL0hkN3hsN2VKQlFNVnhPSEp0eUNXTDV3?=
 =?utf-8?B?cFJ6YVUrRW1aQVpPczNqOGt4ajg4TjEyQXFnK0JKWmIwdXhmUWUwK3RyNGxY?=
 =?utf-8?B?ckVmYzVJMXJKTTdjR2s4VDJma0d1MFpSRTRXbWREZVUrWHpGaFBhaFBQcTR1?=
 =?utf-8?B?K3l6NjgwMWhKWklKZ3I1WktXVDRtSWUxYWVMUmVXMFAzTTBFd3RhcE9lU0NI?=
 =?utf-8?B?Yk1kdXo1RlJKdzZwdVZUbUZ4dk55dkJhL0xDUW0wZ1Y3R0FKdnU1dTNVZmp3?=
 =?utf-8?B?RGpadTR4SmFTekJ4MTJ4QzgyU2tRbTdLdWJhUlRtMUk1MGVrYWk5WUdGYUxK?=
 =?utf-8?B?ZjB1dXRkWUFaREViZ2tCQ045eEkwazZsTGw3N280aXFYMkhUQ3lSQ2FsNGJ6?=
 =?utf-8?B?NzA0VC92ZHVhd3JCWllhVlJLdUV4SzE1OE8yYWhacnNHTk1DbUg4WWRCTEZz?=
 =?utf-8?B?Y29qRW4wcnlXcDBzQm8rL3Z0TDBVSkVvd290elJVRnpkMHJkT0JVdFBDVnFS?=
 =?utf-8?B?NUxTUE1rV3NQMFJ3Mkd4bWR4QmRiWWFaZDhlS0huSm5qN2VObTBVc2JCdCtq?=
 =?utf-8?B?cjBiOUpHMVhYK3IxMGpMN1BMTkMzeUVhaWx0R1VnUE5xazFJUU9FazJadWUz?=
 =?utf-8?B?QkZDN0R5OUY2NUFnWit4TFVMNzRya0U2SVJqdzhYcWxjSFQ3TFhUZ084a20v?=
 =?utf-8?B?cEdnWjJaMTNFN210RmZzTGl3aE8wMTIxdDNld25jREZZYXVobUdpYWxHL0Nt?=
 =?utf-8?B?OTF5emZvak5sQU1iUy9zVlY1WkJkTkpzMkl0anBTOHJ3cHZKQ0tCT2JpOU0v?=
 =?utf-8?Q?DZOfhjGPsIQDqkhERfUFtSDqB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaeb0d3-ddd9-4dfd-d963-08dd95729e1f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 18:42:46.9308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pFFjmW9Tt28pSCgMc4xWuPUbrtXt6K0meKyziqLZBwQw9DY6bTWtVpQb6hqwILU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

On 17 May 2025, at 2:45, Masahiro Yamada wrote:

> On Wed, May 14, 2025 at 5:18 AM Juan Yescas <jyescas@google.com> wrote:
>>
>> Hi Kbuild team,
>>
>> In the patch from below, I am adding a new configuration that depends
>> on ARCH_FORCE_MAX_ORDER.
>>
>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>
>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
>> to be ARCH_FORCE_MAX_ORDER.
>>
>> mm/Kconfig
>>
>> config ARCH_FORCE_MAX_ORDER
>>       int
>> config PAGE_BLOCK_ORDER
>>        int "Page Block Order"
>>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>>        default 10 if !ARCH_FORCE_MAX_ORDER
>
>
> The logical calculations such as "!", "if"
> are allowed for bool and tristate types.
>
> Here, ARCH_FORCE_MAX_ORDER is "int".
>
> So, I do not understand what
> "!ARCH_FORCE_MAX_ORDER" is intended for.

It is intended for when ARCH_FORCE_MAX_ORDER is not set
in arch/*/Kconfig and has value 0. Would
if ARCH_FORCE_MAX_ORDER == 0 work?

>
>
> You are doing what is not supposed to work.
>
>
>
>
>
>
>
>
>
>>        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>
>> This configuration works on ARM64, however, on powerpc, the restriction is
>> not being respected.
>>
>> The main difference that I see between arch/arm64/Kconfig and
>> arch/powerpc/Kconfig
>> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
>>
>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
>> config ARCH_FORCE_MAX_ORDER
>> int
>> default "13" if ARM64_64K_PAGES
>> default "11" if ARM64_16K_PAGES
>> default "10"
>>
>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
>> config ARCH_FORCE_MAX_ORDER
>> int "Order of maximal physically contiguous allocations"
>> range 7 8 if PPC64 && PPC_64K_PAGES
>> default "8" if PPC64 && PPC_64K_PAGES
>> range 12 12 if PPC64 && !PPC_64K_PAGES
>> default "12" if PPC64 && !PPC_64K_PAGES
>> range 8 10 if PPC32 && PPC_16K_PAGES
>>
>> How to reproduce it
>>  $ ARCH=powerpc make allmodconfig
>>  $ cat .config | grep MAX_ORDER
>> CONFIG_ARCH_FORCE_MAX_ORDER=8
>>  $ cat .config | grep PAGE_BLOCK
>> CONFIG_PAGE_BLOCK_ORDER=10.   -> This should be 8, NOT 10.
>>
>> Is the Kconfig in this change
>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>> configured properly? What needs to be changed?
>>
>> Thanks
>> Juan
>>
>
>
> -- 
> Best Regards
> Masahiro Yamada


--
Best Regards,
Yan, Zi

