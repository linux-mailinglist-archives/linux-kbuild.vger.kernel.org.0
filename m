Return-Path: <linux-kbuild+bounces-11953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPHoIBvvt2mfXQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11953-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 12:52:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C70298F89
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 12:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B7B305364E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 11:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2135539282C;
	Mon, 16 Mar 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jn5C4KsD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JBvK2FwV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC843932F4
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773661894; cv=none; b=iELNR7RGcJTMU6xjIvoHFlVBVkhT+cSoTu5SU4OKpeTuq5+B9vG20L67M1i7HyGHpTtjRBbnPI2tld9+OfPScRzcgTfAWMkRqQRnEbB42mb2IIDKTmvF+xnbAW7uH2YEJlaaOuFCMw12sUJIcD74Sort3SrjvU0pQCR5gQ/ILCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773661894; c=relaxed/simple;
	bh=wMfcOM1E8NveOMqBTy2g6Kl0T5mgMJ6P36Bxrnzupx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb5dtAIogAm6zSisEs8L55Fkkv+s2EFtMIkiFECUG3TUs/HImgrAGwR32awY4sRQH0SuzJ1lkUou5EHomMa+xrFTHFb3mhMHE2+Rqs/AlmwlTWTgu3O+5+MhH6JN/5mJJU28AbeUE1hv3WNCGkCYA9FroordUl59uGECcNJepXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jn5C4KsD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBvK2FwV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBeixm323714
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=; b=jn5C4KsD9OFzgWxR
	MrdUrbYqFnKXwZzWsOVEVJE2t4JS6NeWON/rsCmqtYcpQQHVPYv11tJWf8J5zN+f
	gWdtYyyxmnjQyljVOuqDhD1ivVpREbikOcLyAOF+dZh6zVYB9NqV8rFeiU88+dw1
	aA1QJYxz+RGOoeMvzffqhiFsi0X4/gK2W4DGa+aEi2Othp6vJIbkQoblbxd6WJZe
	1sIzibrRG1FqL6x6tGR6rauFQ4ZuQlWd9VqnJZSzpgykRRq7SMDUg51COHArf59g
	Xm3xmtxPWLcoVU9MS/4/i2tucosBqVchnPJ7K/RcXhAOhArRWZh+/5lD8/3kgBqt
	JVjaMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qnqkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:51:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c4885814dso315309366d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773661891; x=1774266691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=;
        b=JBvK2FwVgUdI8j1gSxDCRbIgKj5WR8FoY/V3lfW5iNeUfjLz6dedukEvqIc1EevzB9
         7K7KlnIqReXCfDMiY2rCbepBc+Q1frzXTZH8+PQ/HZ3csP2crqMm1ev1pK9FkIpeuPly
         MMEGP+SrL3ye7vzQB9WnxUmUGtdpn8X1VVdQBFp0yeIrzNe/m6rrrxMVmQRj9Lu0qbSI
         TkzkK08lQm8VVmFW4cZr8CfkSuvLl9pcFFKOd4Un8KZBXw57qEKIvCKE8QOQofrblX9E
         AFwFUrOvx9MXGRF+pAZbYk73xwS9gjO4fMLs+z/qgbOoZCafvYPKuy+nr1T6G2fdqdRQ
         UsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773661891; x=1774266691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZXaHmFaCXo06Z77INsskRFP9ADKCiNWDgJzdazMXTg=;
        b=mLkO432dmAwbsrSIW2BHL7ELsmZrViQiijZyxWqHCfgjhJy0kYOyaTtqeNlD0koTCX
         K7WXK4dU2+4ICobrnU7f8CQtGgCKZR59pxXKZiaV+s7TkmFwsDyIDqQwFrAWjU2P/zMY
         zvXw2kSV29w0pXxBS6h5FHZT34E+J85V3vxQ63K+OHINJaVdN9wr6KzhMir1Eb9CAiT/
         lO3Qyovp2Hwu6SL4u7pSngSiuTnQmHqz/IMnozgy20jplcaWzqU21rBLTsPGBcQW6nmU
         kNTbzZl9cjK3bCXvIO6heC4GOxOX+wcfgoJTgX2YFFhw7sdxDpzQElMXJyjRvyA4/nhj
         FHzw==
