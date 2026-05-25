Return-Path: <linux-kbuild+bounces-13320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIc6JoH/E2quIQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13320-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 09:51:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92E5C74A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 09:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6F03034DF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F4735E1D6;
	Mon, 25 May 2026 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JATo0DsK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B543D412D
	for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695411; cv=none; b=lENw6Mu6yVgzP3cWSIVRMbOmlN3sDAnEMz7jrAvZVwMFNLgQ7UjiLSI3Hkb3t+6FiXjeE/jBk/yiCC7RRwKZZWdJDDDFvsfA3s2V01qBHnn4vAdlU+D/rvdFnyYEhPYwmY8tnKdrE0a5yJ6CLQKh83EKFWFglfBH61+Hmxj+Yas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695411; c=relaxed/simple;
	bh=NR8ERBteiNpEvT/i3MkwfQhIOdqEBtmpkWicvVoDvSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFko0cI1bl+v+LjrYuoWyyBaq5thqdxwiVVJktjodVy5KVbdOsrDesz6WBFLHerKAHgYL0uJhALrYnTK2kjEVkomF4I6WUa0DklAxxoSGANLz9BqOO/Gh+T8WexgS50fsTAKgbYNJz/llyOQeseUhgHGvel32swvRGtBdu/TKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JATo0DsK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a74032ff8so6861009f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779695408; x=1780300208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoBZmEEKJgwumlmFRTQvrYGlkjtr/HeYrTo4cMXpiV0=;
        b=JATo0DsKUAIwiaib334nnvCZvfCMDNZfB/zXSFLAtU2RuUxxOUe4vb+ypPbpcCpjfj
         lC9aW1xMFrdczvsLF8Zw2hdPHXsMFh2AOFnhGllgmyahxo9FLCPExKoOW7oYNK5ey6jY
         Bs8Iq9wQjANHSan6nRaH8e+mb10duHfhD32Iey1+BN3WdOTrjKIzzjsiH5i/kufnUUrv
         i4uMYy63SS2AkhtSBeM9q5VhS2iWHpMMaRYPClcIp/jwGRDmGFd95sjEArDVuvHi0CxA
         LIOVwIwj+pHZqz+QNEzg7ZvxcvKENS0/WntYoVwrrkR9XT6UdQiXeOdYJVA5KeYi9SsL
         7FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695408; x=1780300208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PoBZmEEKJgwumlmFRTQvrYGlkjtr/HeYrTo4cMXpiV0=;
        b=auJTWdDPAqGulpKveam5qaSptNnOoa5zdFctCnPEnBBcM3a5+AH0lSM/cjkkofPCRh
         V+n+JQSjZ2AKbwicLwaWTDgiPubtsp5tvsIS3xpcUot9YWC1zwpiYNGnYwXQujf2jUyn
         JoczcGAwK5sgG7LNh0cJWlKhhnn/X1TspvJsSC/e46vYoI/gZz89dGwnzxkPZPMf4qi8
         eC1Lgw83mg4fKgIJC1USm15ZqM7iURe2POfs331UtOGestLR1lDgcz5N8r5bTgOSP8SH
         id4w6gTOsO5S50m87KCjW4jWQxW+3V1Qpg2hnX/oSIrsfzV6rJrZNlJMlLiS/6hIO9+Y
         RdRw==
X-Forwarded-Encrypted: i=1; AFNElJ8wprViucfqUDWuejZW/Df5DOMuru8mV+M67nxZJph9dkPlKpSb7p8V3YLqHPILAVoJwPzyTsjnTfMS+Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34KMAQyVOWW7T50/X0xJBON1/OhgkkOvNI0zZFZisdmCXd3As
	BqWrDCgH83uxn+ocx9jfFxs5fgTvmPWr6gELAjybVp+iiJ744AvHwNHv77uMRqtGJ1CveAzVnq1
	YyHarw2iocA==
