Return-Path: <linux-kbuild+bounces-11426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CfaCfIsn2lXZQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11426-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 18:10:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AC819B49C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 18:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E96630C9967
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A39F3DA7EB;
	Wed, 25 Feb 2026 17:08:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022104.outbound.protection.outlook.com [52.101.43.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1763D902B;
	Wed, 25 Feb 2026 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039295; cv=fail; b=sbg0kPumuTAzIIW38D15XkECS5cqc1E7gamL83wEKBQQV+Hxs0DaF+xPbJp55paUYqRZjV1wy288PHUgKiou8EOtgVdvF1Fy/ORsl6ofORZ2NLj92v265eqi1GhoM1OLaZYF9cTqotGsaO1jN4JMGAnue4UT9xWoXiWxxYCX+zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039295; c=relaxed/simple;
	bh=ICQM54IsCDPAgs0ORfVR0Y22l+JKF+NA6fZv+fRoQ2M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vjhzzzj3BQqbv9X6bYsKSTrlYvJBqexBOZy0WdHW5DDZ+FVXDFornecb7yh2NnpHasiS5IqHy85wQPA3ToMU3yzO8KKaSzBIgLgbtevMeugxTwzn2T+jzjl2rXgTWO3qs8zuPt2gdEfIh06S4iLWqXPFe9J3swXYYa5jqESnXYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com; spf=pass smtp.mailfrom=talpey.com; arc=fail smtp.client-ip=52.101.43.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=talpey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=talpey.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfPFQbDXw/qxylgwQt+eH3bPEfg7Psa9QcMPdtKav299CVONhigOgqjRxnmSLQNLTGS0op7bu2mjlAvI4GcFh00g9r5Zoy6VIgTAVKF9ubUqB0tkHotFqxZ2AsPUCXfXIv41y3iSpEA7eXdgdNsefbB3ENbKvhNvHQ2qVKr9J3TkVR1LQEGLnPxFx2fF+nw2aHNz1fuKz5Md0MtzjpNiTE6bp3aOeSy7a9KNnGZtWH3/KIqse5wIjPsQgmufIkB65v/dVxFvi2J5rQ0BZQCd7YVRO6lryn6LxSbGvdEoC+G15JDqHrskSCJMWmWQs21xG4APk23U+f82a8qU/Eth+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZLFIAqBwkRyHb0f4G7IE7saohrY63hSoFiIJt2EcNw=;
 b=j2XMyIW5u4TEwtAVaKAacv90CKLoDrcYVQ01oPGk1eqqZ4PFM6jmeLqJkl1aTWYayeu1FjvDOtWgiYRdgLToktp99jMB1Bqomoi7up6KAZ0yjQ6YyxeDAajz9RRhMHYA5dvSXAis3A7uEdPleWVBPFP3omdaGYXS3kVORczDPstWxLngacdCmTKsxWORuhtb8Q600psqIF7NukYk4FameSykK25+LCDuJkVeKMY4uPMvqbNig48M4IeDVvPYQG0RC57TwDGvwkB898zi2rV0b12mO02bMA9gzSiY9UBsGmLalehj0Yy1AkkbsqhNAK9s2yNV9KPXaFVGYe3E+m51Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from DM6PR01MB5147.prod.exchangelabs.com (2603:10b6:5:5e::20) by
 PH7PR01MB8665.prod.exchangelabs.com (2603:10b6:510:30d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Wed, 25 Feb 2026 17:08:10 +0000
Received: from DM6PR01MB5147.prod.exchangelabs.com
 ([fe80::5bd7:7a26:d6ec:59fd]) by DM6PR01MB5147.prod.exchangelabs.com
 ([fe80::5bd7:7a26:d6ec:59fd%3]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 17:08:10 +0000
Message-ID: <f47fdd45-21b9-45cb-b322-d7de77b6bdea@talpey.com>
Date: Wed, 25 Feb 2026 12:08:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Steve French <smfrench@gmail.com>, Denis Nuja <dnuja@enakta.com>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Ned Pyle <ned.pyle@tuxera.com>
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
 <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
From: Tom Talpey <tom@talpey.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0301.namprd03.prod.outlook.com (2603:10b6:8:2b::8)
 To DM6PR01MB5147.prod.exchangelabs.com (2603:10b6:5:5e::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5147:EE_|PH7PR01MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: c53e1dd0-3a66-4aae-ac18-08de74907401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	Fq2Tx170Ph4XDG/rqmMIsbdCYCJBjiE6bKd6a/oMof/9xf1ArEeVGzwY46Zj7CaZe61aoKjbluBt2i3e7nncvpqlbaQAaPVha+2qTdE1OmBuh7YejWWcFYYQfmX39FMyNv35qSm8DllX1kPQ+0OuPEtw/hSid9KSPpSAsg9WFu+ZY5x5HLg6IXDh6LE3BGzW72BShVcI2rEvRNegRdwFsC/V0oW7G9TZyL5wuoiBFjMrMsCsjbAoYUwrgIobtG2Mz4jNDS49pyjutllLSDWnbxaPm43iBsUml0/rdLrKH1OQpU//I/lxB95oGATpYudglgnlJFDGJAMTzLqtYfMgGM1Wg8+8nQOltF6cv76UomcUC2gpVqwnL7UFFr73gnY3c1ARgUU3GOCQxKP4bv8/5U3Q0J6+IbHZAd+jVu6Wnc6YgwSHtAjYTqQNc6OAA8FYhA9E1p9IImYIrkia33x4F6lcE/JhCIRD5wXR7XD9+mC3/4p84cRDZDko86OvLKz3y/PIU80nb352UmOUHkADW2Rssfwe2Iz5ntaOhvjDMLetj/V4/xshCwNdHlM6NmR/v1R9lz5BVt6K6rlJjvVoj1aicFp7JN/PbkXjaBSqUFfn5NfPREGfvzN2A4fKnTlM+kY/Z4LTOOdGiUbVJHhm0LZg3RSzQKB0vhUBJbrvhDdx47SvCZ44Av/REq5OrPkuhVy2wH0dOpGStcqM35rWMvjkpkzzBRCsXNhzRP6DyfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5147.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2pvcytWbmdjYWpwSEZ1ZFdTb1h3RWhMUDNyNm12dk9sOUZMbEV1cDNiN1Ro?=
 =?utf-8?B?Qlc0bURwVDVjMDVUSDh4bjVnTjhRTlF4Qm5BMkJmSDdMekVaaGJnbGNiNG5l?=
 =?utf-8?B?N0pNZmYzdERKeWlxT09uN2c2dkFxc3h4VmtlOWJicXlDWi9jb002a0p4VUpP?=
 =?utf-8?B?aG9wWXlrdVludHVwdXpFaWpNcjNVRW13dlhVeVMrNEpLVDd5WXJGaG5iTFMw?=
 =?utf-8?B?eVI5Z25od1VyMXhlUkRMS2NCZGdxYkprQ0xncFEwbjJNWEV5UlVIS0RFMG12?=
 =?utf-8?B?eEZDaEFyQm5USGVveG5Yd3RLVXQ3YWJaNGNZNnd1c0JyTlN1Sk9jMm1VWXY3?=
 =?utf-8?B?NlJmVSs4QkY5RWsrc1RqUGNuZlRHMU14L2UzcUFYbmJ4dEdHVDQ1NW5Cd01O?=
 =?utf-8?B?WDNRRkJCQUJBd3VNN1B5NUdhQ3J5dW41aHUzdEhDRHpvVVpoOEw2RTJ0Wkpk?=
 =?utf-8?B?TVZuZFpPYmRQNUFtRzdvdXQ4eVFFR1ljUGt6c1VRNmxDMkIyRE43R0d2bXJC?=
 =?utf-8?B?N2tWNDUvYkxIQlQyOHFKdTYzNFprVEFMaUQ1MWFJaGpVZEtZazd5M1ZSanZF?=
 =?utf-8?B?R1ZHR25iNFRCK3k3QlFvaGZyVElWRFdScFJMcXlHSkVURDdZVyswVE1kd1V4?=
 =?utf-8?B?Yk9GSWdSYWFEWVpJUU11QWNiZkJSSFJka2xydndmeUNHL1J1RmVBb2VaSEc4?=
 =?utf-8?B?SWxrNytIWXNIeS9CNFlUNFg1RWRGTVNHRkQ4M0FSNzh0c2RwZk5YWC9NMDlh?=
 =?utf-8?B?V2ZXTmRhVi84TUVDeGM0bnNHVlBFVnpkaDNHZmIzTkxwOGIyajJuL1dMUytO?=
 =?utf-8?B?QUJkUDVjYTJ1SzNxUDNWYTlKQTFLbzFLTlVEOFlyNjN4Nkd0U1RuejYvMHVM?=
 =?utf-8?B?SjdTTEx4UFB1K0ErMmRtcWNvME1ISVhqTk9kWEtCUDdVdE9DUFlmZjB2MlRO?=
 =?utf-8?B?UXF6S1JyNzg0T21WNzZ0R2tRcDVtWXpHRmQxZFcwOWJTZDNsUHVKRnJuRjNa?=
 =?utf-8?B?aGc3Mklid21Ea3h3M3QwY2tYYW9sRDlhclo1NG5oMVlUNW9JT0tZQWNnWnR1?=
 =?utf-8?B?NmRXT052SGdDZ2hnTmN4eFFneVU3RkNnVmZ0V2taU211Ni9VaHoyeXhheEwy?=
 =?utf-8?B?WDVydnRRREhzVjhMVUJnQkFuV2JBdytjaDBJbThOMFVkNTJhNWdGd0xHcW9i?=
 =?utf-8?B?cXByU2RVTXFmdmYraDN5WStKN1ViZXJxeDZpb0owdU5xcVhlK1p2OTJLSjg4?=
 =?utf-8?B?K3ZCeHR3THV6ZG9VTXVZdWp1cXh3ek5QNGt5VDJ6U0xXTHlIa0ZOazFlTFRE?=
 =?utf-8?B?bTFzQndydE1NVWlVdmFpS1JBOWh6bFNMRVV0a1JLSFUvMmgyT1FsZlNuS1or?=
 =?utf-8?B?TWtQd012T3I1QVhqRnVCZm83SmZJUUxaVU9FeTZXeG9RYXJaNGZTYWNDK2to?=
 =?utf-8?B?NjlEUDJPZ1pNUDRGbUFVNENJWnZ5OWhKK1hxb3IwclAzNmlDdVRjOWRkTVE1?=
 =?utf-8?B?a1FyRlBvK3hrMGNYMnZZdlAyWVRJbFJoK2NTQmkrbjJubmNtTis5M1ZFd05n?=
 =?utf-8?B?VDZuVGQ5UFVxUkJEM3E0V2hGUno0RG5TWWF0d1BwaTdoWUpWOTQ4QjRUVytQ?=
 =?utf-8?B?NlNTU0Y1ZlE2cmo4MDlGMUxoZjg3QjdlZDhWNmVYTG1PL29nY0NYbmE2NE9F?=
 =?utf-8?B?dE5kWlRRVmpkMlp4bExzNmV4SzJzUnNaSncvTll6YTRsTGZxU1FpdG0rUGNw?=
 =?utf-8?B?WWZ3djZ3Z2QzYTJpSEliVnU4UlRESjB0Y0puWWFIUm9hNllEV1dsS1RIMlhX?=
 =?utf-8?B?NGJENjZBYzZSY29vb2hpMHZKWmwvLzNBaTVlUlB4b0NyR3J2cFA4VmxldnU3?=
 =?utf-8?B?OVY1TmFCYWQvdmp4SnltNFNHcVk2SUQ3cDdRYkZmS2NhWU5rTXZMN3NlNllT?=
 =?utf-8?B?UGlDV0EwcTlzREJITE0zRkZ1NURMK3ZVUG5WZURRWjFqZzZOUTdHME1OSjlJ?=
 =?utf-8?B?SnBxRzhCYVpCMGxkdnNRQXVaeUVMb1dOdndjNFFSaEtVTXptZnYyWUdHZmJZ?=
 =?utf-8?B?c0lIbXBlUklFV0Vtb2d2T2lVb3pMVUp3TDhKRUltQkFkUGljUE9pKy8yV0cz?=
 =?utf-8?B?RkFaUDFVWGRMUCtWYW1FdkNDeW81Q05kMGhmNEVWRmgrbGdaZXdZNmRNVU4z?=
 =?utf-8?B?dGdqNk93WWN1Yk4wU3RuTloyaEJPTGN4QU8wMytKeERYREJ3SncxbkFDZnc2?=
 =?utf-8?B?cGYxeXZOY0ZDb0IxOGh1WW1ZVHV4a0ZHMVdRSVRYNnEwZ0VZSndoRW95VEJF?=
 =?utf-8?Q?lmiMfqlx8IJEdJvTTw?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53e1dd0-3a66-4aae-ac18-08de74907401
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5147.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:08:10.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OenH5UGHRddNieE/u3iQpLKHtQ/JEhW5caQMERQQP10FUhanzlbeDbt9OfNNNXgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8665
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11426-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[talpey.com];
	FREEMAIL_TO(0.00)[gmail.com,enakta.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tom@talpey.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,enakta.com:email,talpey.com:mid]
X-Rspamd-Queue-Id: 97AC819B49C
X-Rspamd-Action: no action

It *did* reproduce - you saw the server config, but the client
config was not set!

I bet this is the reason that Ubuntu and other distros don't enable
client SMBDirect by default! This is a significant issue and should
probably be fixed in numerous stable trees.

Tom.

On 2/25/2026 11:48 AM, Steve French wrote:
> It didn't repro with 7.0-rc1 when I tried it. Any ideas?
> 
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ ./scripts/config
> --enable CONFIG_CIFS_SMB_DIRECT
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ make olddefconfig
> #
> # No change to .config
> #
> smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ grep SMBDIRECT .config
> CONFIG_SMB_SERVER_SMBDIRECT=y
> 
> On Wed, Feb 25, 2026 at 10:24 AM Denis Nuja <dnuja@enakta.com> wrote:
>>
>> Hi everyone
>>
>> CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=m and
>> CONFIG_INFINIBAND=m, despite all declared dependencies being
>> satisfied. The option is silently dropped by olddefconfig and
>> menuconfig refuses to save it, even though menuconfig displays it as
>> [*] (enabled).
>>
>> Kernel version: 6.4.0
>>
>> File: fs/smb/client/Kconfig
>>
>> Current dependency:
>>
>> if CIFS
>> config CIFS_SMB_DIRECT
>>      bool "SMB Direct support"
>>      depends on CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=y
>> && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
>>
>> Root cause:
>>
>> CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=m
>> and INFINIBAND=m, the left side of the || expression evaluates to:
>>
>> CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS
>> = m && m && y = m
>>
>> The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
>> Kconfig engine coerces m to n and silently drops the option. The right
>> side of the || requires CIFS=y && INFINIBAND=y which forces both to be
>> built-in — an unnecessarily restrictive requirement.
>>
>> Additionally, the CIFS=m/y conditions inside the depends on are
>> redundant since the option is already inside an if CIFS block, which
>> handles that guard.
>>
>> Observed behaviour:
>>
>> menuconfig shows [*] SMB Direct support (appears enabled)
>> Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=y to .config
>> olddefconfig emits warning: override: reassigning to symbol
>> CIFS_SMB_DIRECT and drops it
>> scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
>>
>> Proposed fix:
>>
>> Since the option is inside if CIFS, the CIFS=m/y conditions are
>> redundant. The dependency should simply be:
>>
>> - depends on CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=y
>> && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
>> + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
>>
>> This correctly expresses the intent (RDMA stack must be present)
>> without the tristate/bool coercion problem, and is consistent with how
>> the surrounding if CIFS block already guards the option.
>>
>> The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
>> identical pattern:
>>
>> depends on CIFS=m && FSCACHE || CIFS=y && FSCACHE=y
>>
>> which should also be simplified to:
>>
>> depends on FSCACHE
>>
>> To reproduce:
>>
>> # Start with a config where CONFIG_CIFS=m, CONFIG_INFINIBAND=m
>> scripts/config --enable CONFIG_CIFS_SMB_DIRECT
>> make olddefconfig
>> grep SMBDIRECT .config   # empty — option was dropped
>>
>>
>> Cheers
>> Denis
>> Enakta Labs
>>
> 
> 


