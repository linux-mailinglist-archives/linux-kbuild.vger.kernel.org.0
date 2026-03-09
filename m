Return-Path: <linux-kbuild+bounces-11705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDAmAfbArmmRIgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11705-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:45:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C06239165
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B3F030172E4
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 12:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FB63B960C;
	Mon,  9 Mar 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HBE5HORV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8743AE6EE;
	Mon,  9 Mar 2026 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060340; cv=fail; b=Oef0adCC4+SL1XwU18ON8CEi9qRvnzUQO4IX5z6C4NzPKiLSRmpeT9NY8d5uC1LIN99dhPiIER1rN0/MD3yto8Kdg5z2izkVaHNabjJNz87+MrVz/OReawhP3qbmgga/mt6h1KgBaZElxT+OZtzR5bG874/Pf/IBliEbOM+IVdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060340; c=relaxed/simple;
	bh=n+fwtR+q3qN7c5tHBcWRIaOfwwIYoiyLNNl3DmHri/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gIi7w2c+uuroIwkeHtkZ0vrxC3SkqVvFJxos8XT09kc2jbQ8q6C90Rcc1rlcP27I3jmzOVnCwlIx+g4f1wEcO//quEV2zJ1YnHBt4alWDu7ofXtViYxUaE5JhRM3zXf6Q2O1hJOdwJp3dRj6FnMfFbyOl/Ju81qNLfGm7qqpy2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HBE5HORV; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoTQxIqB0q0AWLneE3SUTn7VkmNnY+lY38r72PcmTMq7VY3KYHpo8mSNu27SDxiED3IpeqRCgt4ei/FDXKz2O1+rNZ0bliVG7YafXSzYg4pXSUUyb5hhI5H0TfyxuFWR1pQNiNmqUkTy5jCPF+l3oBA8VmO3JQ/KiPscGrAngtbobKGJRtycox1p4Oz2b+LebOp7eH+cPYYLu0ft26WTNbc5Ouhcl0aATYkb+fQVycaAPyA3uZNX7SEEi2stOkzk9qYPp5xY89dLs7QOmtMOTlByMr/LVmTby4L6gpPabvxxYcOhg5ZeAy6noiMqLizddcZqnk7/fVif55yISouhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsKAwx/AXQUjcyE7CvyEbwa7Kbybwco2Bt7gRUfogGg=;
 b=I8jM11F6rm+SjFb+3WAYOpg/rRUVcyjSkZsvTeCvpfsl7ERCYi/EoKTWYh7U740fF8YEVgTinpPB80iEMFnogYvIv7M/qqJ2a8WGJJaNsqxN5uotWrmPSjgZQp5gLcdPKta25G3ZzV4oUyj3GyQUZhsQHCe2SXvGvklq9YEdqcy82lb6tJohi05BMWDWfrpUuyrAszphdVxaLJOL65o4gZJrztGOE78NPmhiwIGzIq5UfWmM7TlYBllEI0Xq6510CcksigRBcUFS5FUDWJAvkZvFZUh8rTTTsixnddp27v8vNT1s0MGHKD17KN8/fJJrrN3qTo0XEgd/OH4QDB5tfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsKAwx/AXQUjcyE7CvyEbwa7Kbybwco2Bt7gRUfogGg=;
 b=HBE5HORVMbaNlD8o7ehIoC4jA+KaXqLlcyADCHlOi6ZghWI+8NvJlGE8yj8KWYMyRVKflY4eo+v+g8lH50P6GF+G2r0BwK3ChgxtfnWXnJVPROySOZ5gUNghPgikMU8S7PNHwsezccIc/ukSszi8n7eblUVWcF0me/zmFn1UnO9MacgRIOinitxeM0TWt+WvHIQpWeKqgHNWHqZtDHoggeLdKq9cyOErzpvrOC8TA0PKJK3vjdxFlJSM/3MxVyR1+f6LLzbF9q/1OTB7XwzXjiskmn6jiLfrcXPX4P1YtqEKIOTNV0LwxcOmUKiKIaFwtBkgjtkwS/NGtlKjLN9Yaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 12:45:32 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 12:45:32 +0000
