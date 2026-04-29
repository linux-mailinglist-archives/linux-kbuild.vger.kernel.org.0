Return-Path: <linux-kbuild+bounces-12927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA4IDkHZ8WmLkwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12927-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 12:11:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA99492A95
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 12:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FF8D3014403
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 10:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED67440DFDF;
	Wed, 29 Apr 2026 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b="Xz2UVnxa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD8395259
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457469; cv=none; b=rKIB0iPRKaC5KrofdpmHiCFXwBH2kQ0suh5czuZAx7yRLkOm7mhbsCzxTPaJso0aGour1ooi2F2GqGlEuVLTMNkWvfmr3oGyZCHsQx3gQT8e+sdVZgR0vluRzsZDj7Hly5kUgd8JDZ9oi/LpkXZGz1xizJA/Q922aoV57HRDetA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457469; c=relaxed/simple;
	bh=KLwWf95QYlXqjTRiTI/nyMeghq1jIrTTG2Jrgoqqb/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gkf4iHixUX7TyZPVCRKgfcfG/7KNysxs4IwAeNTxIAfcp7Xq1Y1JcP1y0uhQK8UOCJPJPEL9A9P/zDYieSxtCPALMMd/cM7DVDbLRsMWbRXOHg3DpadEZpzV3YFLUZGxiqSC9KDizkGk9hlS19TfgvEd8KzqyVD0XokmJrvm2R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com; spf=pass smtp.mailfrom=ingeniumdigital.com; dkim=pass (2048-bit key) header.d=ingeniumdigital.com header.i=@ingeniumdigital.com header.b=Xz2UVnxa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ingeniumdigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ingeniumdigital.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b7adb38d65so60598825ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingeniumdigital.com; s=google; t=1777457466; x=1778062266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=Xz2UVnxaW9LQPQuEHuaS4DHlIn2123lJZ8S5CmasIy2qoiy9XmPT6HLjx+Z9cQrrEd
         WIOKPuS9RQ1SKTkVqf7qpbRG6KkODRAfmbR/K/omQ8AW7Oqrwnntza1CJAvcA2QCVB/3
         ZWvOsLsvvHUs70jtPHoH0hliD5IyFVxxSDidasAac832y5wSn5R+UN3hkZkJ8W/jHhfy
         JmRY1I6jD/pMYHJwbJ/1CwJJU86zzVpiwuDnHXRIspYH/6dO5x3RREuOgV2w8EQLCBB+
         aKfzoa8Toie4zUM3RL4uj0AyuuKJXORDpq5QXTaVtwgXyETuo2OlZkteMb8wp6xGOErs
         Dhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457466; x=1778062266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R26ySyVwseh0XvD0z3+P5speK5gk4CAVoAQ5oLCLJI=;
        b=hqtAHCWRVuTIHayKAe4NHcDHFS/Hc7dsrzFBbLy8UJLt1rsPsCMcagLR6FUmEFDluq
         ZvV0SLPsxsf5SWxh7O6T16fvwD+9kGl2LqYtlC/QINOila0s55ExfCK/6XDXCuLMmePl
         WYK/SLdoqulgEg6ZKv34S0vSftdsRMTZ0ZmPpUptdxaiqR3KNQ4lOn7l8nV14ma1B+1B
         O72fQuNmAY2xjBdy4s9x/LbumbZOehSU5LZb711PW66apxyQVaAJLoJdPhSzGYA7ZIZx
         ocJCh0fsqYRHb13rJ3H46ZiGmMM8ATDngTAKC+Xpztriq94OKeHoP9QJBMl0JA4rAxxe
         jTgA==
X-Gm-Message-State: AOJu0YzMPYo4vmh3FM35bQ5y7mgRWOJRpFMmY4zHr9+/eZzFE2A10xaM
	ew7bRtqsWz0pp51PjCDMT0a0N7w9rsJDaHwJhQ5xuqv9gJdeHWJ/ADJiyFQqf+dAlTMp2lbw+vE
	JOxwNochE
X-Gm-Gg: AeBDiev0NLBej2pdKUVoW4qWRlCEexslf7ar1ZUTyHillIuYctPk0fWVX3BtTqwCRF3
	foZtWXLf8Ek56E4Qp1usTwd4p2Qok02nOp1J6sBpPws3wcVYoOoMMhzeDcqTURhatJHfV9QetZh
	0WB3uVy7hYCKNrpQ4b9lWp+SacVTt7RF+j/Ygaor3dZrx2DBR37v7x97EdS4d4V6f0YLvPdLeib
	QYreJDTGhPA/tP15vJlNqJ/Mo1cSa/o2NFuiYqVMvDkwPQCT0Yhh5WCoHUpTSJ/bNXW0g9lA+xS
	JFL1I9IH9m6b5EYGwdXM0EQD2Cs49t6eRRbXufaFV0O27xSR1Mo01VlGAa0NuUqD9uNSFeC1h5+
	8ZfMtie1Rk9BH7ys51n1HJ6p09Oh8AWykFW1VFDgMuADd4IGVRpQ3hYhpX8ewK5StxCY1NR1FGP
	71FqfEXhhERCdCmmRxYsXmULtt8LioAlFwpmouYmpeRqlsgVg5myXH4TdohPR8yaM0+zcE98nQt
	z6bTypUYvvNC0BNxnMW
X-Received: by 2002:a17:903:3503:b0:2b2:ec00:7966 with SMTP id d9443c01a7336-2b97c462381mr77953125ad.21.1777457466448;
        Wed, 29 Apr 2026 03:11:06 -0700 (PDT)
Received: from ?IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d? ([2001:8003:8810:ea00:ed87:ca88:5326:e11d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988972dfasm17817855ad.72.2026.04.29.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:11:05 -0700 (PDT)
Message-ID: <279a16dd-f98f-44ef-9685-44537eac2892@ingeniumdigital.com>
Date: Wed, 29 Apr 2026 18:10:58 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc
 configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
 <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Language: fr
From: David Gow <david@ingeniumdigital.com>
X-Clacks-Overhead: GNU Terry Pratchett
In-Reply-To: <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9EA99492A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ingeniumdigital.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12927-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[weissschuh.net,kernel.org,gmail.com,google.com,linux.dev,davidgow.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ingeniumdigital.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ingeniumdigital.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ingeniumdigital.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ingeniumdigital.com:dkim,ingeniumdigital.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Le 28/04/2026 à 12:04 AM, 'Thomas Weißschuh' via KUnit Development a écrit :
> Add a basic configuration to run kunit tests on or1k / openrisc.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---

Thanks very much. This works well here (assuming 
CONFIG_KUNIT_FAULT_TESTS=n, and either a long timeout, or slow tests 
skipped, as qemu-or1k is not fast on my machine).

Reviewed-by: David Gow <david@davidgow.net>

Do we want to split the series and take this patch via kselftest/kunit, 
and the generate_compile_commands one separately, or just pick both up 
in the same tree?

Cheers,
-- David

>   tools/testing/kunit/qemu_configs/or1k.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/or1k.py b/tools/testing/kunit/qemu_configs/or1k.py
> new file mode 100644
> index 000000000000..dfbbad0f9076
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/or1k.py
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='openrisc',
> +			   kconfig='''
> +CONFIG_SERIAL_8250=y
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_SYSCON=y
> +''',
> +			   qemu_arch='or1k',
> +			   kernel_path='vmlinux',
> +			   kernel_command_line='console=ttyS0',
> +			   extra_qemu_params=[
> +					    '-machine', 'virt',
> +                        '-m', '512',
> +			  ])
> 