X-Gm-Message-State: AOJu0YxcAGNjvcjju2MKN7CO7J4qFkhcQM3f7uw2bvD9KtXlgzk+oro3
	WfsyROE0QJaoxwRiM/8tWiSiRXtO13Sw/knRPGv0tY/i5XhbesVdkKW0emnRx0m4dqcgHjTTVMG
	8jxXjGlaPt53i4u7dwaJ3rrtH1mU9e3NRfDRjf8sN12fcOJMeHygY2hykwzrtc9hc6YQ=
X-Gm-Gg: ATEYQzxU5+zGMEmZi9prTHc1oOpp8ll0X9zw3MF2qViyDJy/rprA9ZZ0xlhajxBRVgm
	JJWVMk+IfhCs+N4LxfVvx5Rt6+D56a6Yz0m+MzEJBlLnqCrVzT9ESnS6H85k/FEecdOh6+7Zi3s
	HWwitPpIunzJvkWJVfH8zMLtLtpa2n4A83bUP2nEvnXgKSi0Pc/QDWhM+ZUtBTLBESoA9AUASju
	wbeiQ1ZkgsNdPumLAeZb7L6ge9zN7BgUzODsUWTxFTuSsoxfcCnxnbKKXOvtoK6b8nZNa/pM4z1
	H2a9w8dudBUi4JwhgDn97/xmmEeMqG9xsWUq2XanmwVQv9Wbhxf6QRT2aqc9i0o4vfIv+Zfn8V0
	zL9+PcVQaqwqYohQb6eJVCpIsdY6DkvFFtAKYecDze3LdikbZG9ntPpQe86a9oXrhnRth8XXauu
	Tk9rVzoUPW
X-Received: by 2002:a05:620a:468c:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cdb5a964famr1517107985a.26.1773661890669;
        Mon, 16 Mar 2026 04:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cdb5a964famr1517101585a.26.1773661890086;
        Mon, 16 Mar 2026 04:51:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm19896229f8f.0.2026.03.16.04.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:51:29 -0700 (PDT)
Message-ID: <9de4e5fb-3ce9-4b3c-aa51-f7e09ac5b3e3@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:51:27 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/30] tools/thermal: Fix typo
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
 <20260311-tools_build_fix_zero_init-v4-2-9e35bdb99cb3@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-2-9e35bdb99cb3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wXCnAKVj5nU3aG1cy_TLnZ1XiugB2V1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MCBTYWx0ZWRfX7slWDzWLOR36
 H/JOx0BdmtwXPRX/0tCaB0P0RD0NCsRmyxRf+QWGuD8gxMCTxhyk733Vc3Aglcr0Vydgh4BtCsY
 q1U+mGbff8B/x8TWsc7Sj6Z3JDhL9mLaejSCj4Dl46PaIHFhA8aU5ypFBLXi7u9EqBlck5vaXqv
 tCBibTkn16TP3mQHdGUcfEBOY6j/vT7vIaaVIkSaxs8WZ+Knn+RLNLycAWS1wgqqq3QbjmdjB2U
 QuKx4vHiGA+F9gFcG/R3DodCKmRldCUyLoI/UL5Ndl2BAz9GIlskr5T+9knDqNIvTMiRGsb9v0B
 Dws/wnAewWqJ3b6Kjafpdm68gjO9EosiVWGTG+55FJOcHg7cP1QNo4cb59rKGAacnognQCgGSeK
 wlyDdWdDdmc3KNnebRcGevFVkAh9wxfLZ7GVhPYDbZzrVNZjr46HBd04iARWkOTJBkWLFnrpipK
 3v/o0LVYhTwLLwrVQsA==
X-Proofpoint-ORIG-GUID: wXCnAKVj5nU3aG1cy_TLnZ1XiugB2V1w
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7eec3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=9qkRzJ4zGrA7FPkgJCsA:9 a=QEXdDO2ut3YA:10 a=u2kJyrKl4JkA:10
 a=0lgtpPvCYYIA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11953-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07C70298F89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 09:29, Leo Yan wrote:
> s/CFGLAS/CFLAGS
> 
> Fixes: 3b7c5e8adf9c ("tools/thermal: Add util library")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

Thanks !

