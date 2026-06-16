Return-Path: <linux-kbuild+bounces-13772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JezxMgqpMWp8owUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13772-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:50:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE9A695026
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:50:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OG0bAwod;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e5a2AVkv;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13772-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13772-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D591306AD0B
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 19:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E2A37880B;
	Tue, 16 Jun 2026 19:50:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C4376BEC
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:50:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639408; cv=none; b=UCgTQtlsDtiLd4EMBy2FYc8wPgta0VoZjz39EohcgwotT8ZrwqU5ZcnxAVfNOneiz0CIwPIAMuTsCQlE5ufh5xbc52L1N98vWuW3m1TFoGD+sZzF0AJo0FLHmwSDdsoFrjOE5iiuTvRUfCsCzlvKKS7gZK/UJB5MT5MgHMU2XPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639408; c=relaxed/simple;
	bh=d/rR3KtKS/aaSnkoWjt4cb/cgXgvu6Q/qT/rtiSARWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=heTYBF8Aeutke3amCTqPYduv2NYlkknwuT4AGgiYtaLjTNlNG2naQZq2OyK8jg+ZWrBMjpSH8rNSmg3Hb/TqT43vJcHoKuN6J7g3vhKbXpD3Nk+a7n7l2Nu6mRKt5N1UuhI1krpgPuT3RaSSLkO9LWBPZgBWdfwJ4qBIp2pfbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OG0bAwod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5a2AVkv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOXWn397509
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=; b=OG0bAwodm9r6cATx
	NnKo8aUVOXegxwYWnumlVvfKZ8nOYJH96M6iigIy8xmBq8FNuJKt2x1F1RghWfCQ
	FcsbPHBwkD0oQ4lqKLewTxrgNhChXGvL34KyDj0+ZIwYJck7Bdz+dgrrgK2t2zHn
	Bq1YrL7dMpVuLZ1j14SC9L8J+/nSw/bVfyady2aCl3TnmSbmTK8+Bsv1qDOCgXMT
	thNi5F/oYfo6KLP1rOZESomGUvvyFLSE2F5ySXSwOi3eDyd6wJKFYCcyABpdvz62
	taeAkJkiRxRKEKc/W3pYpko4C0V47sjhDoVRDh3ndU5jxJCL5eLmCBX7Y9Ak8lLG
	tVwFDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52v70t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:50:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158e75cbc0so742041885a.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 12:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639403; x=1782244203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=e5a2AVkvE4bz+h9rdmPatSDpSll72+CWqn5mG0SNZzvUUXKmdZnc18urqLZTO0A4bP
         0Vf91Zj/F23BOnqNst0ed3ToqHJtjepTJD/xfiR3/i4eJUf8q1lcFjzzwTKIHl7x6vks
         gUub1vKVKmkQpgO9Y3u9yryq/FdEGXXylZOLujzRVLMMMb1x4ujPRemVV+HW6hlvLTJt
         j24upaagA9tVNyUATicBO6ySyjfDT6sK351IolchCpg7CrlyDT2JEAIjaB9A+yEfHUTl
         aMzY9+7TIRgh13byNK25+wDiM56eGa+qa6M9m/4mwdvhp5/rLHXe07HqhwsWTNh69NQw
         u/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639403; x=1782244203;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGsMkJgam8EBung0dk0OiaiHmA1xJP7v0n8Hj/9uW6Q=;
        b=c0LK+S7KvQCFbJxC9X7q1seISRRMUPvYfGD6IRrUutSvLbV6GS9/mpfpQ9Nj/vf10i
         Ifil4V57VVM1pcanW3Sp3CybTj9dLNAAtE5YjmzChb6rVzlvTNxcqim1AekZEKKOTKW6
         fiTV0XotYjJKP95DsaGtIkBpD9t5RGiP2AMWnVeIl2bMPuNKHah0Ivk1z3lfuo94uyAG
         etldtgqPPDdL5TJVcqzqFue+/N0GcZC5PwSUV/qE8c8pYcAOmScrzv6UZvyiyKetHHrw
         hLsMZVa23IsCqGdtYP/9H3/2s/9JLrgDl0jfAMn7zjCY+uZgp4JFpW/hjhjRHIN4WS8U
         ccDg==
X-Forwarded-Encrypted: i=1; AFNElJ+YOGGxK/zZbxq/ExJVd6uQUWa8hLDz00E9Se5aYvNna7PpsK0LFtzeWlPcFjzDg0l0Zfh/Jc1F/KpDamw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2u6oJ+R2c9QBqkL8qkHhYXXz81cjbLAF2P+6CR6x8QrlaEBg3
	2IBJ8U/lI9dAme8c/6jgMVljUumJ9Ph1cR/Mr3rIkpaNHvAglPl/j09omuGW+FsvYL3nVibAJGU
	W7yVBzNpBuH74wtdqPOY+QIFdVY9L4xzywuX9pq3TwgJBBr1pe5Q2H5T2lFibK3P3akk=
