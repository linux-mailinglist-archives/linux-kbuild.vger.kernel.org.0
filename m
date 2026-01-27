Return-Path: <linux-kbuild+bounces-10904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG6RFwMReWmHuwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10904-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 20:24:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A599C30
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 20:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CF6E3031827
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 19:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8722336C5BD;
	Tue, 27 Jan 2026 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NkY6vi7z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012008.outbound.protection.outlook.com [52.103.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFF36C5A9;
	Tue, 27 Jan 2026 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541888; cv=fail; b=iYebRuxuRVzELvDGvoN40hxB4Qnsg8m4lg5x7usSdwTmtPB9jQ8l2egBhGPXjURY4F3un1a3b3GZ1250TV92sgiM8a4rkWcMKZpI6511C6FTBfhNfp75uaoE/9sIVeSm6EAoJoEcKE8kkAqjYFYr/oD6AzcognA1ZGfgB79q6d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541888; c=relaxed/simple;
	bh=Gr/uePpTXmIT7T73iOAOcc9wbYO71QJwxRM0mPGSnrM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E+myNZ1RdCZx3UcV62Hg9NiOQIijuBxmDdG0fbm4NUlLPDvx8AIN1nQLjXOgCSjnFiGGwfsIDEEyF3fSxr/zvG9CJ6VayIKf7q+b8kEjOb+3r4vFkFXbNGv9sZRlcPqAzVo+vlBPwZHrx7UZy+o//l94smDujgRYJy60tuIM8u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NkY6vi7z; arc=fail smtp.client-ip=52.103.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNFOdRF49J9WcNzMwewH1Cr9i5r3st12ecMWpfwNxZzakd62Re/OKZeqfhDpwcuqRKzwzQm+Kz1ScOQcilAMcCS89/UkFwr2UAZg1UZUzGyMun9jS490/mvbqesvj+epgO0mwEHGqyY9RrR2oF3F9tFK6U5N/Oa96MX+nInHcrK+h5XnAM4N7hilCIeRZYaU9y6ijZfftdzhE57J6tXCd42QxO0HsI+YHer0ugI3iaJ/EXyG3ZfWKjxHWzErrslrY5EIgIfCGec0PLFXjo4dzGsyuHGBfA8aZk9w5YCbYjDqRXhaltmGSuRU9I88IXj39XPDVXcbu2+odR6xkG8ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV21SD8aXojg8VR7o4hMBeZzgPq02MWwpbmFQ+Pvu8o=;
 b=kQie/lJSUOBoLlgI5dWhey2Pa6XJsl0H2lKzbuZ8xNVJQMwNnVBslOxo+L9NS4sV4+HKkBD8zPFJIJzZiEYWRP0l+TQXU6u9xH+5+zKa8s/6tP9Al3tnDmmMU+dIKAfTP5V74rSCHWDBRtzaEY+Io09IIm1rmw71EdRryDcbuYpfNwQKT3HSSMK96hDHTAQyS7VnX9yp9X7n66Tg4cqpdbIL0ix53V+PAE7qalSx18iXdVj3A66Pw5930APPNJYoACq3f+tXnkhEAZVbUdDS/8Gauw4kAawlQwpF3TdOLaFnX3XS/o9DJRCZWAbeXuwAnSM+lCiTkLeigvy+LJxQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV21SD8aXojg8VR7o4hMBeZzgPq02MWwpbmFQ+Pvu8o=;
 b=NkY6vi7zM/Pqsupe+FUsxLWBMCMAMqovmES8/2xNt6Fyi5r2HsXQq6+WX6zMfEyIV7sGUc9I+2Ybokvr8UGk7XDWw08tE0aA1pleVUH5fMTKicYQ31h3xbKmZZuC5iqRFTYAJARtowdSnmmHrpQZ7O6fUqVC8XuawTimWkazzeG7o1QwQuiAfUTtiFJ46QN+I1S4vv6cQ4tTFE/CVtk557SZIXFy98BeGVO74fSj39PWN3pPLUAe+3TaotIcbajJZwb4tw3rasSgqJmjkY6yEwpbPuiT96ZljPeSHyBYcCgoT8+CHpydEo4Ts+PIsfKCX9ZqTrB6TFibwc1rTY58Lw==
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:285::21)
 by SY7P300MB1322.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 19:24:41 +0000
