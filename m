Return-Path: <linux-kbuild+bounces-13774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gQU5Is6pMWqTowUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13774-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:53:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD969505A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 21:53:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iX2176kk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dhipdKEp;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13774-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13774-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFB6E319394D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 19:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81AF2356C6;
	Tue, 16 Jun 2026 19:53:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860F374192
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:53:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639611; cv=none; b=aPPkvkykQHViF8Ib8tvrnLrpjamSUxDTQ3nmq0mjdIX/TYaIOXfs4762KBESwlwg8SkLMDEJtrSxRp0ym45tl+iXHCW6PaWqkofqdGgpMYck8lRsXErJeCo257x+kBQjHVqvA1Z0hb6kqOiHpCqQGF2H+0jqnHfXB5QEQU0pi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639611; c=relaxed/simple;
	bh=3j1iAbwip3MXBelKsZgxoBbS2Ky//DwfF+Bz78aHnY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=V71gP6I14of3wekgZLJs2+1LrMsmoDJLOPbtKBS/GaK2pX9NjBX4mUCP/1/Xqhw0wvZ9stPFUhkkL++NXc2XboWvLwMjCUSoSnspF+5XyY4MiBQDIVUgp49U4LSf2J+XvolPczvxBr4U7zJC5E3gL5rEDV+acCoALjzW10aP//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iX2176kk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhipdKEp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOpYH172521
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=; b=iX2176kkjLU1lcEH
	7RkzJ1rIHnwvn3cfxtrZLeunR1thRCKE5l2QKaZQWR9doAk37Jm0avgKfwlCBXea
	eeNvYBm2Jkigi35sDzojS1TV/8fBWo3Suv3IDbPZ+D88cyAQWdMaiXsNH9y9iYsj
	YjNsUBWKELugrjg376j1f++0dmeONXnjV68eT3XbJXQPtp1m2JkdqILhMoF+pYcO
	domb7P2HsPTFTJ3nMlqYxQG9QDpbyayCYlYTKmXX+gr0j9DuQ3HO3/ywS9lCrN3k
	AmzEPKinoeffFYWzCObHEvtcLLz+lcw/2ff99t086PRjZ7P6XfDy9wW+nZTlpX1T
	Gh8MPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09kbw4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 19:53:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cced8f230bso85222616d6.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 12:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781639609; x=1782244409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=dhipdKEpHo9Frq/8sQBrIH4nhnJFstzG9EjbyuRpNO7UascDTO14SGlorzK7CIZpDU
         ZTPKbOlDngCRP96mQE8llbIWp4Qv7tLLlRRntx1spJdYXlK7iIij3BVF5iQEJ2h1ide5
         JK7oJ8ibLtFe6Gsi/GtDy0wNqJorgZn6WRdphDV7UhenSjGowmqC+HaDZkKEpo+ywhMh
         Ni40iZGrIXxHsM3mSxixQZjfVyqWVcye28Q1QF3W66+yvKr1It+ZYO31L6QslJmAgCr8
         aSf4fQrP5j58QrDFAaxXvhW70x8tamtw2DyLbqT5bcCm9nznvNEWx7dL05BNXTFf/z5x
         ZFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639609; x=1782244409;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nKMcxi54NbqW8wjhguv+GM1uZZW8w55AzUsDGhMNIY=;
        b=CIbgAVKtR2my8DsJvqidIe7BsKOakeKDg3mEDk2bJAUsU3URTQlGNfLi/32nHwHQ5M
         IJTVWsMGDUQ6hPBJXN0iJDcJEek7cF7BgLTy8uXzts8aJBWeSYkND54wScw9gTNXY2K4
         K64Advtzc/nptSb3M4J924rWdogD95TgDixL8ubIwsdsvY+/MZECFsMSkR+xqk5WaqIK
         n8X3ncB8XSIW48LCuAkDog/Xz7KI2FV+euBAzPZv9J4aoYnAKD6ED8B9mt4DMLV4JZBw
         RGI3XC8WrC8Nw2HIDVejAt6+AJh5ib8N91w3884PorPeo/s/VqepFYcRTv5Tw52snNvy
         gl3w==
