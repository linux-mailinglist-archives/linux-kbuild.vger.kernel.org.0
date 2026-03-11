Return-Path: <linux-kbuild+bounces-11852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FbHBY8tsWkVrwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11852-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:53:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A951F25FC62
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A031E3051061
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6834343D64;
	Wed, 11 Mar 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDk3i07k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN36wmQ0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE502DAFBB
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218661; cv=none; b=swjjCEQfmkUH1VU4Uw3Z9bx1Zx71ZHO/PGQKQcSl4z4PM6Vm+Dpg6Y5Rng7SC6ZZMZAPYpllcc3lAs0PZeu6sqNd74nGr0KX8hN6qOJC0Bxg2VTl+HlXC7q9ZMK52as0STg1uHJ5D89UhFV13UQl/PeYqBj4It+WFFI82Jn6ttI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218661; c=relaxed/simple;
	bh=Imjp1fxzvFdfmkh1WVAbM18uVmKE1yiH3pmg83B4nQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFJ4JllXifCnmzCbFc/ukYhsJ40J71mo2ITZlGqzc6YwmxqyIcSrCBPLVxZYpBFW0qgFKQP9cjNeScb3ao3EEhh9vDwZU2mWt2VG7KlihI0bufzrXbggS1s5zUimSGCFTCcCgwunt6gl4sb4PWbVkV7WKyPnTQ5aO/j6tNYZuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDk3i07k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RN36wmQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6h9tm2676438
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 08:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=; b=XDk3i07k5AbMgZEE
	GPfzdLbnekR62LdXCUL2wbKO4dJuHBf5HvtlfhVS8gTAMhBWv2G6zp3ww7bY7cvk
	sflliOaL3Vab4D4/NIMSDO1xwwiINd5liCB2ewkeczDYaLxG31LqZW/ER/yrGd4E
	Y2avzBH9FkCKhqn5+qljEzCZ/UNcPCgizEfjtVlQpRLwEJQfm6FKXtM5SeNmhaLN
	q18X+nzPVATsnsGr8QwGTVLO1+ncxpCP/pPLvTK9NXP/Qe8xD8UZcM3ZM6J6QmHP
	nrG68etSME5UCppqhYxYYeR5HJ0y3siqmYNKyTLhDvP5cW+yP/aZt/ara6HDhADI
	UQ0ntQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd0e3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 08:44:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so2194577885a.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218659; x=1773823459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=;
        b=RN36wmQ0Xbe0ODFQEBx4IUNbl3KSsj3F2FdqFFiEQgtmleuVEzudFWAIqKO4KpZPZm
         yQwy7oz6K9Q3lBBu/PC8NIGATFRhXL2Xb9EPAo2q+U4LlIPxG72DWEQcFA+CQZY29YpH
         vwlvXAo86Acw7qW1EintpCJcEHPxGY8jpzisISCqdPdqXfUsoM0+jMnm97eWzPIo58Jj
         2ejAxN7yejLAAiqH5lLNtEzwhje0QhWmZ3Hf6alMxvHOGg7f7RZdNIuPA6+wGQBKfV4I
         wb6ImTlLpuqQFXoxsfLkvZxMXedYApYqRqTP7GGEL0E9VVIIHZ2DShPWgcFfm+Mof6q9
         KyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218659; x=1773823459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqiFk0X3+BAunLh8qic9ybUFgfcvYe5yryI0mSRxLWM=;
        b=CVskricV9JbcNBQ3w2UEJItyuE29cVmgTR1HArhv64VR8WSRm9wnAMjB1vzYfShFMN
         Zc7hv/nzo3GvIJkp/PX4mAEbyVmXQpyW10UBbOC1oP2+oWBPkfJUpEU+w/+hdcwzgsU6
         i7b951CLwwAqXQ8BkRuV3ItODtVzxJv4/A+sC+vtYLABjz/E9dX55+W3vyFGjSU488jU
         J9l+1uxVJE1/azaDN4PP0yjlTJHWwApR51Il2Rty+0kJ1kxzj93KI1FL8Z1ce+npC2KB
         riYDwhtflkr6zaBptsMs90jikMgcPp1BzLDfDifkvqm2C+jW7B5CN2C6oU7eI1bq3zuW
         xOrg==
X-Gm-Message-State: AOJu0YzbC94+QLgiBmZ+Of3ecwJWV50ner6oZYSudrA40Cu41fWmtnTp
	7VOClkTCVca5xyPhnszEMF6qKshofDAi3LXUtvUFBaoQQgOtBnYouz2p0RjG60NrCF4MOrhK2RY
	xg+GShKMc1tK0cqRg2hTb6nIlsnsGD3r8oqh+M10JhcfYzVLkSEmeEFUEY9KyF9Tp6Iw=