X-Gm-Gg: Acq92OHYg0fNzPFO0fh32sQNxf7yd7y3LFLAFvMCK+HlikYPJ4/gBLmqPcdA+qMiwsX
	0RLhx7Hddn05EIc0gD37SbCrhWvDaiGnaTp0Bb5lb91CZpaWiIHgVxtvx6MLTKm/4fHfr1pjUH1
	EKVgJGj7uUy8JTlnnjO+j59UwxJMmG5IHW+22bZdkj2LJmCYFcw1KWzZuGkns+MC8I+l2HJ3uFq
	5P4es68g4aaAQ3TIWe7x/ditb1yA2gAQJLYcRwpE1c+hQrHpJSOu6VDPsN7LclFjCMjL9vGHoyV
	cUppfPWbDJ/u7F2g6xHpzizd1yCR/J59L+/71CBsb9GnuTG+KhGyunM1VTgZvbs5Xss9qQ0cBL4
	EaxLhL/L+dJfTB0pU3XzXsDGrMDWwbHWI0tjx4u3vuPojhIcJqPtZPZveau0tBlZh4ThZ5aPoZx
	1EfJ2Q/8asF/cypiTGsXoeQ1WvfJCHTLJ3bK2DxENRjwjSv9r1dZVLbUYOIayEvSRlOJGtkjcQi
	jr0o87k1VGR5aOS
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54821485a.27.1781639403573;
        Tue, 16 Jun 2026 12:50:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:915:d32a:1cba with SMTP id af79cd13be357-91dbc52c4damr54813385a.27.1781639402784;
        Tue, 16 Jun 2026 12:50:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693791c5d33sm5431930a12.8.2026.06.16.12.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:50:01 -0700 (PDT)
Message-ID: <38433aed-dafa-4275-ba0a-237a1db645d9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:49:58 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] module: add SCMI device table alias support
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-1-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfXyEepXH1Oh52O
 TlRbDA0smhryD/vXrP/wdfVFbY4houRJsKaxSJYZLkafuwvUIMT8L4D2guKZKXa3GuQcS0jW8Rp
 JC5mn35uWQlbmN9iv8YIU2xb+iMmVW4=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a31a8ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=W37sn8zWFLRx4f5Wf2kA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMSBTYWx0ZWRfX6/Bpv+09wnu+
 4KL/Fg+uEu12gu+sBc7uTZDNe+AInXU0HytZHMpVfoSxFgaOZo5Y3dM37A07SCQH7djX1r1pnqD
 KoUNq59Yof3QGnfFc24PIAVlhEcpecTcByzqzojYgE9rfKm7TebaxkAHFH+1AkoJ9kkHBS1ZlM7
 g2dBM9Q0vQgr3fQlh+6oMaHQC7FgiIp9JjmN/37rQ4/Sh5emG1dgh79GEx679zEyE7hBWqqdblM
 po7IGweO1Bx2PAfjnZb0xkWrPZWvd1K1xtDmj/YW9Y0jtH5+AP/iKYG5OPUwQzzc9qddJ+cIOtU
 XnRZfMT5glDXfjcCQRvOGR4llT84XmE6mLUKZMShJO0HoxaK52tvjpYc1m7miGiKf9xLkuav2D6
 KNWxnyWa2pD1Z9bIpfiPDC+MJz85KRg6AO7MDf4tO26vBT+KbUMS8mTyjl8Vib4sJlLBgT0dM0b
 w25pAOZqveqUnpvTiLw==
X-Proofpoint-ORIG-GUID: AO-nV4Aex_VusMsxuWOhRPoq19Py5Wi_
X-Proofpoint-GUID: AO-nV4Aex_VusMsxuWOhRPoq19Py5Wi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13772-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DE9A695026

Hi,

On 16-Jun-26 20:09, Bjorn Andersson wrote:
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thank you for this. One small nit, you add:

#include <linux/mod_devicetable.h>

to include/linux/scmi_protocol.h

But that header only declares pointers to struct scmi_device_id.
so you can just forward declare the struct type there and
then only include linux/mod_devicetable.h in places which actually
need it, rather then dragging all of linux/mod_devicetable.h
into any file which includes linux/scmi_protocol.h .

Some people are working on untangling the kernel headers for
faster compile times. So IMHO it would be good to not introduce
new cases of headers unnecessary including other headers.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans





