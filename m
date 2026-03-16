Return-Path: <linux-kbuild+bounces-11954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAmjJkfvt2mfXQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11954-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 12:53:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CD298FB4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 12:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58468302D95E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 11:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DBC39282F;
	Mon, 16 Mar 2026 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7gZHh9X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz1ndhlW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4870938F94B
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661916; cv=none; b=Zvful/pwVs4Sw7AeSclOrXjdvOYb0UDXsS0jfY4xxLYzNncfHmt/n43M43hat2n8ZX7inlOO23iPR7tFuLcCXAqtl9qazHJ6wm5wCxWYL5WW1tO8WWMdF4UmGpqbBjo9Dyrlun1ARCg91a9aBVqPpZX1KReBiwWr/w3DS6z3A+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661916; c=relaxed/simple;
	bh=YLpCc002qTAuD1kMTo9L2KKQ3cL9ptha/TF1A8yfeIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQ3hggg9A12xZjtgeTyWJR9z3gO5B3i6KIPtda0aZTZuZSe5dCeY+d6ICa6KXStFEocv8J+9Ts9TnYYQuOITC+y3BlsYmaTJMXuMlBAezgQHlnzb91Bw5VBiKhAOSMNFM/ZW2SWfxbcM2Si5fLJpKUPL/9ZgzTeQfaC2Nx5cYAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7gZHh9X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fz1ndhlW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBf3fP323582
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=; b=R7gZHh9XPlUicz4h
	ApdGvsVcPW0AlNGGFSPnNMHzdRsfpQ9dZkk8Q20sXtLvj2zpPxt94+PE6ukW3SWI
	IUDl6ZVbt2JjlXZURxrJLC79qRoPNWHVhIxm52CpLWKffjY/oW5UQhdj2EW+90gH
	zpK1zTzp1q/qH1JH6UHZWJhFYlBwn6bS4cs9PhHWk3mK28PTq0dI9PxFdgIcZXSI
	QI+TnToLJdb3zKgYYBV1CwXAMuR4CKCCfF9ne1ryeYkg2MjOjEzDIowzWK3azep8
	OtpOD7W4dslo6YhaoDF+jNlZmZbzzYaWgBiCYuUHPMTRASEL/aC19DYNk+klafHL
	IH5BjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qnqmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so2923083685a.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 04:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773661913; x=1774266713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=;
        b=Fz1ndhlWkJoGaj3/p8V3UwaH1DhwuccaCJK0/7kKpnGyxq8SleFIOzODnPyqOX55ek
         hRxnG5+5WJlp7Hq82VXGU0HoFC71IKVm9d7OO1OATH4mO3kFVLyt4pfQdsXyz9OGAOaK
         e1HPtdaZ3QIqbW47+We2nIxx780QktkRFD/d4mrJQl710JmPgXB0/6x7G33ebfpGw07H
         PU2phW9hD/Ox31Psd7sDtzbLrf7ScHLI34+X5Ek1qSB2hkWH34hl1/oS0bbsJkrnbRkh
         UREAqLZkYQa+rAUrDt6TkzjqWNt9dQH0iWLggMYCvasCF3zRBlIpdpPfmIE2xGGvgWGV
         GX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661913; x=1774266713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVZQrImfTrVRlq9EnXFdF8VyCUmvC/OmzTav/z10XOY=;
        b=rqbcZmYemmoMO4pn5Mk2yHqqF429HGNYq0FhghQ05JMvIo6hYcvv6IkEOo0rY3/+j5
         1E7ttjTeQ2shhuxCx94qk7DJuRCUV783cnh2sZlP/5PWv1tugfN53a00bF+LML8b9FPN
         aj9+VA84wszJGxbckZQwhBBmw0I8ZFfLIP9rGtDNnKDa0GWnfZHYT2yKenjmtELLaeRu
         WvvgPYR3Pryf0TJbo99FBPJ4Ad8465RGqwehzPYeY+k8b/ubbhjAnqgHX7oMkXUaEwUv
         Ud8Bt+r1JEZYTVoSERXXn9NblNMdSz42Pqn4QX+GwD6VLL3uEjfEZc6MD+vfLp/POgLI
         d03g==