Date: Mon, 9 Mar 2026 13:45:19 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	Quentin Monnet <qmo@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 30/30] selftests/sched_ext: Append extra cflags
Message-ID: <aa7A36lVJQKzr3IL@gpd4>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
X-ClientProxiedBy: MI1P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 4175c5a3-f69b-4238-9ad6-08de7dd9c06c
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	bi/9t+k7trv/EYmN6l/OvJKWyUSczP3QOioNs9S0Fn2Lt41ayLvqL4wWG6abKjFJMBhzGdOHjY6cyBCZ8zKX9G1NErF65e8jz67rZIvrcAer+M80fDvhkVY5MG0kUwrOCXutsOF2wTticTxsaS8UoeRu6Xkq35SMkzpf0VxCuuPxcKy3gpApxC6H1LGH3JYx18x0l6SxFe/4pYWQXj610OTruf2yqKQkIr9ZCYES6Y/xFNqepnH4gv5ZYunqMY1n5HfQEBZTnlJFDYkYB+IICes/zxt/2zDOTcYLkrE2cezQWSSHuef9n8ve0jXvI2iefFjkV9kv504boPkXO83LkRhKcDz8GG0Xipe6uJYydCmJ4QkNEk825oSz6Gp0ae+gl3XrjKXqFbSbbJ/+rfHLGI7XKX34gN/YkwKIJweI7RXCFaFi2UXxEdkGbk49zuNWLnLAOdgVr0NgF2IRFcmmr9C7KflN+2jfmUwES2Bh+WJHSQdhg8qANrlV/xUodBVE82iXYfcv7vpr94JigzNTiBeieaPH+xfdm6expW3oCtmy0OttO5nc2aZ/a37hviTQq9u2AAaGPhx++A0YhV2Eh3lmnTWlx0hFnFNYa1QnwHqf5QnbVmfAO1AaqSCZUD6d8AjPpCJKzHrH5BCXctInNMS0UL56kZdFnwrKlDRIO0tOOOZHtwYs1TY8NPXGzcaSr6pZ5ESDCmYgHVln0ok9VfJtvd3Ix0oXDM2GyAXqteg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PnCfLPeOjIp7ainixdnTeg0GxWslxjSwKQaYp1W4K1W4XMU0nSeXFDEfootW?=
 =?us-ascii?Q?OhQmZRDvg4tkeTshRKpTsLC2s8UuwCD8r22x7RZ+kMn+b3uH4GOWKOx/QS0S?=
 =?us-ascii?Q?NUP5KAr2jZQoCYQvMShdBOo4oe3zwcdZtn4Fwgwsf27WyCEhCOST+8QrePGb?=
 =?us-ascii?Q?VZR+6icxSASeAhjmCEhmh0SkfWocsp8PYSl+b/uyuB0UpHq/MbC9B6yGS5F0?=
 =?us-ascii?Q?KKoFVqNTFZWzfvsDh8fqtfMraSMPYiIwAzeBu4KY1nTjM2xM9DtHE+Ij87ip?=
 =?us-ascii?Q?rcIRHquyPb/1IYEgi2qes9xz2Om9AYAnKCL8N4FBQbVRYNotTVIezuJe3tRf?=
 =?us-ascii?Q?aJf/mfjUUpvfqoTpYsYmP0JOL/6O3Gipe/yIuGsqnHalEOZTjnED6vEPZ68l?=
 =?us-ascii?Q?pY1w7hxj27QFLT+SIjdk6YLtv3Mz+lfkvbdWl0VTXJ0guigUQUIhFWtJPVYw?=
 =?us-ascii?Q?EkW9rU1CXvjTzwDMsHoAcbgspcZweofhyXM9dRujCifUqGudqlkTXKX3IBnU?=
 =?us-ascii?Q?9G2T6o+xs3j8XzrzHDQBmHdzq8pjdJaFGAszN7I6j45S1gCjv0vqzgypU42R?=
 =?us-ascii?Q?j17TRcc41icNGC7vTcZkALN9XlIKEkzb1DnY5GULUmrqaM8mmmC9PPSaVwWX?=
 =?us-ascii?Q?JXchqL9iFXWvIlBv3sYMWJb+VotUnuGJFlIQfxpOxrbcG10zapAsHnkNqWFu?=
 =?us-ascii?Q?nEvy4hXFK16GqPZgK94Dc80VZetTlVBW+VhspK8d4sp8JIqQ/tHnA0MsmQdS?=
 =?us-ascii?Q?iWei1yVMPdvtweXlV3ZCkXovD1I253ixBvUd7WdPPOwbP69BoiLebA+dVaEC?=
 =?us-ascii?Q?zQGdTG5qvvZF2Wj6phN+CQtJMF2Xp9pzCxMt/gRHix/+CmfHLENOijICHASm?=
 =?us-ascii?Q?6BElofW2uTzGGLHQqLfdgpjMrFjiMgaTGrMAWQ3gY+yXiJSNO/1CnDeM2aoD?=
 =?us-ascii?Q?HJVFXGc67ufu/L4tqSQ4A7BI7KI+Pm35/mNc/GJDl1BP4Dp4izDH+DATKvrN?=
 =?us-ascii?Q?HWy0koIhuE62W5NqExIgb6YYoMu6Y2GktS04hPp17VLI4D20V+rvzC+RKW01?=
 =?us-ascii?Q?S4UCo7IU4o3kTjiKN3AVkc+6cexaYa2Rt+67MfhRFAvrkUoOYjPmYgtFRtTF?=
 =?us-ascii?Q?kgcCitKkyaa8C9MBZpJcK09f5JXtdjJQgwcdMVNpqeQPwdKs0xc5KpfQ/w1T?=
 =?us-ascii?Q?hmjd8NKKeqI6fgyjar1Zku4yDPtYs+CrRLNeabkfxPcR0lPpY6imNN+jDkPt?=
 =?us-ascii?Q?ntoMH9Jzb5mYvI+uNZcemyfjRRrbEhz3ScHAvQeHQgTFDY1j3ATk3p2vkYoJ?=
 =?us-ascii?Q?0SBqsCtyZTfCqF/nuqogqhG88sZk29yiqOwBzv3ioHAIgBCdCKelprLQt8Do?=
 =?us-ascii?Q?FGbKQSH0nK9n1z4g+L9PY9lW2zMSqCrpHuZshaQnEM2QoFOinzmL0JOcCeQz?=
 =?us-ascii?Q?QXi2ZdTXkfVWp43GpgbC+ZMEz/q0EFpl/4mkwUfQvU9Uw6E5hGDIOeWBevr+?=
 =?us-ascii?Q?rTyGmMUq36AmuH8bxeusHhsh6TEBrFkBiROwPmibnZZp/gS4jHUJfsUkOuB+?=
 =?us-ascii?Q?P+HRd7vmvviCooy0DRyszYrl9dCzPpymRE6k80dn4EC0N02iX0Fga9awRktL?=
 =?us-ascii?Q?TGp0eWZ+1wqEAehgYAkBD5+cGKpFThJZ6BYTPaNecXdrMu/EmYaBMoca2nso?=
 =?us-ascii?Q?h0CblRDpdddaPAUhfFKzzE2ch/xSpcKf1JMww7tRoiYBizIRq6xxvuqMVXjK?=
 =?us-ascii?Q?qC0e9SIJMw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4175c5a3-f69b-4238-9ad6-08de7dd9c06c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:45:32.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHVkotXk0vb77UbEtMyi07c7gWqAoaMiV60ysFrhONJSjoleu4+PiqGjIbSQIWgySm9r1l1wX6YfYCTf23tjoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
X-Rspamd-Queue-Id: 98C06239165
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11705-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arighi@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[69];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.991];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,arm.com:email,nvidia.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:46:35PM +0000, Leo Yan wrote:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
>  tools/testing/selftests/sched_ext/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
> index 006300ac6dff88a48104977398d8517753e7e385..81d8f4a184245d8c330cf45b75bd868b2a7aa7dc 100644
> --- a/tools/testing/selftests/sched_ext/Makefile
> +++ b/tools/testing/selftests/sched_ext/Makefile
> @@ -53,6 +53,7 @@ ifneq ($(wildcard $(GENHDR)),)
>    GENFLAGS := -DHAVE_GENHDR
>  endif
>  
> +CFLAGS += $(EXTRA_CFLAGS)
>  CFLAGS += -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)			\
>  	  -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)				\
>  	  -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include -I$(SCXTOOLSINCDIR)
> 
> -- 
> 2.34.1
> 