Received: from SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618]) by SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 ([fe80::3f5d:60bb:b39f:f618%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 19:24:41 +0000
From: Ethan Zuo <yuxuan.zuo@outlook.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Zuo <yuxuan.zuo@outlook.com>
Subject: [PATCH] kbuild: Fix permissions of modules.builtin.modinfo
Date: Wed, 28 Jan 2026 03:23:23 +0800
Message-ID:
 <SY0P300MB0609BE844D61B504AB2013C99C90A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::16) To SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:285::21)
X-Microsoft-Original-Message-ID:
 <20260127192323.44614-1-yuxuan.zuo@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB0609:EE_|SY7P300MB1322:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c2dffe-db96-4cfb-7748-08de5dd9b815
X-MS-Exchange-SLBlob-MailProps:
	9IecXKUgicB5Y5xtj3Bi4po1AHQXatGhZuIDYaXDGeTkgi0J4nucDCdbDCHBfzdppxYMVAlVzh5CEj3u1rargfD+OPkYkfQ9oafg1qKaoO2W2D7AMk7icHSR/YDMmTn4u8f2/7H8CPPGs1mmw/Qs4xFC+nsxIVLYO2RTgjIpARKqQKE1cC+CDBt3KLTJgR5x91zEhddaomOIVf7Im3SnGQ1SU/jmWNDTcFQ7+7juml+FpryNWqzi1hah8OpVfsGPeoW27b5NMBfnsBtPXEh+HCSzLnzLy/o5NvGLmsWTi7V/yG/JWZRf/yTCscwQw4+5BNcbcz5IKYcdAwMkfGvHgwhICZYJfHdgNJnoq7K335IlriaN/Cji8D/Bty+LJmD0nGXJUuPbhAp6iCVwxEAqgsDEcolvy7lhKiGxtUo13NHNGEgrmIO9Vlm8xE3icsOuzSNOWSy3WXlkQJt1an+ELUNTSyneNQJOuMDUOMVkSLYYJakob7qbIg/K9sIJdk8hjbiyFjJ6x02l76KM234uKUC8qmMQGfH9dbD4+f+BwRM/6Cve/Csib1gz4/JjV927vnEU2F2Emd0flhhyr/Z5SQxfexRvNJqqqTnp/VMHsZBRLrTLGJJyxyAC1Y6MD3rYk04KSdsVAFvF0gnm6Q4x4LQTzrdDSpIVWe9XwwTxxWKFgFBnrs6TivNyRIACvl4uTvzb5eP1gZ3H7FL3hyfL3YqmZTqtcY6zVwXFWDNVrAtGTfSqEgrmDA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|5062599005|461199028|39105399006|8060799015|19110799012|15080799012|23021999003|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KHKd4PRj5MMF+374J3iu0k5Gh652/aBz88OCZJBL3KhyH20+1DddQzBP2z9T?=
 =?us-ascii?Q?BSL4yHuSwx3GF3+FMafUrsu/c+42/LFupOdRMiKiq9mTK59UyTG5zC03NUen?=
 =?us-ascii?Q?7veMw+pPxwos1xluFTWkrzu+An0Toqj8lKhy5tqrCV0OACH6hkuk14w/QchQ?=
 =?us-ascii?Q?QlLfbOX23nMe2EMH74BiwBMBSYLWyY8NiyLhy4CCWcgtb2Vneg4x1kxv1W3Z?=
 =?us-ascii?Q?mDpNlVBcsU6F9KWfxDEpcQ6eLoM1lQB8stpQzjGNpcqan+W1lT1PUROKyg+d?=
 =?us-ascii?Q?3v1gjPO2iLjeq7tRlNIwHOPpbEwfNVV1ogcYafYH6Y3O4L6vNIfvr9dQsn8L?=
 =?us-ascii?Q?COsxDvk93zRrqkG3RebmMHpP1PK6Sypbn6FDJwrhLALg0CCcPr0/i3/NpGQK?=
 =?us-ascii?Q?CaCW1gWAdh/f3R4VhSj69FJ/GEbCGIuaaPreurZQ33DCUQ6OAY4sHvIKrktu?=
 =?us-ascii?Q?RSfFNIPLQHk1KkYntIu7hOIKu7CpKm8DZCyfd9+G1Zi69kqOU9L19zgrW7gi?=
 =?us-ascii?Q?QNdD2mM2uI5qh4mboIRpVOKv9t4LfCqQBsgytyebJaSJkmaxIOG4knaRAw4Q?=
 =?us-ascii?Q?ycd0KByDz2jO28IOyJKnnBzre/AM14glLo+lnpkOrLuwYi5g6Q65BFV1a0s0?=
 =?us-ascii?Q?fuTFBAWAtaW7myYDYexZ1x18NKOR+OeZ23IQrvlyy5GGexMWkcIu0iD6pTxp?=
 =?us-ascii?Q?U34iliUMTTithpC42P00Z1GNxaIZ1zZg15rof9GXvK1mZ1rYlyLF4phF+5C7?=
 =?us-ascii?Q?ycZUnnhUoIb9xKs/WEucDI5tUZyq1TUHz/sFKaJ/49WnIbGtpfvqvcnsCkKK?=
 =?us-ascii?Q?vswkUid0sR6UUsP6IaydOynG9iOsRXd8qoTxsMwyEQ8ouWHw3Hk2461rHl1d?=
 =?us-ascii?Q?37w67NI5oC3qraB9dLV6EVD9vg+Iri8MRdjYM+eA/of1sytZ8JWnfM0yh705?=
 =?us-ascii?Q?rhFBav9TupVU6/R3yAhXvp+820Eev9dQ8+otieIMAEX5Hh6VxeMNEHRqGXgS?=
 =?us-ascii?Q?Hc4stkGqUgVuy7h7JMMy3mFpwi9aT26q3Wnfd5osRGTUJXrWVo6W1PAh/JVE?=
 =?us-ascii?Q?sbtRMEuHVsHTaYPbNVfKfsfa4+SOdgxskTSmEjfnHmGcD/CUSwJzLZA6kfeM?=
 =?us-ascii?Q?SPU6dzdGbhM5xcAz2TRQnCnQ6FTJ/2B+OpqNDWsVxdXJrBUrNO1i9IdRYGbN?=
 =?us-ascii?Q?msf4O5j4nHEc7qRzlrwJAxexVKJVAhbS9vIrGA9Tu5H0Z2ChBZobgrb7/z4?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQE7KyExF4ANcnb+y1avppqZbC2pRacdlJ9enz7ULAF6yRy6olPTzop9qPZY?=
 =?us-ascii?Q?bf/zmPy7oaJyOKgGUTSLOWfgJbIVzRAgfx7ulfdWM96nk/OGCsQwAzmld/Ym?=
 =?us-ascii?Q?MiUkYetUZs6d+QebIrWuc0c6qnavXhngcdYObXVVVZmkKWOxU5o+nPyJqary?=
 =?us-ascii?Q?EmSqtW53Mxc9P9hiJi12jawRmryYSsB0kAqZJhXFzqCT8mTvuHnMqZGz9uV2?=
 =?us-ascii?Q?izFVeZ3jptymu1KUVIoPhF8r7Sd2z/b4ZCyoGhq5Fa9N2WaSYT/mpQWT09TU?=
 =?us-ascii?Q?tBnzer/RWthBgeNQ5THYghkho5B9bvtOt8IbhQyzzLWNPvJ53E3ICoSUyaU4?=
 =?us-ascii?Q?758mtBYO7rUF8ZBuVTpF3uEZ4R571spLvLdv+SG3A70e0RsF7exgEdtkTWpm?=
 =?us-ascii?Q?9AQDVIcu1k5e+U0efi8gq0+97aCbGGCRiT3GIbngIpB58igdTtWDnlRoAMa+?=
 =?us-ascii?Q?/tjypKhWuzh7o6FXjUB1urxycy3s8zB9aVhe475zyhIoj25Ntcr4gJynIbqM?=
 =?us-ascii?Q?0xJlv8Pa+WHmO9kKPpuI+7O1BMZz407BENn4BlTXKgFHCge5YsErVyzVXvhL?=
 =?us-ascii?Q?CrExoab+W8voJvJfOEqNVqC87U4VIKr6UNASomR8uiC0W5GnUtQ7vu/XbRFT?=
 =?us-ascii?Q?7AppoQR/4gJ/MHTMlIRYu/xCsv+KviAZRwpRVAdpZhXSihIaCr4VlIXFfGcb?=
 =?us-ascii?Q?wmgosiqVzNPRQdAFFQgpshQIQz4ySqO18rORqX5APt/geAiOQ63hLPX2+3Qy?=
 =?us-ascii?Q?/9q0WpT/xox5aANwHlXoQz4Xb2WqlXetXJgXl3VTJTjtq0Q8kgUwEqlKKyT1?=
 =?us-ascii?Q?ERQz8L9At8mEyVJf9hfyyPI3XIt+WPmzrHp7JCnoYcMdjULu8oYBlQddeGQa?=
 =?us-ascii?Q?4u6tgiQ5+9xX6xhvYUKmHrYww4MuCfpv07AxZ32zDS0hhmgbJ2ghszQmM6hy?=
 =?us-ascii?Q?2PhFd7sxsO/yTQCnFlGz/SCjx9OGfDa4tbb0muMQsVXIzyYzfHujNp+Rlb+A?=
 =?us-ascii?Q?7Ak22jvT9in4nOHBAD5zjleuplvctGBP3/fkl0DMxT6gt2xejp/y3wt/1yT9?=
 =?us-ascii?Q?/FEw6i8PguCmyHrYJ9h0DLeD/TUp4tLey/8egsLG0ZsMhAlbmr/ovS8uKKZ4?=
 =?us-ascii?Q?G3OalhC+xNDSm5c/2ejFaotVn8KLEehbCb2EQ0idFijhPGgfCHUfRAmuPc5L?=
 =?us-ascii?Q?irG3LlhW90NnsVL4M3vQU6yOvH59VM7fSekJSdXol5vAKoYG3IpkfyRu7CKu?=
 =?us-ascii?Q?X31T9Hv4YMTtBeMP6weBmzGsq6zSIvtyPPfxv5OtSc7FulnDQCIZCXvqby1S?=
 =?us-ascii?Q?dojQWvq61+yycu4K52VpjwKFSvaSEdCUjgDPtq8WgJGNyCADyAaYd7bnT4Bv?=
 =?us-ascii?Q?FIIQiNge1pq/JD6xZ2OLF2LQugpk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c2dffe-db96-4cfb-7748-08de5dd9b815
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:24:41.3999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1322
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TAGGED_FROM(0.00)[bounces-10904-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuxuan.zuo@outlook.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim,SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 956A599C30
X-Rspamd-Action: no action

Currently, modules.builtin.modinfo is created with executable permissions
(0755). This is because after commit 39cfd5b12160 ("kbuild: extract
modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
is extracted from vmlinux.unstripped using objcopy. When extracting
sections, objcopy inherits attributes from the source ELF file.

Since modules.builtin.modinfo is a data file and not an executable,
it should have 0644 permissions. The executable bit can trigger
warnings in Debian's Lintian tool.

Explicitly set the permissions to 0644 after generation.

Fixes: 39cfd5b12160 ("kbuild: extract modules.builtin.modinfo from vmlinux.unstripped")
Signed-off-by: Ethan Zuo <yuxuan.zuo@outlook.com>
---
 scripts/Makefile.vmlinux | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91..c5305619b1d3 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -113,7 +113,8 @@ vmlinux: vmlinux.unstripped FORCE
 # what kmod expects to parse.
 quiet_cmd_modules_builtin_modinfo = GEN     $@
       cmd_modules_builtin_modinfo = $(cmd_objcopy); \
-                                    sed -i 's/\x00\+$$/\x00/g' $@
+                                    sed -i 's/\x00\+$$/\x00/g' $@; \
+                                    chmod 644 $@
 
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
 
-- 
2.51.0