X-Gm-Gg: Acq92OGUY/1X7IH4u+pHXPXhiY1Unj1ng4IJ92pPziRW+zyrtL5j8AJk4wFF7GwlIL+
	6a5TUVE7S0FjI83gw1Mx+j3TqXu56UXzGjF8wGJVUC+KPAffg+XlaXXfb/w4A/YuAmb8dqUc85s
	NjPQB3ECGaAfPKHZhpWxf7TgUerkV6tMLgnyA+TXA7qGSiXd1QhusSBgEPsZXsAhCG/LCWcH3lA
	AEEvnxwq/X5LpjsBm/tUG85yMtwpebKbQmkYSd/gbiWipeJWMTyc1z5K9jgHoO34MD4cnSnbzuK
	A3bMFxb/GWAaq3P8mwpNBSudyWh+CAuqtRwv/H27Ko19GTR7C7OWdZgpmt5uDfXJUsHGT3IPKgq
	k9kvtC+uLhg9COuqTu712Yw7DFkwf+5Eb+ThLn3i53SrOoDRXSNO/RHsaXg9ETBctozvORSA8Sk
	B9ZvI4hRDpH658KCwEE5b2AWxRSXE4W8gl3kitPUWUW5+6I5FEl/P2sopeAinTxyx4OS2J6qivC
	KGFiCi6UKXSCvHnTv88FA5r35MFdh+ZFMtecrFPB4M1M6+PNTuq0VIUfxkTuM1A2jnn/Q==
X-Received: by 2002:a05:6000:1882:b0:43d:7d24:b4ff with SMTP id ffacd0b85a97d-45eb38a80b5mr18489748f8f.40.1779695407785;
        Mon, 25 May 2026 00:50:07 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9ba2esm26039629f8f.8.2026.05.25.00.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:50:07 -0700 (PDT)
Message-ID: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
Date: Mon, 25 May 2026 09:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration
To: Wentao Guan <guanwentao@uniontech.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
References: <20260525070344.1564886-1-guanwentao@uniontech.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260525070344.1564886-1-guanwentao@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13320-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,uniontech.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 1D92E5C74A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Cc: kbuild, modules

On 5/25/26 9:03 AM, Wentao Guan wrote:
> Use hardware 'crc32b' to partial_crc32_one() when support,
> it shows 2x speed up than crctab32 way.
> 
> I think it will be scaled to more architecture.

Could you please provide measurements showing how this improves the
runtime of genksyms and affects the overall kernel build time? Are
CRC calculations actually a hot path in genksyms? I don't think it is
worth complicating the genksyms code with architecture-specific
optimizations unless there is a clear benefit.

Additionally, many distributions already switched to gendwarfksyms last
year. Unless someone provides a good reason to keep genksyms around,
I expect it will be deprecated soon and eventually removed. It would be
more valuable to show whether the same optimization is worthwhile for
gendwarfksyms.

-- 
Thanks,
Petr

> 
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
> changelog:
> 1. remove change in partial_crc32(),
> for partial_crc32_one() already use crc32b.
> 
> ---
> ---
>  scripts/genksyms/genksyms.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 83e48670c2fcf..80b7797c842aa 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -116,8 +116,40 @@ static const uint32_t crctab32[] = {
>  	0x2d02ef8dU
>  };
>  
> +/*
> + * Architecture-specific CRC32 hardware acceleration.
> + */
> +static int crc32_hw_available;
> +
> +#ifdef __aarch64__
> +#include <sys/auxv.h>
> +#include <asm/hwcap.h>
> +
> +static void crc32_check_hw(void)
> +{
> +	crc32_hw_available = (getauxval(AT_HWCAP) & HWCAP_CRC32) != 0;
> +}
> +
> +static inline uint32_t crc32_hw_byte(uint8_t c, uint32_t crc)
> +{
> +	asm volatile(".arch_extension crc\n\t"
> +				"crc32b %w0, %w0, %w1" : "+r"(crc) : "r"(c));
> +	return crc;
> +}
> +
> +#else
> +static void crc32_check_hw(void)
> +{
> +	crc32_hw_available = 0;
> +}
> +#endif
> +
>  static uint32_t partial_crc32_one(uint8_t c, uint32_t crc)
>  {
> +#if defined(__aarch64__)
> +	if (__builtin_expect(crc32_hw_available, 0))
> +		return crc32_hw_byte(c, crc);
> +#endif
>  	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
>  }
>  
> @@ -740,6 +772,8 @@ int main(int argc, char **argv)
>  	FILE *dumpfile = NULL, *ref_file = NULL;
>  	int o;
>  
> +	crc32_check_hw();
> +
>  	struct option long_opts[] = {
>  		{"debug", 0, 0, 'd'},
>  		{"warnings", 0, 0, 'w'},