X-Gm-Message-State: AOJu0YzKyIXwwecvTuIbybv+MC2w1hd3rMegd7VgB52Xr0PZ/EBAh3NF
	WoKjtwBxQjrkhIWWoMAk+L5Ss2XzVPQ/KUT7uv9Q5UhVVodLog186o56CJo4uXzH1VyX4GLMvH0
	uHBkfOBzoVDIpCyxaDuzk6bFAFeWtYtTsxvWvWfa9MedB3NizIGlnDdhrksqiILM7h98=
X-Gm-Gg: ATEYQzzlq3D+0zlX8NJaEl1QLdUudNEZWNDeB00nKYeIM2koiBcRlTEQSq2HhoGcun+
	z4uZah8gWYAG6YSy+HhZv7Bh9CPUDr5CQb5je8fAQKn2TvugfanOHxQpHUM6fiegkqRIzDDQFlk
	L7ERBzYN6IxMiEA4iG9SVBJVckRMZYD3PcUcRAUQybN+gPko0BqyNR8QLjBiJ/uydG7BV/YMb+2
	qqnM7WQURNJZ/lnS2SHa9/cA7ModtnLb4ZDM1EXOubv/o31Ph7Da2RHZZuw84kHCmb1y4ITDq5s
	KZ31sn3IMIGEepMaO2XqXNm29JQPCcmAjRFXEBd2VVf4Vtk10o49YxBWlKjoCJ92z2bPD5akZwE
	OXzNqEglCpO4nybgRiENk/mJ44xJB8ROOtrZdjH8GQeBVjHss+3Z1qGaFC05i1XNfTn8jGJ0nSL
	qVf1+CnJpI
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr1654673785a.2.1773661912777;
        Mon, 16 Mar 2026 04:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8cdb5a5479cmr1654665485a.2.1773661911989;
        Mon, 16 Mar 2026 04:51:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b899sm40444943f8f.23.2026.03.16.04.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:51:51 -0700 (PDT)
Message-ID: <c214b66c-6ef0-494f-8f13-9d6000068e7f@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:51:49 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/30] tools: lib: thermal: Initialize CFLAGS before
 including Makefile.include
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
        linux-perf-users@vger.kernel.org
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-3-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-3-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MNxTiFwFdLjzTTsUDfJdiVYOE5ornqpB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MCBTYWx0ZWRfX9ipSV9wZ/5HE
 9hHqYdE1LlYxRpe7Kgu4amyNgjeZtzRCthQ+uRC5T06DpU9l0QL7VqyLAxmx/Kn8ajK7S6fH671
 SiboEgefR/fQO1zzpycfEAos+DPlf8qir+KCXp+hy8vJ82BPJVMLj053VQUAgQHBGjuSdjgvw2T
 0mLRaQMW0Lbuhm75ta3TTQYLrFtcpDUru4GmhgZ19pILeW8Vcrup8/6NElN3mWZpu/PRizyfgy9
 LgUs9hxIBwUTkJWDShyyeRRvC9EOFjGdf5ZAkbtZ0c+uMycR+cTsEb2DWg2tYr/xrfMYfWRhh4F
 uTs0+DuP06q3s+WjMr71Kz+nVVulu1iSdV9XUoiB7U5RklcL61QPddXsiuRqYbTobF9nAp/gWxg
 ajzO6P09TEeeT/L6Nnskb1QOPcB8l/TQqBM1JFM9fs3Irk32Rmz2thP1bhKMqgj4GDM7qwkQa8p
 OHYDe/FmLxXX7ikDqJQ==
X-Proofpoint-ORIG-GUID: MNxTiFwFdLjzTTsUDfJdiVYOE5ornqpB
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7eed9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=xTKRYfdV9gSblPpQG3AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11954-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 015CD298FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 09:29, Leo Yan wrote:
> tools/scripts/Makefile.include may expand EXTRA_CFLAGS in a future
> change.  This could alter the initialization of CFLAGS in the thermal
> Makefile, as the default options "-g -Wall" would never be set once
> EXTRA_CFLAGS is expanded.
> 
> Prepare for this by moving the CFLAGS initialization before including
> tools/scripts/Makefile.include, so it is not affected by the extended
> EXTRA_CFLAGS.
> 
> Append EXTRA_CFLAGS to CFLAGS only after including Makefile.include and
> place it last so that the extra flags propagate properly and can
> override the default options.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

Thanks !