X-Forwarded-Encrypted: i=1; AFNElJ9dffDNZnqRWfBWkSrmXqRZmpyVjfFgPqV3z0kSZerWs0ciVzoREzDZxVnxIIXkRTfvgOLy1JgXbTatNQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbh9OFBcvJTNqD3SRobamXSc718emYuAipRcJrblLfwkueRZl
	vsl76dqWKXJ4VCSFAB8MbeNDY91bScy7OzqOmLvuce9aXRiobd63N+NtrmxPmSIFjQ4mSI+YIOQ
	adT3rVrYfURgbz7bgAgN7zdEWi4bVVtfdCq5uSSXFhTz+tR/oJV+IqkGVqGKsk0GA+2g=
X-Gm-Gg: Acq92OEhARNFm/U1yoWmrgk/fNRMJsXai2eOEYH7e5Iplp+DbZFdZEz5Klzf5xftiT8
	yuPBVPgDhAgCneRHjYNXAOUIx4fuxpdFxwnDPLMqCFFR9usfTXBUsSEY6HL5VEqaFWmqKD9soNv
	MWbu/DSlQehyxgvqFRjKnAx1OT01JdcTP1TOmNLgzxhYeWZnoLrGNFCyIZ3xLhJDzvhXW5ySQKZ
	rqdmpDhEy3q6muspdfbcG6cL5njDF7mj2g+s/fyhX1jDvKK+ZIS+GavlRg7VSrtG3pJbLOcMyWr
	m03pJEjbPrjVM0RCfDnODZELsiIQf7DOMTQ8tvzW42JEoSpPq0GLbBXVtiojKWKirirhNDPRyav
	JcbD4GquVgNEtnvo3K8X8kZk+gAwJ5N7lDHwhR+dig93JazNiWkMkFQxirVbRtk6st8cDF9xIB/
	N1B4mKB/pAkIu+7WKkY+XyBZCzxliXtw/76b7o6R4h10qnjhdkDd1NAztCjEOkYT4eUrtNOa3OZ
	eKg10f0BT6omWWu
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192596285a.12.1781639608866;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:91b:d037:4a00 with SMTP id af79cd13be357-91d8add3a1dmr192592585a.12.1781639608423;
        Tue, 16 Jun 2026 12:53:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8d1de1fsm708913866b.55.2026.06.16.12.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 12:53:26 -0700 (PDT)
Message-ID: <2d863db7-afad-4413-96db-7a1befca62d6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: request modules for discovered
 protocols
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260616-scmi-modalias-v1-0-662b8dd52ab2@oss.qualcomm.com>
 <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260616-scmi-modalias-v1-2-662b8dd52ab2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwMiBTYWx0ZWRfX+uIy3vGQmHVw
 WpgAZRz0inyjX7Usbbh1i0TDdEv+8yfKmXlZz0k9JLuKfFeTyD3AfpGZoFGmgnIiYYzk8MbuhYo
 O6qTG/PUMVCiiDIm2Gxix3W/9ro0gtk=