X-Gm-Gg: ATEYQzwuyeSss2H9hvbwu5hNpJ3f+lwOqR00x40mtiHXWgtB6SPRiBBFjj9DCB5AQ/U
	IeUfErez47dsATuTbosJ0MASW2+lDBGpsdfgSXSR/Kpn4Y89fGXYvReAJtEdTQg5iZXYl0t5fCK
	k4HvwCjrS01saaiWt6f/giK6TugpDsc5ROyI3nXvtQ39UQEwitGIXBC09d751EjkwRYks0KX3HF
	uED7CePbhk7N2kWZ7Ynty0ycxNut4d0+ugyPfu3P/4Yt4M8rT25zG9CuW1pAzL+Rfc7yHksCL4v
	58gvE3ArowE7SYaZ+nDMuii4mOXXnYWwLXYJN80lMeSWM7lHiTaSywCGsFXgMOLy9b7GReycZXY
	mM6y3rdevp5ue/NJ6xfRSEtOOmiRtd3sYdOzVuZDbLVz4gfhbnRPbywG7VAzP/cSM1AdKcZ1p0+
	Gv0m6nKJUs
X-Received: by 2002:a05:620a:294b:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cda1a58338mr222189485a.68.1773218659220;
        Wed, 11 Mar 2026 01:44:19 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cda1a58338mr222183885a.68.1773218658603;
        Wed, 11 Mar 2026 01:44:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d5eesm5866352f8f.1.2026.03.11.01.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:44:17 -0700 (PDT)
Message-ID: <6707888c-a31a-4d38-a99a-86ae42351561@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 09:44:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/30] tools build: Append -fzero-init-padding-bits=all
 option
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
        Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau
 <martin.lau@linux.dev>,
        Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
        Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        William Breathitt Gray <wbg@kernel.org>,
        Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
        Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
        Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, bpf@vger.kernel.org,
        linux-perf-users@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX6ke4XIskgkgL
 B8ehK7wlS5nQqM4Gz9RqzORJZA2A9eWlyxijyEKnGrzizs6TDmttSnYLBBd7+vHDcn/SRIlAh7a
 zBoJwKcVkF+agKgCMNp/YYb7lfcwMm7eupnj50zbmU1LlpUA/sJ6Aa2yDoD64EBn+HAX5rGkEuY
 WWhhspcJuVcJsLWaLOjV/Uo9ZZLKOHItP7lvq2SAyJLrUN7wdIQq3hIzA2aX1X7gR9oKuYE86iJ
 IQSKCkHZl767qvexeqxCZzBrpRraMY02BPsW/BJvRQ5+iSF81HZ2ZMK6MNnCLbZU/utov7Dcd2G
 6Tb4Axv+hQIpI1RF3IYoY+0nOwhI4EAvWbwZuI5/X3HFDKTdEVByV4adCZ/8LWZrJC/0bKejai0
 +7f+L0KE147y68cbmGmQYMehQvKF7wCJQf7IvZNVmrCoqjCQ1NyrkJwfjSzrYqrxWROFox3J2Ch
 RHMFezpKwL4We77JboA==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b12b64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=fUoFdtiNKAmboDELQeUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nY0mh0Elz_1ZuUdEAogfHoy0XupEg5PB
X-Proofpoint-ORIG-GUID: nY0mh0Elz_1ZuUdEAogfHoy0XupEg5PB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110073
X-Rspamd-Queue-Id: A951F25FC62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11852-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[71];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Leo,

On 3/11/26 09:29, Leo Yan wrote:
> Thank you for reviewing v3 and I appreciate much Ian's suggestions, most
> of which have been adopted into this series.
> 
> For anyone new to the series, the reason for appending this compiler
> option is described in v3 (see "Link to v3" below).
> 
> In this version, the changes are organized into three parts:
> 
>    Patches 01 – 07: Preparation before adding the new compiler option.
>                     Fix typos, adjust Makefiles to ensure the newly
>                     introduced option does not cause regressions.
>    Patch 08:        Propagate -fzero-init-padding-bits=all to
>                     EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
>                     CC and HOSTCC compilers, respectively.
>    Patches 09 – 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
>                     project Makefiles.
> 
Through which tree do you expect these patch to be picked up ? Each 
maintainer picks the patches related to their subsystem ?