> ---
>  drivers/firmware/arm_scmi/bus.c   | 19 +++++++++----------
>  include/linux/mod_devicetable.h   | 11 +++++++++++
>  include/linux/scmi_protocol.h     |  6 +-----
>  scripts/mod/devicetable-offsets.c |  4 ++++
>  scripts/mod/file2alias.c          | 11 +++++++++++
>  5 files changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 793be9eabaed..7e344f2ee18d 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -13,11 +13,12 @@
>  #include <linux/of.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
>  #include <linux/device.h>
>  
>  #include "common.h"
>  
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
>  
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -141,7 +142,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>  	int ret = 0;
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name && ret == 0; entry++)
> +	for (entry = id_table; entry->name[0] && ret == 0; entry++)
>  		ret = scmi_protocol_device_request(entry);
>  
>  	return ret;
> @@ -197,18 +198,18 @@ scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
>  {
>  	const struct scmi_device_id *entry;
>  
> -	for (entry = id_table; entry->name; entry++)
> +	for (entry = id_table; entry->name[0]; entry++)
>  		scmi_protocol_device_unrequest(entry);
>  }
>  
>  static int scmi_dev_match_by_id_table(struct scmi_device *scmi_dev,
>  				      const struct scmi_device_id *id_table)
>  {
> -	if (!id_table || !id_table->name)
> +	if (!id_table || !id_table->name[0])
>  		return 0;
>  
>  	/* Always skip transport devices from matching */
> -	for (; id_table->protocol_id && id_table->name; id_table++)
> +	for (; id_table->protocol_id && id_table->name[0]; id_table++)
>  		if (id_table->protocol_id == scmi_dev->protocol_id &&
>  		    strncmp(scmi_dev->name, "__scmi_transport_device", 23) &&
>  		    !strcmp(id_table->name, scmi_dev->name))
> @@ -245,7 +246,7 @@ static struct scmi_device *scmi_child_dev_find(struct device *parent,
>  	struct device *dev;
>  
>  	id_table[0].protocol_id = prot_id;
> -	id_table[0].name = name;
> +	strscpy(id_table[0].name, name, sizeof(id_table[0].name));
>  
>  	dev = device_find_child(parent, &id_table, scmi_match_by_id_table);
>  	if (!dev)
> @@ -282,8 +283,7 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
>  	const struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
> -			      dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			      scmi_dev->name);
> +			      scmi_dev->protocol_id, scmi_dev->name);
>  }
>  
>  static ssize_t modalias_show(struct device *dev,
> @@ -292,8 +292,7 @@ static ssize_t modalias_show(struct device *dev,
>  	struct scmi_device *scmi_dev = to_scmi_dev(dev);
>  
>  	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
> -			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> -			  scmi_dev->name);
> +			  scmi_dev->protocol_id, scmi_dev->name);
>  }
>  static DEVICE_ATTR_RO(modalias);
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 3b0c9a251a2e..769382f2eadd 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -473,6 +473,17 @@ struct rpmsg_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +/* scmi */
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;
> +};
> +
>  /* i2c */
>  
>  #define I2C_NAME_SIZE	20
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..48b346a26068 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
>  
> @@ -951,11 +952,6 @@ struct scmi_device {
>  
>  #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>  
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -
>  struct scmi_driver {
>  	const char *name;
>  	int (*probe)(struct scmi_device *sdev);
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index b4178c42d08f..da5bd712c8da 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -144,6 +144,10 @@ int main(void)
>  	DEVID(rpmsg_device_id);
>  	DEVID_FIELD(rpmsg_device_id, name);
>  
> +	DEVID(scmi_device_id);
> +	DEVID_FIELD(scmi_device_id, protocol_id);
> +	DEVID_FIELD(scmi_device_id, name);
> +
>  	DEVID(i2c_device_id);
>  	DEVID_FIELD(i2c_device_id, name);
>  
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 8d36c74dec2d..a5283f4c8e6f 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,6 +852,16 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> +/* Looks like: scmi:NN:S */
> +static void do_scmi_entry(struct module *mod, void *symval)
> +{
> +	DEF_FIELD(symval, scmi_device_id, protocol_id);
> +	DEF_FIELD_ADDR(symval, scmi_device_id, name);
> +
> +	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
> +			    protocol_id, *name);
> +}
> +
>  /* Looks like: i2c:S */
>  static void do_i2c_entry(struct module *mod, void *symval)
>  {
> @@ -1491,6 +1501,7 @@ static const struct devtable devtable[] = {
>  	{"virtio", SIZE_virtio_device_id, do_virtio_entry},
>  	{"vmbus", SIZE_hv_vmbus_device_id, do_vmbus_entry},
>  	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
> +	{"scmi", SIZE_scmi_device_id, do_scmi_entry},
>  	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
>  	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
>  	{"slim", SIZE_slim_device_id, do_slim_entry},
> 