X-Proofpoint-GUID: 2XJLl0Mt1h66QhfvDG2GrVVQQqqOUm9B
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31a9b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=0IHGurON3k-uK7srJYgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 2XJLl0Mt1h66QhfvDG2GrVVQQqqOUm9B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwMiBTYWx0ZWRfX46zQ9WCfM9C/
 FGLMmtoK/qMiOhSXsfLSIpUZzVPhZiP9SgrvaQ3GNFZyXVDf9UelWZ6ZQF8xBXKInVQRbfeMo6j
 94MG0bBKTpcN+XaI23MkU1GzmO6P7vPN9vhtA8faBkgVidRfZA3nXJ9LFbrBcdHqEPS/SQoHsNv
 wnzdbkpazO7GBeJqOa1d9eFkV4pSdVu3uxNGy1m3scxIoduz0+/jQHqyYJjmkJBpPtcqGImemVE
 PMBGesc0eDZJlUQiyyjhH94ZdOIjAmyrinRyC1GmnthXseauZrfj8QbUyopQUZ+7+hh6tf1TY9F
 U6J1Vx+HKfV1KHlcu1MEtx/W+FX53Of/LPZjyp00Cy0z1l7DaBbNrkkf6vLwms4CwLjpUqgzm0T
 pjqkreU8LZ47Z5nBWi1zJRgzFzrxXsNypP4e7nMwJ1Sv9Y2kJTVcfZ7KuQS3ojOyvZp7vrR8h8w
 ptElPaIwLNe5a5fDkTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160202
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13774-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:nathan@kernel.org,m:nsc@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDCD969505A

Hi,

On 16-Jun-26 20:09, Bjorn Andersson wrote:
> SCMI client devices are created from SCMI driver id tables. If such a
> driver is modular, the core does not know the driver's client name until
> the module has already loaded, so normal device uevent based autoloading
> cannot break the dependency cycle.
> 
> Emit a protocol-level alias for each SCMI device id table entry and
> request that alias when the SCMI core discovers an implemented protocol.
> This loads modules that have registered interest in the protocol; their
> normal SCMI driver registration then requests the concrete client device
> and the SCMI bus matches it by protocol and name.
> 
> This allows e.g. ARM_SCMI_CPUFREQ=m to autoload on systems that expose
> only the SCMI Performance protocol node, where the cpufreq client name
> is Linux-internal and not available from firmware before loading the
> module.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c | 2 ++
>  include/linux/mod_devicetable.h    | 1 +
>  scripts/mod/file2alias.c           | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e0d975ec94c..8538eedc7c3a 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -47,6 +47,7 @@
>  #include <trace/events/scmi.h>
>  
>  #define SCMI_VENDOR_MODULE_ALIAS_FMT	"scmi-protocol-0x%02x-%s"
> +#define SCMI_MODULE_ALIAS_FMT		SCMI_PROTOCOL_MODULE_PREFIX "0x%02x"
>  
>  static DEFINE_IDA(scmi_id);
>  
> @@ -3362,6 +3363,7 @@ static int scmi_probe(struct platform_device *pdev)
>  		}
>  
>  		of_node_get(child);
> +		request_module(SCMI_MODULE_ALIAS_FMT, prot_id);

I think it would be better to use request_module_nowait() here. AFAICT there
is no need to synchronously wait here for the module to actually get loaded.

Either way the patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans






 


>  		scmi_create_protocol_devices(child, info, prot_id, NULL);
>  	}
>  
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 769382f2eadd..2cc7e78e35a3 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -477,6 +477,7 @@ struct rpmsg_device_id {
>  
>  #define SCMI_NAME_SIZE		32
>  #define SCMI_MODULE_PREFIX	"scmi:"
> +#define SCMI_PROTOCOL_MODULE_PREFIX	"scmi-protocol-"
>  
>  struct scmi_device_id {
>  	__u8 protocol_id;
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index a5283f4c8e6f..40a37b6bf1ad 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -852,7 +852,7 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
>  	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
>  }
>  
> -/* Looks like: scmi:NN:S */
> +/* Looks like: scmi:NN:S and scmi-protocol-0xNN */
>  static void do_scmi_entry(struct module *mod, void *symval)
>  {
>  	DEF_FIELD(symval, scmi_device_id, protocol_id);
> @@ -860,6 +860,8 @@ static void do_scmi_entry(struct module *mod, void *symval)
>  
>  	module_alias_printf(mod, false, SCMI_MODULE_PREFIX "%02x:%s",
>  			    protocol_id, *name);
> +	module_alias_printf(mod, false, SCMI_PROTOCOL_MODULE_PREFIX "0x%02x",
> +			    protocol_id);
>  }
>  
>  /* Looks like: i2c:S */
> 


